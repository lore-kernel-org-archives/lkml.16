Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360BD204C04;
	Mon,  3 Feb 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603468; cv=none; b=E9wVX0+rz9n8dqnkmOAHfszENY/rmO2NrZp5/QRbBP7fqRw1D5GH+lEfWKela5UW/ZJWJtyRseLTH2w50eabNT0xw59q/U+TyxEERmBMldy6dgHw46sIK+jZZWVOeolYl3MmQcD4Xrfdnyr1Ak3Ufy0dDpbfCSWyFwIhQw7uT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603468; c=relaxed/simple;
	bh=tsmeqsmK0D8N6gHzRskB8wmyQlAgoDPQgv+Is6rupx4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gqp6W+iZsNFm24Al9uLO5GlInLWFcZ+Z9J8cDnirVWiTl2BT1eRqOBVhefqyIDlb+kVHbnZXhPcb8qBPAB69npX3e+rjFV2G2avUv65Ex1gwGVAC8BbhfCCDmHZ2EuBnlSXN0S5mK3dXA08fpJlN7sg62yXMZd0GncBwEb9VGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ShB2mRiw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=araymnGB; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ShB2mRiw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="araymnGB"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0E0871140200;
	Mon,  3 Feb 2025 12:24:25 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 03 Feb 2025 12:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738603465;
	 x=1738689865; bh=tsmeqsmK0D8N6gHzRskB8wmyQlAgoDPQgv+Is6rupx4=; b=
	ShB2mRiwFNWwgi1aStAm6DINCgIG3Whemk5PiCj004x5l1XcLmgrhUzQE4ECbcch
	4z/Uho+iHqrId4R3m2w3cSvcV9N6p0tj24QmD5vCyWfZ7LgO58uHenb931GxpWaA
	/NOo7qw8muns0IB+I/zowK+vVIc2d3ZJzEBVEIBNwNz7FS+igrWRPvvMeaHCmE3w
	hKlnwlv09234QKNFWy3ZX0X2fZhXGe0do/q3iQlfDpfrahY68TR8Kxub1ER0nk8x
	iKxSEbnG/5A17eFm3PzIzTUUVvkz5HytGbKnhwZrVpUFx7rgNuN+xr4qV0LQKpLP
	/XzxiqqdKSuFXYhpuQLzrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738603465; x=
	1738689865; bh=tsmeqsmK0D8N6gHzRskB8wmyQlAgoDPQgv+Is6rupx4=; b=a
	raymnGB3AWlKvfCMRBEsppWi+iTMksK9ADsLQ4CKs7QeVQC1F0Z6Ahbt3esbfOZm
	5LME8S+sYvay77yqPvCz8IX1DYwWQROXXjJwx11pzOr6QAPY+WxpMo38bKOIiEDv
	lppHgkaN9V0STpQFqpmf65Gk0W1yFYVNBppzO1b4bWFmixhCRfgKybvfbWxKob89
	ZrKMziVSknWmuRtLKSm7B4wm1g6UJhrw533qmRVkaQbk5BpPvkmcdopjSP209Ed1
	4e4BI9bTtZWQJnm/Eak6jMKLmeGM+EZaIpSjJOKLKB1NlUd/EufpFIk1wj70qFMP
	S2fpOiB91exxnnqjsTtJg==
X-ME-Sender: <xms:yPugZxhk_jmebSDLlQtK0hzhYE1yABeoVmAVOjcgkbTF-r4hcNfxXA>
    <xme:yPugZ2BKVJ1tv9H9t0jug5tRZ8L8wF4UBkxznthWjBhtKT5MMSVCPGyk_SVHtlvGn
    -aHoyd77SAgUJpaHpU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedulecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:yPugZxFDln9AWw3v6K6LfjUmp7plnAXsJvc4OfnGD1G3ZLNsH4sI-g>
    <xmx:yPugZ2RAyyliem2j5tpYpyTacehMGdmWD_ccmALOHD0XAAioOriuUA>
    <xmx:yPugZ-wG2LejNHwWk1usIKnmo20h6YBRguP1kJwzTX6z8MPS9k4cUQ>
    <xmx:yPugZ86Wqee9MBts-QvHADRIy5VfWJdpsG_wl9QXYuGdU1MprKgn0w>
    <xmx:yfugZ5ws5UCOOHOrUPMsyENuBjyXGMx9p1esQsLGsTfTYbj_sY8bg4as>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22D932220072; Mon,  3 Feb 2025 12:24:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 18:24:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <eea8171d-3eb6-45f0-b115-3b6fdbf3f498@app.fastmail.com>
In-Reply-To: <20250203154216.172040-1-julian@outer-limits.org>
References: <20250203154216.172040-1-julian@outer-limits.org>
Subject: Re: [PATCH v2 1/2] alpha: rework use of memset_io, memsetw_io and scr_memsetw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 3, 2025, at 16:42, Julian Vetter wrote:
> In order to prepare the alpha architecture to use the generic IO
> functions from lib/iomem_copy.c, rename _memset_c_io to memsetw_io.
> Then move scr_memsetw to io.c, along the scr_memcpyw and scr_memmovew,
> inside the CONFIG_VGA_CONSOLE.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
