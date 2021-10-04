class MediaListModel {
  int id;
  String fileName;
  String path;
  int playingStatus;

  MediaListModel({this.id, this.fileName, this.path, this.playingStatus = 0});
}

List<MediaListModel> audioList = [
  MediaListModel(
    id: 1,
    fileName: 'File : 1',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
  ),
  MediaListModel(
    id: 2,
    fileName: 'File : 2',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ),
  MediaListModel(
    id: 3,
    fileName: 'File : 3',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
  ),
  MediaListModel(
    id: 4,
    fileName: 'File : 4',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
  ),
  MediaListModel(
    id: 5,
    fileName: 'File : 5',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
  ),
  MediaListModel(
    id: 6,
    fileName: 'File : 6',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
  ),
  MediaListModel(
    id: 7,
    fileName: 'File : 7',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
  ),
  MediaListModel(
    id: 8,
    fileName: 'File : 8',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
  ),
  MediaListModel(
    id: 9,
    fileName: 'File : 9',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3',
  ),
  MediaListModel(
    id: 10,
    fileName: 'File : 10',
    path: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
  ),
];
