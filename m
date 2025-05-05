Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F76136E37;
	Mon,  5 May 2025 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424796; cv=none; b=USx4imqBD43OAIatDtvAc6OK5p/e5NqENIoRSo6cW72Hr22XEP0kcwHP/4GxnlSnPcTCwUflCEIVrIL9OfLdLWwO4AcohYT0QhfEh0ZkGFew+0T1nsF6pNVED459opk1f8fbStzhEELq/ZGQGUgWpqyqbuSh/J0rFgQ95NuxGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424796; c=relaxed/simple;
	bh=HsSaF8FoPftE2hsy02lVw9g+IldWgG4YIEdpeyBxU18=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SxGx6VJqxfpUL/UDkKp4XzmvUK0xdwiWkV0TToglnuY3IusncI8bobF42M4Gfn7mg1EbNPUijVKCxI8TN+bQERXeORi/k/5ZKnrX40Zwe0+hM0GbSWWHm9o+Wo+xBwHsu350wetbPn59GesWGHmtFSqcyflwo+D0hZ+fiJph8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HryXOYoe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ciWynx2j; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HryXOYoe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ciWynx2j"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id ED4511380119;
	Mon,  5 May 2025 01:59:51 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 05 May 2025 01:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746424791;
	 x=1746511191; bh=eZU0NfmZW7ypFaE5xktchKZ0x7ZPLj9yEOipJzJ6BO4=; b=
	HryXOYoeNkQzg4voUYMWirUOimGE9rTmdZQRp+Kcg5WBkCNeNmPnG+VJ7xqNLgKe
	0XJ2nWJBXwTG9ymCdZwd7ylgupTvl/NLkCoujMRk7njo+bOg2iNel0wrWAInQjt6
	tCfCu36pcAPJkhdqM7WiDHkb0bmZd40Qt8ZnBRkHwUL4ncT9lub7W2DfHWhmwvTC
	ucVaTrWu9NhnS8WdJanSZqujdcFQisPd3sBDI0nzeABbzhLNsjMy+iXwY3PASfWK
	zYccNPsVsAs3ZQdltSqP5VnmimpUD5SZGdxF6j2mI/9/YQS9ezHlxsHthNC3qyP8
	xSpUHJalAL5lxFI62E5pBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746424791; x=
	1746511191; bh=eZU0NfmZW7ypFaE5xktchKZ0x7ZPLj9yEOipJzJ6BO4=; b=c
	iWynx2jhhoBvm7779HzkyfLWi6xYGQDbrO7WYl24mM14FuD8fhwvTToJoWHX+qch
	1Q73MYi9p8+d+5CzBi7WeX+8m0cXIyJnpoOhVbthoO7attcYcFuXnMyns+o1PzLk
	sIF0mTb0MZ3KIZRGDgZmfRxFYJrCC3vamA9JKXNXvnK21uwSwpxDlJz1o37Tuumn
	2zN51xwaK9z45sy3y15LVQ9w26SianiBx/QyJTgaoZrh0SkIFEx9kzfbKUvmWE3l
	DrzqPdQ0Rk3NahVeeXYWY48P+l9X3TDXAtVI3M5CUxzSvljFL4TokMSJL4IvFHcu
	YjWHr93bx7aaXuyqwzB+g==
X-ME-Sender: <xms:11MYaPuOyCvrCloaBh6EyCBOQbRHbrtWOjxLECIxvzOBRN2aXCfmkA>
    <xme:11MYaAd_NJYa_Yxr1soFJWuKhCnWZEKTVwt9vZ5Tbp90CBfiIeuOWyOIc2CvG3vPr
    z5FpIv5pqXR6s2Fl5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehquhhitggpfigthhgvnhhgsehq
    uhhitghinhgtrdgtohhmpdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:11MYaCy4TkIvIR6G1uuU8R_TZE_bQ4IaW27Y_T29vgPcQKS9YDEcsw>
    <xmx:11MYaONebyrfoaSBD1t_wVEOLfI33F_15BM4Vpb-22GLNw7zv3oVwQ>
    <xmx:11MYaP8cM7A04KtlHnX4g3Pmr1xrv114hAKRmyKHCjQnO2DO7nQeLg>
    <xmx:11MYaOUOy0-5jqimVh-kOHqRO-_KKBVrkuof-IIsb-vJJYVXymo3pA>
    <xmx:11MYaA-Vi81hlCpjMHDm5Lrj5cw0BRQbAA-ii5LY1A9HnNYuVMjP1v0X>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 645121C20067; Mon,  5 May 2025 01:59:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Te2f939405235d867
Date: Mon, 05 May 2025 07:59:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Mark Brown" <broonie@kernel.org>
Cc: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <a60b3290-a535-4666-9f0e-18a3621e70dd@app.fastmail.com>
In-Reply-To: <20250505052032.1811576-1-arnd@kernel.org>
References: <20250505052032.1811576-1-arnd@kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: qcom: fix USB_XHCI dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, May 5, 2025, at 07:20, Arnd Bergmann wrote:
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
> -	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && 
> SND_SOC_USB
> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && SND_SOC_USB
> +	depends on USB_XHCI && USB_XHCI_SIDEBAND


Sorry, this should have been USB_XHCI_HCD, not USB_XHCI. I have some
more patches for this driver that I'm still testing I'll include
a fixed version when I send the rest, or you can fix it up yourself
when applying this one.

    Arnd
