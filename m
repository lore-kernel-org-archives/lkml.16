Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F602D8DB0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632922; cv=none; b=nAJ97B5poYPZm4MXwI/VISsSKT71dCi70PX+iHgHiBbHo2ek5uJVTuRVIv4JD2u2j3gA5ynxYnunRP75kGCGta2+pU0ZVGb8sCjNVFDhYr9PyIzVtCIGiJh8Hpn86AOV9FjJe5FnHTC3EYBdVz3ke2ouWGJvyeJFROdlwv2Uu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632922; c=relaxed/simple;
	bh=kGtEV2cuH6b/oHVSRFuKI7/mizHhpicF4X8A2aYvW0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkDTF/05esRuzVo+xDTTXIxuE7uo5OkLRtrspZCBZPloJHGgyMOPkXdjegQso3cPTK+C8a0pQdzRelVn4jBQATJq+vYYIvcEZOzie4dfYR2fDh8dCxybpJyQgMl8mOCWg6p2zlkcu0bYRv+KzRndgTtr5OH39HwFCamml+nvgw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKb2WRwj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKb2WRwj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b4dc9be5eso1216301fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751632919; x=1752237719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd/Gd4g9iL4ksrRFBiW3o7hZmTHOxsax9CgkAVFFH9A=;
        b=hKb2WRwjQFezHEhlyd/0Einkuwu2JWJsSy73So2d2vBy5p6a248g4hh13N0vAdqYkC
         KWHzPQha4dsl5CNNsMHMU9karIqEe/Nh26+E3NLLdfUN2D4ZdigZ1VJozIB/W3SoaiVv
         vYLdjdFHVN+I/YhHXiyrzUhecfTqkx4jBF0o9q+Z+37WenSUoJV/elkjHG2t4OzOuRqO
         GSTfdn1m7kZMetcsgmMGlTtw3XZQkUmDeg37N3NGikD+iv0aZsqx02bR0whY1XxO1qxz
         51VdZH+TKI0k1QEFwmkhpEMTCfk7xvGN9urLfWG+VLviV0UAFwANPMJZSv9OqEpCRFjW
         gVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632919; x=1752237719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd/Gd4g9iL4ksrRFBiW3o7hZmTHOxsax9CgkAVFFH9A=;
        b=DE82nZ8SJTK2HmNxSLgpEqVW1e13lmX5YnU85M0VcOQ1WNzPDJeI96q0g4/ljdrQ8u
         6LpKpy/TVKOYUWOgJdGwoMcxxD1A/hu2+cd0Hd656OLWzlc1wibuCHz2nC655pz1j5Y6
         9k6l6u6x9y7wWIkJzy5Ya8p7nVKS7lQ3wda4wk7AHB9qMCkSphryySw4otpoLrAxtJm6
         uEMhEBXQVF+gzYWgxf59kGCsEMGHaWw/6hymkNBYo6JDvsFi0i6ArtMTIeIl5MjpH3M/
         wSeNw9amGFWDuVYT4HmnCde0LNZtHAjNjnCQ0aB3Na9d95tFWD387NaUtzd/C+NjHKo9
         lVOA==
X-Forwarded-Encrypted: i=1; AJvYcCWmoh5Lm6iSd6CzHC09htCLJQ14aPHD573nrczabNu3UVCwede2GNeTXwLMNbs+hFyfjsY7u9/W70mxg78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSuBXdiwLvMLwzHX2n5kLTOscqYDww2+4XxWi1L+FSeudoFHa
	gPQ9u2dT9iO0I0mQh2No6vrJCfDjA1bYXt5r78nA2ugurVux5+ADBgjy
X-Gm-Gg: ASbGncuSCktCz4s/zuVJwuxpLtJziOOfAUYgIKI7MAANk9cFQaEiORealgYp7voNgTY
	f1A2foPvjZIDYE5/ZpwRtKdiJaTpn7+EnN8tLYLSCPeBssZBH8FvOGT+YmzDoq4M81RvWFcDToU
	xLzX699ImOTqh68rctN7blYmugpIAUc6LfNJpQrHmci9hBV+T0lag7kjwWrqABPvAJ8B4FMpmrf
	JPE3nsjVsZJaRRNVjdZ48ikv/rHc/L7JsCUW/G4M1EAz1Jh9WpSVwkgpuQFDmIezS6JrM2ia3GP
	tXGVplaP+WSpK0CGl+Xw4VOiT+/DrB1Pryq5BG9EK6okDSje6HFkzdoNqmwunFw0V/TU
X-Google-Smtp-Source: AGHT+IFpR+kqHcRCowqKxD/zKWbNA1bImZ4/UaRb9kZ2c/jW1iKS5nfu++9PfLMSuf444Ocbqa70pQ==
X-Received: by 2002:a2e:bc14:0:b0:328:109e:f974 with SMTP id 38308e7fff4ca-32e5f5b7630mr2452791fa.10.1751632918553;
        Fri, 04 Jul 2025 05:41:58 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1afc362bsm2090351fa.36.2025.07.04.05.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:41:57 -0700 (PDT)
Message-ID: <37b96f5f-d79e-47bd-9616-b6c8905bc984@gmail.com>
Date: Fri, 4 Jul 2025 14:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kasan: remove kasan_find_vm_area() to prevent possible
 deadlock
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 akpm@linux-foundation.org, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, byungchul@sk.com, max.byungchul.park@gmail.com,
 ysk@kzalloc.com
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20250703181018.580833-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250703181018.580833-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/25 8:10 PM, Yeoreum Yun wrote:
> find_vm_area() couldn't be called in atomic_context.
> If find_vm_area() is called to reports vm area information,
> kasan can trigger deadlock like:
> 
> CPU0                                CPU1
> vmalloc();
>  alloc_vmap_area();
>   spin_lock(&vn->busy.lock)
>                                     spin_lock_bh(&some_lock);
>    <interrupt occurs>
>    <in softirq>
>    spin_lock(&some_lock);
>                                     <access invalid address>
>                                     kasan_report();
>                                      print_report();
>                                       print_address_description();
>                                        kasan_find_vm_area();
>                                         find_vm_area();
>                                          spin_lock(&vn->busy.lock) // deadlock!
> 
> To prevent possible deadlock while kasan reports, remove kasan_find_vm_area().
> 
> Fixes: c056a364e954 ("kasan: print virtual mapping info in reports")
> Reported-by: Yunseong Kim <ysk@kzalloc.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
