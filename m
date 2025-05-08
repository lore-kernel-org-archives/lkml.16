Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535922D9EE;
	Thu,  8 May 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712465; cv=none; b=U5whOx0wYuV1rsCjDFU+eD+Iy67e3IgDF4PzV4VmTsbp8Eq2x97GNjhE+eL3mOwOw/0pUsHufOWQhuAkh/uB1mFE5iW32+zfnYoepMTYKoEoWg2tgCbJFN7OwkTsR7H2aaVbYhuapcWPwdcWXLpQe0vdSIwg8fZtIbPsk+XzQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712465; c=relaxed/simple;
	bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bzbx4Aaxk2zCzugBYBSqOaMcWgtRjCKBGLyEHOKQAA3mPR9XQqrltzIRo89Bj6aXqfuE9kKJsLypzDstSQCjkLYsJQIo5bRDRacBt+/0RNelAjAMjI9oWjrd5W7H2zBskN1qS3etCvtXozrs/WqS1P4TwX9jIE/XO2+wn6g9ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IVQgLZWl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nOzlWj2G; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IVQgLZWl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nOzlWj2G"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D331A11401B9;
	Thu,  8 May 2025 09:54:21 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 08 May 2025 09:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746712461;
	 x=1746798861; bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=; b=
	IVQgLZWlVgLU/lJZLr+iFqaSMheF05AC/yD3uJd0BIhy1D5y/PTmDkTl4T2oiPrJ
	EvFv5pgK+njzB43WRd0mvC8LnivltiQZR3LsCNirUojPOGVlTfIMVK06XI+U4+MN
	mW+/ILx3zEBt1r2/PVY57IDxIog9txi5p2ZkUq3/8NGV/D3oBQq0Q0F1hQ8kydLp
	InbjgOsl8hL3UJhRReFsViKbu9PNnHSEhV5L0FQGophIBOpz15tHy3ChIr3tudi3
	x7UVNkDcdZeBcnbFHnt2mZd9QT5JSjMPoxe4B5TB01yMK68FH7I1F0d5kRgSvhLl
	Ue3hwtao2XwqhHMjlKtY4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746712461; x=
	1746798861; bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=; b=n
	OzlWj2GGOFn0sYTPX97eTu1g9aWel1P8MgeWhkuCPiqBEv6vHM1qdcw0y0kt9MV0
	YDHAV02oS2Ddcs5aHpon/3V2hEj6wPNLOKc8VRUnHj9YP+1O3PcaJC7L4I8pE2hD
	alwUrZLeZ2nUF08mSIHgEhYH6fJVvOx4uPblyLffbS75VLiGTZWkjkMutnwcpT3E
	itd2k55CJYnPAF4e+oPd/6EtSVJnuXNPJrMTj4EfHTLFkB1WrgpxjX91+ESaV0t4
	H26hjVJ0HaFvUKkgqUqLTvqtEg0I2PiMvoXiy7y7Fq2SDF/dkZFbNB1RVYASDnUx
	zVgtnt4O+wuymBPFq1Q5g==
X-ME-Sender: <xms:jbccaFFUfl4J8bkCxYpNg9kU3xJOFCbTXSj23bHtrL4ERVLUWX5cZA>
    <xme:jbccaKXILPyFEbRQlNz_JmbQNnjShXpQraFrRwQwe4T0F7OAYDnrPOkdix8AHM8Is
    _dn7bIKh2eKWFoTatU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvghlohhgihhorggttg
    hhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    khgvrhhnvghlsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhhfrhgrphhrrg
    guohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    rhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:jbccaHIE0qB-gRcBJPF3mx9qcmmsmF3lPvAhWDPZ1jd6yMJp7qoeRQ>
    <xmx:jbccaLG8ZWNJpxRforzfW626CgfovRMyHHcoyDphFRKPXTf3Mrn--Q>
    <xmx:jbccaLUhSGeC_PLFQCBI5mms4AWAfZ6kN_mRSmaMzIwsPGg8pqhGvA>
    <xmx:jbccaGOUwVH610AoyCT6aAPNy9Fkk3mNFCWA1OTn1VOJQHArOTAicw>
    <xmx:jbccaNKTVBAeYTcqdy_Q7JAsVbVyyZ_U0-T7lgBgM2ZLjsWT0VeCVwAi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E83471C20068; Thu,  8 May 2025 09:54:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td2f4dc7f18582246
Date: Thu, 08 May 2025 15:54:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Zoran Zhan" <zoran.zhan@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <518ffd4c-2ea1-4496-b0fd-399ea1db0f57@app.fastmail.com>
In-Reply-To: 
 <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
References: 
 <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or
 disabled
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025, at 22:14, N=C3=ADcolas F. R. A. Prado wrote:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
>
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headse=
t=20
> jack detect support")
> Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select=20
> CONFIG_SND_SOC_MT6359_ACCDET")
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
