Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271D274FC0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641670; cv=none; b=Bex27YGsK2X0CRiTj38kJweH3eSZ0gtBg2+9mwSc3jIgDxJIiEW0xND2g1gxgyps1HXxRxJlZMkcQxbrSAGdldDP+idNhAh19rUAiUDgLH7MqfYRajlnHV52Je8dcMhwvzOvXhDAJhoj30k8K3GER9KYzLXIC0tveQpYQECTVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641670; c=relaxed/simple;
	bh=k2r9BjUJ2LgXFUkjt7ewqYNmIKp2+sMGSQhM7pBurx0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uB3JfDCmmUOABxXG/w2paN2Ial8s+b6ozG4Hju5ZirmbMx8IPZzKHYbbQgMkHop4Phf6sSN04gFK/HgV8HeUKTQBZky3kYkekmHl2koYB72BljXdK6mzKXLEX+U5+keUBUxIaZD1TR6agyPMfc3+GPBX5Qheoal2ReKMBlaCUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rqprf0xB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rqprf0xB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso22740705e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744641666; x=1745246466; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7uD5m79hm0JVI9zwd0XoSvV8MCK3GE0Uar2aLOQpAN4=;
        b=Rqprf0xB411BFA7mMvBW3ftbazd5uz6SUFe9GvhSN/s2fn7q9loefgODNLWfH4JwFu
         OIzGnhK3ooVP4fu6byvD4IiqjLPZdSySJL7rfE02tAPeKBd3KVpgtvDKGeEPZPhQQ9Rn
         XTmuCR8nT+RjfS9+Qb4mfc3lC86tUpS0u+NCJ2vxZZ4a3eLW/HBXr/OZvV1+xNneploz
         4nPh3lr+kObOPR8lxaEwxDBkt4X/V3rOScLq8C4kJcbZyocEugQkVn3yBymbynBCvyJO
         pT6GInrohfg+xO5ZVNaOC9ESaQsDEjfOHbSQF61duBgyCOEfctqV90HUFlpyt5AitJbM
         f3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641666; x=1745246466;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uD5m79hm0JVI9zwd0XoSvV8MCK3GE0Uar2aLOQpAN4=;
        b=bYyoJU00RwOTQVb8zzWNg1hrhvpmEWJK7J9pCrOJcB5t6A7o98Xbj1OfGPxGptqQzj
         pcA9tW4+nnqEhmeuLtxRrDireHaJDN2j+8KtQdC//LdiDF/tAmLkLC6x/rSScHo5II4O
         GKPQbfKSJR6P7InybVXTbAQsTYNBMDfVqW6eXoZQN4fI0xc30IvLB9I7JU/zSAiva+9e
         f+aivmUOhoEQUvoWcr8NN6iUfz2tDxNB9sAk7jDIO/msHDeqUMArJR/2km4VtNpahyGX
         wE+/MlHgDlneGweyJvXZs2yDHEh7qImrb8KY5kNi9+FcjT3BJRbXa5K1ZZ6c3HmWSs9U
         q4hg==
X-Forwarded-Encrypted: i=1; AJvYcCUKAHsv8UQDg0qWvjS+B6YYQrDBbvjL3fdWnigp20/JHDH6GCqd4AMYz/RKcBLgKT3+NxNMjzqKkYQ/Sas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWkKLXQtp3h/ryQ+Wn/yqKExPfKEpklLBYLBtp2TlVwhTPAxJj
	kiTxmOW8YZfAY3ydDqwzWGBpuDIYDnZ9mvYmrf7lkND8h18qtHK7SWHm6FDOfg==
X-Gm-Gg: ASbGnct0dL2AdxzFbHJcMTIf4R0/lbn4Rc8QSv0vIwqWa1V9HVCya1WULjnr37co8V3
	aiPYDp+5Z/82U9BapBND+zS8gztMUbPJElgmpRN3egtDFqv+/Yxa+x/tz1dC/hQKff3ubloBsbC
	EQZ9+CBHUsVQhwdnhzNMX8GEKNPp6lutOvTN7mNQoahSv9hkyM3OxoBj6MPzzUv5JOz5PFtsUN0
	EB/MRM9pnKt1CAMXFGpK6wIPy8OSuK/L/bc+XlSvBIVoJRd6d63np8KRtOPfEiou0Tg/tG3B38P
	kfajRUgUvJtVJZWGmmsqW4OkHIHTC+j8x8pWISCU1ZueT0m3BJu9kLZjPg99vdFpiDXEDJ2+019
	Fx7T3gCLYL207wIKVEQaFN9uLx4G3usNLEnTY
X-Google-Smtp-Source: AGHT+IFHqCXrR1DYecY1tcLErO4fdx0Uz79XxvZhty/Ri6lBqowh69d+xX2NU3vf+TVenMT0UeWHyg==
X-Received: by 2002:a05:600c:1c2a:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43f3a9258e5mr89939035e9.5.1744641665978;
        Mon, 14 Apr 2025 07:41:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5b08sm182374575e9.33.2025.04.14.07.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:41:05 -0700 (PDT)
Message-ID: <609d2c74-de13-4fae-ab1a-1ec44afb948d@suse.com>
Date: Mon, 14 Apr 2025 16:41:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] compiler: remove __ADDRESSABLE_ASM{_STR,}() again
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

__ADDRESSABLE_ASM_STR() is where the necessary stringification happens.
As long as "sym" doesn't contain any odd characters, no quoting is
required for its use with .quad / .long. In fact the quotation gets in
the way with gas 2.25; it's only from 2.26 onwards that quoted symbols
are half-way properly supported.

However, assembly being different from C anyway, drop
__ADDRESSABLE_ASM_STR() and its helper macro altogether. A simple
.global directive will suffice to get the symbol "declared", i.e. into
the symbol table. While there also stop open-coding STATIC_CALL_TRAMP()
and STATIC_CALL_KEY().

Fixes: 0ef8047b737d ("x86/static-call: provide a way to do very early static-call updates")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: stable@vger.kernel.org
---
v3: Re-base.
v2: Drop constructs instead of fixing them. Use STATIC_CALL_KEY().

--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -288,14 +288,6 @@ static inline void *offset_to_ptr(const
 #define __ADDRESSABLE(sym) \
 	___ADDRESSABLE(sym, __section(".discard.addressable"))
 
-#define __ADDRESSABLE_ASM(sym)						\
-	.pushsection .discard.addressable,"aw";				\
-	.align ARCH_SEL(8,4);						\
-	ARCH_SEL(.quad, .long) __stringify(sym);			\
-	.popsection;
-
-#define __ADDRESSABLE_ASM_STR(sym) __stringify(__ADDRESSABLE_ASM(sym))
-
 /*
  * This returns a constant expression while determining if an argument is
  * a constant expression, most importantly without evaluating the argument.
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -94,12 +94,13 @@ DECLARE_STATIC_CALL(xen_hypercall, xen_h
 #ifdef MODULE
 #define __ADDRESSABLE_xen_hypercall
 #else
-#define __ADDRESSABLE_xen_hypercall __ADDRESSABLE_ASM_STR(__SCK__xen_hypercall)
+#define __ADDRESSABLE_xen_hypercall \
+	__stringify(.global STATIC_CALL_KEY(xen_hypercall);)
 #endif
 
 #define __HYPERCALL					\
 	__ADDRESSABLE_xen_hypercall			\
-	"call __SCT__xen_hypercall"
+	__stringify(call STATIC_CALL_TRAMP(xen_hypercall))
 
 #define __HYPERCALL_ENTRY(x)	"a" (x)
 
