Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89B23771C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603600; cv=none; b=HK0mAF0sRX18BMrlEsuEOFFVh6Kqtrwe8o3UL30MAPFYWlPI7mtU/CHHC37d95lQnZMTFf6fuIfbR8pXxqTq73YizfxeTsLYR/VTqTHsrEbZCzPLeqgNAGFBfQF1rhXYb14LMTCiWt5JlElMAKDQF5EB+7J7gNHvhsz100F3x+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603600; c=relaxed/simple;
	bh=IagHZNFl6FIqCRQBOGu1dRvf3ivadDEvVwI2wvCLwj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8l4EFrU7Vj87zgzX8oVUsifqdv/ps6IxgY+TPNF9W3rPFLcI6kafTjS6iC43IcEgGhAwyhufroHBfTupiXJbnO+KayOeykPi0d2TAx+wW/LlQoxYLJwW/3V4TWcaz9PoSAZ01NEgiQZXGIvtkqxFGTl3//Z1A6RUcb1ONj5RWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=TazZ6EKz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GBIZ5ta4; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="TazZ6EKz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GBIZ5ta4"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D939625401E9;
	Wed,  2 Apr 2025 10:19:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 02 Apr 2025 10:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1743603596; x=1743689996; bh=sqQe3ur961jEGccmSiNWW
	YEe5WbZ+exhYjcqLTWqpRA=; b=TazZ6EKzmvd7ypRnQcSZvh7cjkYcgkoebM2jL
	x4q5lagwTlfDUh3A0tIPhf9k/f4ak72Za49VOEWQbN+giGEfTjvZCN8Eolpp7e9l
	CTrrYXvoyoZSGUOp5Iln/fd49EOdghqoYcE5be7wSYANLUh9/m1XM8+FAbLcP4gn
	+ia1P11YqDjTKPpKrU3P3lg9xf96rCIIZj8wkFfR8lpYXwob7Q6lOlIdbWhRPCax
	XABO/pAnjWYcfT+9UnqZo63HLXBluo2GwSVE1F5OWukodE6apkffUgqogYCyy1uf
	R1KOnoByplSe+fEsD5F0pPG9emtn5/wS+yhtSLR86aw2kiGtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743603596; x=
	1743689996; bh=sqQe3ur961jEGccmSiNWWYEe5WbZ+exhYjcqLTWqpRA=; b=G
	BIZ5ta4rwrz8/xKGxszlrACvkaXQM6uCvxk6zsV5KMQWPoDaPQfSIPKZrbILsNVe
	XQmBjWqgKLi6Kxts9/VRSuvS1tvwRgmRjZm72dcYC+OpRv1oWMBKJlbuuNXXbjX6
	Vs7f84QKlZsNSJROi/H2ZVyWuGrVXxyU5HOnwsxVqokulLke+YzORG5OdXmtK6n1
	w3bNg53/oLveZhFtVqvHRLIsagtihjXNgBBj6uvWet8I6KE2evXmmUkJuCGxAxKe
	bz35FXs96TvHXaEtf4XI5E5iq0P8uD+r+GgbrlJ0xq616p4/rjQPaDCBs8tjNEEB
	MJGMWZlgB0pvUbkIx8GQg==
X-ME-Sender: <xms:i0ftZ5KaG2uufPJVKBfTobWJIKlCKbWDgdX05z1VF3py-_P77of4Gw>
    <xme:i0ftZ1IYLsoC9yIEDaiAHdfDG5XcGqYWhc4HBxkZySYq9g6OQ-bGwmpUD7-gZx290
    2scjkgjv3pGgXQY2rA>
X-ME-Received: <xmr:i0ftZxtfcv5Be7XX6NekDgEtSgnLPsED7bWptDgLcjA9QUPXSgyGky-EEIXtVjXTkHkgMktBdnFqZL5FnNNpYCJkx5ZrISPbdGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfggtggusehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpeetfeeiteefveegvdfggeffheetleejkeekleeugeffffdtgfdtteetkeev
    vddvgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhho
    tggthhhirdhjphdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurhgt
    vghfohhrghgvrdhnvghtpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhurhhifigvnheskhihlhhinhhoshdrtghnpdhrtghpthht
    oheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihuhdrtgdrtghhvg
    hnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:i0ftZ6Ys7HOmZYX6i7CjkGeWCXyXroSjKpNcOj68r6-TgO2BwxscGQ>
    <xmx:i0ftZwbr9-RaRES0dEYIYaAw8djzY66UYk6h_yTX916ZRnjmgr1oZg>
    <xmx:i0ftZ-ARJZmWGfOkkM1ojwGssxA4VlY6ebenJ5vzVWtmRlgHHbH8Nw>
    <xmx:i0ftZ-Zt9a-go7CL_4XjzLh6I04otjTC5w6-SLVSfMQvEbQDSc27uw>
    <xmx:jEftZ5QIieS5oYEIetnhoOJSetjhlt2675OecW8fTY4o4RKOrLpoZSfz>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Apr 2025 10:19:53 -0400 (EDT)
Date: Wed, 2 Apr 2025 23:19:51 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	masahiroy@kernel.org, luriwen@kylinos.cn, rafael@kernel.org,
	yu.c.chen@intel.com
Subject: [GIT PULL] firewire updates for v6.15 kernel
Message-ID: <20250402141951.GA79643@workstation.local>
Mail-Followup-To: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	masahiroy@kernel.org, luriwen@kylinos.cn, rafael@kernel.org,
	yu.c.chen@intel.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please apply a single commit from FireWire subsystem to your tree.

As a side note, we continue to have a discussion about kbuild script since
the recent change seems to bring a regression when building some
in-kernel tools including the one for firewire[1]. A fix candidate has
come[2], but it could be too late for the current merge window.

[1] https://lore.kernel.org/lkml/20250328074750.3524280-1-luriwen@kylinos.cn/
[2] https://lore.kernel.org/lkml/20250402075253.1772541-1-luriwen@kylinos.cn/


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-6.15

for you to fetch changes up to ca2c736554c105897d67a015a97973af315e1c32:

  firewire: core: avoid -Wflex-array-member-not-at-end warning (2025-03-16 09:32:30 +0900)

----------------------------------------------------------------
firewire updates for v6.15

A single commit has done to use the common helper function for on-stack
trailing array to enqueue any isochronous packet by the requests from
userspace application.

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      firewire: core: avoid -Wflex-array-member-not-at-end warning

 drivers/firewire/core-cdev.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)


Regards

Takashi Sakamoto
