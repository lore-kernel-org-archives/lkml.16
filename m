Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C4282ED
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430148; cv=none; b=oCVOLtj1qQFGaqk9lKqw+SwSLxoGKo/ZsPFmr8XIkgvJHeQoxWiz7tjOrA/jsKwXovoH4SzIjy6XdQweXkiM2UVS/R7ERfAcVQtIVVs48l001avrtdh7AIoLArAUYdbVTRuq56gyunMBQVMAe9fFF2quVOxn/XJehthR43hRGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430148; c=relaxed/simple;
	bh=QIA2TZhgja5MmNtCmG7TTTxpL15mVdbtm0WB0u1sZfQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=urqkAch4q4td/re3pz7IH2hjKPDTbjXIXQ9EelBP/Di5NAiJh6DdmOTLq3bfKdDAwvl6S7faIM4q808/7jEk6EZ6s97U8drb84P0+FLYb4ysJpXwnT5bvXq8LpT5DTq0UP/lSIC0RlUluHUB0mk5qavzFZeXS5z1w7GfKh78xgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LEyXV9pk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mf0cdhE0; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LEyXV9pk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mf0cdhE0"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id E0F711140206;
	Fri, 20 Jun 2025 10:35:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 20 Jun 2025 10:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1750430145; x=1750516545; bh=Vc
	aaI2US/aqfChXnIhEFupiOIGzf7TUthnMmD43vvDo=; b=LEyXV9pkiWRgcofqjV
	WqQppSL2MBwdtvUBNtnfiU3AlYLCZJgbEBDgMGw2a0uCAr8OHwZEeDk2yxnJyFio
	cSZ4E5DdxvGFbBBDOfvS9fKYdUJTodowpJaBZk2x83cNHrzmyKr5xQEIKJzYzhaU
	I7rhABOTfMCGpwQysSaxyk0Cp8e33XCmoLMqn+tTiwbVEUqR599IP5YCftJkAN9I
	xu36/6N7qrnZF8kodUJT3wT8gbC99TRJtn2iDzQIVNdIUo0yzIo+enyrRug7Q5xt
	eY1Mt+QCOQFFku5w9sor1S+McgqGZIEYYRXg47hQWKYHT0KI2rYZ4EvxZjGiC8Ik
	h9fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750430145; x=1750516545; bh=VcaaI2US/aqfChXnIhEFupiOIGzf
	7TUthnMmD43vvDo=; b=Mf0cdhE0FDBONnFZ68+Z1EDfYSMUe70nVecuu/ilT2R1
	sdf5hVrpcyX3vM2tLN8FQ/mcuktU468TsRMD8BRty157RRWfEHwj1uC4JkDxkdSo
	sJeqLsPgswDbikmjhORdp9OWNv4Ol461ImLS7fsCExEJ8oqWb2HNcmZLmgQZ+9up
	r3RYpz0cqMG6RBjscLFHYplCN/TbLzXLlHlWzKFn54E7Cewf8u+DnHuOf51Qx5X5
	ShM+ygvfQDwRuGsDpaKI4+PeW7962x6KF5p/zpoZDOc5O6S/0SoUCUMz+CMesZvi
	xJs/fw1moRdXnJNgYNL54VYsZjb8JhvuMfdCaylnwQ==
X-ME-Sender: <xms:wXFVaNjES9Ol09blSdb4lFzYQAmvd7do75CkKnoQ7sLPi47nd3Wgfg>
    <xme:wXFVaCD8MhnLNsyqZUgt5hHx2ZywbqmOaJRDYHGqqvSemnUyvD0zBPfGemRJaCbIl
    NmvODFaIr1PZn1Lqoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghr
    ghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepgf
    duudffuddvieelvdetgfegleevjeelgfeuvdetfeehtefghfdtgedvuedtlefgnecuffho
    mhgrihhnpehprghsthgvsghinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehjphhoihhmsghovgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhlvh
    hmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wXFVaNFxGq5HRnfxuptOZa_QfCUdAgNcoOKHWPvRm8ecv9ib9VbV-Q>
    <xmx:wXFVaCSoE1Onq9Na5q-yykNEDGsGBV6frjWAJLH4EBR-Puad5PiHaQ>
    <xmx:wXFVaKyz4n3X6GnFy64nwupj_EHqwngohAs97SnDFFrntFWS37fM8g>
    <xmx:wXFVaI6kaZL-7PHtvEAe4_2BkeqyWtwLquljk0ISaFj8nfbzhDY1IA>
    <xmx:wXFVaOV9paxF47ltTD7w2JfrnrVqX8u1GG-Xh7mHSAWCxIq74zWWsgiN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 742D4700063; Fri, 20 Jun 2025 10:35:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 16:33:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <b89e2cc2-f321-4775-aa05-6e8175441f88@app.fastmail.com>
Subject: linux-next-20250620 objtool errors and warnings with clang-21-20250619105726
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Josh and Peter,

I came across some new build failures from objtool errors
today. I have not run this for long yet, but this is what I got
so far:

https://pastebin.com/vM26CVnJ
lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch+0xe0: call to __msan_memset() with UACCESS enabled
lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xfd: call to __msan_memset() with UACCESS enabled
kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x20f: sibling call from callable instruction with modified stack frame
drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0xe: unknown CFA base reg 0

https://pastebin.com/5UppA6JZ
mm/vmscan.o: warning: objtool: shrink_lruvec+0x198f: sibling call from callable instruction with modified stack frame
drivers/usb/host/xhci.o: warning: objtool: xhci_configure_endpoint+0x15bd: undefined stack state
drivers/usb/host/xhci.o: warning: objtool: xhci_configure_endpoint+0x15b5: unknown CFA base reg -1
drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0x9: unknown CFA base reg 0

     Arnd
