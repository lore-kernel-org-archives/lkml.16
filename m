Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46D2F273F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623812; cv=none; b=hOhXwpjSfjit6I8SCzqX5cE10MZevyhi+KVvcniNJPr3ZsXsmsagzTcwZpYcSH8NcOBkRtdduzExGSwPP1jOcy3lbClPGLYmYTLZFbnCmblsZBryvdLtF4frqOwX9UfG80IT1FmJSGa39OUHc+Nt2Ljfh8AHkBmxr1La9J7XHDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623812; c=relaxed/simple;
	bh=edVCtLPNmEyUg+JxcvkVvpYAULerPJaroe+1N9eutfM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=En5ZKd92YM7T5OQIdyXaq1W2u5AaKphWu0wuNwwjmW+hv7PG/Gq6gsjeRgqy2EQbyEUpnyncG3gKDGFiXHtAlDex5KwHPQ8El8cMvP4HVIGHx6NrjCDLNLkNB80W05WNBWpnxWNXSqhylaySIlM+eoKTSYzy7Z2JgmzXHpGPTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dIIc/gPP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QLumzDf3; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dIIc/gPP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QLumzDf3"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DF5111D00226;
	Fri,  4 Jul 2025 06:10:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 06:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751623808;
	 x=1751710208; bh=ASjtsV3/GLyL6IawlTFlfhxkgTBfBjU0amMAxMOoRSQ=; b=
	dIIc/gPPD9XKPZ6RYjigTfU6f+Ni4/Sw1RSlQhDwoXpycy3g0INdMp8dq82CS4HE
	eGWPstTKIjD0HgWHsvKmn9PBnK+H6nDylkfJz9F5EbDf3TjbBlebGPY820CL5BO5
	dvgEmkFkgdTRx0xmNusJQPP09Bu3lHwhbg3wK+5cttSBHJf1nKYCE7+I8LJMjEdI
	veMmtQC8iYkuF3SVa/iATVNV5lf9gmS94hDo76ZSdLW2A77I+xayqA67YdPy8erM
	3mi83x1iS0F6NXVlrn8nUjlu9Yg3sbWfZ1VnajqTy5K2Ddb5KEwT/RnDSxYkqMW+
	NLGZ3QXAWptthPKIO9NarA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751623808; x=
	1751710208; bh=ASjtsV3/GLyL6IawlTFlfhxkgTBfBjU0amMAxMOoRSQ=; b=Q
	LumzDf3EcbhY3DEgiUNb/pSb6vXu+I05FYdHlaVtDNCQ8Up1lS3DxAKExXnDKJlC
	tWPvB2+S8W9znxp3ABX7zx5pXvXabZMppdRZSGnJpi7BDZMeiUfdHUYwAR045/Nk
	36qeyVzyjynqCQmfVY+XFuQ71mJyKcBcykumZ6nBC+k0PjHZGi9lo8yX2gYIsyKc
	CnK2OUD0kaZ73lKby4OMAojzkiZl+LyCxPRjz1aQkDCwpYSaRCPGd84KnmNCBgly
	qdzU8RiFrH7iMQdLt9UZ26jun5eZF/S/XFro1I4/+1xS3uVz14bLfCpfTgO96Uj/
	iZTomFk1qyZPZob/OIhqQ==
X-ME-Sender: <xms:gKhnaO2BoALedA4TnTCdSHsWYstGUjfU6qMYCFyKknp_2fTG_tU-zw>
    <xme:gKhnaBFchOfSDVdfEGoFBsf7n5NtmbuwuLymNmZuADy9iTJhdkoVKQBBtE4zHVDYp
    OqI-VwcdLzjNZdMEPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehhuhhirdifrghnghestggrnhhonhhitggrlhdrtghomhdprhgtphhtth
    hopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnug
    grthhiohhnrdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhn
    sehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:gKhnaG7RHhNULOGnUHXYADMlgtGp_lbo7WgKrqXUqj9Vi4gT0ktXbQ>
    <xmx:gKhnaP1rk46Q-gdozwhnKVE9Gzta8DjPtEuV8v3wcc0pKE-pgiGjPQ>
    <xmx:gKhnaBENSlcaEXmu_LaHyj51qA6T6ankDOMa46gKuBGrrZka-7XFqQ>
    <xmx:gKhnaI9y1_zgS1dgN5OqM6sVB0W5aJ284O1f0xJBragIXUBCJLdMtQ>
    <xmx:gKhnaLGyzZYde82W2j2rKE6PKkbQ9vFsZ01biWifwX_I4fSZX_NhH5gp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5609D700068; Fri,  4 Jul 2025 06:10:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ta67ec7dbdfe9b7ce
Date: Fri, 04 Jul 2025 12:09:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 linux-kernel@vger.kernel.org
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Michael Walle" <mwalle@kernel.org>, "Hui Wang" <hui.wang@canonical.com>,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <d5be177d-505d-4d72-9d18-913e69c23ea8@app.fastmail.com>
In-Reply-To: <20250702222823.864803-1-alexander.sverdlin@siemens.com>
References: <20250702222823.864803-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH] eeprom: at25: convert to spi-mem API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 3, 2025, at 00:28, A. Sverdlin wrote:
>  static int at25_ee_read(void *priv, unsigned int offset,
>  			void *val, size_t count)
>  {
> +	u8 *bounce __free(kfree) = kmalloc(min(count, io_limit), GFP_KERNEL);
>  	struct at25_data *at25 = priv;
>  	char *buf = val;

I see nothing wrong with your patch, but the added bounce buffer
reminds me or a general problem with such buffers in the SPI
layer (and a couple of other places like it).

The problem is that kmalloc() does not take into account the
DMA mask of the device, which can have two suboptimal outcomes:

- on builds without SWIOTLB/IOMMU and an SPI host that has a DMA
  mask smaller than RAM, dma_map_sg() fails down the line,
  so either the transfer will fail or fall back to MMIO mode

- when SWIOTLB is available, dma_map_sg() will succeed but
  require another copy into a second bounce buffer.

There are various drivers that work around the problem by using
GFP_DMA instead of GFP_KERNEL. This should be reliable on all
platforms, but means that the allocation comes from a potentially
really small pool and is more likely to fail. Ideally I think we
should not do that any more at all but find another way to
allocate bounce buffers for SPI transfers. The two ideas I had
were:

a) and a generic interface to ask for a buffer that can be used
   by an SPI bus driver for efficient transfers, with the SPI
   core code making an informed decision on using either kmalloc()
   or dma_alloc_noncoherent() based on the size of the transfer
   and the DMA mask.

b) push down the bouncing into the SPI core, so you can just
   pass buffers from anywhere (stack, vmalloc, ...) and
   ask for the lower parts of the stack to copy these into
   an appropriate buffer if necessary. For the spi mem API
   I suppose that would require assigning a flag in
   spi_mem_op->data.

    Arnd
