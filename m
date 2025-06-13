Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354C2343B6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845561; cv=none; b=fd/RcctUxzEAMOpc8yOet2Boqnov65Ln0zeHFi0kr/u3GGJFM8ArHriqWFOLfkgjefDluxlC0qLj1ohGN4Q+FZvtfWg7Ua+zkGDBGhluZvT8BsYja0TJOi4Y0/cikulkefFRShIqkYOAJgmpvw2Il1PCqWcVrMg9kW+PTd6924w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845561; c=relaxed/simple;
	bh=iyGFDId6gNGGAgQ3Tspa6TixUr1kWvUB+RXOYO05TZE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SyZYbceamqbSj0XbYp5+zwjMCo+DlywaUECOQJpACXCuftszN8f3EoDoJgZ12un2QD833Pu3eXruxWHO1wF/bTwMgPgftEdaLk9i8iDGN/AQViMnnDYrHxSVzoqk/9b9c8x0IxPZQiqohGtW5uqgzsAavtTIBdLIjOQ3mrCefsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=OIgDRmNG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="OIgDRmNG"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so4175939a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845558; x=1750450358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NweKF8SVH3injbfSiS2fNVqMZQ6C6K10QpkWTAAVIKo=;
        b=OIgDRmNGeKzw/3vBMT+6UjAK1VTHfoRvaT5mpKXyfe5ocdDMkLOMXV/MJHelMhGeUG
         AuBUUUMRWGtZdgLafMcwDjajuMtTcagxyk0F8dPFFNG9aCX4I759BLk2HdIWx6GJl2Xw
         koijXseWKn64X3y75S2epVvU6ulVeEjQVfQW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845558; x=1750450358;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NweKF8SVH3injbfSiS2fNVqMZQ6C6K10QpkWTAAVIKo=;
        b=lbnWx8JvnRd9BNCt833ZhEpxKIqvj/ZNH898R3ut9iROO+8QtgHRdJqGE/gJncjrsC
         Xw3KPwwgPpHdRBabCBsRcL2lNQjbpcCW0UT+LWvVRnn7xtWym+AJCrI9fojt78Q1sVPu
         Jg7MpXIX3jI7uu9RnVjYIKdCpHRLzIXBTJ0Fjj9bKmt8lU4xvp1l4XGrVv6s7JhfqQC4
         ydgu6JU974jH5zmg1QTkzNUI3iaD7op81Lan1wHrKqAeWOP9xeDwyAjgd8v/WSxswPx9
         uJC/QNklDg8LPssoORzdV1pcyudVexq2KQpaV1Tb3CKvgt+kP3SGbTHrMl0XM5MBhveV
         2N8A==
X-Gm-Message-State: AOJu0YypeBkge9EG17qyezJXY5iUR/NFJeQVu7w2bXgyYuIMTPL5mn4Z
	vybO5T4oaujhNQzB9L6sDip63blBjENle14v2XwxazWVdZM2YBTmZCLot1381NssbrXyXVCoDfU
	MD6bOoYc=
X-Gm-Gg: ASbGncvZetVtCpfa/MVy/FluTYZfkou/BVVGHs6hu6l7KzCSX8Tp0a51go26s+dQKI3
	Z56+Ziu3tm6of4oYaMLdBztY6dvQmed4KdTCtRQNPFu3Z0Tuf8k+bF5JwUuG0qek3DpJLFqIxu+
	WIalEy09LDWbU7eJlEO7ZA1tYeZ+fXijzyVEhiq5yMmD312gKb8Go5/aax7f3rjQz+ahV/hQ5jt
	b5GEz/wRmNtHlEdWowNvV16PNBuDRSxfs0+u1BKKuNGHeVHS5cbCY4oRP/2cg8g8ZKgEbfMBdcj
	K0jr8LD+pRtY/aA/nWynwc7QfdX/XS5IGLPfm0axi1unuqJ8x9rycvHFbHZilPQhBA==
X-Google-Smtp-Source: AGHT+IHZOIdE98Xx/meIwe4RQMdXHRB+vSVgcGbiS6IiDa0l13qNjjNb8DTbd8V27rMfCiXEpAIELg==
X-Received: by 2002:a05:6402:d0b:b0:607:3344:6ef1 with SMTP id 4fb4d7f45d1cf-608d0979c1emr379552a12.29.1749845557982;
        Fri, 13 Jun 2025 13:12:37 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48a8bf8sm1640985a12.11.2025.06.13.13.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:12:37 -0700 (PDT)
Message-ID: <a7a5d7e9-76cf-4b3f-ad31-19f8a239ee53@neon.tech>
Date: Fri, 13 Jun 2025 21:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/4] x86/mm: Use GFP_KERNEL for alloc_low_pages() after
 boot
From: Em Sharnoff <sharnoff@neon.tech>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech>
Content-Language: en-US
In-Reply-To: <7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently it's GFP_ATOMIC. GFP_KERNEL seems more correct.

From Ingo M. [1]

> There's no real reason why it should be GFP_ATOMIC AFAICS, other than
> some historic inertia that nobody bothered to fix.

and previously Mike R. [2]

> The few callers that effectively use page allocator for the direct map
> updates are gart_iommu_init() and memory hotplug. Neither of them
> happen in an atomic context so there is no reason to use GFP_ATOMIC
> for these allocations.
>
> Replace GFP_ATOMIC with GFP_KERNEL to avoid using atomic reserves for
> allocations that do not require that.

[1]: https://lore.kernel.org/all/aEE6_S2a-1tk1dtI@gmail.com/
[2]: https://lore.kernel.org/all/20211111110241.25968-5-rppt@kernel.org/

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
Changelog:
- v2: Add this patch
- v3: No changes
- v4: No changes
---
 arch/x86/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 1dc8fbd8cb63..80eddcef992b 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -131,7 +131,7 @@ __ref void *alloc_low_pages(unsigned int num)
 		unsigned int order;
 
 		order = get_order((unsigned long)num << PAGE_SHIFT);
-		return (void *)__get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
+		return (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
 	}
 
 	if ((pgt_buf_end + num) > pgt_buf_top || !can_use_brk_pgt) {
-- 
2.39.5

