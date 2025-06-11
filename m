Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0C29B23D;
	Wed, 11 Jun 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749672620; cv=none; b=qDpPAEAoWA55ZYQXpvC3gAbSn8OE64oofJfog7lDjhnEmThz4xzCrGhBB2s2uRViDT9YeZxlS/qCjdz/XmPQw5n52pC/R50mRdLaMM+RF+Lb0R5ODcUIRM0ayN768wA0rFfS3eaCsaPydg7ZpM+puMw9s34qx19UzUaJLLscfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749672620; c=relaxed/simple;
	bh=bEEaQfa0pcYxrZSCUh0iTKeIswton2UT//fdDCiKa5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO2MkTGHDmg+kMRSttOrPYJCtEOR+nWhxFAycrq2SluvxWvPpBSs+G3Ou8rTd7I7GjQPKTXj1f1LlH4ksIn0UYm1tM7llAPVrtKIPqxhXer89VNRb/E58YqogkVfCHqySWTWcr68tce1tkd+h5jqXIG52BRAwwQUeHQ0fqN8xtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=XF1bDW3v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IGtPwG73; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="XF1bDW3v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IGtPwG73"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C58F31140089;
	Wed, 11 Jun 2025 16:10:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 11 Jun 2025 16:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749672616; x=1749759016; bh=dZbDOY3A42
	gRinlRSx+qPEKp7iblwIBfqRBdkTzwifI=; b=XF1bDW3vBccJwENTlZpWn/Lwc1
	fcc1+HVDNfHWNtEU5AF+O0mFnfUum57I2XE9kmVBe2RslEeuzRcIa/n9rmkFN6uV
	LBoVOfZG1LzHLNC/fH1qc91c5OrCTmXdhl9abmFM0XBtPfEaDMdO/vVmo92V4ddM
	laEowTRF2iviDDRywKnIAvTWYuFttTo8SNlqrT/anRbfQfHmhZsRp5mB4S2M8Cgw
	Q6TA7tDtrq72PzNbQELD89ZoDbFfpbLXMlf+iIC/wHTRYzCjo9drSue+bdPgjB0G
	//8zBPudgFUqZQW56OLaBPu3FpQng15ONuY6zjCJ6jWisxYW7MDRO26LXUCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749672616; x=1749759016; bh=dZbDOY3A42gRinlRSx+qPEKp7iblwIBfqRB
	dkTzwifI=; b=IGtPwG73LEGW34r3sXxoaXHkLmo+jPEsatiQ3tQ15PvLRpBNaUd
	4vZLB6YDWMPssFyHiszcSdJLyW7vT9CaNBHqC12l/I9XhI+QQK5zUxSU3liMTsmi
	yKK7MFOEHBpJ7q2GudDrmchBhZxDVqv0q4GXeDpcrjCm0RHwPPH5LYX+wENUdKMv
	cD5faTcsS4C7LjOJfqEUOXcjy84fGwKpGR1pDeRZRFYVmuXWiBLBw6ZzSafxLwO3
	YcOIMLpcjlIXFQF48BeTMMD/XPhQUbjEH5x6dzeIuVKMB8k1wUGSUvdKFQXJZu3d
	vyLtb2n/39Jfh/+5xGlvEDMtklPG7MEFovw==
X-ME-Sender: <xms:p-JJaJSHBFa6LHZEi1rcFs3gtyWgaRgAmMxHaDQAgirkE-qAZkqm6A>
    <xme:p-JJaCzOIk4p5aZEHLHvH-UgmDjZ3iXzV4Ay3IyO2VU9fdDQVzh66C4NIF0RWNsoF
    h2NYk1LqDhK1FumQ0U>
X-ME-Received: <xmr:p-JJaO2o_bmgmEgna3wDwUDSt2W_CIzRn_cKo5q4NRr6gC5UGoFcu4nf7pKyRvQAgUIg7KQd83SeodQmzNYBZkp-_d2EAmrBqk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedujedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghs
    rghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrd
    hlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnhgv
    rghlsehgohhmphgrrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:p-JJaBBHJZw8M-agVQcr6OtDmJ55REB0eYxX4b7jzXljlGGpgRcBLQ>
    <xmx:p-JJaChmu5id2-1eOgfO2ahMSjeHDal-3fD_v8jl7_Gi7QKnWI3k2w>
    <xmx:p-JJaFoLWcMt0J8oDem2IIvXpLLzqtmSSpHDEYugKFseQH3BHmgNxg>
    <xmx:p-JJaNhCsiLG_DVpcPcXRRO0MEB8oEyx__CO1WYXxKC6Aj3IQ1qi0A>
    <xmx:qOJJaPaLGYxINreGkLUMRQaJAG8r0hOlaMW303golrWJybwnlh1Gegcc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 16:10:14 -0400 (EDT)
Date: Wed, 11 Jun 2025 22:10:13 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: fnkl.kernel@gmail.com, asahi@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neal Gompa <neal@gompa.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <20250611201013.GB3141695@robin.jannau.net>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
 <47bcce06-9c08-40ee-a22a-bc168952b74a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47bcce06-9c08-40ee-a22a-bc168952b74a@kernel.org>

On Wed, Jun 11, 2025 at 09:12:35PM +0200, Sven Peter wrote:
> Hi,
> 
> On 11.06.25 19:32, Sasha Finkelstein via B4 Relay wrote:
> > From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > 
> > Add device tree entries for GPUs in M-series SoCs
> > 
> > Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > ---
> >   arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
> >   arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
> >   arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
> >   arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   7 files changed, 198 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
> > index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
> > --- a/arch/arm64/boot/dts/apple/t6000.dtsi
> > +++ b/arch/arm64/boot/dts/apple/t6000.dtsi
> > @@ -16,3 +16,7 @@ / {
> >   };
> >   
> 
> [....]
> 
> >   	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		gpu_globals: globals {
> > +			reg = <0x0 0 0 0>;
> > +		};
> > +
> > +		gpu_hw_cal_a: hw-cal-a {
> > +			reg = <0x0 0 0 0>;
> > +		};
> > +
> > +		gpu_hw_cal_b: hw-cal-b {
> > +			reg = <0x0 0 0 0>;
> > +		};
> > +
> > +		uat_handoff: uat-handoff {
> > +			reg = <0x0 0 0 0>;
> > +		};
> > +
> > +		uat_pagetables: uat-pagetables {
> > +			reg = <0x0 0 0 0>;
> > +		};
> > +
> > +		uat_ttbs: uat-ttbs {
> > +			reg = <0x0 0 0 0>;
> > +		};
> 
> With W=1 this results in a bunch of new warnings like
> 
> arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-394.5: Warning
> (unit_address_vs_reg): /reserved-memory/globals: node has a reg or
> ranges property, but no unit name
> 
> but I'm not sure it's possible to fix that without making up fake
> addresses that then get overwritten here. Would be nice to fix this some
> other way but I'm not sure how and so far we don't enforce "no
> additional W=1 warnings", so:

warnings go away if the "uninitialized" reg property is removed. Since
it will be filled by the bootloader fills those anyway we could use:

|	gpu_globals: globals {
|		/* bootloader static allocation */
|		status = "disabled";
|	}

Janne
