Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340428C005;
	Wed,  7 May 2025 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637882; cv=none; b=as2kvohVP7lJwSzNfGOvdpK/N8hGQQad1C/qKDr0tfCE67eMr1uA0WlmEjIbAOFJrqoUkttlR4R93UnpJtGd4Kb3qlTsI+xSt6/PYV3Hz5P4a3WcGhQ8ZQ8LmJKn8zBZ0pvWc5e2RjJd1S0oyfNdrMs8bV70cMA/W/VWs85gNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637882; c=relaxed/simple;
	bh=PtOzak8p1izoQ8d/3FjSq3y4ospvl2h2KBvgXERvZGQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rxFEiTLQTDuioj8s3jwMW3lJo736OLrsT8wNDDvbii0RQvh0z2hKce/H0TQ0gizLx33qo1HzaT92gdkWgRpSz4dwejtGgvaBEHwKW6NN2k60tlhxYjYsEMgp97Dc8J1x5tesJrfo2GQkgYWtaq5ERRGk28OS2KRiHRYqOL4tKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TD8MeoFX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pV1thzWp; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TD8MeoFX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pV1thzWp"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8BF492540051;
	Wed,  7 May 2025 13:11:16 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 13:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746637876;
	 x=1746724276; bh=CxmqSZ1AK7yBB5MUSaTIQdTYBYRu6YuDz5DPNt9zgX8=; b=
	TD8MeoFXIn00Al80JI5XHSktYNRxRkcus3vLgbmGgVz/giA9jWsvGiRPlTSCF62R
	SPRPCKSZRQlHnqrghPxoXESn/AHD/YE1gUnSm0TPa+hl9YnQr9TMlpylF5vWEZX8
	70qpjziLPxUlyAzY1B5J7wvSqNRwFbYdweccbt3XJn+9+k1P+lobGddJVYmLa1vz
	f5DTv6Fg1fntIA9WvjDC6PUZD+CEpnca1iqH/BUoUWhv8QSbtrEzzplIbgRl0+SY
	ii7Q3/z5vPrWEJoBXeHPzdAg3A11bUV1Zd2RoBpsZy1b204Vy6Xc3zb1FDbPjTpH
	96TCuaqbNvBJSrppI+aHZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746637876; x=
	1746724276; bh=CxmqSZ1AK7yBB5MUSaTIQdTYBYRu6YuDz5DPNt9zgX8=; b=p
	V1thzWp7eesDXNbedrvkD1iAzNrHo/OXQuyk/CTNDbUB+BHkdY3atJMJwoSezu02
	O4pnKco6LMh9FNLV7pk18A4UOAnpAY1mtF3VnIlrqJo5RH6Xgj+sgXxcxvkCQVHI
	byWwyEArtM+8aRcyavpO8F1LmkYQ3yZqRXURUYvTkEP9MnQkNqaOmCnsd2ZNi0sk
	9m4Gylxw3oUWGoxvaLnzD/NTje+gr23mwgyYsu1vOmrV134NBWjavDveRBY2WMtT
	4BMGlou69/KJYdDRuWwrCwjc33W2rSSdXsZgxviuKgGy388ml3+dNHxlMjirIsJ0
	DfR+Nmbaemm9s+ZVK6slg==
X-ME-Sender: <xms:M5QbaPsMwqf-pS3_653FHCGaoz9P_YagO9WpOIr_TpM7OBMshiq_TQ>
    <xme:M5QbaAclo64on0zQsOgWsim3nNFSsWsbwLz5rO_ZRdznEhjkpTdGFzmYF4OGFS7o5
    jMDYxSHyYiXwfBdq00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelveff
    feelkeeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthho
    pegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorh
    grrdgtohhmpdhrtghpthhtohepnhhfrhgrphhrrgguohestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslh
    hishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:M5QbaCxmjxrDE9yrJxbt3PHNCP8k3VIrNux4v48ofmIojq2f1xZpTA>
    <xmx:M5QbaON0TcKXLcysSxt8BPSKohLTEKYCDL-UG7QhOOUFuV0kJJ8CPQ>
    <xmx:M5QbaP96hilH0TkMGS83WQ_pdM_Cx1a2PteS4DivZVflYIq3ug8fdQ>
    <xmx:M5QbaOUUvoZp3p8jSEdBS3unBjEDzBoQ7uGr-oRHGh87eakDVvUgaQ>
    <xmx:NJQbaLcnpQ6jhKJ4Hm6Hmzq6JnU4oeNA91IBLkIWJGTncBLWZdNMWR6l>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F40F51C20067; Wed,  7 May 2025 13:11:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2abdfe4f2fd01522
Date: Wed, 07 May 2025 19:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>,
 "Zoran Zhan" <zoran.zhan@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>
In-Reply-To: <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
 <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025, at 18:41, N=C3=ADcolas F. R. A. Prado wrote:
> On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The driver support was added without selecting the codec, which leads=
 to
>> a link failure:
>>=20
>> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in funct=
ion `mt8188_mt6359_init':
>> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet=
_enable_jack_detect'
>
> Hm, I cannot seem to reproduce this. I just tried to build on today's =
next with
> CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
> CONFIG_SND_SOC_MT8188_MT6359 both =3Dm and =3Dy, but in both cases it =
compiles fine.

The config that failed for me had CONFIG_SND_SOC_MT6359_ACCDET.

> I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add=
 stub for
> mt6359_accdet_enable_jack_detect" [1]

> https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@c=
ollabora.com/

I had not seen that patch, but with that applied, my patch needs to
be revised as well. If the idea is that CONFIG_SND_SOC_MT8188_MT6359
can work correctly without CONFIG_SND_SOC_MT6359_ACCDET, it should be

      depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET

in order to force SND_SOC_MT8188_MT6359=3Dm if the ACCDET portion
is in a loadable module.

If SND_SOC_MT8188_MT6359 requires SND_SOC_MT6359_ACCDET to work
correctly, then my original patch is still needed and yours
should be reverted.

     Arnd
