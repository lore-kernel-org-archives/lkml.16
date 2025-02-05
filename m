Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993621D7985;
	Wed,  5 Feb 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748441; cv=none; b=B2BcfmXKE3iK6h+5LXY/VcFfh+ij3Ngtxd1yrQpel6K1ZtS5p/Eprgd76Q13XYhW0DlDRVPCyCC9b5oaPuGh2puJubmmJVPQkB1mJv4raBG1CAjAxb4pMYA76faLVTi4ZcbOcnRvNl+0b4ru/LUDUesFlOVrI49JKdSlcF7qehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748441; c=relaxed/simple;
	bh=qDM7Khu2FuRIVqpPSG7C0/6QrPWtphywMAO4rTe5szw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGfEnwUX24KlnDw5ACuzix/Q3I8JPja0V6jPBsnV7jp9vOlIdfoWPCgD2kpOkyopLWkqeWF0TFY5CI3KU1g8zPkafu9C9LNudDBZdARfjbt0Rfe2zQ1qN8vTINdlsGutxYlD/oZQdWbjr6Sb4uQThSHfP4gJYkIhwtLm03uby9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/t+9pR8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/t+9pR8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21effc750d2so28631315ad.3;
        Wed, 05 Feb 2025 01:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738748439; x=1739353239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNbzmIjyvLuPYAHPzzGu818yrvIvdE4ZiMGQe0p2pvo=;
        b=c/t+9pR8I1EkxTAvRVcQOwp6GdztVuEFsCUbuDMQJsYkyEKFwQ2fuLSHotgbz5KQBr
         wQhFjyh+w2F4uoQJ4oACHLRHR1dIRbmreotrIDHrbk25KK7NMbi26a+BSFQq08PldSGd
         gIUQGrIvtlHtycfbbqDUnboNXH/HsoG9C2f4yJbyavktvimoNuV3fD7sHyhld0rrC8hs
         mrrROS/w8pj/yZJnGPd6beNiiewsqlpI783l3po74ZxCIso7p0I4glqjgc82vDFzn3UV
         q9cQ8yO2/5RStnI1iTO9JF8MmrY8IuZoRcocouXzvw867zFyk3Ys3ljOQDTBXdxwPZFD
         0cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748439; x=1739353239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNbzmIjyvLuPYAHPzzGu818yrvIvdE4ZiMGQe0p2pvo=;
        b=DNZxA2ROk2swQm1AoGkbKco0IJxG9vKIFsw6WsigHYnEvbTA5Rydgp6MZR2hgklDrF
         QHnfi3gpXWQ60vv5LX4Zbuu7SmBuTztB3R+ON3rArzzgCf6QSVKbXDIiYsLKo+dteIJu
         SPtvNC1OCml0APTYU5VezgQpthoIIX9v4CDm37s34Y9nSBzzpfV0xLXnFPkTEJIoWD9V
         dYl3xDthj+mW7f7dkiTyKHwbGCOeYCKeLLOw/8Y/oRG0M/F53FXE49hVpCT4vfPCpHAZ
         JXfCfIznmNs2zpCa12EHDcCFenKS8TI9P5jeRo0T6CjVe+hlqaET0YK5r7jeSHMbglip
         1r6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYDo7vW72G2vEUQzlLOf+CuZPAleKwjFSgT+2RwTE0xwv4kgeNqGtLRsW8Ny/m1iDYESPdvzdxsJM=@vger.kernel.org, AJvYcCUsW/IWWnluFsprobj2OjvL4WRSjWCllUP+c7bzVAy6RkhIsiHrnkgPs2FEpaXJc27vFMg+MqlxlnLBIpm5@vger.kernel.org
X-Gm-Message-State: AOJu0YwrS4+F54mk8xKVKQ06JgXXJXaWTuh2a7xjhVKwR/2H0SakhvQU
	LRDuYW+V1YRZF6lR8FTEKYKvgn0jD+/S8xLF2T7DjiUN/CQWPS+c
X-Gm-Gg: ASbGncvD967UyUxobi+bihf58JqGICJ2/cgIYNkvRjeJGFZ84Nc1eUHege7dzRTe/va
	jx3Q4/0IKVd2KFPx4qIJXT5hJ4S0Vqatl/fjWyw2ydXNht7mFKODiBvTDtBlqQoKBsnzicwpCUM
	PH2NUCugiNJ4oYhnuQHIovGf21i8iM7XHvt09vTpHr8ysjvtz8g8k0+NnBqOzIeerhqNKPcfY9C
	M511ggqLXT90q00ViykuJWXLGpjl8gmeTIWT8daiUPgOjKzqWbiFLgNyD30Ok2TMXqq4OyZojAa
	jxMEXuqs0YLlxTJcYn9nSoiI2bGHCqQiGY59nPg41uXlA4f1/3KHoGDL19VMVQ==
X-Google-Smtp-Source: AGHT+IGVepeVcR2w++x+9BNvro2+B6Cb/41IXf3zUjSDyO6ESbtJqvykmg2BaKlmAB6SMj4cXRWEOw==
X-Received: by 2002:a17:902:cf12:b0:21f:134f:22ad with SMTP id d9443c01a7336-21f17eba99cmr40535235ad.38.1738748438750;
        Wed, 05 Feb 2025 01:40:38 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330462bsm109916355ad.204.2025.02.05.01.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:40:38 -0800 (PST)
Message-ID: <2f9b3ec8-4877-4df1-99a1-f5ab3488add5@gmail.com>
Date: Wed, 5 Feb 2025 18:40:31 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with
 Python 3.6
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
 <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
 <87r04dei1j.fsf@trenco.lwn.net>
 <4274a2f8-5ba5-45f3-80c5-2de54c44c06f@gmail.com>
 <20250205081501.160180bc@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250205081501.160180bc@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Mauro Carvalho Chehab wrote:
> Em Wed, 5 Feb 2025 11:37:52 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
[...]
>> I think rewording the summary to
>>
>>   "scripts/get_abi.py: make it backward-compatible with Python <3.11"
>>
>> would resolve Jon's confusion.
> 
> Sure, but IMO it is still valuable to say somewhere that the script
> was tested and it is known to work since Python 3.6.
> 

If you want "3.6" in the summary phrase, how about

  "scripts/get_abi.py: make it backward-compatible with Python <3.12 >=3.6"

?

        Thanks, Akira

