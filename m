Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF62459F0;
	Fri, 23 May 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006101; cv=none; b=dtc9X09/+9QHkh5RpoSrdQimSulWrp27s1Wve2AYXdC9Yor1S1zlrfOfoWfiKe5UGRzwchl1mFbZ3EIvJc1A63q3AL50RV9V7LZorVVae6LK0T3kPj52IWEmCqRrk52+rsOBepf6UlJlicNE7kNLgkh+htwYSEILW8Q03AW6WaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006101; c=relaxed/simple;
	bh=nP4DCqI2FKwvIfEQkVkSafK1L7oY2AmjccjXGu8w8I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nl9ULqNLRcjgtggT4lkaf6FHtEs0jhVXa6RU6qQekdbBQYC6/5yhQkana11FaUTuYDDhfI7GeA+7GwuIXySuYXBsPB4iN6D61RgSFwv9Z8QLxY48s7TIFf5PiOE5N+w/DxDUuK4XqxQvxKChmUKRxCX48nXi3MBzNWslrbXz6qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=w697mgEF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rHe6EB5Y; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="w697mgEF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rHe6EB5Y"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E2438114010D;
	Fri, 23 May 2025 09:14:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 May 2025 09:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1748006097; x=1748092497; bh=onu9pSqOyo0uXFxfnI4FT
	VRTqgcadMSK1+A57xxFnXo=; b=w697mgEFErnrhXal+vlUYUwA7VdoT4XqkI5cx
	5vuk2tyhfs9A59WAQazMsRytAAgwr8XRR1rryDjeisfLdxvEXpK8Uv+2ZQn6L+9+
	9qGEyUqdNxepBuYT/vuE4FJamHF/G/NDMrVXXpRJ52SiwniEpWYf1Gog+IChxq3Q
	p1wfsvmTfafbTxanjQ/G5bI9sAVbvuBpQn6Gr2Igdw0xoLGifziL5Mmkv0SSLF8Z
	ExaGmQZoi+W92N1Y3iBKBpt3EQR5fM04lfs+hvnbCBHI/4aP72mBb3M9fdQ6IyF/
	M+uUAzshtCt4b1TMuLzMcB/kj0dT3HC7/WihLNskQRt2+306Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1748006097; x=1748092497; bh=onu9pSqOyo0uXFxfnI4FTVRTqgcadMSK1+A
	57xxFnXo=; b=rHe6EB5YRfABUSJf/hlkF3SUW5BadxjpSJdDqDafVgJPJQ1Voe9
	zHgJHX9nT1TcHn9rFJEsOP+VQ2LDiLqm+LJBzwZzKjLjxOs/VOT5cnAt1PNjlLc4
	1jN/colujxbIa3fLi3hjB8z2Nx6JPV3pUXGJjy4JkuBTedBik/c6efc0TuTFL47r
	k/JoFWy/S0nduHnbuSim8V8Vb41WE7KAjQXmXXpdis6bzPROs+b4B3ZNIv6y6nBG
	c1e7mJ5lsyKjbM2Lwul6pwxK7nZUuCJyTlsXI7/PzP3o16S64q5i1QXP1IXViOBb
	RJ7D/WaHAMoTNh1/jPFm10SoBM+CfbWMIBQ==
X-ME-Sender: <xms:0HQwaCGGyaQevqsHWQ8o3Ll4Y5WhtsMSbJlrnlk44cJMFgp_4Wcu3g>
    <xme:0HQwaDXescQZ_hCUsJt9ze2SD2v9vmF0ZJliIFXVWIBCNIfOqA-ztKZgfWnppfpNy
    e7YgoOhcLDQcp9ZVCY>
X-ME-Received: <xmr:0HQwaMKSm1MnZoniOauZWXTsigPqclGas4uVejbjeuCk6CKPZZWHwYGDjcnvUkHg1XEWZ0Ycm5iovY5gOx9QVHaF3toxtcFAY0YKKWDBxhM8X6AJXlTzdmTBs3as>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleehucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnuhhk
    vgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrh
    hnpeeihfefueeuiefggfdtfeegteegudeffeekkedtvedufeehtdfgheekjeevjedtffen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhu
    khgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
    tghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgu
    rdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:0HQwaME00yq8pb-Jv51axUFvaXGr71dphK1jvg0IW4iw9FtpD0gRSA>
    <xmx:0HQwaIWggjlp9PFI7rmsZ5anS2Iw4md5bcqqhRYOE_IWbycLrKerlQ>
    <xmx:0HQwaPNyWKp6pBq6vzM3kE4Sbf4gHkw8FD4giJTEDuhsZq8gln-Pvg>
    <xmx:0HQwaP3UkCOdGvGfXjvF522Vycm-y6xpLhQ8rSKZvfs-NcReVdWFdQ>
    <xmx:0XQwaP1kbYzhtZaTZLKZ4l1Ic_bBvbflZb1-1IU5X-Y2kSboKc6oTSW6>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 May 2025 09:14:55 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH 0/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Fri, 23 May 2025 15:14:50 +0200
Message-ID: <20250523131451.1942578-1-luke@ljones.dev>
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

Luke Jones (1):
  platform/x86: asus-wmi: fix build without CONFIG_SUSPEND

 drivers/platform/x86/asus-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.49.0

