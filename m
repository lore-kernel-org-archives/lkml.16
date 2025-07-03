Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7723E235;
	Thu,  3 Jul 2025 03:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515048; cv=none; b=rTvfrHJgCYc5VzC3yXI9Adf9kq9KD5R7Os5eSmhzmdDoEKDR7pDr/xqGW1cTqUh4JrqQ/EA/FSjDF7TuEqnQ6H5yX2u8+FE2ubgm/BXtsFoBUgfv26CtgMUlZa+GeT5kNnbNS1lgBs9td/TUOLTUxd//9AInga+0oQchyWPxX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515048; c=relaxed/simple;
	bh=u9W/kYVpfIvJPsVcmXSI9qAnh2XAGqjYATjG+MLCoPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kE5RFfk6brQj4c0aPcRanVXWT+garS/ElJt3L4J8jtCk+3hUKQ7XhOxbWI7czgs6s78RnbSiD0WwkO1OnISGGqyVx0SDbcvlv/IYtBpYN2yblLvhGWUU2skfN7J0T6h2ZC18jzslrCFZZxwpX71GGUwwJaByU3I5I/Um652+M7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz3t1751515002t0edc58b1
X-QQ-Originating-IP: qcMBedap8afZgWOniI3tLTauxRB0J2eKfOa+UDRz1do=
Received: from localhost.localdomain ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Jul 2025 11:56:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14714430603402196420
EX-QQ-RecipientCnt: 14
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: like.sin@gmail.com,
	xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: codecs: Add support for FourSemi FS2104/5S
Date: Thu,  3 Jul 2025 11:56:35 +0800
Message-Id: <20250703035639.7252-1-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MszGE+h1ErHWixatcTf0JMpjGZwfNQIAO3hF4TZdIw2wtBpslRocaa6H
	sGTmXWGeNMAqwewyfD7aEazt9MhBL5entJKRuW1E51rR5nh9KDLUJ8tb3Q5WCzu78WzMVZU
	cLDxzOPc6QGXukcs4VFnrP2AfssUjsofVfJkSimqnu5mhdcEMDWxbdSjZkILNxAZE/Izahj
	D6KFwOBxjdDvAMghnL3rSdoadgGTPb2e5hS/1amRGpPY8KIhvOv5ypt2AbG2zmOSlW0WYzJ
	RbOSYfCKGmhuuVBH7q7FjJF/DmECsVENH4Qpsa5nw6ON76Lx0vA3wDiRKQWKBP3eEVyNxaX
	SARbUQzxfoIPwtePId1bU9C8V5QxrjCbbw7INfDn283UMhjPywB7Gf3MY0hA6lkz8Z2YoXR
	l3i95w/mCFDpX7YDv6lw6y2+HSV4RoDvj7lchYYu1AUrD/OrjaSpNLvCcrHvI7gCofHh9rq
	MwLIul9AP9W2c0JckK0QJmlU57qDh/ZpYq8YUX3RbhURw8+vrxEc2l4AlRVwo83FJENPDRt
	N2RzmG07Ut7/Q7FAa+x9ffxbKyu85LVUZJIJOtUoPwzBkjzKu6ZT3hb4YSU71MfZvly7oD3
	bQ51qTTFHDOJpsxWgRXHO8reCOMDIT7+MSzUhXbiytdRD/LAMtIt6oIjMGjYSjDD/henXpT
	gPLYFHeFsll7xVvw9JNAHOvMadxqOiOdXEqw1Z3DOTRogfDrGZYjMRRoP2JxThaYbxk10sz
	3nQS+28e4BlSclzQJK29pse53JIeU/18kPPwkbM+1hhzelmeC664OsOHzr7o3J1nznxY7ck
	WK5214lYGB3efv5F9A1Y41sh/DAjl0mhZknj5j1D13m9N4g8PP6kxm9VY5OkvvXh+daKKQH
	OS+9MJIhixi09pWIklD9eGMB08M7pz/bNF2w/IrBNrDmZsRqVMIfh4W/WHr6ASKfnziNswT
	e9A5uikMAJXrsWvF7BIw1ioW9UiuTzCpAi1j6vhDomm3qxoML8mWz1+paFKhdslRra5w8f7
	TikQZdVgVhZDy+vT1Nbv8dzKUKtv6lF/XxJjvQlQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

The FS2104/5S are Inductor-Less, Stereo, Closed-Loop,
Digital Input Class-D Power Amplifiers with Enhanced Signal Processing
FS2104 can deliver 2x15W into 4ohm BTL speaker loads,
FS2105S can deliver 2x30W into 8ohm BTL speaker loads.

The driver has been checked with kernel scrpits and cppcheck.
Most functions have been built and tested on EVB boards:
ARMv8-A, Linux version 6.16.0-rc4-v8
Part of test logs:
FS2105S without effect scene:
[    2.941289] fs210x 1-0068: version: v1.0.6
[    2.941382] fs210x 1-0068: supply pvdd not found, using dummy regulator
[    2.941441] fs210x 1-0068: supply dvdd not found, using dummy regulator
[    2.965632] fs210x 1-0068: FS2105S detected
[    2.969875] fs210x 1-0068: Loading foursemi/fs2105s-btl-0s.bin - size: 2854
[    2.969907] fs210x 1-0068: Project: NONAME Device: DEV1
[    2.970319] fs210x 1-0068: Date: 20250624-1918
[    2.981171] fs210x 1-0068: Switch scene.0: S0
[    6.142932] fs210x 1-0068: hw params: 48000-2-1536000
[    6.157219] fs210x 1-0068: playback unmute
[    6.201567] fs210x 1-0068: playback mute
[    6.202801] fs210x 1-0068: hw params: 48000-2-3072000
[    6.217364] fs210x 1-0068: playback unmute
[    6.247900] fs210x 1-0068: playback mute

FS2104 with 1 effect scene:
[   18.067507] fs210x 0-0068: version: v1.0.6
[   18.072095] fs210x 0-0068: 0-0068 supply pvdd not found, using dummy regulator
[   18.085700] fs210x 0-0068: 0-0068 supply dvdd not found, using dummy regulator
[   18.113663] fs210x 0-0068: FS2104 detected
[   18.119216] fs210x 0-0069: version: v1.0.6
[   18.123675] fs210x 0-0069: 0-0069 supply pvdd not found, using dummy regulator
[   18.137239] fs210x 0-0069: 0-0069 supply dvdd not found, using dummy regulator
[   18.159819] fs210x 0-0069: Failed to read 03h: -5
[   18.164969] fs210x 0-0069: probe with driver fs210x failed with error -5
[   28.422623] fs210x 0-0068: Loading fs2104-btl-1s.bin - size: 6696
[   28.422741] fs210x 0-0068: Project: NONAME Device: DEV1
[   28.422751] fs210x 0-0068: Date: 20250523-1538
[   28.433739] fs210x 0-0068: Switch scene.0: S0
[   28.513483] fs210x 0-0068: Switch scene.1: MUSIC
[   61.912099] fs210x 0-0068: hw params: 48000-2-3072000
[   61.928384] fs210x 0-0068: playback unmute
[   73.962865] fs210x 0-0068: playback mute
[   92.833623] fs210x 0-0068: pm suspended
[   92.893641] fs210x 0-0068: Switch scene.0: S0
[   92.990521] fs210x 0-0068: Switch scene.1: MUSIC
[   93.077759] fs210x 0-0068: pm resumed
[  103.315898] fs210x 0-0068: hw params: 48000-2-3072000
[  103.331770] fs210x 0-0068: playback unmute
[  114.316948] fs210x 0-0068: playback mute

Nick Li (4):
  ASoC: codecs: Add library for FourSemi audio amplifiers
  ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver
  ASoC: dt-bindings: Add dt bindings for FS2104/5S audio amplifiers
  dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor
    Co.,Ltd

 .../bindings/sound/foursemi,fs210x.yaml       |   95 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/fs-amp-lib.c                 |  265 +++
 sound/soc/codecs/fs-amp-lib.h                 |  150 ++
 sound/soc/codecs/fs210x.c                     | 1616 +++++++++++++++++
 sound/soc/codecs/fs210x.h                     |   79 +
 8 files changed, 2225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
 create mode 100644 sound/soc/codecs/fs-amp-lib.c
 create mode 100644 sound/soc/codecs/fs-amp-lib.h
 create mode 100644 sound/soc/codecs/fs210x.c
 create mode 100644 sound/soc/codecs/fs210x.h

-- 
2.39.5

