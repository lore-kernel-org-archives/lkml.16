Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C96A935
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850535; cv=none; b=O5+i5DDlkaFZEhCUSfWJDy7yuhpv/vZ8bsTkSUyypJvFkTNKuLcZwrfnAGHUW1ROOmDxNadTPoe+npzZTR6B2oXkuxzGz2FMHihRf6Uk+bOOS9vUN+gqB/kTMnbjktePHeLxkIqJAMDXuyIqHhiC7u7hl6O/ygXXKtHAvC6Cm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850535; c=relaxed/simple;
	bh=tst8LNMMFDT11WQgOBgJHKA16AjK4S4lrg0QCndvF5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2OoPx2ALJLbnxYo/trU5XdxPT0o2OJpaOScgSYBT7CzlrY+6t9Jbt009jEYQrTWJDVCnzkAST6Yc34VmngsRdenPoglTANNR/WSa37zXkSQgFGAjxSzSKGYEBTIsnS0XRejkyrOh7SId8mIDSnFMCXaYdqSE86wdnWwNTsm1OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI64PYDI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI64PYDI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7369ce5d323so137576b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744850533; x=1745455333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3JzZW8Vec/M6PKHJMF8TNngqQQy5yNrBF4bogvL3NjQ=;
        b=KI64PYDIkYbdX9m5p6yz5lBOzEMpvy5CxV71A1XEv88RbC8bxuxDh5Z7rwWkyUXeLt
         ClczbZXCK4DypB/rIkQ2zhKet7CydVDU9Glscq2ZF88IjH30ja73vQGzjp6azCYNuypV
         zmKOvpKguZzT4DK78d60SAHKeHaRhVyndK+vOgi4EsekMqZAWJCFDduQ+w3jzFdHYEkC
         53po0k0V6ZD1car7obzn0BOrf3mRQCYhRTti29fqHsDsRtCu7l17ydXGCJ0bPvmHHDHi
         ORfR45iKHAejU5pdAm4W8yjjr2Sf5UVd0fpvJuo0qt5+nM7zcB7SncvgUncDvBpv4FsS
         5BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850533; x=1745455333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JzZW8Vec/M6PKHJMF8TNngqQQy5yNrBF4bogvL3NjQ=;
        b=wP/BWSW17J1XRtEId2txXlVGMTggRBeQIUnsupONvv0LA1fC3vZw1pUJ6X07Dp5Zsh
         FtIL3LOZwLGefdiCUS6dM9hNiHVuw9OT6fqHHbzMEi2xpE7nIm1SukBPaeOqtzozgvOL
         DbCLlvWt47kuL+QwFK9fiysxEuuGkaAmsYDMNeIX2DA3wbV7ilP8Hju+o6y8IKbHnv0u
         v9PHzbwshiywIdkVz6BTIfPCW+6lfTbnP3PkrhCq5NUusRKQDsdZNMC6+phbiynh8foF
         ZpqMuQ62Y8rW7F2z/WhlG0Ifjv6f2KC0qiofUYdWHBLodIZgLvkEA64WkH7FRA1OSbWq
         ByoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMiqYAoO4Xd1ycp+Haxq4JJBnd5dOjPsSQ/FPoczhQaA20Btymfdf9lrbOvuJ+wjajYKcZAS4kWvf0tZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsqaJy7aM1P04AuBBl+AP1y9XjNelOfEeao5U5Le0G0Akl6FTl
	MHX9EJBR8NesyZdGjLcqQtIOUKR2KUbrJKBeug/e2T4Y1KceL0AbbctVqg==
X-Gm-Gg: ASbGncvgWiO1uxVw+L8DgAPAlE7voiNxmzDgWuHT8sha6cp4Ttnhmzwxh6Tpm63TVgK
	+lRjF85ntpsraAGeHeeXOw3N2ZDLIITSxkvYI96FGZMEZhw0JUfq6o36tL2fttPIkmNdjiybQMO
	u1liuYLpdIbKZe97XZFsws8fX1qf7NOvLC7MLMTmFe3jbrpDGScNeYnFLZet6ZOmXpW7u55AGZw
	7t3ki4NqZZn0zUVNgO2TBSxK/Ub/UYEP44JpwpjJJEFiPOmivFbdi3od55vOJDfeQG9geNObrZJ
	wGSmmdT1u1p5S7HZCk5BMSiLtB4cpu+rch4g+JUS7Fj6ZuohHORc+h2HB7QXF35h3ve2hofYAVg
	W6pn2zu6uSPiIyg==
X-Google-Smtp-Source: AGHT+IGtl8krBpdNuNd64dWA6eV3pmtc+QqPmwzIy+wCqg8g43+fSIjlzpcUOWZlrbxD5ySNeSEAvg==
X-Received: by 2002:a05:6a00:3a06:b0:736:3fa8:cf7b with SMTP id d2e1a72fcca58-73c2671dbc2mr4679954b3a.13.1744850532709;
        Wed, 16 Apr 2025 17:42:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b22216855sm1888795a12.64.2025.04.16.17.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 17:42:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a589599f-e069-4aaf-aed6-5cc02b322f1f@roeck-us.net>
Date: Wed, 16 Apr 2025 17:42:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/Kconfig: Fix allyesconfig
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <20250416230559.2017012-1-linux@roeck-us.net>
 <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 17:03, Andrew Morton wrote:
> On Wed, 16 Apr 2025 16:05:59 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> 64-bit allyesconfig builds fail with
>>
>> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
>>
>> Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
>> testing") as the responsible commit. Reverting that patch does indeed
>> fix the problem. Further analysis shows that disabling SLUB_TINY enables
>> KASAN, and that KASAN is responsible for the image size increase.
>>
>> Solve the build problem by disabling KASAN for test builds.
>>
> 
> Excluding KASAN from COMPILE_TEST builds is regrettable.
> 
> Can we address this some other way?  One way might be to alter or
> disable the KERNEL_IMAGE_SIZE check if COMPILE_TEST?  That will be sad
> for anyone who tries to boot a COMPILE_TEST kernel, but who the heck
> does that?

As mentioned before, increasing KERNEL_IMAGE_SIZE did not help.
However, it turns out that this works:

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index ccdc45e5b759..647d4f47486d 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -468,8 +468,10 @@ SECTIONS
  /*
   * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
   */
+#ifndef CONFIG_COMPILE_TEST
  . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
            "kernel image bigger than KERNEL_IMAGE_SIZE");
+#endif

I'll send v3.

Guenter

