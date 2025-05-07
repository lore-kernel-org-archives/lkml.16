Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E41DE2BA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746587449; cv=none; b=br/w4mW0BzBaZvVevVMHAUYTdSqXCupGMeRklgw23vHRDh8pdSpFVUB4TyVlrWPbKMML7mCPaAfKokvBvNnQleX7aSFmegTBoMi+aGCB4SJ7waQpDl2YtIsiIhlqRX7JnpFtSHPMRYtdynbNjDB5MTNMuKf5e2C7pDVC/Z5QfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746587449; c=relaxed/simple;
	bh=Gg21LHsk2DA/gAZ+3TgrOAdIP9cGG3SLUbHO658YwX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vf6Uj2seA9+Sw/mXghiK/r/xsFZuCkpo0HJcdvuWXamcouc4LN4tgnOVRlKvmnzYy+pgJ0ymIOjTkKHU4Xnyr002Hly3SbpuSTiCSko2rdXMLtaGTEP8dEOC4+96mU0JBY+Q3UjQOzRSyVK2xyyq7KVYO3fKZ7qrN0IZ4+oLhKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OY0lCZNq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OY0lCZNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746587445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDP5SJyu1HM2jy5Jk+I9deDo8NdSHT65dpnO1OhhUms=;
	b=OY0lCZNqH4gFdgWxhwePg1l3Il4NuSu9znjaUFUDW3BMv3sA918PVVT9eJjbOeNCNMvmQC
	L2HThMvpI/8cHu/p8yo9DWMOajlMkrg4zqBe22t2wzukl7dhz4QtJeS8JOEMDu3Rfn9MqQ
	Xhxs+TlEBY1zxrca0ery+K4dAqdKFN4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-y-7KwQbcMeeI1HwSkXyskg-1; Tue, 06 May 2025 23:10:40 -0400
X-MC-Unique: y-7KwQbcMeeI1HwSkXyskg-1
X-Mimecast-MFC-AGG-ID: y-7KwQbcMeeI1HwSkXyskg_1746587440
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3abea7e8so14698225ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 20:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746587440; x=1747192240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDP5SJyu1HM2jy5Jk+I9deDo8NdSHT65dpnO1OhhUms=;
        b=gWThVbCbnVeDihjUW09zyCFajC1GuMzhsjV7jQnrDeXLuQyPcWSOe2uwjrt+Lry3gD
         8mNvO2jMHaRjYOnFbVQZ+xE3Za52ho/9qY3gWm6wK+myXU0iT3lqYN9G1mLoz8AS3sFI
         GQGHG7vM2dDWUuetTKQ9HaYYWFmZDDChJrsPgbIqjhdaOG0YWRxmQyJY6n+tPsdvY7CG
         64zT+rA89gO0+OqXGEUA/lVvgr9mobfUsPWwhIynSIa3k8lyM0sOgsQg6ePeKONm1PY5
         244C5DZrywJwnlrBut5/00rNjSUKU6F6/mVUfyYNgESuiJykp1GeEUu8C8ITg6WlAg4j
         WbJw==
X-Forwarded-Encrypted: i=1; AJvYcCUhOwYcDDHNivk9VdrJvn1j9+hZHSJ4W1ABpAvcee1GNveGJWPeK0hAA9IoXugUpY/BZckcVRx9gl89IVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAd8JaY+Y5IFm9V3NVSQYv7zy4aWu01a1I4QZ0aLrgfYLHNyk
	9WFLR5z8lcHs2EURiWXc5o1Oz7rLKpG3aHmjBKcW+138+J1GgTIbuAzO/ga9CtMPe2JKGynR+Cv
	xLJFW/8K6/LGSMY/7ocNuqSmda5DZ3EV2hqPCNc5VSQOorzClFIo0AHE7B6yvpA==
X-Gm-Gg: ASbGncvB2SzQBUu6YsHjjmtQKqHMgTW01pyrYkgeD0M1UsP9Nv9WkgozHFWijfTcx5J
	2H+LGXLLmmzH5GdD2kxur0K2ZHfwYvx0hLK8vw14I5xOVJy0VnZ2Uo8tIqhYgcgDPvCLXIE9r64
	pd0WoZE/VhnZF7So5Kdo5p3+di+CcXZGnMr21MC795ANXVRJwXuCb52OCidbYQCvdPhBGkOb1cL
	Yywf0XhXjtDta9yLFnE6ytXRHw1jA9UTt7aafYdfsh4U2z3cS1xwrR7eZ4Z89kAHSX4OsM7PiSp
	bC8=
X-Received: by 2002:a17:902:f789:b0:224:1001:6787 with SMTP id d9443c01a7336-22e5ea2e466mr24846955ad.4.1746587439739;
        Tue, 06 May 2025 20:10:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0UfEi+55Sr/HmVL17k/pyRle1Z4csFmmJpk2KYXZvLlD0HVZ1oUcDI55EPbEuyt069E4aHg==
X-Received: by 2002:a17:902:f789:b0:224:1001:6787 with SMTP id d9443c01a7336-22e5ea2e466mr24846475ad.4.1746587439348;
        Tue, 06 May 2025 20:10:39 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e98d0sm82766195ad.80.2025.05.06.20.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 20:10:39 -0700 (PDT)
Date: Wed, 7 May 2025 11:05:27 +0800
From: Coiby Xu <coxu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v9 6/8] Revert "x86/mm: Remove unused __set_memory_prot()"
Message-ID: <idxxt5vwxx65n73rau2pr72bnw4nopyxi67otivqdzrlnt6tnn@7uygzqael66u>
References: <20250502011246.99238-1-coxu@redhat.com>
 <20250502011246.99238-7-coxu@redhat.com>
 <20250503234605.94d954b6ca70ea09c0aa8004@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250503234605.94d954b6ca70ea09c0aa8004@linux-foundation.org>

On Sat, May 03, 2025 at 11:46:05PM -0700, Andrew Morton wrote:
>On Fri,  2 May 2025 09:12:40 +0800 Coiby Xu <coxu@redhat.com> wrote:
>
>> This reverts commit 693bbf2a50447353c6a47961e6a7240a823ace02 as kdump
>> LUKS support (CONFIG_CRASH_DM_CRYPT) depends on __set_memory_prot.
>>
>
>x86_64 allmodconfig:
>
>In file included from drivers/gpu/drm/i915/gt/intel_ggtt.c:6:
>./arch/x86/include/asm/set_memory.h:40:57: error: unknown type name 'pgprot_t'
>   40 | int __set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);
>      |                                                         ^~~~~~~~
>
>I did this:
>
>
>From: Andrew Morton <akpm@linux-foundation.org>
>Subject: revert-x86-mm-remove-unused-__set_memory_prot-fix
>Date: Sat May  3 11:38:32 PM PDT 2025
>
>x86 set_memory.h needs pgtable_types.h for pgprot_t.  Obtain it via the
>higher-level pgtable.h.
>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Coiby Xu <coxu@redhat.com>
>Cc: "Daniel P. Berrange" <berrange@redhat.com>
>Cc: Dave Hansen <dave.hansen@intel.com>
>Cc: Dave Young <dyoung@redhat.com>
>Cc: Jan Pazdziora <jpazdziora@redhat.com>
>Cc: Liu Pingfan <kernelfans@gmail.com>
>Cc: Milan Broz <gmazyland@gmail.com>
>Cc: Ondrej Kozina <okozina@redhat.com>
>Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>---
>
> arch/x86/include/asm/set_memory.h |    1 +
> 1 file changed, 1 insertion(+)
>
>--- a/arch/x86/include/asm/set_memory.h~revert-x86-mm-remove-unused-__set_memory_prot-fix
>+++ a/arch/x86/include/asm/set_memory.h
>@@ -4,6 +4,7 @@
>
> #include <asm/page.h>
> #include <asm-generic/set_memory.h>
>+#include <asm/pgtable.h>
>
> #define set_memory_rox set_memory_rox
> int set_memory_rox(unsigned long addr, int numpages);
>_

Thanks for catching this issue and providing a clean fix! I'll make sure
future patches pass allmodconfig. And also thanks for pulling the patch
set into -mm tree!

-- 
Best regards,
Coiby

