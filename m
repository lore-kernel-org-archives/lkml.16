Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CEA221FDF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333237; cv=none; b=mtivdEGVN+Cj0+yVCGHlZHE2j6PNGpSr7kUC6w/5hiqZuuxlVfbBzhMwq8nkl5DoQPmBKcVMwvmUe8MCduDVijih+AEQOvR68pEJpc2FHFpMp7G9hNskM280m+32TDnb1dMRVxIWJXuvufVgtxj0U8yTpJPmUjse+YcByhj0xRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333237; c=relaxed/simple;
	bh=fI4b0JmvmR/LKJHS4kYGRgS79fqtVDdNyB26iJdkI7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fylYRwaVH0JkndoiqiwA9upAa4Q3t6D44d9FPzaDn06ccTjyOWH8ZylHgeVM7c1fCAFkJow972HrgardsElMsSzQ2BzLLfjryActrWA/Qodix0deijomWBVCzD+k2Txd+fKYx8Jk8DL+uK/nA6kSuwhlan2VFXTuWxSGqqFW+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNZcfN0O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNZcfN0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750333234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5MqY5EbJPpgVIT/GMNbBL+m8bzhYEjTyXfnL0CxcoM=;
	b=LNZcfN0O5EiHbj61InS26SG0DzgdUWWkci85mvoDr02Jd0QJjHDcXuzfG+DX48i/0nJxv8
	nbpvCl16f3280jjXtn0KogAmJZy/KVQsA/eBHUWqIMCPVYoR85DHFC78sitAGwReqtsP7g
	eGM9zD7jKB8dOuDqOW+S/QtDDyaptoA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-izFp95o5MFe5szRlLiozwA-1; Thu, 19 Jun 2025 07:40:33 -0400
X-MC-Unique: izFp95o5MFe5szRlLiozwA-1
X-Mimecast-MFC-AGG-ID: izFp95o5MFe5szRlLiozwA_1750333232
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso324160f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333232; x=1750938032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5MqY5EbJPpgVIT/GMNbBL+m8bzhYEjTyXfnL0CxcoM=;
        b=BSw69vZo0orw1UAtrla9itqtuTcPRHxd+2TBgPJep7nTn4ay2bl3IpCiLswVvdYJOt
         jPR2BcU2or/SbxbeGUE1iYtFs5n/oqWfE+Xe3YpbZWi0a/Kko/Q9uB3GbCqvVqKDUzZ4
         exk4Gw/QHWNFCjUjJNB4HlLUnbRRJwNiosheuMrlX2Iw3gVfiyQgMWuPaWMIgnonn6cU
         7KYjeUtsdqD9rvVL72c1b/6i2m3rFgXRN6OJypPW2nH5HyVQF6NvxmusobdH+o8pWmLA
         UDDxSPbUj0IjxuLWhgrXhpXmWu8JVHCT2ssCi2/XHRSZBv+Zav8fYNuVgakJZXZuk5Tt
         1dYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/88+amfMqIaj0ToqKWpQD5It0YqP0/WubKj477MKk8xNdpANJPFI+2M+dCPmIJbfyQO9eNVTUqfuSMcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyMsDUE0RDJRCJyffEsI7NusJcN4uAUFs0BZhlpK6gnUExAor
	3GGZ8G8USI04PBMx4IjkkbYYVFRAFFzZeFkokOMJoCb16jEQSS4pcASF+OVN/DRhcGcehms7glk
	GtYS3helKnEsJAJGmNP7JR4I5lKGMzMCsF5g2phUEJU98DJgePSmpwQ4EVcipxDD9VA==
X-Gm-Gg: ASbGncu3giSmua4XO4TYAb0ZJdttbK1ig8N5eB1/DujB9H4I758dSGhwmo7F3lAGJPa
	FVs66j8Nmryiib1jjH1pUE3zcCttqOJl3VpcloWflq2U8lVpPEdQXgiALxB/sN/RfTv54qVayxj
	3ZIGdaejWWbKAXqH02liI2fB2sLoq+D5EOafxsfNBJUv35RbY2E4wkrD10bfWdmWASTb5cUzs0y
	3HJ56aIItNVrErT/IDDrt4x9IuDLVh3oxjljvhq2uOXVDX6FjTbTwxSZrau0IBbDXpbE5Ou36HF
	V8VDTLNKuIzZ6cWjt1Ie85gwefGQmuKJkuYBTcpSV5Pu02MPs3NIXFkR2GloevtJ4HV7nA==
X-Received: by 2002:a05:6000:2d0c:b0:3a5:8d0b:d0b8 with SMTP id ffacd0b85a97d-3a58d0bd1camr4831909f8f.54.1750333231806;
        Thu, 19 Jun 2025 04:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkPsAM7rzvUuUIwuWTbnbsaa2hHEQ50y/ld0Zh2qJ6v7nBnPiul0WnrvWb0vFBIsYzskhEqg==
X-Received: by 2002:a05:6000:2d0c:b0:3a5:8d0b:d0b8 with SMTP id ffacd0b85a97d-3a58d0bd1camr4831872f8f.54.1750333231356;
        Thu, 19 Jun 2025 04:40:31 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28876sm19250304f8f.73.2025.06.19.04.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:40:30 -0700 (PDT)
Message-ID: <7fce273d-06f4-498c-a36a-d6828b4d4f30@redhat.com>
Date: Thu, 19 Jun 2025 13:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 14/14] dpll: zl3073x: Add support to get/set
 frequency on output pins
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shannon Nelson <shannon.nelson@amd.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com>
 <20250616201404.1412341-15-ivecera@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250616201404.1412341-15-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 10:14 PM, Ivan Vecera wrote:
> +static int
> +zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
> +				      void *pin_priv,
> +				      const struct dpll_device *dpll,
> +				      void *dpll_priv, u64 frequency,
> +				      struct netlink_ext_ack *extack)
> +{
> +	struct zl3073x_dpll *zldpll = dpll_priv;
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct device *dev = zldev->dev;
> +	u32 output_n_freq, output_p_freq;
> +	u8 out, signal_format, synth;
> +	u32 cur_div, new_div, ndiv;
> +	u32 synth_freq;
> +	int rc;
> +
> +	out = zl3073x_output_pin_out_get(pin->id);
> +	synth = zl3073x_out_synth_get(zldev, out);
> +	synth_freq = zl3073x_synth_freq_get(zldev, synth);
> +
> +	/* Check the requested frequency divides synth frequency without
> +	 * remainder.
> +	 */
> +	if (synth_freq % (u32)frequency) {

As the frequency comes from user-space and is validated only the DT
info, which in turn is AFAICS imported verbatim into the kernel, I
*think* it would be safer to check for 0 here or at DT info load time.

/P

