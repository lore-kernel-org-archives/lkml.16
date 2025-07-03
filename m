Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C523BE;
	Thu,  3 Jul 2025 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511255; cv=none; b=frNbiavJ1ZTxOWsiHOZsnJQhWgXCxcIc8yT6B8WCehxOl7lBHl13SfmQDnk3K/RpmLcWVVeFuTxe9fvQMj9dwwVUarR9YvlUXDiZdllGMh+dvEFXSEy8IcIUQFmRirvnTs6bPBmM/auAcERFz7kt3ifiCn4LvnuI0eba2rqvz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511255; c=relaxed/simple;
	bh=VOBKR54EE5jCrpZGqJFlz8nauwn08Z16YfzFexX5IzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qyeu/lya69oJVChmAxkOJYhxSWQbzMgJPWaf3mJT1zWa6aYsjPZ5njnFpMtZXgpsVk8VYZ0nuD5OAcvdaJSiMgkGZF2k3bVmffcDej75mNQ5BFoHHj14j/cbI7jHpmrjC2EGSNo82TMqonPiTZal4Lr56MZQKxmXJJwQAByx9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET8WjewA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET8WjewA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ef62066eso96619725ad.3;
        Wed, 02 Jul 2025 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751511253; x=1752116053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtdBQdeRqVsi7ZLQSvKypf+nVKVbYCrdNH/yCetNeKg=;
        b=ET8WjewATZWEAWvLD4A0yxbfdo5qmoBAkWDu1Rtgg7Yi2jjOh6UK3XwcSZ0qW74rw2
         gTyCusz/kUBBr/FTLxt1kEQRX2lqiw16JanOCRSAkyCRBPjNWqSgRQvcaQ4mxNJ+drkL
         Y4PcLti6Mujs2HAvst3HiVEQ8t3YTUcSf9ExnFh/vS+9p04gGAWsFlS3U2+YSuPvm1VM
         XZRainYNyeaidMT28HGj1dhK7D/AsWKtwNHxgzcCXgdbvPadnyMgu+VdbEaJZmgk2Vnh
         bSUVzIIsE6CHFkTIYTOjNxAFXQc+T2WiSxRJCr61/xQW/l6UUN2qp7CO7MMhQsH6BTEF
         GcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751511253; x=1752116053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtdBQdeRqVsi7ZLQSvKypf+nVKVbYCrdNH/yCetNeKg=;
        b=lM6TLGV7P3hjftzpaAI9ifc8qONaPqn9Ebw0nDEDRR11NzT2ZfEjoQWYAx4uJE55bL
         4gAr1BactbSb5yeCSJrMdbJYFCU6HnEfwFONaLdvA4Gz6BD1kY/sPhzhUw3KkewJrIOR
         gxWoLfY0D1Gsq6J3m/3JAVgqjcwTMDTzk9mhlTzaA3GKCF7s8xk861kjNKyRJfx+JhEA
         pJmyFT/+2Sgsq+lgfBqiHGsNaNjSsVa8G0pIzZGeZJMYvqpJfi6zLlNvnxcozVA6TluU
         qqTvZE4/PK3Ehczb9sy15MhU2CBRe9JysKQiej4jklcMLjwBOMTb7IkdyMrup8Qj0ie6
         Jsxg==
X-Forwarded-Encrypted: i=1; AJvYcCU8LyKY4XcIlTBZbf7gkwM7BGxwPJlkEo5YRFUiwiXF+3tdEmdVgKQ605d0btE9ViEUxxYSdO3+LeU=@vger.kernel.org, AJvYcCWU1suU+mnhDpuoGokdglkSr/zwOV8WD9q/jkJq+F5YL9FQ7jIXpbaSsFjml7b3qpLqhvNHGAue0YL0eTU6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn0o1ilZzwwbjcee/++97Z9JDl+PIXJzwfI2jqwsytcf0thXpH
	vbXzvLRaNZHpSsDinfifxa3mEJ09ls9o3666atHYpedMDrBDVmIUhx1w
X-Gm-Gg: ASbGncv9dqsfpksurDzzg6PbWP5ZkICRQT0D3oQE05hCK1wt0y6xmZb0gEwjKiyy6B+
	YeKAC5yNFmL+t+0BvAVyCM6MgijKjKQZZzs9wuK9/ZWofkl81K+VG12N2l5KtTHrjsnwPEV+sOI
	/4XIw4c9Yx+OcvvvpD9HSSLvKIbS+ywVSQ0sipiVUzwQB3ojHcvXiadG2RbOJt5irtLPxI1hSJr
	6rlX+e1yKaOoJH3ay79stgdkeKTIjAZYh7TySSNs28ZBPVyUCUz9Zb2odZp3TWvNVLKjszbjupR
	o3EMw76jlKTbCoKll0ymhviSn5B9qUL7xLB2VUC7bH2xexf2LUf/YbLoOxuw5L6cFCuGFQ==
X-Google-Smtp-Source: AGHT+IFRJ49YIpr/b2Gv0vtGiodyLEBH8/c5aD1zMNAf5dwWMsJ5LYPcKAUmVV/H+VKfYucretlwpA==
X-Received: by 2002:a17:902:e5c2:b0:231:c792:205 with SMTP id d9443c01a7336-23c6e4e2a2fmr79267915ad.4.1751511252914;
        Wed, 02 Jul 2025 19:54:12 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21b2sm153163325ad.43.2025.07.02.19.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 19:54:12 -0700 (PDT)
Message-ID: <e5c2ead0-7f8e-44e6-9af7-8addf7b7d016@gmail.com>
Date: Thu, 3 Jul 2025 09:54:02 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Jonathan Corbet <corbet@lwn.net>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGXeyqygzKi2P-kP@archie.me> <87h5zum1ei.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87h5zum1ei.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 09:52, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
>>> +In State 2, we've added Grock after the list head::
>>> +
>>> +         .--------------------.
>>> +         v                    |
>>> +    .--------.     .-------.  |
>>> +    | clowns |---->| Grock |--'
>>> +    '--------'     '-------'
>>
>> Looks like the corners are a bit imbalanced (single quotes are taller than
>> dots). What about using plus instead? Like:
>>
>> ---- >8 ----
>> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
>> index b0586056abb04d..bf92f44d7b2d06 100644
>> --- a/Documentation/core-api/list.rst
>> +++ b/Documentation/core-api/list.rst
>> @@ -148,11 +148,11 @@ clarity.
>>   
>>   In State 2, we've added Grock after the list head::
>>   
>> -         .--------------------.
>> +         +--------------------+
>>            v                    |
> 
> One might argue that it looks like a nice curve and should stay as-is.
> 
> This work is welcome and deserves a serious review, this wasn't it.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
