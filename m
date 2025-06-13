Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E023C4F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845513; cv=none; b=MfHi/98YrlJm9OIHH0wWMh5OeZcREMsM6ClHd8YrkaR6h+88Itg8HXdJyRMGox79NHtSIBPpsqDbTZ6GEJLGub/gTKirZsLj/VU8qaMo4teMkwqy451vWdZCM4pBH+X+y7wUoYB1Sifv2vA4KNAjfQMAIxwu/bItdDY/9RE3his=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845513; c=relaxed/simple;
	bh=W87Z/HpxToGGkm2QWkvPkaACSn8wTCoH/hM+Wwmd+T4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q0x6XShw9Wcq0MJrP2lcvA1QJ944R7dCLbFFj+Mfg+DKgLfGdZ6cA5OaUmgiDY2qY9V6Qcqo0cLqxOBuLbhxamFrowhtdKn/WOZRIaCglN2tBQbmgCfJGTycpHrMI/LnbLZRCjVj3zWRuNxY2d7PoiD9V0JQqycYAzm2ZQMq79A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=svaf5b/m; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="svaf5b/m"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so462646066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845510; x=1750450310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZyPhDp3clF+2nAcuBvrsAf8X3aSjPmMQy6JJ8napoM=;
        b=svaf5b/mwGj4NuXdOHCqeU5F8+XIP2tEA83Zc+QEY4flCRGVbvX2Wk+Sb9kiPuoMU/
         NjNufawFQGhq/YMjrg9ANj/7CYSlQJ/aQam0iD2F0zMBBO63i2G7kFx0FAPLPxF6Ck6d
         wWlem3RZ0NSIr/AHCeSnjBM2xSY98ZMIkjLSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845510; x=1750450310;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZyPhDp3clF+2nAcuBvrsAf8X3aSjPmMQy6JJ8napoM=;
        b=jAJXjpzFLgooL+pleY8/yu2IZ9IBPMEUJXBHUrFhMfOaDoGjX3VPW+IgKtr9l4Niqm
         TKZDmEI6Rxg/fcxd999nxKGdz0+fktCJsf/TEh1xpnCZzOiRunCZsU/MxWprypzsFMYe
         b1xU3ougx299DGTcNBP8eB7nLTTFCjbUDX5PGnvwR2VdRbs4dilUGy0rT9DWBMeiykU0
         pG6C2orP9FGzj2PfSjg9tA6HQ6mUIwuVqe9uBfmCpqzmJlgwdwawZbSfQFnnPHu9AYMQ
         eR7RiWup4xJ80nt2UwiqzN3OVTdT7N9VMD0kvG3hVdmBVKc3ODYuhIb+fFiFnOWEsJ0C
         f6JA==
X-Gm-Message-State: AOJu0YzwV/oKENTNhG9xiH+tIOF0Aif+cPKsWT26b/vehx/mdJN4MhGA
	p3Go/R5vyH/dkzBbjbOdmJIec404ffO5ChZo4afjOLXTg1pcsATnNa6xu0BufgMjq+N/40Y+vgO
	2mCd0K+0=
X-Gm-Gg: ASbGncuLqHVka7yxGumh/CBQ/l35xN4CtfdCzJGWjX2S8I5DcTwKnUsw/sZo00wLldk
	J1PkPy2xwv1ld80pvN0RIZc1nyYyRZnzkKAmi6ftRQPy7IlntM4PMfXUiAZNIto7eSenICg6UwT
	hoGRUZavzAnqb4QGtKhpCNiYGBFZGyhzs3vIQkt3C9R/ksZWqRciEpTE8HyXvhaH7BUqzb0yNG7
	DIlnvHsa2ehzJ9+OgnsXiQRfTpZ+P6m7/ybYqVuqKAkbIS/HoUs6+IqWuajkXRUxwlu/tpk6mov
	ZRrqWKYQ8potA37aerN0QoZQfBPNG2wtr769rWX9CyfTc8RtGp/wWkOKwErqKmQymQ==
X-Google-Smtp-Source: AGHT+IEPRO9S3H+OVVnpMZsQTJUxr/PZCZ8mq86dBJISkt9MMHMssWxJk3y2H9thIDYzD1Iua45FeA==
X-Received: by 2002:a17:907:1c0c:b0:ade:3b16:faa9 with SMTP id a640c23a62f3a-adfad5c771bmr52408266b.29.1749845509990;
        Fri, 13 Jun 2025 13:11:49 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fed6esm178736366b.103.2025.06.13.13.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:11:49 -0700 (PDT)
Message-ID: <062402c3-e640-4578-b1b1-318a0a728a93@neon.tech>
Date: Fri, 13 Jun 2025 21:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/4] x86/mm: Handle alloc failure in phys_*_init()
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

During memory hotplug, allocation failures in phys_*_init() aren't
handled, which results in a null pointer dereference if they occur.

This patch depends on the previous patch ("x86/mm: Allow error returns
from phys_*_init()").

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
Changelog:
- v4: Split this patch out from the error handling changes
---
 arch/x86/mm/init_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index b18ab2dcc799..a585daa76d69 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -572,6 +572,8 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pte = alloc_low_page();
+		if (!pte)
+			return -ENOMEM;
 		paddr_last = phys_pte_init(pte, paddr, paddr_end, new_prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
@@ -664,6 +666,8 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pmd = alloc_low_page();
+		if (!pmd)
+			return -ENOMEM;
 		ret = phys_pmd_init(pmd, paddr, paddr_end,
 				    page_size_mask, prot, init);
 
@@ -726,6 +730,8 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pud = alloc_low_page();
+		if (!pud)
+			return -ENOMEM;
 		ret = phys_pud_init(pud, paddr, __pa(vaddr_end),
 				    page_size_mask, prot, init);
 
@@ -774,6 +780,8 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 		}
 
 		p4d = alloc_low_page();
+		if (!p4d)
+			return -ENOMEM;
 		ret = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
 				    page_size_mask, prot, init);
 
-- 
2.39.5

