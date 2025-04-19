Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168828E0F;
	Sat, 19 Apr 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745044966; cv=none; b=HIqQ+aMOVuRSjQoymd2/Shde7UaX40CcuAsjGpbM4SC+Jq9YuSJHcyvyJk6HhG82L0tG1roZWn8w5ccKtskOvdax1p9u/fxEvthKw0ENmBFIEV3o5uyCc19wu80mX4pXCBDufM92QNKucTOc9yIdg21Oc+rVPtsfYY/BvmbWpbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745044966; c=relaxed/simple;
	bh=RpDJN/CwCIEnkvfWDcWekSrBuACy5eLCDUNY+0W0a4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4RgwoggI8u/Bfd9mAZDjl81UDDpkCAkbPY44igkyNg+34IhD7IhOb/C60iTp5L57Ci5Mf1nT4e366vph6Hd2wYUHgJ1kg0UIZ4S6ASs1zYfsafrpm44MLsNAP5Aa2MMRZ2ZW2JJbS0fw6N+2pY8pmV/DmL5eK7+3Ve5017GhgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=Oh9mfdsp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UfrNYTHn; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="Oh9mfdsp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UfrNYTHn"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 417362540395;
	Sat, 19 Apr 2025 02:42:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 19 Apr 2025 02:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1745044962; x=1745131362; bh=zjt7NfBTzseQQMbU4/Y8LSDbLij1PLqZ
	aamI7Qx/jKQ=; b=Oh9mfdsplZ7i20GBTkOnAnIP3l43QK4SIe0Oew6G5Vn8rjDH
	Jkzx6Xdgkqau6Tr9sg6fdh9RdZmVngGuaEtFU+s91KEFO1/Ty6LBUjLiSCsSTO+W
	GZUMjhe0t0VDHHH4Furz/W2aUTkg7Noicw1E/u+ICm+7VtCRR2bSyTQo6D5KIxzv
	5Gdaf/gtacF04VHSEJetuAZdz2DPbURnQqQY9l6yvu/anIX2QYfdJUkLJFHfvD9N
	p2lS4e1nW0I5t1UEAXUW86f+FRXwslbZdodOAweJLz09CVm71WKWsfQal8RDNNaY
	m9PboVUhZQ9IUGx7Mkhh9f6rfkJKDV8bFwRjkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745044962; x=
	1745131362; bh=zjt7NfBTzseQQMbU4/Y8LSDbLij1PLqZaamI7Qx/jKQ=; b=U
	frNYTHneRJPrz+u2FZYVGWYEb/oJPDEkfkJmCemiKjDbphzYsj9to3yvXzqDuxND
	tma2eP3q2rFbCngaSqNEd6mxezuQLYb004rM+y059La1SvmTz2fYdUAPv/cfOIMe
	be/oRvTS9uSnHx4ievbR4ahwaPunb5Ok+ozS4/D+5seBOuGDwk8N373HI7xHfUEl
	PJ+0Qbbt/XeG63phsDUHo9ewLubEpHlrgq0OkkksMMv4oz5xn14av/fCLhgEJ7Re
	9b99upCdxMZS2xgcaSdNSS7eglKr8zz3wY5f0fSW2L7BchEEkPsYSUufwD/mjmhn
	5V5b6/qyr376NoM1kmwhg==
X-ME-Sender: <xms:4UUDaIs5Ny7GF38C8WnUn0nR48lDcMXrwqpGX9IZvw4kHNogcGPeCg>
    <xme:4UUDaFd-UCklpb-X5bxoUNiEQd1yoiR1mFOE-qv1BXUD2Msvrk52lW0Va2AwT_WIQ
    SSLTAS7LANOosagsDA>
X-ME-Received: <xmr:4UUDaDxNXMpVP_b_QdrhZ0KjRd8enuK4YtIXq1wjQXK2gaAdwkm2dtBbLia8TL4IOoVX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgt
    phhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtoh
    ifihhntghhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghr
    nhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:4UUDaLM25JbRuYmCuFzy8hpuXXbZDn8mw_IgxhT6pDJw7zQAJYqThA>
    <xmx:4UUDaI_glysPJGPj2VfOhzjRGHrEa_5Fl9_Nfw8Ome00AyJKkUJYJQ>
    <xmx:4UUDaDWzJYoLb2zfyJ7NEkkQxLixy39eC_5VqQ-DtSKcTfpushl5vQ>
    <xmx:4UUDaBd9iE4KcB8v0v61cUf9HSWGj1B7fI-2B5x15ZE04mZsHfdHxQ>
    <xmx:4kUDaILQRmgzG8Z9BoOLGaiybrwn3SiiHE4Ym-YYn-dMGZdocIVv0jJR>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Apr 2025 02:42:39 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on
Date: Sat, 19 Apr 2025 08:42:34 +0200
Message-Id: <174504490666.63781.1711699267217097502.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
References: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Apr 2025 20:06:18 +0200, Janne Grunau wrote:
> The driver depends on boot loader initialized state which resets when the
> ps_dispdfr_be power-domain is powered off. This happens on suspend or
> when the driver is missing during boot.
> Mark the domain as always on until the driver can handle this.
> 
> 

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/fixes), thanks!

[1/1] arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on
      https://github.com/AsahiLinux/linux/commit/dc5befecbe26

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

