Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823120AF86;
	Mon,  3 Feb 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593621; cv=none; b=hXGTD+8cUVo5OO/wHlrECvsAS2EN+8/eb/gnO6Vzla3F9lzfJ3d7C+ZwLrNM4P2VtdhE9yuqB/bS0tnZlhbJBqYvXajvtOQJNoAgvQINqIrIh9Vq8QzNcVutKqeVjPBArYnzciz1WiZDbnwDRdzzdSQjVkE7NdrXgV+9h40TIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593621; c=relaxed/simple;
	bh=MbIYqXEsVWfsQJ5POa4vcKcZGzZMl8tlZCBNZegZbXs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jU5AUv5XnZ1gay73vVN1CAR3yoUrfkvlD+MzbY6iLs5En1jZ/4hw5QjLqFiI2QzJSDhAkO69/q75Gy2pDL7aI/s9izZiiT7VZkMaXwLQKgH+I3fGgVeuUhHPTuLENOkCSiUIFCaWjrAy+SLnxH1azbxGrHOEMaEqm2/53+dPqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=wiidZwaN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xVC/qdmX; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="wiidZwaN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xVC/qdmX"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 892061380212;
	Mon,  3 Feb 2025 09:40:17 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 03 Feb 2025 09:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738593617;
	 x=1738680017; bh=S3RS4wH0DKGptalqHy9YmnRTMiRLzy2TNzn4ehLzpPE=; b=
	wiidZwaNMIQ7SEl2ogiVQiHM9xu5HaDdInY7Nal9CVEGs/xMUfyJyfqicjkB0L7u
	joUpsANNGyhzR4t+hoS28yrF7Fm6/TRTRZWiEK4C5hkBwXQNkEpPXW17rnCJHqjC
	iuD6JjmQj8aJCsf5CWXE2H24ykDDs6YLe5XuMXeig4DYwKUL5aMvmURFL4cjDxkR
	eYNo3SgBlw1C2AuS+CLt9wO6zIXrro0IybGpl9dV67n4YY4aia7eAL6JT7GQe44a
	WPjH5iGRge9tn75MHyChtQUbzZUWgOu6age7LmPXEpJtjW0u/7/4h36eVl1RRSdg
	7SAezXEQRJAoIHw00Nlt5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738593617; x=
	1738680017; bh=S3RS4wH0DKGptalqHy9YmnRTMiRLzy2TNzn4ehLzpPE=; b=x
	VC/qdmXWvYFINf9H2axjpSrDpOKRXX8CI5k9hH/soo++R7+eTjw7giV36uGcmMdc
	N/dZiexnoffCBjTuOthenID2I+WG44EgHBacN/u+LR038iEWILOTBhapgQIu1vbf
	JRkwkQ9bFT3s2jhpT0d3o6UGa0vT4owvc0zdm2ZPV7p6LeysCj+8Qk53agbtqldJ
	v0Dr87lK1Q1f11Qc43g+E3qzQkzb+5ugNsYm2BT6P+Exm8oG7BnrocHnphhnLYOu
	Cm+hTd0nCk6VDlqQCRlAYv0vLPVCBCFgkcQEOix6G9xqs5Zrk8nIYiZz3zFo4ked
	nTgTX4v9Q7tor6iFkxBtw==
X-ME-Sender: <xms:UdWgZ6NG4_p2gqWowFOR3jTDUaYdj1HIwlZrMl3yRjZftQAyHB6XbA>
    <xme:UdWgZ4-hdcR90xYyHYT4kDBiCjhSWVVfjq-ieJ8tW2w3uptKaIowVvcI6XR1AJw2Z
    KmGTKqv3M2a8sCk1Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilh
    drtghomhdprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhope
    hrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehjuhhlihgrnhesohhuthgvrhdqlhhimhhithhsrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghlphhhrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvih
    hrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhk
X-ME-Proxy: <xmx:UdWgZxSccD62rjTpLpyk63XhyNmjMztW80BC2_G51tQby_gi2fHUGg>
    <xmx:UdWgZ6vYf0FRabRDYiX6xsajez37cphsVRsjrS3U9BQL2wbsUwDbbA>
    <xmx:UdWgZyenAARdzq3Ht26q7ov9rkVOGlP5440NFvjr0Brz4VZmTPY5tg>
    <xmx:UdWgZ-3RTrVY3_JawSHebaO_aUg4LAo3VieDGW5ASPCFwMS3p9_DCw>
    <xmx:UdWgZ4utVpT2eDLfJXbO_N40VxDXXkzHbKSFuxgTjJskKmU2WWn0EU9a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F412A2220072; Mon,  3 Feb 2025 09:40:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 15:39:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <64035bbf-1872-4750-9988-6e7929be647e@app.fastmail.com>
In-Reply-To: <20250203141800.69126-1-julian@outer-limits.org>
References: <20250203141800.69126-1-julian@outer-limits.org>
Subject: Re: [PATCH] alpha: Remove IO memcpy and memset
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 3, 2025, at 15:18, Julian Vetter wrote:

> diff --git a/arch/alpha/include/asm/vga.h b/arch/alpha/include/asm/vga.h
> index 919931cb5b63..cac735bc3e16 100644
> --- a/arch/alpha/include/asm/vga.h
> +++ b/arch/alpha/include/asm/vga.h
> @@ -34,7 +34,7 @@ static inline u16 scr_readw(volatile const u16 *addr)
>  static inline void scr_memsetw(u16 *s, u16 c, unsigned int count)
>  {
>  	if (__is_ioaddr(s))
> -		memsetw_io((u16 __iomem *) s, c, count);
> +		memset_io((u16 __iomem *) s, c, count);
>  	else
>  		memset16(s, c, count / 2);
>  }

I don't think this is a correct conversion, memset_io() will
set every byte to the same value and ignore the upper half of
the 16-bit value.

On all other architectures, scr_memsetw() turns into a memset(),
but that does not work on older alpha machines since MMIO access
has additional constraints.

scr_memsetw() is the only caller of _memset_c_io(), so I think it
makes sense to move both inside of the CONFIG_VGA_CONSOLE block
along with scr_memcpyw() and scr_memmovew().

> -void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
> -{
> -	/* Handle any initial odd byte */
> -	if (count > 0 && ((u64)to & 1)) {
> -		__raw_writeb(c, to);
> -		to++;
> -		count--;
> -	}
> -
> -	/* Handle any initial odd halfword */
> -	if (count >= 2 && ((u64)to & 2)) {
> -		__raw_writew(c, to);
> -		to += 2;
> -		count -= 2;
> -	}
> -
> -	/* Handle any initial odd word */
> -	if (count >= 4 && ((u64)to & 4)) {
> -		__raw_writel(c, to);
> -		to += 4;
> -		count -= 4;
> -	}
> -

For this function I think it's close enough, the generic
version is slightly simpler since it skips the 2-byte and
4-byte stores between single-byte and 'long' stores.

      Arnd
