Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6823BF96
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183116; cv=none; b=rigKAb+1f06OxVl4g1ylpHWz2oM5tu6wyxCD2LQ1gjgDSSnTxARB1vZvBm7BrjO5PnJAm1pGN8yYyX4kAXcgjVtyQMwwzmYykGKvGlsV4+An/9IDUL/ojr6JPDu44H4G5VaLVZSiyOYqrv3Y70eMpmGyQ0RbR1U2wfklcp7zeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183116; c=relaxed/simple;
	bh=/Bg1W3vx5VqNBb4X9ISt+wzbx9RV1XwLd37krZ0v+/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIibGb4NuKqKQjhhSXwEpfmNEteCSxoqPRyO1X3D1NS/8t8ydOdU5TkTkOzpUEyDKVrdp1MQR8cS1P1EIx2fPgZTs9U7Bb4B2T+eSxv7VLmujZaSh5f0xa724l6ZK4Nj/apVDJWV5qYsvO3+bqNTzAcofC66Izi9HCqFqtn/VYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TAifApre; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TAifApre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746183113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pHoDrN/cn5NUfRY8+fhnaI8XRygteksiSbMuei/zJ8=;
	b=TAifAprebcDstuT1HqeOF2WOZ4SuwewKrGeB9S3BSlWy+ihhbTbz7w+xVXiP3XFBNp5X/E
	XZAQQ77h36L5udLK9HJ5H6Midq5HwUd8vpHQEbYoiFqAdYPgPCq88733Svar+QPvc3M/mj
	USdNMSD3O7hBkswntmz7Ba6mWQaXGAs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-jp0M8GHeOH2CCks8LM04bA-1; Fri, 02 May 2025 06:51:50 -0400
X-MC-Unique: jp0M8GHeOH2CCks8LM04bA-1
X-Mimecast-MFC-AGG-ID: jp0M8GHeOH2CCks8LM04bA_1746183109
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so7810195e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746183109; x=1746787909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pHoDrN/cn5NUfRY8+fhnaI8XRygteksiSbMuei/zJ8=;
        b=odIzozAUaly4Qj+sDTEYqz+fSuA6mVDAE8pv2uxTRLHVd4a1kw6eFsLpV85twPYSEL
         7g6guyPpuMPoediyMLY55KU4PWCSD/gpGXfs+D8WVe4mrYrIGXE90KtryKsx+YPdOf8g
         FZPdp+y4l9BcBGvbvcg2emN6j7s5RXVc6riCCG6M0Fl7z7oucyLIO12bny5BFipY9OLZ
         c+lPfI+z1aaPa0qDb15cIB+cJKe8oflXjwY90362WbIbEyj1mHgzZTcnuKrkL0OANQCS
         VoAM5+2AC2zY+j81++MRfTV+CXI5Mhtcrxhxjxggwi9N224O/fECL8WDr7+GPYENje43
         aLpw==
X-Forwarded-Encrypted: i=1; AJvYcCUWJDYxKrKGRM80VK0I/wCsRYzo4O/4zvbpqxdtn/VU19kD4+OyVYoSqNntjsu6nMMZ6ZJRYvUQvUWBt8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVwDIxfSG75YR1vFWBRQzdVc0wp8XrDtBKpNrdrDl7ikV7LIu
	dpThnzwt9j7HV5TT1q9yehNIlohmpFDt2gPPngFhREzL/pQPdGF2OG0Y6hCFG+hzteeJ3UjXjEl
	j25NmrzfEmxNobaZqvCRdaFPEq/jii/H9gyUfBV4ZuzcJds2jvsNgBENUatmDxw==
X-Gm-Gg: ASbGnctZilpb9Nm09PsGpHH45eIXfUKeV4rJ9WXDFPydRHIFgGePwjG1/+INPzYzauN
	iKmJzTaabnSXYkTYG23ECNThDOVXSLxGNNloA4wS6rwsTcLZJLrbemMV6G6TmFdzUhSYLpicLk/
	AP1WX4dUX/ZZ6dTNoejMi042TWfrBZ/y2tii1NqL15Q89ie4CjSnCHivL8xkAoSgkyZtTYae4YQ
	Da+kr06VWOH0wjIdic88opSZiSH+jf9XwKF2rKQono2jTRPHNumpnpUAeLWmWZiS9iwjTj7tNP5
	f3bczZI9p0ntUs75KnQ=
X-Received: by 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr49043895e9.9.1746183109576;
        Fri, 02 May 2025 03:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ji9b4/ZVgNefxRUhb/GlgmAOtjpg49JM7ialo/DRbM3k1g2bgLpI6NcCCmHH8X+ehawG3A==
X-Received: by 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr49043615e9.9.1746183109261;
        Fri, 02 May 2025 03:51:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af4546sm87615685e9.22.2025.05.02.03.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:51:48 -0700 (PDT)
Message-ID: <4e68ca40-85b8-4766-9040-edf677afd0f7@redhat.com>
Date: Fri, 2 May 2025 12:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: phy: marvell-88q2xxx: Enable temperature
 measurement in probe again
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
References: <20250429-marvell-88q2xxx-hwmon-enable-at-probe-v3-1-0351ccd9127e@gmail.com>
 <20250429200306.GE1969140@ragnatech.se>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250429200306.GE1969140@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/29/25 10:03 PM, Niklas Söderlund wrote:
>> @@ -765,6 +768,13 @@ static int mv88q2xxx_hwmon_probe(struct phy_device *phydev)
>>  	struct mv88q2xxx_priv *priv = phydev->priv;
>>  	struct device *dev = &phydev->mdio.dev;
>>  	struct device *hwmon;
>> +	int ret;
>> +
>> +	/* Enable temperature sense */
>> +	ret = phy_modify_mmd(phydev, MDIO_MMD_PCS, MDIO_MMD_PCS_MV_TEMP_SENSOR2,
>> +			     MDIO_MMD_PCS_MV_TEMP_SENSOR2_DIS_MASK, 0);
>> +	if (ret < 0)
>> +		return ret;
> 
> nit: I wonder if it make sens to create a helper function to enable the 
> sensor? My worry being this procedure growing in the future and only 
> being fixed in one location and not the other. It would also reduce code 
> duplication and could be stubbed to be compiled out with the existing 
> IS_ENABLED(CONFIG_HWMON) guard for other hwmon functions.
> 
> That being said I tested this with mv88q211x and the temp sensor and PHY 
> keeps working as expected.
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Since this is net-next material +1 for the helper.

Also AFAICS this is fixing a net-next regression, so it needs a fixes
tag, too.

Thanks,

Paolo

