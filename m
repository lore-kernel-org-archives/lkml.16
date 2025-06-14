Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53929ACC3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900898; cv=none; b=D3zYLY+CIgbTC+BVP1VZZy1VJL8lD/v7WUPlEyAOiFd3CtJbwacJ/1SXri7z/A2OtXOlbmbbI5qiJqk7DfBJdmN7CI0ijGPIGdh0nJpNKjPLUUJgOEYV4hwuyqZzIWcUFmYPGfwDTzLW0T+S8Pp6/7hPhO5eeCI1/WebtQK/P10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900898; c=relaxed/simple;
	bh=4evBXhltGHAvCim5DGTtyLoSOEFkwu9qfk4Q+7Xhi4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxrbtOPXFDgMZ5UL99QD6ogNxo9E0oNPnWXy9un0Z30/0ht2H9/HuCzw/3tVcaV4k6/91a3pg4aaL23RpmI4m++1699jBqK47tsh5ElrlML1Bow5XV4PH3VT0YihGAZy2tKWO1R+Uk7xsTYMYDUcYw1uB+hk8wRBv/BrbaVypco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SEsDU1aQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kJ6P0+1g; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SEsDU1aQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJ6P0+1g"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F7921140155;
	Sat, 14 Jun 2025 07:34:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 14 Jun 2025 07:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1749900894; x=1749987294; bh=IK/XiAot4O
	KLe1kIw2zSimDrO+1Oe6vk5F7XGo0YnsQ=; b=SEsDU1aQn+1CDfMEK0hj/CX4GB
	eZ6nN+4vYE9MitioiAh8GbQ1PTwbJ4hzt5L0Ap3dEdg4eFfBnUI94rK3ZrVVRt6M
	toSfkbrSafy186QCWQcQGWVeRmHcRPK5X/EQkmtgAHBHAFxo0O2QOP8HtMQYa+OB
	9IvYGQqHVkedgVyquvZ0dnXEeZeOfB2VsXYKKwIk6kA0PXS7ATOfkQidfASzBlf1
	r0UIrm+aekOj2kG6QJTAwXvTMsCRWURVfKokFB/Zy1S5wa1CIXtwLdUTyvTAF+L7
	UStDVVTjEuqqVZrVcSj+Z/aHTKz5a+nZVXMTyPLTzRSE9AmD3ZsrYliITC+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749900894; x=1749987294; bh=IK/XiAot4OKLe1kIw2zSimDrO+1Oe6vk5F7
	XGo0YnsQ=; b=kJ6P0+1gALJg4urdltWbGwVyqKKV31uFyP2GH3NYwqMft+/rprs
	3EipsebVR/s94815z5TNf8CBgb4RkKRTHchpq3C+hIY2TKIMKYznOxJSFkkJecR9
	sE/eCNQq3z04xnb0JchWskSvLIxfgYGB5udRvvrhrjy8bplPMxHdpw4XLarlPwH6
	h9unvRPc2AE40j/lqFyPP656Sf+x43vlroPkTDb0b2d7AM2ZVlLVVFQ3cOZRZvPt
	wUFMRm1nPuhTB9JhpldgjbwMfKmRn9xq67gEWYqE7ZiQhsVLzQIFAesZC8VOVAfp
	M28wLtKJz3soy+z24J9pn6LNGLsr7Dh+mPg==
X-ME-Sender: <xms:XV5NaANmuE8i43i2vBfglnhZLExr_CzdMf25QiMRov8-6Ix-_6UwTQ>
    <xme:XV5NaG895IlYwHooHAZhXeldexNdn4y10vG423eQ_LbSCyvvjdpCo0_l4Cet7WrGZ
    9GvpjGKWTEpKGBi2-8>
X-ME-Received: <xmr:XV5NaHQ6FKF8_8CkX8XLt6nvoHYAC2FhhFRS18uX6QlMPnwcKuq90oUxfjHQtCYauQmXN3puDL5mfb8KjHRUURux2jos768HkxRdu8UHgWz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvtdejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhho
    thhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrth
    htvghrnhepgefgheelheejieelheevfeekhfdtfeeftdefgefhkeffteduveejgeekvefh
    vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgt
    tghhihdrjhhppdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhr
    ghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:XV5NaIuH9IGpJog-Wq-DYDBGVyu8i87UTsYHJbc0n93ChAKhySK0gQ>
    <xmx:XV5NaIdcTMG6VsElEtgeM-FksqQ1_wxaRHARdK4rpV3bUP_xMoqxHw>
    <xmx:XV5NaM1L_8d53uPOU1LWKiD27LS8EEHt-CnUpb7ajvlP8_gP1qGbHw>
    <xmx:XV5NaM8FZ59dEyPSq_C5FzV8mSnYGTebgGeTRnq3OpB5XipRRZudOw>
    <xmx:Xl5NaLuVEx0GaXwpzYPs6htP3HZ5sB0MKvT9C5Ylerv00k6kFqvFc8Cp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 07:34:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firewire: ohci: use regular workqueue to handle 1394 OHCI AT/AR context events
Date: Sat, 14 Jun 2025 20:34:46 +0900
Message-ID: <20250614113449.388758-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Last year, in Linux kernel v6.12, the bottom-halves for isochronous
contexts of 1394 OHCI PCI driver were changed to use workqueue instead of
tasklet (softIRQ). I have received no reports of any issues related to the
change until today. Therefore, I believe it's time to move on to the next
step.

This patchset updates the driver to use a regular workqueue (not WQ_BH) to
handle 1394 OHCI AT/AR context events. Unlike isochronous contexts, the
asynchronous contexts are used by the implementation of the SCSI over
IEEE 1394 protocol (sbp2). The workqueue is allocated with WQ_MEM_RECLAIM
flag so that it can still participate in memory reclaim paths.

With this change, all remaining uses of tasklets in the subsystem are
completely removed.

[1] https://lore.kernel.org/lkml/20240904125155.461886-1-o-takashi@sakamocchi.jp/

Takashi Sakamoto (3):
  firewire: core: allocate workqueue for AR/AT request/response contexts
  firewire: ohci: use workqueue to handle events of AR request/response
    contexts
  firewire: ohci: use workqueue to handle events of AT request/response
    contexts

 drivers/firewire/core-card.c        | 40 ++++++++++++-----
 drivers/firewire/core-transaction.c |  7 +--
 drivers/firewire/net.c              |  4 +-
 drivers/firewire/ohci.c             | 67 +++++++++++++++--------------
 include/linux/firewire.h            | 12 +++++-
 5 files changed, 81 insertions(+), 49 deletions(-)

-- 
2.48.1

