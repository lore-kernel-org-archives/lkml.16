Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4162146A72
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269095; cv=none; b=EhqZpoYer9xa31tRP5JKJVYawpNDiXlbQr1O1BpMyd3JBhAF9EY11nulrmzTXaxf2FMuM+EOFJFAm7yTxTH3AM0tZLVxNHOJlNbLXZqfXQYpRCw27D5yVwr+H1vmNkI3qGpZnNmlB2i2WqhtsG5rSIHSfekUu/zsvui8QAsmr2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269095; c=relaxed/simple;
	bh=9nFS6Z+Qr9uYWg+WgnqklpMTBF4mg9ANTFsLb7GrZEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBKcZlvarrixFLzTy7QARm/ONGv2kxHPyjUlOZz+oinRg0awSruEGaFZgH/PlLAi1Hj/l9f5fByS9PA9BjE2WTaHk0xuplLRsQ5cPxBqOU9gMflCGijBEUZKv9EngY3ymIte8hFdFfHmq4XnFw9qVNC0jWjZUdVNkcIm4qQu7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bsNCDAGm; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bsNCDAGm"
Message-ID: <a98ad2e7-50de-4d04-8d99-2cf77354b1d6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748269080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CG65uiG820yU4E9kA+la6nKKENDkdykyFfNseCcdUss=;
	b=bsNCDAGmpl6C8L2Lkj0cxztxBBCc75SVO1eCCy6WLnR1zVp5j74zJdDgFqA28LK/IHvuCG
	6tV+4J0V5d4+xrsoFHcgWE6TIg/xREsvVEbNfcrBJ1XN+h7iqQvzNCZVRLclPy0pN4DG8N
	VXHnkor97AA8Fjb15mrYGKLKegxIRkU=
Date: Mon, 26 May 2025 19:47:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-5-aradhya.bhatia@linux.dev>
 <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Michael,

Thank you for reviewing and testing the patches! =)

On 26/05/25 15:05, Michael Walle wrote:
> Hi Aradhya,
> 
>> +static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
>> +{
>> +	struct device_node *companion;
>> +	struct device_node *port0, *port1;
>> +	u32 companion_reg;
>> +	bool secondary_oldi = false;
>> +	int pixel_order;
>> +
>> +	/*
>> +	 * Find if the OLDI is paired with another OLDI for combined OLDI
>> +	 * operation (dual-link or clone).
>> +	 */
>> +	companion = of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
>> +	if (!companion)
>> +		/*
>> +		 * The OLDI TX does not have a companion, nor is it a
>> +		 * secondary OLDI. It will operate independently.
>> +		 */
>> +		return OLDI_MODE_SINGLE_LINK;
> 
> How is this supposed to work? If I read this code correctly, the
> second (companion) port is always reported as SINGLE_LINK if its
> device tree node doesn't have a ti,companion-oldi property. But
> reading the device tree binding, the companion-old property is only
> for the first OLDI port.

With this series, the dt-schema for oldi changes a bit as well. Both the
OLDIs, primary or secondary, need to pass each other's phandles now.
The "ti,companion-oldi" and "ti,secondary-oldi" properties are not
mutually exclusive anymore.

Something like this.

&oldi0 {
	// primary oldi
	ti,companion-oldi = <&oldi1>;
};


&oldi1 {
	// secondary oldi
	ti,secondary-oldi = true;
	ti,companion-oldi = <&oldi0>;
};


If there is no companion for any OLDI dt node, then the OLDI TX will be
deemed as acting by itself, and in a single-link mode.


> 
> FWIW, I've tested this series and I get twice the clock rate as
> expected and the second link is reported as "OLDI_MODE_SINGLE_LINK".
> I'll dig deeper into this tomorrow.
>

I was able to reproduce this behavior as you mention when the second
oldi dt does not have a companion-oldi property.

However, upon analysis, I realize that even having the correct dt as I
mention above, will fall into another bug in the code and fail during
the OLDI init.

Unfortunately, two wrongs in my setup yesterday caused my testing to
pass!

I will post another revision, if you want to hold out on debugging
further!

Thank you for reporting this!

--
Regards
Aradhya

> 
>> +
>> +	if (of_property_read_u32(companion, "reg", &companion_reg))
>> +		return OLDI_MODE_UNSUPPORTED;
>> +
>> +	if (companion_reg > (TIDSS_MAX_OLDI_TXES - 1))
>> +		/* Invalid companion OLDI reg value. */
>> +		return OLDI_MODE_UNSUPPORTED;
>> +
>> +	*companion_instance = (int)companion_reg;
>> +
>> +	if (of_property_read_bool(oldi_tx, "ti,secondary-oldi"))
>> +		secondary_oldi = true;
>> +
>> +	/*
>> +	 * We need to work out if the sink is expecting us to function in
>> +	 * dual-link mode. We do this by looking at the DT port nodes, the
>> +	 * OLDI TX ports are connected to. If they are marked as expecting
>> +	 * even pixels and odd pixels, then we need to enable dual-link.
>> +	 */
>> +	port0 = of_graph_get_port_by_id(oldi_tx, 1);
>> +	port1 = of_graph_get_port_by_id(companion, 1);
>> +	pixel_order = drm_of_lvds_get_dual_link_pixel_order(port0, port1);
>> +	of_node_put(port0);
>> +	of_node_put(port1);
>> +	of_node_put(companion);
>> +
>> +	switch (pixel_order) {
>> +	case -EINVAL:
>> +		/*
>> +		 * The dual-link properties were not found in at least
>> +		 * one of the sink nodes. Since 2 OLDI ports are present
>> +		 * in the DT, it can be safely assumed that the required
>> +		 * configuration is Clone Mode.
>> +		 */
>> +		return (secondary_oldi ? OLDI_MODE_CLONE_SECONDARY_SINGLE_LINK :
>> +					 OLDI_MODE_CLONE_SINGLE_LINK);
>> +
>> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
>> +		return (secondary_oldi ? OLDI_MODE_SECONDARY_DUAL_LINK :
>> +					 OLDI_MODE_DUAL_LINK);
>> +
>> +	/* Unsupported OLDI Modes */
>> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
>> +	default:
>> +		return OLDI_MODE_UNSUPPORTED;
>> +	}
>> +}

