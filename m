Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF772627;
	Sat, 24 May 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081638; cv=none; b=prGj88dB5Xf/g4fzmDDqGGiHEgyVL1du3TLdxkonL8EfFjI+lh7n0lGTuSWV20ips1My74qxbxfhzI1tXq3qXj6pWgrOYr0FeJCOdkHtRbH+TYww1p/QFKL7MsJH191RIM5KL2IwNjljjcGBLU4qNqfMbdc+QWtsDye5/KqAoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081638; c=relaxed/simple;
	bh=1XMDELaeqTKaIim3oYaW+v76R78xWPX1eFmjmVSqpnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIOO65hbSkK9WOFC8irZoeLlFR6ryZW203XO19XyTEvUij3GMiJt3vTIqk2rDkiYQDzlaCEFdcC4YrmN1LY1R51mHYCJXVs2hS1x3RZX8GmSmjnJq3FaVMriVTRgcbhMzorBH00j/jhl8PgN3eaPEdXjYFrTf8WmQ4q62vChY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=UgyE4Xa/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rqTbBLFK; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="UgyE4Xa/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rqTbBLFK"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id CC69111400F7;
	Sat, 24 May 2025 06:13:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 24 May 2025 06:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1748081635; x=1748168035; bh=FluFuOFvgquuWZWu40tDv
	+uWE6BcxeZX5V782aBS1jc=; b=UgyE4Xa/PnfMVmK3EFRdRQhfGDEMp7m/twOiZ
	YhZcUvMj+MxshTEYj6TwIDkrhJfMw3QUcpQ3U9rWZbnLq1aQth47nr9p+gqovg+k
	ATx0Qg7z5mC12XfpK3Kpeo3fUfmsLaNUIpr6x1I9Jso+2MbsLuX4dgHzkawQcJUi
	xFqRnyik9wg5jxG4Q7vNQCldFXsgGnG+HMt8tgFN44QCfmpzQe4SYIwzMkEf7MjC
	3l7s7VhUWoohpHfCQgkiquNO7osEQkkCHIr2i0f+B8RDej/E0Pa7eLdQKBxVJCO4
	nIictmtpO6aR7ZFHitmJdKaElIYjV0S5empz++Cn+sSuYJaeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1748081635; x=1748168035; bh=FluFuOFvgquuWZWu40tDv+uWE6BcxeZX5V7
	82aBS1jc=; b=rqTbBLFKexlfDu9mEnP7RcbumS2a79OE9o9hwx0U7GOagSCQzpK
	zMXcmVavu7E/PTIUMwQS8e33I9/68z1FQyJbldC8Nxo0c9cPEMn4OAVm/2HUCT26
	38NGXOCtTQTJDIFif7Q7Yr9OoFIKMVoj0EluyANU/peZ+J4w7BPJHdAQoVQGq50d
	gbmmPFDYg+rrRWpteDpcuPhc31dV4yt3GV8EprFJbsAq2yn+7QgHSigQofDunihW
	EXJDh5rBKuLIrd+8LZBkID3lVMef2LRxNA3W/IyiyM/vg/WmWsKvOwB6B13YRh0d
	DpOFEUfIMo1k/5VfSmqwMXrm0E8bNXpzP/g==
X-ME-Sender: <xms:45sxaD26wyRiOEZffzQW7DEwN5kzKx4oEDbYrmThkS6Ue0ZR2oXy2w>
    <xme:45sxaCE2216wiAPjFsLLzVf0UBzR4VzHEgFGeiNhE4pPAKMv0N3rLymbJDxRx4Zac
    256otAhhN0B0DtDkr8>
X-ME-Received: <xmr:45sxaD4KxNGCHVyjkIPQ54RmzSAvEzuOvkwluVXthI5CVr0c2UH8BfiyAxdQbF4RRn-cBg97u5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudegieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepnfhu
    khgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
    hrnhepiefhfeeuueeigffgtdefgeetgedufeefkeektdevudefhedtgfehkeejveejtdff
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehl
    uhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghm
    ugdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:45sxaI18t-tsytJqfaQadFICAGELiRXM68h-LlWh5hluzqSbQBXFOw>
    <xmx:45sxaGF6RotkKqzVE9-VXf3GiZl_Jc0GWytVPG4hY-YOn63J0IMzGg>
    <xmx:45sxaJ_dRw_orhleUuh-avq08DqlHgr3BEsTnK2e2YHvacjyE5KwNg>
    <xmx:45sxaDnI57UAfGEmKRX2lecfcrZ-qeUJwIDAJOMY_Bkz4OXkDMYyag>
    <xmx:45sxaBkVj6FA-Sc2bhQLCC1_n6VvHk1EaDOo8iYTu4rrp54GSbm7Uk3a>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 May 2025 06:13:53 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH v3 0/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Sat, 24 May 2025 12:13:41 +0200
Message-ID: <20250524101343.57883-1-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes "platform/x86: asus-wmi: Refactor Ally suspend/resume".

Verified using the following details provided by test robot:

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   83579675331059689e2869bf752ca9e17fadbd82
commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x86: asus-wmi: Refactor Ally suspend/resume
config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)

I've not done anything fancy here and left asus_hotk_prepare() as is, as it is *incredibly* unlikely anyone would ever run a ROG Ally without suspend enabled.

Sincerest apologies to all for the noise.

Changelog:
- V2:
  - Move functions and struct together to be under one ifdef block
  - Use wrapper functions for s2idle registration
- V3:
  - Use the correct commit for patch. V1 was missing the full set of changes :(
  - Reference the right patch in changelog....

Luke Jones (1):
  platform/x86: asus-wmi: fix build without CONFIG_SUSPEND

 drivers/platform/x86/asus-wmi.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

-- 
2.49.0

