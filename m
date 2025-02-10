Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5ED2580E6;
	Mon, 10 Feb 2025 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204125; cv=none; b=ao/FyNnugvawrOPOgf3fMhOdysrKNOVvbza1JyEcRokq/FPyyqyPObiy49gn3lzedAVJ0xk/MbsMHl8TWTVLPytQUz5tXuU3BLnIxNSJE2PB9OcwVoUyP6TlKO0kdP1B8TRntRnm4/9gULYyQ43DCawebpS+01JW60XWZXTyv7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204125; c=relaxed/simple;
	bh=69oPoGXGO1/I3dl5SQjJ2SX+Qm/azEY2yPtT20J8Q5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aqmq93wE8fE94I3InnYvK53lcteTlhg4CpWrct6AzkLSOlGf1xl3NxzQM37JGGLGliK4m8JL1H0hkeMOJGEcbEKH/RKamTY0r+KdIhGF245YL6zmAg/TveJaf9kL36YWzQ7dY5k8woiHYok+L8RddZXYORXD2zNq3OrX8otGVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSU+FPc+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSU+FPc+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f53ad05a0so51326565ad.3;
        Mon, 10 Feb 2025 08:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739204123; x=1739808923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=exHh3iJCugwqvJ/AUZ9T75qWIXB0k7aBw1De0F+zoHg=;
        b=jSU+FPc+QRyG/AOO6+qJmEn+fDaL4JDLVxIIe67aHnaLyJlcW1EGs9kQIXn6lzQvK4
         Dn1boQNfOQ2pIFLG/9aSlXr0Iqd6eBND95ak2GrWaPHDILtTvx3xDt9Af3ZzpASJB0US
         yiF9Jia1fSDGFV74EoteZslWNprzhV+3UDH+RbQ1NBevIRAWEFbGEFGViqUlko+m2mF0
         P+xdR7RBvcXQTNYd8UFFVSEUs/qcNNsit+Kw8MsOWozurZ0Fka/UYABkfofTu6sR4rDi
         N7ou5i+LHRmeE5bkb/jnt1N7MVNaaVcVC9VqEXqQyPeVgmdVkj/Bn+Gfi/JSt0FbNQTD
         q1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204123; x=1739808923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exHh3iJCugwqvJ/AUZ9T75qWIXB0k7aBw1De0F+zoHg=;
        b=qwAgtrVJkgHN2dL2VDx0SRIhERSGRlTesZ4SngxDMlez9S0QW6rF+GW+a2qxCL66uS
         KJiARYqUmWrS2fPPk5bGez6G5vfvVQrz0GSu1qXluor5wWO+gq1hCkstps/9+AM2fIpK
         axGOlfAQxDrVGSA/6KfwPU4xxlP59HwOh4Hj/B4Z8ldKhFrj8DVgFYBu9EWsgvHH1udo
         e31A72QrY9mA/dSBXwBnbCbRrK7tDGXrHwJCSm63swJA99g9LF9fuJWQEYYfXvEnbVus
         xEHl3pD1X4T1mpB+sLp9xxrO1siUFDFZUxqzK47V3KHBw384yuvlKS4oNaASaacYijsV
         uhtA==
X-Forwarded-Encrypted: i=1; AJvYcCUdUr+Ba99hMsrranq0rMslnzH2XYy438ugxR0BgRkTMnO9Bc6XjK+9QDIZZFL2sY69X7AuR0iNdBTa2w==@vger.kernel.org, AJvYcCXMXLiAX+o9NQa6CdvErX2yornE7LodsViX51LZ8ulJpZS3sNf+aoObUVh5G6ECSJy0uvbnVEHCCOyzzEXh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/l9DrjFQ0t2gzONKuh0o1ogY864fJpq6Kfl3pcsr/rJoM8AT
	bA5Pay8t7rJPesvfdJP601z5rt2xiVdXW39m0eRQWrr7vRsuqmJT
X-Gm-Gg: ASbGncvJ/il0Eu8k/GbU9Ccx11voyEPC0t3mOZZzs4zg0VEfizeGbSMUsj9eCNzKRmw
	sAWZHubGrpZmZ2pHO9wLCUQ6wu+K9w0N9DhnpeL4hUl87wYKCBU2VzCC7l9NlEXYRBMH+XMhvTg
	vkupgHptP4WQSlFIkZX9xvdaqEk0NTifh0Gj/XZ/Lm/szEhEntHBXM+jOwykqKM1wL54skeZnN3
	o42qbK8FMDWGq0BXYGpe3y47E+pgwdTivLHr+pw/d042EOCnCCrJwmPmO4mg8FF64fqlIFA3wTl
	3LY9f3pcyz8s5VG9c54MC17lYEeUVN1gRi+TAplrkRkdWTptFMX3uQwXepfL5urk
X-Google-Smtp-Source: AGHT+IGrIpnmD1rjfVOcExkOXderHwH2tdrRDwDRFsgkMZfPT07QF2EVimiGqaQrOKeGpN+gjat1jQ==
X-Received: by 2002:a05:6a00:1884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73217f8cb8amr249995b3a.20.1739204122938;
        Mon, 10 Feb 2025 08:15:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73074779cfdsm4607880b3a.176.2025.02.10.08.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:15:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a7836a1d-4462-4f49-abd5-16aa22a19160@roeck-us.net>
Date: Mon, 10 Feb 2025 08:15:20 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: emc2305: Add device tree support for polarity
 and pwm output
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 viorel.suman@nxp.com
Cc: Florin Leotescu <florin.leotescu@nxp.com>
References: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
 <20250210073158.336522-3-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250210073158.336522-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/25 23:31, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The patch enhances emc2305 driver by adding support for configuring
> pwm output and polarity via Device Tree properties.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

You can not just add support for devictree attributes to a driver
without documenting it in a devicetree .yaml file and getting it approved
by devicetree maintainers.

Guenter

