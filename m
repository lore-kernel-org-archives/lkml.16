Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC032BDC30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465587; cv=none; b=lp30nKOKyVwvrtMxONG2Jt8F+yh+OXsGihOCEfa9D8wm16Cxs59Usf9GoJ43yoZOCawIli8Hg3lB/BSnyagejf7/2fQAs4ibuwyVjLXpnRlY5YoJnV+sbDg7Xwhkf6M+tzgac5xCDa2qSmffVOD9uE3hFnyLNiJKcnIV4mkQV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465587; c=relaxed/simple;
	bh=xIX6GxkYy+RMVioZ/VaEmi8TDF7cbtgtQXVNUQIlmus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbWKEeMcLvQwuQJLmFPj7Cnlcefb7mvyzY4eHCI0NtzSX+QKilHWs+lZDtKAhe1/1Ox34IF297fPlqObQYKPQEVHmCI1GDeJ1tVEtwBex7bh+S5s5xy9Q1SjqlvypqZ9BTVD5Os3Cvt7CzfmxlLJVxcxBVIPtTKiasV5bWpsDB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=0g8/CW6n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="0g8/CW6n"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453634d8609so49339045e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751465583; x=1752070383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCX8EDCd8/i/wYRS9YBmGDW0iWUiXiEN/46xP+vv74E=;
        b=0g8/CW6n4xengA9/rppoYsTHQxislg1Z2I5aP0twp4c8xYsmszHOV/Mpf+zRNJV7cw
         Q5NpzqCvER6Hwbt+TGuNv95T0LPr2gZtIN775W3NCc4Oy6BZN9tReQxeGchZZ9TGl+G7
         IVVsH5CErKsV0gwC8iSYFI3qUaoH1oMvVIpTvGJEoeWHBZ3T78rvkfO5BE3a15uv3eeV
         2iuN0R7Ef47Z8WLCkj3PX8X5G0UauUE6c5zWyFEKKKMcVZ+psObLob816QgkeW7zIfGI
         aKVKBjrsSwhrF7xrGDig/xh5ruQCa4dSyRgtOik80DqnLuVSVAwACKdYmABsd1dVdZ6x
         ZQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465583; x=1752070383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCX8EDCd8/i/wYRS9YBmGDW0iWUiXiEN/46xP+vv74E=;
        b=RXLLOPArGfQQJGIMkeAMbK7CPylBHUUgF3pERLJSb91vQBkVMtFyEj0+wdRCi8Kl4z
         RQn2ti8oWZW8rd+s5ywi6Oca356+zIVQw23IRKAVQ5+H37amoiIqi/1iSic4fsv2hv6Y
         kvqWSnrxtwJk7mEnPfjH0Nsz2IIS+RVkWf1Rdpnw9lF3l/Q2Hx1IrlZqBqNraQQYqy7u
         kNXOdW/MgOivQkB0YjcRa6FMsBelt5ZGksdP5EFsTAFZNRUmypMCsgK17h/K8+jLGrcY
         kpX6BoEh1722mCjYZ3jPpbtqMd3VnWoDJSRamDxUFJ3l+9+pQzEn/1l0aByZApbjwVRM
         b1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX66V/BokaHzd9qc+3f8VIFO9z2fDaZdMXMQSNArwq08dKtM9mCQWuWufzPFw2IdVb6kMzra74/YaK9a3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QGCKvQFbEGuE+TBCtuP89fE7/7JdwMJVJmUHoHx22tVOUOwY
	wkpNEju1yILNcKrPGYJtW2QyfO/TPU8KeqZGrCzXTiVb5QcVAulie4OfJMlJr+Onz+0=
X-Gm-Gg: ASbGncvJ6aFCcl1k0/gYt7pqLQvXgqi5c/BUfVQXL8WE/RTHi8x3jrSGiIGP+s9nNzf
	MzG/7txgDHJk4c5rIqBfn8Wq/5v7ATMjfD3l1ThpRfLlsDXM7jqbwHgcs+Pn/4O/vOSV/HYTYfY
	QQJRMA2B7uAVwjAcyYKu78tjLbWtG7lCwOOb7/k4zhWo6SGVpeUJYGUcGZH4lTsFR+9NwywseKM
	0MXt3c2qio3/DPTrPo2na8XWURwy48Adkq24p6icG7Sx53C084TvwbCGSIe2ci23BRwlcQBuKIt
	5WuQsRmEIpZC2vHB6WoSPaZlbxqLYLMSKXKivpz/fuoY5JAamSRPefNZdrMwRJGga9+ITA==
X-Google-Smtp-Source: AGHT+IEk1Iz9F6Hzi17G8siVxy1kneMMVA9o7oJxCvLiimTGG5VAQ9oHTXa5JjHBEPPb8pmO2Hxa8w==
X-Received: by 2002:a05:600c:638e:b0:453:b44:eb71 with SMTP id 5b1f17b1804b1-454a370c313mr35319005e9.19.1751465582882;
        Wed, 02 Jul 2025 07:13:02 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6d50sm233164175e9.30.2025.07.02.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:13:02 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:12:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 09/14] dpll: zl3073x: Register DPLL devices
 and pins
Message-ID: <3sgsj5vxtkzfpfpn5igave2qppy27mq7erpcmhqtfswaayaynv@zcsldf44o7b3>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-10-ivecera@redhat.com>
 <ne36b7ky5cg2g3juejcah7bnvsajihncmpzag3vpjnb3gabz2m@xtxhpfhvfmwl>
 <1848e2f6-a0bb-48e6-9bfc-5ea6cbea2e5c@redhat.com>
 <k2osi2mzfmudh7q3av5raxj33smbdjgnrmaqjx2evjaaloddb3@vublvfldqlnm>
 <e55caefa-2ea9-4d31-be76-48cdfd481b5c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e55caefa-2ea9-4d31-be76-48cdfd481b5c@redhat.com>

Wed, Jul 02, 2025 at 02:16:53PM +0200, ivecera@redhat.com wrote:
>
>
>On 02. 07. 25 2:02 odp., Jiri Pirko wrote:
>> Wed, Jul 02, 2025 at 01:49:22PM +0200, ivecera@redhat.com wrote:
>> > 
>> > 
>> > On 02. 07. 25 12:57 odp., Jiri Pirko wrote:
>> > > Sun, Jun 29, 2025 at 09:10:44PM +0200, ivecera@redhat.com wrote:
>> > > 
>> > > [...]
>> > > 
>> > > > +/**
>> > > > + * zl3073x_dpll_device_register - register DPLL device
>> > > > + * @zldpll: pointer to zl3073x_dpll structure
>> > > > + *
>> > > > + * Registers given DPLL device into DPLL sub-system.
>> > > > + *
>> > > > + * Return: 0 on success, <0 on error
>> > > > + */
>> > > > +static int
>> > > > +zl3073x_dpll_device_register(struct zl3073x_dpll *zldpll)
>> > > > +{
>> > > > +	struct zl3073x_dev *zldev = zldpll->dev;
>> > > > +	u8 dpll_mode_refsel;
>> > > > +	int rc;
>> > > > +
>> > > > +	/* Read DPLL mode and forcibly selected reference */
>> > > > +	rc = zl3073x_read_u8(zldev, ZL_REG_DPLL_MODE_REFSEL(zldpll->id),
>> > > > +			     &dpll_mode_refsel);
>> > > > +	if (rc)
>> > > > +		return rc;
>> > > > +
>> > > > +	/* Extract mode and selected input reference */
>> > > > +	zldpll->refsel_mode = FIELD_GET(ZL_DPLL_MODE_REFSEL_MODE,
>> > > > +					dpll_mode_refsel);
>> > > 
>> > > Who sets this?
>> > 
>> > WDYM? refsel_mode register? If so this register is populated from
>> > configuration stored in flash inside the chip. And the configuration
>> > is prepared by vendor/OEM.
>> 
>> Okay. Any plan to implement on-fly change of this?
>
>Do you mean switching between automatic and manual mode?
>If so? Yes, later, need to extend DPLL API to allow this.

That is why I ask. Looking forward to it.

>
>Ivan
>
>> > 
>> > > > +	zldpll->forced_ref = FIELD_GET(ZL_DPLL_MODE_REFSEL_REF,
>> > > > +				       dpll_mode_refsel);
>> > > > +
>> > > > +	zldpll->dpll_dev = dpll_device_get(zldev->clock_id, zldpll->id,
>> > > > +					   THIS_MODULE);
>> > > > +	if (IS_ERR(zldpll->dpll_dev)) {
>> > > > +		rc = PTR_ERR(zldpll->dpll_dev);
>> > > > +		zldpll->dpll_dev = NULL;
>> > > > +
>> > > > +		return rc;
>> > > > +	}
>> > > > +
>> > > > +	rc = dpll_device_register(zldpll->dpll_dev,
>> > > > +				  zl3073x_prop_dpll_type_get(zldev, zldpll->id),
>> > > > +				  &zl3073x_dpll_device_ops, zldpll);
>> > > > +	if (rc) {
>> > > > +		dpll_device_put(zldpll->dpll_dev);
>> > > > +		zldpll->dpll_dev = NULL;
>> > > > +	}
>> > > > +
>> > > > +	return rc;
>> > > > +}
>> > > 
>> > > [...]
>> > > 
>> > 
>> 
>
