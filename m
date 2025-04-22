Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C91F130F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745302820; cv=none; b=YofYA75DBsgqgM7Tx1eT9OnB1UxuRNQ8+jj/GJK0JIPkpsbw1uOzkk/bAm6UeoXt/Aea4hPsgdb5YrGQ/Jpkqx8Af7tnf3b8cr3JLn9JRNG8LaaazhPRWY+WfElUvsBHO2KJcEM+4aIccwJxkTBq8PAfU+gostP1gMifrR0deIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745302820; c=relaxed/simple;
	bh=0s09EqLIwlM2iekdxdYJbToy4ZOVTiwzqJVwtbYQlC0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XF9hKvdVgU04+3efqjJXSYZhjCGvIgVDfzjdt3pcespK2rSznABgOBrHEyYkVAm9hsAV2Ag2z9yEm5tfajAhdvxoTRFHmG6Ui64G1rS6CcvZTynQC5ldZjuHWm5fSzyqSNEJ+EvlPQliUGOKSBHS3JIrmaNiw3QlCd6K4dQFqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RNYY25D5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lLql2wRh; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RNYY25D5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lLql2wRh"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5BB921140190;
	Tue, 22 Apr 2025 02:20:16 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745302816;
	 x=1745389216; bh=EOJBzyuwNNLXuvDG/kOJMfmJJBgisqKl2nfidKYzGqE=; b=
	RNYY25D5qj/fGot1ngHfauIWEu2pyFUYTrt3Ih81sDeW1Li9e3uiLkOWrZRw81lS
	aup96vJS1KJU/9A8H050S+E84Vf0R+zlCL5wlemp56EvyjBi7oGAZMiTlKtLO4fk
	Fe+nZCnYoYMdHQsQIY52q6zgJsciIZDU6Nu8aNf8x4DiJMSLYM9OQro4um8X3S9g
	x0F7jTiY686Fxo9QHqQr1fBkePTSC5DvZ2bmNakkCXgDRXYXiaNCnYe5/jKFeWE9
	/O3z/UhaNAUSxyZoVSlo7OAZWdlAW3ep8fXyqsBeDyraRtgKXxVWfILJaNdePAe2
	HhvGKfFUeuYclwa/KRW8LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745302816; x=
	1745389216; bh=EOJBzyuwNNLXuvDG/kOJMfmJJBgisqKl2nfidKYzGqE=; b=l
	Lql2wRhjkw3buoCuP+M4aDcX2f+WUwjDWo0XJeoo6rI4swU32sdBB0Tc8FXOHybM
	2EeYBLdjDBuPGmGE4pg0h27u6bT+PHh+zKP15nOPMLz+/0qEE34eKBkR3pIlg7t7
	IBvybioI5/OZUu9FBI3sWR0qPZowzkIK8AQdH2vOHvxcIFb70lO6ts44u/PPszxP
	qSa1mc72IdUiWFe1eLtfOIyNsoosoP6BnGeNKkcYa9tIvOvH1Fn+GU4FQB3Jo5Be
	ddLxIqD3JAYkK1J4VzztEveplfS0aUnB97yXO+lNde5176w0WEnAkarYXZuwpcud
	Bcs+dC7r9uZGaOv0wM+VA==
X-ME-Sender: <xms:HzUHaNfuFbSbij5etfbjEpAk7Be7U6hYlV_5fbp8vZkQEn3lc_GvXg>
    <xme:HzUHaLP3FUoz0tfLQETVidxItKwcHEiGrP-mdIgEO8ADIapeSMFYSGipjykNxWmPs
    aGpdsbb9Wl0zKLywQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughpvghnkhhlvghrsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepmhgrrhifihhnhhhorhhmihiisehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepnhhihhgrrhgthhgrihhthhgrnhihrgesghhmrghilhdrtghomhdprh
    gtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphht
    thhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtohepmhgrthgthhhsthhitghksehnvghvvghrthhhvghrvgdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HzUHaGihSdI_bb6eutYGdjxqc7VOvJOYJWUGvnpZzBGUl6DZ1xoenQ>
    <xmx:HzUHaG-VIPGKnxEZf9WqkhNo_0MFKU_OHwXGPm8rL6EkQ-5QSkoF5Q>
    <xmx:HzUHaJseuTHdgnNDcz5cqICLQ-tBeBENqlbPuR6hVizc_b5X0fJwDA>
    <xmx:HzUHaFHmG59ApiBigsWIuBeEh5gJAf9PNVZKCNlXj-3wbkMc0ne8Zw>
    <xmx:IDUHaOnjvzC3bauQfieDKF5ec5clZrpfHZcSSAefXFwglUpfjrgSnB67>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A51822220074; Tue, 22 Apr 2025 02:20:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc63700f27876af87
Date: Tue, 22 Apr 2025 08:19:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marwin Hormiz" <marwinhormiz@gmail.com>,
 "Dave Penkler" <dpenkler@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, matchstick@neverthere.org,
 "Nihar Chaithanya" <niharchaithanya@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <eb79a1fc-080d-4be7-9d72-5fa248f48fee@app.fastmail.com>
In-Reply-To: <20250421184144.220972-1-marwinhormiz@gmail.com>
References: <20250421184144.220972-1-marwinhormiz@gmail.com>
Subject: Re: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in
 gpib_bitbang.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 21, 2025, at 20:41, Marwin Hormiz wrote:
> Change kzalloc() to use sizeof(*variable) instead of sizeof(struct type)
> to improve code maintainability. This follows the kernel coding style
> recommendation for memory allocations.
>
> Signed-off-by: Marwin Hormiz <marwinhormiz@gmail.com>

The build bot reply already shows that you did not even build test
the patch. :(

> @@ -46,10 +46,10 @@
>  			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
>  	while (0)
> 
> -#define LINVAL gpiod_get_value(DAV),		\
> +#define LINVAL (gpiod_get_value(DAV),		\
>  		gpiod_get_value(NRFD),		\
>  		gpiod_get_value(NDAC),		\
> -		gpiod_get_value(SRQ)
> +		gpiod_get_value(SRQ))
>  #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"

This change is completely unrelated to the rest of the patch
and not described, aside from being broken. The macro is clearly
confusing, so if you want to imprve this, I would suggest removing
it and instead open-coding the contents.

> @@ -1063,7 +1063,7 @@ static int bb_line_status(const struct gpib_board *board)
> 
>  static int allocate_private(struct gpib_board *board)
>  {
> -	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
>  	if (!board->private_data)
>  		return -1;
>  	return 0;

When you do this type of change, you have to check that the
types are actually the same. The original code makes sense,
your change is broken because 'private_data' as usual refers to
a opaque pointer.

     Arnd
