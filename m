Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66BA2BDC01
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439124; cv=none; b=ESoQkOpMMCJUku50uONlRAguyj9QIwYyqi2fq+ON5GcOnBO112n5uXML5dVV3QwQAAhmA/gU5ckyg7VPz0nznNc/QDFWHheanhHvp5cJoYgzoSMnDREwaTMv3Ud/qCIVxEGahdAI/HUxocE85rpr2RAUTKFQjLFCoQys4e92aL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439124; c=relaxed/simple;
	bh=qz32WDm8kGqJZkxyvJ3a2TRLVvgFrditQhnsHw8Tesc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jbfP97v4vS7H5VHpJpEVieZCh/D1pjr0hP6xxt3KkCwC0GCV3nq4Kmb6uxo7+w/QfHj1guB0NyAUfkbfF0wDtzKgDKt9wH4UVuMld0jvK7SJoAQykou32UtqCcDnXK4sSk90y7jM8oQVUGKCV7aT1eauUlYUAn1jxEgP3ytWh6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRG/lLDt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRG/lLDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750439121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0uKaElPF1p9RN7ExopibAGaJCOW8iQTnWa+hoEBRAw=;
	b=iRG/lLDtl6M2ordYi5SCEHmS10+7OD4mm/03lnmlGohw630PUt2vc/PbhGPvALMHNQXi1k
	mGUUFWsWgV2TTT3K97/ig+bcxZ7HG4QpJO9odzs/iXb/9Ro6x2gvMEjLnhwGxhAyxbwASw
	0mOisle9c1SBozj06q9R7vmylfTm9xQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-fq_rVKOrPbyWSRRjuwZXMA-1; Fri, 20 Jun 2025 13:05:20 -0400
X-MC-Unique: fq_rVKOrPbyWSRRjuwZXMA-1
X-Mimecast-MFC-AGG-ID: fq_rVKOrPbyWSRRjuwZXMA_1750439119
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so12122125e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439119; x=1751043919;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0uKaElPF1p9RN7ExopibAGaJCOW8iQTnWa+hoEBRAw=;
        b=JQKzex+6RURZuXAaCKwgC8WCeLfkGTbgWHC+zqmYBgSbBLX/rLe7vRdJZuQ3KRctRQ
         65TLzsJdn9IjApZYUHSkCzVfL2jReuHPkUxxnwIUEBaJi/C9cuEvusWf7DquG1RETqYm
         6OreZPx4H6oFFVTRRObYrRJ896mUSIl43f2u3Tj0GKwaTuCT2op74ttMgWq8uHPNL2ks
         9sETGEyKUqgzHhnyk6eRvTyupUYOzLjO3b/A2ORUk+XEH3yrSHNXD1mxA29cBUUvdfjd
         tsg+VTC0ZDv6VbeevTDcZ/SnLtG7DYXiesbAK5zGKl/I3xwrNPwHSmwpmr/vyEb0gwEo
         y73Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYnhkHarU/k03OpT5HcUfb0KiSchhprLaaqZTtg68Ia9DQeqrlbsJ5vut3q49BGDziVbstmo6mI2bzcYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cah2RbSKU1WA5k3gnpQfyl6KRdMcD9P2L8ZaOMmIDxgayKSZ
	hjYjLnccHkfjXusOGMuOcyTRGMOKzq68FAJh19B85Elt5kV+6zpeCveNEGve4OsqNwleCaKBuKU
	cd/da5FdVcvIDibF8Q9IFW5lvSd49MsBACtG8ti8/WY95X0jgDrCRFxWoFTEdqAwc1g==
X-Gm-Gg: ASbGncuDo4bqvPM5o/jSxJdh+esPmGNqjG8pClOkWFz0j/5RnyWisYrxnVsK+iWxu5a
	WrF0tVGZaN55Gx9akKdFou0WhsVMUhX89+8uF7FKIxwVhHQ8ZGrvE2/9QM6yUK1FJ3zQ3bxikuT
	ufhfPWHxC9QbT9Eaytr99jTz41IHW3V5ibRede7IovB8J5gP0Yw3ePBryvAIv3ci7pdnJzLHmN/
	47akR+3WV/UQwkiiV2BS7pSMstPBs74BVejAtG+gnnpznABnGP82d8Pj2Ay+zR2E3P+CbfEifKF
	/oHd9ooYy3phO/iBe3E=
X-Received: by 2002:a05:600c:c4ac:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-453659ba4d5mr32818475e9.23.1750439118385;
        Fri, 20 Jun 2025 10:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErRRYJ7yHniQTxZlTtcjXynaBaSE5vB7XTQS6ITom5OtykTCmLWDLCyce9A+anV5QdRiHhQg==
X-Received: by 2002:a05:600c:c4ac:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-453659ba4d5mr32817665e9.23.1750439117743;
        Fri, 20 Jun 2025 10:05:17 -0700 (PDT)
Received: from [127.0.0.1] ([185.23.110.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ef6edbesm62743115e9.20.2025.06.20.10.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:05:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 19:05:14 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v11_03/14=5D_dpll=3A?=
 =?US-ASCII?Q?_Add_basic_Microchip_ZL3073x_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com> <20250616201404.1412341-4-ivecera@redhat.com> <20250618095646.00004595@huawei.com> <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
Message-ID: <DD848DCC-23FE-448D-AA1E-22EE281E34F9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 19, 2025 1:43:38 PM GMT+02:00, Paolo Abeni <pabeni@redhat=2Ecom> w=
rote:
>On 6/18/25 10:56 AM, Jonathan Cameron wrote:
>> On Mon, 16 Jun 2025 22:13:53 +0200
>>> +static int zl3073x_spi_probe(struct spi_device *spi)
>>> +{
>>> +	struct device *dev =3D &spi->dev;
>>> +	struct zl3073x_dev *zldev;
>>> +
>>> +	zldev =3D zl3073x_devm_alloc(dev);
>>> +	if (IS_ERR(zldev))
>>> +		return PTR_ERR(zldev);
>>> +
>>> +	zldev->regmap =3D devm_regmap_init_spi(spi, &zl3073x_regmap_config);
>>> +	if (IS_ERR(zldev->regmap)) {
>>> +		dev_err_probe(dev, PTR_ERR(zldev->regmap),
>>> +			      "Failed to initialize regmap\n");
>>> +		return PTR_ERR(zldev->regmap);
>>=20
>> return dev_err_probe();
>> One of it's biggest advantages is that dev_err_probe() returns the
>> ret value passed in avoiding duplication like this and saving
>> a few lines of code each time=2E
>
>@Ivan: since patch 13 requires IMHO a fix, please also take care of the
>above in the next revision, thanks!
>
>Paolo
>
Hi Paolo=20
I will send the next series after vacation=2E=2E=2E
I'm now in mountains in Albania=2E
Will be back on 6/30

I=2E

