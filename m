Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D15C603
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120251; cv=none; b=NMsihhSt+hgepW0sioHNyqsOvsPtO81GWmpH12ekjOAfaCk8JsrWXHNNfHhG1wr+d2RAE/PN8F17147Hs22AfnFs9fqS5l6sjGKgg34GMh/NQxz03Ia9ayJHXwpwUKNhXhdZ19tlFBTi2ts2biLNjcvFn7treLzB4ppOWZ0qiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120251; c=relaxed/simple;
	bh=+ZmrUsZGAa6xa14i/ujK1FnHtnDXDlYsrqp8YYYUCv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzVOUss2Wz0XDdPtqnpsz7KaTvOCkE3t25NTt1VKKFcrIlOqZwKR8hUyxMnAkp4WLknrLjrzI68HSIKaWZ/4NLGSlg3cFWnH59JtpLgcyBkrKPePdcnBOeaAdLwjTM2JNFG3ugf6eMUqu7YbNwG7qEQgr5mug94XE3Qd9nyOvTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ZlYJUlig; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OvSf/Tg8; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ZlYJUlig";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OvSf/Tg8"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 1E35A13803DB;
	Mon, 16 Jun 2025 20:30:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 16 Jun 2025 20:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1750120247; x=
	1750206647; bh=x5XZ6qJaA8Q+Y8DRQar4ffKcyWxs5Gd9Upu0Wb+KVqk=; b=Z
	lYJUligQWt9tL/Y7F1tLXcseaLML8/xJ1CJkVqhLsOrCro4JeNGbzocgj4Go0j/X
	Ghx/F618iF3Wv2rDcY6SnIoLl97U1b5eYysf0mq07I8p3AYszJjTeX5thrZLKYGB
	UXieesQjYRU79pqo5eZuDejTCyhVn8E4pkT0GvAyg7vr5MrU693LPNELIjl6IQNq
	v4kUlhqkLOkoBEVjZ79Mf/rVllvruCPzCozENG2oz0ymHrXaw7S/Q66+SRdXXNS1
	Ec2Id2/CmfQMBDwsHw6c1CbjEgNbYyD1G9h/VNwVrCliV26j/U/4Se/lvj1q1/iN
	pdGVSZS6mwS4kYLSwYFJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750120247; x=1750206647; bh=x5XZ6qJaA8Q+Y8DRQar4ffKcyWxs5Gd9Upu
	0Wb+KVqk=; b=OvSf/Tg89vI1Ctc5vVu1VedY7p2SyFrof5nwEmRZBWckekhNTze
	7qftwVMzHVoEb5HuD0t/654iQiufDYQqR5wEPB6YovD0PxVmOjFOZ4YtZpAfm22W
	beTtIYFtEzqheL0I2QZYLJ9Lc9or2Tz6CqTy51tfvdc5iIzF8c3NllrBRe1yvXVx
	h/T14in+l2LzqjY+mn4AZ53+jWE8Y5bV68FHzmVmRNQ4Btww61cAm9NTkEzr/Hin
	yitxFr5HaRIQy3Rnmka7EhHx/e6cQLVEw28BWZgtJLqY38DZfnXEpRAeuPwGAtGS
	qKI/yoa/teujSft+QtWWe74OLqSz8o924Gg==
X-ME-Sender: <xms:NrdQaJrCo4H3wvGi3MI4QXmnFda6AmOFofwmNlSDOas9nufw03VIXA>
    <xme:NrdQaLpTfo1Fzxom2riYLF0XrfpozqdM1Z3-Je4Sg8rotEJlWKTvSKQIgc3QArkZp
    SxR1zXxwwq-7zwzHOs>
X-ME-Received: <xmr:NrdQaGMa2zD25UqxQ75y05HeCMPO4iFmKWj82qqJecnNcJ2oL-VJBw84B6L4ZFP5it8AGCHq8W7Un5Q-3uuZNuGjSGR3-LHetNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvf
    evuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgr
    mhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrf
    grthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeegieeljeehjeeuvdeg
    hfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghm
    ohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghf
    ohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NrdQaE6aJhlsSz70bWevLrj8CgkR2gNMGWcV1dNrU5YXIniTYJ44Ag>
    <xmx:NrdQaI6LPYTgIPrHVXsi9huD0GnqRlC-Q_rDSpN73EduhsLru2_alw>
    <xmx:NrdQaMibZOV7uJsKZIVtlrAwTzsRfkMzGXMnszu-IcO3-ZGSq2bv8Q>
    <xmx:NrdQaK6VyY7OqgZyFtQSCccfeJhlgxZjclQiH8_hkBgA4JyHt5UL9Q>
    <xmx:N7dQaEo2lObxA-nRLKg7DhfWBN6kqt2m50eLTiJ5WiTK3FTKvXVEvLAY>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 20:30:45 -0400 (EDT)
Date: Tue, 17 Jun 2025 09:30:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] firewire: ohci: use regular workqueue to handle
 1394 OHCI AT/AR context events
Message-ID: <20250617003043.GA461319@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20250615133253.433057-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615133253.433057-1-o-takashi@sakamocchi.jp>

Hi,

On Sun, Jun 15, 2025 at 10:32:50PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This is the revised version of v1 patchset[1].
> 
> Last year, in Linux kernel v6.12, the bottom-halves for isochronous
> contexts of 1394 OHCI PCI driver were changed to use workqueue instead of
> tasklet (softIRQ)[2]. I have received no reports of any issues related to the
> change until today. Therefore, I believe it's time to move on to the next
> step.
> 
> This patchset updates the driver to use a regular workqueue (not WQ_BH) to
> handle 1394 OHCI AT/AR context events. Unlike isochronous contexts, the
> asynchronous contexts are used by the implementation of the SCSI over
> IEEE 1394 protocol (sbp2). The workqueue is allocated with WQ_MEM_RECLAIM
> flag so that it can still participate in memory reclaim paths.
> 
> With this change, all remaining uses of tasklets in the subsystem are
> completely removed.
> 
> [1] https://lore.kernel.org/lkml/20250614113449.388758-1-o-takashi@sakamocchi.jp/
> [2] https://lore.kernel.org/lkml/20240904125155.461886-1-o-takashi@sakamocchi.jp/
> 
> 
> Changes from v1 patchset:
> 
> * Fix "error: cannot jump from this goto statement to its label"
>     * https://lore.kernel.org/lkml/20250614113449.388758-1-o-takashi@sakamocchi.jp/
> * Fix indentations.
> 
> Takashi Sakamoto (3):
>   firewire: core: allocate workqueue for AR/AT request/response contexts
>   firewire: ohci: use workqueue to handle events of AR request/response
>     contexts
>   firewire: ohci: use workqueue to handle events of AT request/response
>     contexts
> 
>  drivers/firewire/core-card.c        | 48 +++++++++++++++------
>  drivers/firewire/core-transaction.c |  7 +--
>  drivers/firewire/net.c              |  4 +-
>  drivers/firewire/ohci.c             | 67 +++++++++++++++--------------
>  include/linux/firewire.h            | 12 +++++-
>  5 files changed, 85 insertions(+), 53 deletions(-)

Applied to for-next branch.


Thanks

Takashi Sakamoto
