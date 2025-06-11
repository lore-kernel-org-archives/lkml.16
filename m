Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567D23D290
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631098; cv=none; b=sU6DEQNAs753hiaUwBQLhpyiJPTk2WgQ7Pf2QKse6rebm5wRmRXFMfL7X+EtffmUOpObxnPR3H8hpL8RnQOvATYhDTs9YRXKjh8NqMncq+TmPBq1l60Xv0sWxOOro5H/vyVhkUMj9CniNTy5a7HPof1ZUyVO5AK9rVMz964UKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631098; c=relaxed/simple;
	bh=D64AGcRCPHcvDx1jfHJpg23zObBF7fp6mUeiKWe/Mks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtKBGhf7nOzu4JImhjJQvyRnO1Sdx4aqRU9UAkWehNCO/GBF+lzSlb/IDBIzcjjnly1tVRFWWCoxE8JF2oif5LTeHQxjoCY1QsQXyuid52Y4qBH7u7qMR5nIw5K4k22gqIXgQvTQBh6umwrg0Ce3CGVTGM4OD4Xm3FjkDRn0ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=Sat4IauE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="Sat4IauE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8243598a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749631094; x=1750235894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D64AGcRCPHcvDx1jfHJpg23zObBF7fp6mUeiKWe/Mks=;
        b=Sat4IauEHIGcvOQ/V072BWy809Jxi2Zrk7HbVWNFZHYkyVhm2AcO/E3o7+VCp6kg4z
         RVJHeDUOGoek86UqRnBKblcjiFOtR3UKsD2Tgg5Fde7OlfiF8N7AY7z9lWCrvB4UfHYY
         532EXdXT1GeJYnbuGNROahPPqGhgukecGY/9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631094; x=1750235894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D64AGcRCPHcvDx1jfHJpg23zObBF7fp6mUeiKWe/Mks=;
        b=DX10tRcrU6xRy6dpRX4ju5pWs4kj3f26u/kKxriSud4+qdXpQpi4NzwBkEFEWEFBEE
         /pVHHelwpCVzf+mBs5V1Ksc+UE6Qq+3cFwdAWlM9Cs9JkHfDsODd8ARRMe/XlfcPRMXs
         defddEQRWSTQw/CCarfPSPaLVm5honqkvnkq/lRK+Uyd+c7PcX/1tuD5Zvr1sueykH85
         1X+q7LEI6ofAF3bFt4Jgl/iHA3ONWRCc//71Syu5KWClPhOe1K67z1BiqtX+Ck75d/4j
         2kyycQEKhtQxA+t7zn+Tjsgy6+BC7zHtWAjoPvyznDW64wjTBGOQ0u2tPclV0o38d6Or
         Vtdg==
X-Forwarded-Encrypted: i=1; AJvYcCVPvs+LYyXP8rF2Rl94Gr+5gKArHDyiEJ3yTl9lNLx4UV+KlqpNYKwK2AqXGWT7NddvTeMYe27FLjwQnwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqeybBfrwtOWkh3sNGsOuAq1DjF5F842J/okLH0CF4egBWlvL
	qAS4U2DzjQWT98owORalUF5OIHTKi43SXmgEjVzq1aev+eVsNH9VMDA8MoBKZn9e9ATRsfhopjy
	EKPLOr9Yf0w==
X-Gm-Gg: ASbGncvc5UsHSP4ZcPvKaOoJ3FksPug8nmhIrXF6Dse2gDrctc/6bddcFycstGdxGFA
	wx+uJT3/AfZPZ3757/pzOUXkYUE7ZdJWrk7/EGtlJRTmnYlKzFDVofUfZiINb91bMrUUTIdPrQj
	r1Mz+iT6sOHkuU1oxEF7XBc1a6IpUBW9ybzz5WMcSnBBDtJ5BLQ+fZgghOkdJhN0plI5UqC7RH/
	b6F2hvnmpEFEy5uvCgqGQPonP6L6nwuvE1EyZ9KRZh2iqPwCzwU09AVedh9PVcPCgPrP5lHcVgl
	UIvgbAdZU/Dk9bIimjec2Rtjy08gNAlEkRzGVpn5ngxYKHzlCZOQ57zxH/DfGJxgTQ==
X-Google-Smtp-Source: AGHT+IHfpgxq/IKP0ThT1N5OnbuDnVWyZUPwXmhwvUMbpRGv4tnTD5aJBQbcBrn4Pnd25O2AoX5W1g==
X-Received: by 2002:a05:6402:382:b0:608:523c:1365 with SMTP id 4fb4d7f45d1cf-608523c1401mr864164a12.29.1749631093581;
        Wed, 11 Jun 2025 01:38:13 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778377a38sm7268698a12.27.2025.06.11.01.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 01:38:13 -0700 (PDT)
Message-ID: <2080ec7c-8dc8-4f03-bd96-78ba47e55a97@neon.tech>
Date: Wed, 11 Jun 2025 09:38:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
 <a404d023-e0bb-4dc8-8952-accba299ab50@neon.tech>
 <22cd0fa8-d14d-4d37-a6a1-5e6827d6182b@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <22cd0fa8-d14d-4d37-a6a1-5e6827d6182b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 15:55, Dave Hansen wrote:

> Are there any _actual_ users of 'paddr_last'? I see a lot of setting it
> and passing it around, but I _think_ this is the only place it actually
> gets used. Here, the fact that it's an address doesn't even matter.

I checked and didn't find any other users, but I'm happy to give others a
chance to correct me in case I missed something.

> Could you please find a way to reduce the number of casts?

What do you think about changing the return for these functions to just 'int'
for errors?
It's a larger change (especially if all callers should be updated to check the
return value), but I think much cleaner in the end.

> Please write everything in imperative voice. No "we's", please.

Noted, thanks - will address in the next version.

Em
