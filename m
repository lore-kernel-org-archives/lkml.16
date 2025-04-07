Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3F20967C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043271; cv=none; b=KKMpesvoWVrnRdDa6hphdXhXfuyLy4538VFJKN1CoZUHmO3ezivGgg7EtiIJoXkoy6imuVTSytx5B9P4DF3wI3tM61V9MSt1XMGm+OvEP9Upqh9Xq+HUXry87tB9dN78HAXpnEpTOnl9JJjP70InTzaCiK69qJ6l2wGSJNDAWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043271; c=relaxed/simple;
	bh=ixu4OFoJwzg1v+1wl51xk03lO5q8ieoco/QoCpn/be4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIQ0DvNnYYEKEcmn95ms8ist/F/xB3cK4lbHw9Ej3HTioSqXFUIXuvQ7QpUQsejPvtX8KOIjh6QL5D+csMn6x5wohH9qwdYYXfLGx8w//4INp649xeuH/0w6W/NNQvS01qfzFPyoUinN7keBHSusFUwfnBcMUORDXLEpBY6Hh1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CJjPujMh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CJjPujMh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so2626467f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744043267; x=1744648067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmt4HX/iSNiSTqkD3t3ALwtpmvWnuIuBQoVi+iO2Lmc=;
        b=CJjPujMhKpR8Ka2qInFujzInJVSRNAgpGLfDvBTxTRZtTXaVur3Y4xK68UyceaFHh7
         7pPcqYdXqsa3XhfsWV0/OCq8L0m2LkA13N9k2HWQ9jFAGeXSB3ShLkhRFB6HOSZxDa1N
         N3vu0K0ProzdEcBTfluMRCpfE2vYHJqpcrTdHD+QqbFa/H9bVk3kuPHNgRg7wysgFu/4
         y6vYEbehUyBMWDRBATOJszi25NbagcmcvmZvcbey2LB0VhWms1V8dCnMC8FWLkLR3ngM
         5UoAxTaM4V7MkSez7t41faMXV+SGO2jr+azrbjVPwet8CIgtQIsDNWfklXQ3PNVnnltN
         aSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043267; x=1744648067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmt4HX/iSNiSTqkD3t3ALwtpmvWnuIuBQoVi+iO2Lmc=;
        b=LFQJ4SVkztKxssxybpWgV5sWlHJs0wKBDSanzDHpUz8UksyVneC9p2hGkmrlCL7rID
         +cplhivPYWIzgqnuPoDjC98X83in354cMNTRDGWNnAzMbxjswfViurSe5ydCIlMYF3XF
         NDbMXegSXvFsS6oUo5REdyyo54bglifDwPAtofozd6GYztriWs2uUkdpC4C6IApGWgdF
         WjyHSVM0wH9Nn/Z5gTmusaoTsS6ltDoIkkbI9IC2Gpb/7LXcsPGeI75TkbQYZkKrkx8W
         z+DsFjUDwIdAcsrcVDDX0ebCxJ5arZglFHzI+7ll1QY465tkbRSN10cL6/jkP/pgdR1T
         L0bw==
X-Forwarded-Encrypted: i=1; AJvYcCVFLVCGo0uoCXpJPeAD6cg8EVAPZJuUPAmLJzrmTZAeq+QoEclr0RlMl1nbruEcsZgRHAOVlb3CBfCi710=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2gBQxw3OHXCgVqbJPXH/erqczOAlNiO7csfP5diMn4sILRK4
	rJxGcqk17hsyOnL3d+SN6prQ439xJq47T7/VVoLl3nj+nhWTKNTI5SL+o/tvNwoSjYNTG2N/9Ii
	uYSk=
X-Gm-Gg: ASbGncthkHxkLHLgzEIfBlUB/ZLZhI5ltvsJQU8nQ9/mSwLiYRSu67Efnuk/l3DUD7Y
	3OM1F6PM2+VBaJm0MMOKg0wfFpxNMOAjHyFI4otLd5hWxZFYWOq6MP/uKIezrIngNn4Xp0HYG8t
	sQiVpUaJ7DF3zNI5ZB7HJOv3EM2ANOLK+nyXQU4wYF7R4KHesIGQgfHmn7lMpt6t39uRkggl3ji
	kVWedZCvtNZYX+xe6KNt+g/n+1PDGgKCOpgqM5luAHqQ5OhcMvnKQBsNK1Gyu1TewPG8cc4uwbM
	hEjYK2HrDgm1SjEIkZqCuMrbmhafeW6IiTyOQSJtB4rjg+UI44Hug/eQOu6KC1Eqexgz1gRYpUe
	TjkbWGsD3Fk18k+HvLvGMlxXV3wI=
X-Google-Smtp-Source: AGHT+IG8J3er1iyXQBPMxITzMvfz9EFr3jDi7ygtRVXk9vTgIkpVU04qGBBpxMY6//a+NXkI/WoaMA==
X-Received: by 2002:a05:6000:1786:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39d6fc00d2dmr6036975f8f.2.1744043267049;
        Mon, 07 Apr 2025 09:27:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a92desm134263455e9.14.2025.04.07.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:27:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:27:44 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Message-ID: <Z_P9AEGq2sBYShgv@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-3-mitltlatltl@gmail.com>

On Mon, Apr 07, 2025 at 05:51:17PM +0800, Pengyu Luo wrote:
> Kinetic ktz8866, found in many android devices, nowadays, some oem use
> dual ktz8866 to support a larger panel and  higher brightness, original
> driver would only handle half backlight region on these devices,
> registering it twice is unreasonable, so adding the slave handler to
> support it.

Is there anything unique about KTZ8866 that allows it to be used like
this? I think it would be better to add support for secondary backlight
controllers into the backlight framework, rather than having to
implement driver specific hacks for every backlight controller that
appears in a primary/secondary configuration.

Also, the kernel seeks to avoid adding new instances of master/slave
terminology. See the coding style doc for suggested alternatives:
https://www.kernel.org/doc/html/latest/process/coding-style.html#naming


Daniel.
