Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CE38DDB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634561; cv=none; b=EKeEzpC+G4JJ8Kb6oTKccOgrR302vA75dm8wnDqpXWm2jF1gLtPghNPqfC1aphlk5aOM55CqvXHTpbV7cb+c7BA/vY26T0FY38Tn8bHCU/hPsGJsC0ZJv1/sjZhPPh4/J5zJH4Bkx/90i64I0XYdaeBqUmDIndhpr55li6WJMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634561; c=relaxed/simple;
	bh=Ta9oBCAhubod8prwYsmUDErfCxhu2NU7MOvICvUcjz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQMSCSc5Pkf19/0TlAggBoLKOcab8l30byNIsi9tRYpaiADOkJW7MmULK/5fUbLd0fTOHqKJmPbMuCrJXB4UcYlxMRwU7j6Y/jgFqxPfr1Y9rxpZGLy2/28Xlzri0rjshtlRDXPRwwRl6Ncx0aXnkFbPS2ds7y4hNTQRDTjqYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQB5RYU/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQB5RYU/"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553e5df4511so34803e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751634555; x=1752239355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPT/Yn9IyO9lNhZMkeKSyj5/KPjAxsknNyMSqLYzrPY=;
        b=fQB5RYU/pPFT5i4+j6XDDUwhh9SYhvGtzEsY9K9aK1YNx0v1bkK7LcTEBpMldSpcHY
         Va0QxT6NTVf7oDEjDDF56hMvz9eNvhbetwgwUp58ynV35Urek8KuFzn7oadto3bj2gDx
         EfaR/CtQe5htWzOsIs1Q2X3DTmD+JHjC4zoAES5JyJjR6S8fM7uzOpUxdQ/9Sl1MKYv7
         JsweEUIEhFlB+hKoZ42CjccWRM6bgzm/JOvLXR0tIqNQVKR3y5UFiqi8YC5FSFz5CUKn
         MtfXE/KJkjzi87NZJ5LPT/bBOAGceSlvJSTUP+sYXFPNdsWc8z88oNrHXUlzxwG74RNf
         LWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634555; x=1752239355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPT/Yn9IyO9lNhZMkeKSyj5/KPjAxsknNyMSqLYzrPY=;
        b=QC6/GVNE5/tvL8aGhtRnozy49uElV2PoGjsmRysC6ZRULq4WKBIsY/1B26kHjowbGF
         pW0Zw5TZgicDxEEMnc/cEiTV7eb5mBZxFh0zgHB7pnMXBENAO1Wy5KUwMF/Ss48ezmj4
         jSs7A619GUY4EyTMLM3TvkIfmjhQpLYUoMcn9OHL/E7Or7hjCc/cI3s3nNXGW5XfnXsw
         Ac+n/XIzk+IKzIUqM/kS2FySmjUvy92CyeyT/eD0puU/EulqICzVhaC+du+oABViH0Wx
         cCbm32zawyEz0xgkohJqsVrsYCWyYe06pLE/EFcVyppDyy+CP0OLR9Ksh7qMND9SyaUz
         BPaA==
X-Forwarded-Encrypted: i=1; AJvYcCVkmtpkGaYkaX6wrbq3swHSj2+LQCEOZooqmkbZDjaBL+qXsqOpL/Uu/1udxdzsJqJnlhThTTR+/kEmj28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzCdOSusINhe9lZ0BdxkOlQlONrTH60bJtmYS7rkhJ/4VOfhlX
	ncArc4kI7IhLlTJb2sKueZ/LufL57vcEtyIPq91Oo2HHphtT1bxe9+YT
X-Gm-Gg: ASbGncvGP40RcqrfgGbJJRuG+27UGl7Vq5mLNWC/b8sK6LWGWYUPMdzKbtf9ylxawQW
	OFaahhZbBQ6MHtyEZavKAUZqbosQSmWGSYDFPifyFFiXVh7aW+NOp+rZTxtiBeFt0zWpX5DqPFn
	6OBNzecx6afsmueONoayBZiwXSp9FrvSJgzaCWgKzn7TfSZJXUexNOF+o14PKwvHNwTNwVGoEQ3
	GUEQ2SazJ+yjxtz4GKscAo0g8A/RRbDGElVbxoG81gjU77aGVMs1iLKpzVqnbxuBA8lc7CUoakT
	s2f9Zk/dRc8gllCHRGeWF5qXfQ2Idljhi5PSNTQA9Xu77BTBmbdQFtyAxkZ8Z2+C7bQ4mELBsL7
	bRXQ=
X-Google-Smtp-Source: AGHT+IHGkSf7b6gCzmikSMHbOGCPLDngVVQXuVASyhJ3m7+Ta9yHqoizqWxSIsu1KXw9T4avAiQtfA==
X-Received: by 2002:a05:6512:2247:b0:549:8c32:78ea with SMTP id 2adb3069b0e04-556f3db2bb9mr271494e87.7.1751634554993;
        Fri, 04 Jul 2025 06:09:14 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb14bsm246405e87.16.2025.07.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 06:09:13 -0700 (PDT)
Message-ID: <b32229f0-0702-4047-9e71-e3d6ed85f0bf@gmail.com>
Date: Fri, 4 Jul 2025 15:07:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kasan: remove kasan_find_vm_area() to prevent possible
 deadlock
To: Andrey Konovalov <andreyknvl@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 akpm@linux-foundation.org, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, byungchul@sk.com, max.byungchul.park@gmail.com,
 ysk@kzalloc.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20250703181018.580833-1-yeoreum.yun@arm.com>
 <CA+fCnZeL4KQJYg=yozG7Tr9JA=d+pMFHag_dkPUT=06khjz4xA@mail.gmail.com>
 <aGbSCG2B6464Lfz7@e129823.arm.com>
 <CA+fCnZfq570HfXpS1LLUVm0sHXW+rpkSOMLVzafZ2q_ogha47g@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CA+fCnZfq570HfXpS1LLUVm0sHXW+rpkSOMLVzafZ2q_ogha47g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/3/25 9:05 PM, Andrey Konovalov wrote:
> On Thu, Jul 3, 2025 at 8:55 PM Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>>
>> Hi Andrey,
>>
>>>>
>>>> find_vm_area() couldn't be called in atomic_context.
>>>> If find_vm_area() is called to reports vm area information,
>>>> kasan can trigger deadlock like:
>>>>
>>>> CPU0                                CPU1
>>>> vmalloc();
>>>>  alloc_vmap_area();
>>>>   spin_lock(&vn->busy.lock)
>>>>                                     spin_lock_bh(&some_lock);
>>>>    <interrupt occurs>
>>>>    <in softirq>
>>>>    spin_lock(&some_lock);
>>>>                                     <access invalid address>
>>>>                                     kasan_report();
>>>>                                      print_report();
>>>>                                       print_address_description();
>>>>                                        kasan_find_vm_area();
>>>>                                         find_vm_area();
>>>>                                          spin_lock(&vn->busy.lock) // deadlock!
>>>>
>>>> To prevent possible deadlock while kasan reports, remove kasan_find_vm_area().
>>>
>>> Can we keep it for when we are in_task()?
>>
>> We couldn't do. since when kasan_find_vm_area() is called,
>> the report_lock is grabbed with irq disabled.
>>
>> Please check discuss with Andrey Ryabinin:
>>   https://lore.kernel.org/all/4599f645-f79c-4cce-b686-494428bb9e2a@gmail.com/
> 
> That was about checking for !in_interrupt(), but I believe checking
> for in_task() is different? But I'm not an expert on these checks.

The problem is that CPU1 grabs '&vn->busy.lock' after the '&some_lock'. This could
happen both in task and in irq contexts, so the in_task() guard just won't change anything.



