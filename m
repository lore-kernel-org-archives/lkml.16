Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88735953;
	Mon, 12 May 2025 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067606; cv=none; b=Zw+U2WhFirGjsa9NRsEf6dNcZni5MK8HtPulvkPBMB53aKeU68ikNeAsgUinGZlRGYEm84+FAp61zqGog+6Wjg3PWNGwFu/8FNYzWa7fVXY/EJOc62IZIC0zGyt8RzZT7zsZSFkJDbQrgJA7PsrJ87FODkLe7fO91Ia73XXoZ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067606; c=relaxed/simple;
	bh=kUGQH80AVrhfyjYADjSapWJYo4WQT0Hfu6z+RAxTtrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV9EZxZJ103PXFcPqfDTMEGyeFejoRn+snjIoI/tjdcymTYOsfRHVyWNBasY74WeOypNBmgwzrDstSPYUafgNGDXkbye87a19dz/2iJTNlkVj801LRIflNn3XhrIcQhSBuZs6atThOKxpftMxd5C7o/h3sjl/iQVBw02Kh9k0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX3S+MH3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NX3S+MH3"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74019695377so3444183b3a.3;
        Mon, 12 May 2025 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747067603; x=1747672403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pxnN/Jo3ePwIGeY3IKNLYP76fzUcGfkSoLqkEqCf8o=;
        b=NX3S+MH3XSwG8zOE5Vz0zqFv2nmjoNwu0RKACt9s+Day83s6EezV0wlK3nBHSUtw7m
         1AwHBaWmSu7/X4zxpfTEQllqz86mJCGkUIgXNhaCLxtOLWRsRJEITrmPRhIO4xRgR/Iw
         HSSzclvwGFQdJTqrIgH1OIRl+O/PIzhaxDhdGcpw62iAY2Un0W/1s/S4/3AHLqKUSsib
         IpDd7lemaJZVMymR5CWTvj35oP7PcpABlTrKFBmQ0isyXjrBDOU0DRKtVQKmqBPiQcEd
         zurFl2mBvYFm9V4DZdGNk3j3jIw4mY/VEWJSBQGvSSh/yAgUKD/xA92ry1Ub4ANPYTqp
         Y2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067603; x=1747672403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pxnN/Jo3ePwIGeY3IKNLYP76fzUcGfkSoLqkEqCf8o=;
        b=C4FKePSMNmUSUkaSf6411mn86tHUl4WdFDSJ1FLqDaLusGBDvW2eZdjPrGOCrZVPdg
         SMmBaM2PMQ/N5viMz4kucp52j2fEMu4VsWHwYZrdcF3nKvV2kblXegnWpDjazA1CXsOZ
         B7UeaFN58ck2hhUWfbMgePU7lhhPIGMhN6yV8qLAKRWDny3SHvhWLo+sFsni8kRD0U2h
         EPVjKhKvTXAiLoo9ZykgMCsGIojdBa5BP36XyRbEU/QZ4fz2jc1ftHv6m2FkmRYD4tuN
         6VMJ9IUIW5PqdokjaxpSAd1yAYD22NBOLsU5FXoO63VBALvx0pd5GlvmwufvWvGRu01E
         tvQA==
X-Forwarded-Encrypted: i=1; AJvYcCX/HII7E6Y/ers2ywRavQop0n68gPehSdiwWaBIT5MUt6SsmpIXjjcEskOKNtIYyxDAN3TgzghtFxlVjaM1@vger.kernel.org, AJvYcCXxPA4ThXZTWr2w7Dt5+l0L34TmiUhtVatDwQnC2MQ/ywVGq7JKbiH8EmFmDAIq9fu5gYVzUkeWE1JHGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAF1XyKLd29lve9yVdwephxhxZyqf6W7juxvCArOTGuxhAo+x
	lxInA8tQzEkg/MLmrFlKueuCawj9VEbXAGkBqzNpUNoMGKCwUcG/M1z76g==
X-Gm-Gg: ASbGnctST9lWgk3IJ4vfrsw6J+8W8GGHXHQMGXdesJRyWJnMgQQ2aVn+J9VgJm3a8n5
	rkyUiUsecAOsEzNqYIQpeFzwjn3qAve/jEWfrD7+phw0ozY1C9g4ZF6Tnv9J4ssoXpKaQG+SEwA
	TZaQreiijo+6+fzObSvLHBClsYC1EaLDNkCU6lldDiML0n2DiYjK09pJWww6I+PA988QK6LShui
	3UzMBc6Jcz9EQKdKp9xExcO/NYAEEuz+QkMeiAFnWb/Vy3aYKBZ4irb7Z0uqG7tLaT/tjkB0Vcq
	gzkQcRyJiFhsjP48FC6MoLhWkHW+4+xIGEK4BWCJ+Rt/vbMHQe7g98sobs88vOQj
X-Google-Smtp-Source: AGHT+IFjmAbwrOYag+kN/+vzM6kABryvuUOjAjD0uCEns0APGqDfpk59xG8VsWfMDkyxKTG4QuVksA==
X-Received: by 2002:a05:6a20:149f:b0:215:df57:8fde with SMTP id adf61e73a8af0-215df579056mr2784370637.25.1747067603319;
        Mon, 12 May 2025 09:33:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a405b9sm6436426b3a.142.2025.05.12.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:33:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:33:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com, chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: Re: [PATCH v7 1/4] hwmon:(ina238)Add ina238_config to save
 configurations for different chips
Message-ID: <5b673485-7a70-450e-a766-acd7b3da2078@roeck-us.net>
References: <20250506053741.4837-1-wenliang202407@163.com>
 <20250506053741.4837-2-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506053741.4837-2-wenliang202407@163.com>

On Tue, May 06, 2025 at 01:37:38AM -0400, Wenliang Yan wrote:
> Add structure ina238_config to store proprietary properties for different
> chips to meet different chip adaptations
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>

Applied.

Thanks,
Guenter
