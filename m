Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB9283121
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550661; cv=none; b=qqleNAkHKyoSGnSBUBVi94PPw9wl+qtB2ebfHxiVu3siKZpa0KBFQYnunZdKCh5fGyUvshwnMs5IO90MCZ5034430ccVXuQxsmpy9w1IoKW+hjREwXM2BhXkKRvFGHeI0rkg/uGb2o1evNCCLTj8MPip9nclVcKDOryWK4m0B8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550661; c=relaxed/simple;
	bh=dDDNfBinN8PAMwqLA5OJNpKoERFQz6yp9KWAM79txZU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dw/sRilwA5taSUIU2N/ohUhoXZVCilCV9z9xG/x5DZKy7IUM50Pko/PwMYFAMDUf/tBepidj0eamXc/w7dzELGjAq7uZRJclu8K9mZuWOdgFBexmEUP/jgXGCU0GfrM2DnRCetR6ml7Y+9xkGoS/dqtk6GSOzFbr5tlhcdXmgBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=gsK4CrBa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="gsK4CrBa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so4723547a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749550658; x=1750155458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MdXAoe13GikYW3/JVVfkOpgxOfq/BMWnCOBM8bUopok=;
        b=gsK4CrBaOwxFmvjJ+xZF/fT7RoXxPU+8x+RC9s+ZtzL+6afaq/CLYSreaJJ6topzXX
         dzl8Kh6F24CwJJbMNZBAdoXr5Kzu5pocHspsg2cdjVH5+j/zkzlDV1jvOL6gR3M9D+bn
         ECaT27Y8nrVhN+zL+c+cPiGsL2EH/Du5ofn3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550658; x=1750155458;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdXAoe13GikYW3/JVVfkOpgxOfq/BMWnCOBM8bUopok=;
        b=prOsavK8rR3qxFQRmJjRje80GDkpQTxXa+1eTX1vS7ptIHb+9dgFk3lZnzYh2p1vFt
         tdBpaxagmUHX9LGavIVqIUonqFk7kNkGG2mXOZYDbpLSW+sfJ7pt1/Oh/zJKYlGBCRwj
         pz+SKz+f7Z4/NeTdJq61uUhb53JpFhvt/kqGTafTSfojD3b2EUZUTEO8QIM181lh8CZ7
         xC6qsavMIIX5cts93aOg12zaE7oTXaTRxA3Rrm3d9RCw3xia8DnH0vVXJ/RLkRqyXKsp
         g0wv2yx52e3rwrFtCPOKXEHbo+l1kLw523CMMTIzOugu6ykEoppI7v8dGIkFjdPGEw+4
         vZWg==
X-Gm-Message-State: AOJu0YwKU85YR7gVEoJG6A0jJJ6RXZjnBjI3cqsOo0Hj7ldXA/tg8qJb
	4vdCBv6w8vp7q8cyj2OCDtXfCtNny8i8Zm8Slwo5i06FkPHmBMDE9rAfLNYoUFvKM9opyYzetMN
	3SzBqdFbGkw==
X-Gm-Gg: ASbGncuJTT/pTaWBFfjwJvLhcKTQUAD4yP1d3FswaUfdVm4VABbBCG7ceKRBv9dNC3T
	SLN4jVbsu4XQ/0XrgYmOUyUlP/w5mBkFY/bqT5HfGRJcL9Wu1zok1ZUtlB6dG0w0h4D7wqHDFk2
	rk4hievHp1483f66n8t1JaXfKlUl4XD5EB1xCf4LHJ5RY7NJN0S5Ad3jK1OjKs0qDu52oeRh5y4
	9jnnax/JwTgspUTXboluXU8LHl6mdr4h/hxtT61Z1dhQvuE/0dmiWJ/2vEI4EeoP16r9aG7l92Q
	SyPrQVN4NeMPMd5VAPlsEysX+5bxW+/LHrznCIsWQ1MUkxQUyBhbYlnO2we4tmG73A==
X-Google-Smtp-Source: AGHT+IEBICJlJWbKgkwUwtxDPeNS/LZyZLquBPse/trluqTy6pSNdxV8h8W68MABHGTpCpR+5A/3gQ==
X-Received: by 2002:a05:6402:5249:b0:606:f37b:7ed1 with SMTP id 4fb4d7f45d1cf-607748987e0mr13057422a12.21.1749550658244;
        Tue, 10 Jun 2025 03:17:38 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077836fed7sm6043562a12.7.2025.06.10.03.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:17:37 -0700 (PDT)
Message-ID: <92894a9b-3088-4cf7-83bb-ea7382a35d82@neon.tech>
Date: Tue, 10 Jun 2025 11:17:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/2] x86/mm: Use GFP_KERNEL for alloc_low_pages() after
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
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
Content-Language: en-US
In-Reply-To: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
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
---
 arch/x86/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index a2665b6fe376..3a25cd9e9076 100644
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

