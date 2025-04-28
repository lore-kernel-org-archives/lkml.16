Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018984A3E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858604; cv=none; b=m58VmUpeqSqdiNFt4wxtsn8Fxel7lyb01AFRDuUjrfjOWJSx2SO4OkBHAPVaG1dPS765SzOMEXhQ6cMoJRjxz4hie0H15Gmpc4FFCoV8ucwAWdzOTa+i3wp0FCvLEpfg2UOXQsW5dMtITrAoMXnk4vnTo3gOIe0FAZptKYvv3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858604; c=relaxed/simple;
	bh=zD7sx+OuhL+WAheWmPauk2ahQJDp/HK74ySKXA17O3g=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l7++wZoCLraPkB5hBXIiT6tLrnQourw9t54OUpUYNF2+fKoADjNd5bxeSqqWasNAww4upkGLKfZCeLoEWp2hjgMQcbBcdOTQa/rBSFF0gzwpjuXtKcPKlnCQW0MERusLMvcJSq6F8KMDVAPjK7MHSosLbu/BODMWf2l4871AkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=K9W5vj48; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="K9W5vj48"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3313274f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1745858600; x=1746463400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ngL9FqKM7D7y0OuHdGq66gueiX0sm6vhAO6erZg3jDI=;
        b=K9W5vj48VfTh/SCd6hpO1BTMOr3F3YZqoHGvTxE2hbpP4kefLUIegwysfQxyTWixts
         Q6CTfw9iYeax2Fbo89V4V+j/fF7IWHnpBZzBKLJncy16Vl8hW79hmaR+KnjkbjL3FXgZ
         4/2R7wuFPi28QkCMnjyu7JsHAhsnWPruff1rgBpUYMSoqq6rsxxHTV+RvepTXUWh5BE8
         9qXcgjWbgz7l9cJlQGo1sWtiIRZ0hT5jxq589vqrrXr3PgziGTfdC9ROi09u1QMkoyb1
         u0TAaOqKbw6uwHG841Pmrbt23ZLsQ29lFce18Kse1K9xBYJeoHo6pLyvjVde+9xqIZXz
         oRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858600; x=1746463400;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngL9FqKM7D7y0OuHdGq66gueiX0sm6vhAO6erZg3jDI=;
        b=YK03i0ikVzdU5uxSmMrkBUQCHNMCKAAGhHuNWd/izftLucL5VL0y/UutJR69fuJcs0
         eVEBCVfcocJ2NqWSPsPi/B4xHnrXZOsz+5vZxh87tLPIuqsDg80VZs0aLFPTXM6KZK9w
         9ldn01rZCUi+KTC4Q0BJQU3t+PJ5pdwpW84GWJv6sGrMNjUfBfjyX8XubI3q5eLpZxOz
         byznqw3QfNzmxNkGpJSHad5e2eLcWc7pJGtGv51yB9ouS4aEkm730N3CIINtPiGZUKwo
         qx9amskRAiaBg1LMfAbhKSXy62O6YRpuuCTLjEaGWcsJzMsI+Dc8Uv1Pld+QxGE1zoBh
         zSUg==
X-Forwarded-Encrypted: i=1; AJvYcCXJqKG1BXM6QSplMb8wSre9X/QMpQvH8A47E9qc2LSdIW/P97RtqEjzKTf9n+kMiZHNtHov+yIf6PvY6bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGLGciTd9rVV6lusMvSNLthZCmqJ0fU0jl/lriUrvW38lGgH1
	2K+HrfsPWGKFy1N/xE1Y2isD+1AxXhDp4pwEPZdf23/P8d8P1BJfzYZEDtry2A==
X-Gm-Gg: ASbGncs89fQV3u1lanz5/DwqEoedda8WXUeGki43W4uOZtcbtb/1kJE/JAT18JusQG5
	Bor2wg59UQF6culIuOP7aNqynYGeqml6nnPso+hUx86/4RT0IAZ2ad/IEd8x/kP58OkqZ2yF8op
	znH3k8+9pi5bkyxd1gDLi0zdMle5wt2I/FTqgRMr7Kzq73rq5cgBjY7LH8pDJ8J1pZUivg0myTv
	k9G7virgmuJkiSg1LTUnlKl1zkwR3iUxOABajbJ/HslFrOI8GlTPsgoQnW+mttZtwE662lJqCfJ
	XEXFFWYy8oXl7JtcEzrQ/cAKHAFfYbo1aR8W5LBy+V4=
X-Google-Smtp-Source: AGHT+IGFjWI+lVIy6EA1Bqgdb51QjF8leLF2CGAMRsmOB2lGxbngUneKH6NHv056PQkZdlWc6qwEdQ==
X-Received: by 2002:adf:f78a:0:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-3a07aba1590mr6610525f8f.43.1745858600210;
        Mon, 28 Apr 2025 09:43:20 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm11763147f8f.94.2025.04.28.09.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:43:19 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <a0069d48-38b9-4bf0-979f-7051f8e906f4@jacekk.info>
Date: Mon, 28 Apr 2025 18:43:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: disregard NVM checksum on tgp
 when valid checksum mask is not set
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
 Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
 <20250424162444.GH3042781@horms.kernel.org>
 <879abd6b-d44b-5a3d-0df6-9de8d0b472a3@intel.com>
 <e6899d87-9ec4-42aa-9952-11653bc27092@jacekk.info>
 <0530ea8e-eb81-74cd-5056-4ee6db8feb9e@intel.com>
Content-Language: en-US
In-Reply-To: <0530ea8e-eb81-74cd-5056-4ee6db8feb9e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Anyway, I think that the commit message should be precise.
> How about this?
> 
> Starting from Tiger Lake, LAN NVM is locked for writes by SW, so the 
> driver cannot perform checksum validation and correction. This means 
> that all NVM images must leave the factory with correct checksum and 
> checksum valid bit set. Since Tiger Lake devices were the first to have 
> this lock, some systems in the field did not meet this requirement. 
> Therefore, for these transitional devices we skip checksum update and 
> verification, if the valid bit is not set.

Should I prepare v2 with this description?

-- 
Best regards,
   Jacek Kowalski

