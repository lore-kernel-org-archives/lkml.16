Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B44C91;
	Mon, 28 Apr 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842723; cv=none; b=pxdhGhCg2/WvF38NlSliEnsRmer2my8/vTGqTMAJSMkUvopjdhyO9du40idg6WMJKb9U+Bb5q7F+Muow+QKcyQpbgIvFtcW/YBaxp2wTColLkRqrDGf/GaC2nQ/KPEdlnifGpQmU5CYkhgBBWAQy8AXsgK77MrykT/Rp2MwhVg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842723; c=relaxed/simple;
	bh=Ewjf3tyBr+R5RFwbWFFcn5c/Rmv/H8aXqAjKjGy6Rm4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SLZBkB98GLq/lveJTHqt5s7VBcUHyq1qJg5gLIJSYXNkKWmcUiFmo1McodXLWobkAs8nl5DYHNVE8uoTKouS155qBBfZ6H14nUwZOP6/yGPUwQVGDXBKdGrhjZBxoa3hFrkPRT9a59380xHU1Zxn0/uPFPnpOfbQP9u6Zg23kaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WROXFXya; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FW5cTupg; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WROXFXya";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FW5cTupg"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6AB8C254026E;
	Mon, 28 Apr 2025 08:18:38 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Mon, 28 Apr 2025 08:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745842718;
	 x=1745929118; bh=y3dDG05EPV18g7EQNyeKpiaJtlzZMl+EXyCOzy4Migs=; b=
	WROXFXyaFO2gM33IP9NPiPuro3todaWviWyem7ZByy1+HiiFxKdt9oeGbC4lVhuI
	k8umGA+h6p3v7fSl4ogtguAAT09Tgd2dhKYxgfxryGQ3mgjkgS+uvPOmBlW90h2P
	bQUcPUzxJXw9Us3ADnpE96M48pm7cshEmeUyRr00GUZx6ibi/Lrrfk1hD0tDf/Yp
	aTQ0GXC2hmtoZ8OUSintxIyDUnRVRD+rk0wngy4cos+KvQ9SJwtENSffd1Q7jlwb
	fFCacgxim8Eqz/Nn2WNfgQzpuR0zgqofrtk+XO+uqCMvpGcF7gj3V6gx7A2M4bC9
	sld69AtyP5fWU9/0TrgVUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745842718; x=
	1745929118; bh=y3dDG05EPV18g7EQNyeKpiaJtlzZMl+EXyCOzy4Migs=; b=F
	W5cTupgdPknifv2gBMxJysTc2inSkeQbRrSb7WqpKBOkT0CtlFefU+Zs0xTFwWhC
	hl8NO/X6Kpjm5Pc56AFMwSICkQgkCWyfHbODpgqt3htTAewxosb2zrdEPSPWNf+3
	C1UCECNt8OfB77/+1pxgOGrAXySG2DH8dfYeDITj1DcSDMMaRybDfoFNAUpjDlW+
	4D1k09eozo5ed+Zov6eUu8fYyVFnSf0HwNaMwPpHfLc/m/yv28Vv9v/ApS/OL492
	AzJ8NA057adxVnpMGBcFwJsNC8oB2fSBL3eKR4zKGV5L4JpNufrpM70JogI6RHms
	SFD0ezlaGSTkdjEH8RjBQ==
X-ME-Sender: <xms:HXIPaO56dI61zPH2_80uGMSeBw6HgTBNnQADQp0vXym8Ti2N9fMazQ>
    <xme:HXIPaH5HaE22KiDf1mb3sxsiQGJ5BpP0F43nfK9FmUQT0yPGS75ul0CMCtwzkSd2Q
    FQf4zYnLVYWn3J7f-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrsh
    esghhlihguvghrrdgsvgdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqd
    guohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HXIPaNf8KcnB6wfaRG64cIwZFGDzfZfJS5_lGnvqNmGBFI8JFcVJOw>
    <xmx:HXIPaLI9IS139tocELkntrYr_JSNlAzBUaNHFjiE4gS7cWa4YcRuEw>
    <xmx:HXIPaCL18IxstUK_rvKBDa4r0f8mW9MHSbP66dZWADZzaUlqpyt60w>
    <xmx:HXIPaMyHE3ekzNMDKYAU5jbl4QZo-UjqR5Gdn_y87BqjbNPFYc4cRA>
    <xmx:HnIPaDrP7oEpjsiJAGhHwl7cWt9YAvxx6xm9b4TjJzLDu-fe_denQ56Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9EBAD2220073; Mon, 28 Apr 2025 08:18:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tdf882a97cf9ebc13
Date: Mon, 28 Apr 2025 14:18:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Message-Id: <e5002084-b324-4627-8155-9abc28391d3f@app.fastmail.com>
In-Reply-To: 
 <edc7373f33955f6dc4c9e6268afcb1a40566b39b.1745840884.git.geert+renesas@glider.be>
References: 
 <edc7373f33955f6dc4c9e6268afcb1a40566b39b.1745840884.git.geert+renesas@glider.be>
Subject: Re: [PATCH] nvmem: Remove unused nvmem cell table support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 28, 2025, at 13:56, Geert Uytterhoeven wrote:
> Board files are deprecated by DT, and the last user of
> nvmem_add_cell_table() was removed by commit 2af4fcc0d3574482 ("ARM:
> davinci: remove unused board support") in v6.3.  Hence remove all
> support for nvmem cell tables, and update the documentation.
>
> Device drivers can still register a single cell using
> nvmem_add_one_cell() (which was not documented before).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Arnd Bergmann <arnd@arndb.de>
