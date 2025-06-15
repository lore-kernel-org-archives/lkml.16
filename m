Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FB38FB9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749994383; cv=none; b=j5XWAr4wPKpjb3+w6vpUlOcibua5pOV9N0dhVqeiqbsMvwHY8Cqa4af0k3TaGi+MuERjMqYTfYEE9bXs27kMWHjpFRRb95yxZruVJ5Q43IJ2KUJanLUrfavGej+6JzK3tjWbvXCtrSqJt2MvnX10yz1zj2Q6tM4aa15hbbk+nzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749994383; c=relaxed/simple;
	bh=q9wGeoEV7c3Pgy29ZqkwL4LN2vyvIDlUEfAvKb5I1x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0GD/YYi7Q1c18TdSTF1oOgB+RQhT849iHbe8BQocXGHKnhACIb2ypkPgyZxADEPRrrWTy+2c7JUWtV8nC2k5tSK0duFwlsu2v95ESb5XvlK2/5NXcF9J/1MA1kAR+xiBWTZ/jCm5vrxV0VyB7NpRwU3dzyPGWWlJ5P+hianvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Vx6Wz6n+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bsflmaci; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Vx6Wz6n+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bsflmaci"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE44911400E0;
	Sun, 15 Jun 2025 09:32:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 15 Jun 2025 09:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1749994378; x=1750080778; bh=vzFryA+NN6
	Ht/0dOq5eL4QdUkSuCzecwwDqk0+RmhrY=; b=Vx6Wz6n+/jAbOFHo5vMNusUEVB
	QIUQBe4GH4O2qWmrBbQ/NX2zbNpGCCF2CiL4oNlTa1MfmJwTcvNJKcFXOhdWK7Gy
	rvlrQDu7QXMsm1KmeqE8oL/TN4X0Fp8i+QQblwJoxrxsYW66igZK3RSeEwNXQcOo
	LLOYIuZKTqS+Ua1t4TZUHIIN1MKiQLAeFwKdv6x/MfnqowsIP29GahAdpkRLYiuk
	Ienc5Q1ang2Mk8n0j7zxZkiGvmYnE50qSUGDTgx7qWyTi7YXvecPdAYYpEoLRARh
	0c/qhgtsyXgnBa0OzrXgXyXovxv6h9+HKGReHg/gj/dnAAtDrWzdaUKt2tkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749994378; x=1750080778; bh=vzFryA+NN6Ht/0dOq5eL4QdUkSuCzecwwDq
	k0+RmhrY=; b=bsflmaciIB78rlTpfs2CNozLnC12l3w3deWDOxJ8zUASX219mMj
	rwzTN5AvKf6/nL0KZxm/GVD7Yn1sZW9+0DUK89uupmOqFiQtrrUPrmoZCa27VxZr
	feuB9syEv8hAy6rNh8C9k3dDtQPf0KSOXLr4r0BKHyCWTQdKaKJH4bBYf6oddXMJ
	NHNYb62I17HGS6FHrc4eDUcVuxof47fpvZ/IQDXqP7c5SGO2d+d5dEkjmYNt6GrS
	Il/z55BCVfOMmrvvGhtOTk0RWRTVSw7jsHuIj2viYfQjAY57IdL7ngz9eafDe+D3
	W8QnwuBJohgS90GXI1kHiMpvA4Z1GVvzxvg==
X-ME-Sender: <xms:istOaB-SPmjZbguYhps6jroAfNL9ucDwa9GcYmdAPOKnfn9uMvFmhA>
    <xme:istOaFstdngSYPt0MtJMOmOnU8xF5tte-ljoRnGdZndccG5NSD3c40alu7aPP1Zfk
    dwLFV_AveQUthYNWpw>
X-ME-Received: <xmr:istOaPBpVSjK2cCr6volY23EuwXtE-QPyZP_OIb87sBgbmgxVUraizGyFi_zNRdZDBFYe0Bm1UnbP8ha1ybfXvpb8535berbzKJa0ezfJ4MjYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeekfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:istOaFcnr_dAL44vozyMHsCZiQwXesPxzdZoCDlCe7642QWfJDtJKg>
    <xmx:istOaGOuY8UbSjeLpl4nSXapsdMr02Z9TTMwu7ShoM-xsEk63i72Xg>
    <xmx:istOaHnOSLjSlPAhDjJadXSZvGC87J9tql7To70nrqR0suKwLVhmDg>
    <xmx:istOaAsxqpjRLwz5yG7w1SNxtrJkRyxC53X-FmAOy2_li6uvqH7WbA>
    <xmx:istOaLdvoxowxJrUCajhwgnaUaS7xnSOVU9vtmkGUXRrozj0A4nmlQkF>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 09:32:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] firewire: ohci: use regular workqueue to handle 1394 OHCI AT/AR context events
Date: Sun, 15 Jun 2025 22:32:50 +0900
Message-ID: <20250615133253.433057-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the revised version of v1 patchset[1].

Last year, in Linux kernel v6.12, the bottom-halves for isochronous
contexts of 1394 OHCI PCI driver were changed to use workqueue instead of
tasklet (softIRQ)[2]. I have received no reports of any issues related to the
change until today. Therefore, I believe it's time to move on to the next
step.

This patchset updates the driver to use a regular workqueue (not WQ_BH) to
handle 1394 OHCI AT/AR context events. Unlike isochronous contexts, the
asynchronous contexts are used by the implementation of the SCSI over
IEEE 1394 protocol (sbp2). The workqueue is allocated with WQ_MEM_RECLAIM
flag so that it can still participate in memory reclaim paths.

With this change, all remaining uses of tasklets in the subsystem are
completely removed.

[1] https://lore.kernel.org/lkml/20250614113449.388758-1-o-takashi@sakamocchi.jp/
[2] https://lore.kernel.org/lkml/20240904125155.461886-1-o-takashi@sakamocchi.jp/


Changes from v1 patchset:

* Fix "error: cannot jump from this goto statement to its label"
    * https://lore.kernel.org/lkml/20250614113449.388758-1-o-takashi@sakamocchi.jp/
* Fix indentations.

Takashi Sakamoto (3):
  firewire: core: allocate workqueue for AR/AT request/response contexts
  firewire: ohci: use workqueue to handle events of AR request/response
    contexts
  firewire: ohci: use workqueue to handle events of AT request/response
    contexts

 drivers/firewire/core-card.c        | 48 +++++++++++++++------
 drivers/firewire/core-transaction.c |  7 +--
 drivers/firewire/net.c              |  4 +-
 drivers/firewire/ohci.c             | 67 +++++++++++++++--------------
 include/linux/firewire.h            | 12 +++++-
 5 files changed, 85 insertions(+), 53 deletions(-)

-- 
2.48.1

