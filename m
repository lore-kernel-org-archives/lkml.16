Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6201553A3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465263; cv=none; b=u58tXLgd7H5B19Uy9J/ORxn7sSdS/kZWb50f6dAKu/XEmBanlGNNUVfXCQ+ftwjIGyDmR3UnsbRBgubNv8vZSCXZ7ludDECrL1GHqaoAnPsx+e0R9gkAfYOhe/Z1QjxaWsqzNo7sYs6bdTB2qd/cmxUMH58EUY0lSIS0PMeoLks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465263; c=relaxed/simple;
	bh=Bh1+6gf/hBbTDpZrYB4D+mAs+xgJRq1q9W1FcNyyXSM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Do2yG7Elt+1PGkWLqzVNIZDjGeOm/PBzUSNo/wCYh1l6zUNy86q3kcd66he2XVe9kT3PEMc6m6BC7BZgaNOpwHO1cFuoF2TWGCor/hCtblC8GWKo5Bc6M7GndxUK+CUYQfMYMp7mu7kFGyaEw8S2zeSdlU+Dl+37ReoFgYsJt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=NCUYai8f; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="NCUYai8f"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so4419042a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749465260; x=1750070060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kPFw96LcZwktws5xLzqqPvxWDw8Thkx4RgtuQnSXllU=;
        b=NCUYai8fxqUNzQg5OaNqtIRyyAIuLefmR+y77w2aNt/UM4tvYk0PXJdLyawfdNWiNT
         aa0xwW1HGvR5bOzDbUOhg555NoQ/VKql3YU2IXnjWGsbo9hTknKsTwHq2QIcK6R/2LXh
         wHa06ZHwrxQ4RTrPhqVn963L+opQgBaKqV5Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465260; x=1750070060;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPFw96LcZwktws5xLzqqPvxWDw8Thkx4RgtuQnSXllU=;
        b=M5EG7vedM75Qairm0kMFI6uw0llMqkRQwnZs6oE/tqFFJMkqWgKFWS27tvQ5OV39py
         Mjko6w7KXer/YcsasrTnXHyMERx/60tlb4UKjFyOI0b3UPp7SMty/MysnquxzqJPU0Fu
         w9aXsx9RAU+SrG0VsCgtBWKZ+5MG8D9QlUcFYOn3GcIYeVUk0cKaOwl+OBf36+iwJRyi
         JHTfjh01P16gmrKw8zkwzcRT2nJ/sugnEEW2A1kzaQ+CFgyjeQzf5jiujpGDFDEGBBjV
         ogV9ukc4WAQrkVQinMau2SJfAsXrhA+c9zksAy1LLyh1zI80x4DnYfVQaU1dhp0PKeLr
         BucA==
X-Gm-Message-State: AOJu0YwMh+9wm9elGKHOA4oF60FPiWhdEgNchsXn4l0YGBqNwqBsrG+q
	niXz1woa4yZi1yoNAn4lcB+yCf0PNkygz3WhFeNbKGjGpPhklZMiGJma9J+i7Jkuvo4WsOl7xre
	Ut2GEQB6xAQ==
X-Gm-Gg: ASbGncu3A5wEeTQFxLmQeKpJOpkQVRnuOBzVQJ+xh/xSpEcJ4YsqOQ5VpaI8ucgJG5k
	2J6wJr6sy2jX8h6Xi/M7byAdywcHK5qxTf/ku+gK3ay8lU38ZKQ7XjqlpZv35dm/6HSml2DZtYE
	nv0hsKq58HBuQ1Y8odO720PufUEfvBHJ9ZSWnoMXliawPzrAtJ6ur2fS0698M+qWnW7oTmf8Xtn
	T2ean41JatueDLwdQCHWPpHFq/EL7hpMx4DMVZ63T7b2AbBDu2NiCuGFCQ12QXLH3GzNwdyWlHE
	1cMnS8f6DXhmSWuEVv7EG1xPW/ikY9C0Qhnl1uTmQq6PexTp2k1hhJfpq4XugaHb8A==
X-Google-Smtp-Source: AGHT+IFl/hTMXfTGlX5BQe31tgUG2iMar2OR7eu8laWIXpp/pAXK65O+l/opJrf5bs7GemkIXNgwgA==
X-Received: by 2002:a05:6402:2551:b0:607:116e:108d with SMTP id 4fb4d7f45d1cf-6077479d4b5mr9637962a12.21.1749465259634;
        Mon, 09 Jun 2025 03:34:19 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783701bdsm4477721a12.2.2025.06.09.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:34:19 -0700 (PDT)
Message-ID: <9386a5f6-e663-405b-9b28-dcfeffc83fb0@neon.tech>
Date: Mon, 9 Jun 2025 11:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] x86/mm: Use GFP_KERNEL for alloc_low_pages() after
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
References: <0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech>
Content-Language: en-US
In-Reply-To: <0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech>
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
---
 arch/x86/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 82dd5ce03dd6..bb5fe21f4794 100644
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
