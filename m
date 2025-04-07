Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D72116EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050841; cv=none; b=a/kbqNkiygTj0HxFYdArvIC92QqLBnu2EQZDFhkNsIf/8s/mG18WBGorh18f8VdJhvtXCydQMdwNShy+IO28jJb3PXW3pgra/QLMybqqc6wxmEW+rdYTX9pOnWWgCMRRnAHvUYa/E7YiEQBf11fzaC3NSQoxQuojBh8FMh4Qe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050841; c=relaxed/simple;
	bh=z/W2vvT43/AMNqZeflj2Jx6YCpGmGV1tBn+Hc9TCEZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuST1AKPRg12Lhr3Ts5g9tzyzj+x5h/w/7ZF0ApwWRJa0DDRqheWg3Eci3oTtsvdZkcqC0cmXCZK+hCoajV1SMiSH7BchIroRJdtnXBi27uvvuYxRQsLNxHqd5fxs4Icr6QCHgHWQksngmUS6AN12Mf93kAI4xTxlNJMEjXvnnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ftbpo4if; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ftbpo4if"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso30079335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744050838; x=1744655638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q8FZtvZTV1xf5prMpLMQCunOAEoyNTNUS/rIy+fX6A=;
        b=ftbpo4ifO2YM/kl6XfGenm9mCdNcFiWwTLShpPV1HCLZQBOQOiQU2gQZ1yZTrWkIHm
         g7opCozwzS8Ccx6pqz6n3m160+OJoUsbVvL2JIrz/O5/D4xEbi2G+uuHs8JFnWAeiSJs
         3hbtp5A/fV3KN7+aPHg+rd2TPqoRn75Gbx24Ux7xeFSTH+9G3JCHmp256p7X1mH9Ne5d
         oRhu6yMYjlnZPtXX7MbvdQPqVl6JDjxKkB4cVLammPdNEA9OGOgBRavqDJRxhjWoqGJq
         OXD8qsxy1BkKaMe9KoFUGbAsNmb6Q2z/kfXMh9NxmUYtWFk7tOSgLBSpKejzOTR65l95
         vuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050838; x=1744655638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q8FZtvZTV1xf5prMpLMQCunOAEoyNTNUS/rIy+fX6A=;
        b=gkhVCThuxYP3QiYgDW9YN0tCoQmX8W/KZIjeoTQty3Kp+P8TeBDwVQGrtEbwAWKTeZ
         VbrWuKGUHYT3WbikGlZvhtVy5lRrKZTMHNq19acTksx0XmINBp07G3yehyIrn80hQ3dL
         A9mKyWyQqaHnmNk4kSd07dzBy+lJoRc+TGBbp9kVT7I6mChfBiLcE7GUHB2mCqEohNGM
         AdlnoKCQHcRW7ZJORMXqLq0PMzCVW9NtmiEYwQVKaPAVPEaGgaNLBQNrTOfZmPaina+V
         Qv1y8anfAWYL724QRhz3PURU6ugxH0L9F3D4rewaAC9zGhX6CBCdmq52tdFnbOqxUsMT
         G6ww==
X-Forwarded-Encrypted: i=1; AJvYcCWQSNHJxQgFnc4bJTH4n4jmrpvapzYYxC6zBRHiZrn/ZaItzNRKitLnk3LSpUTx5kz9ccARP9bv0W75prc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/6Iok5jgSNB6wjo7jDWLJcUd9MrDNd/N26ZTJyeba08GVjC+
	kjZRukh4YWWPAuzQiTep4RCWxpy+0hg7eBc0XyL/8QKZcHN3lSxLTbdkZmSjLNo=
X-Gm-Gg: ASbGncuONlO7OXHwscmXLRwHoEwpvy3sS7ZC0X36hqhOFedoQVEjBL5SXQGjix89C98
	qrGDz6p3lDsTRcF0pw6/4Iu+JWsc1q40bBwOdtPEZ+KJ6cvC2HYdj0oPzR8ECg1hrGxWLOiHws8
	bEWm+NlbLvi7hj9PAtBEs/+4kL1cMXbJBPYOFaM4q4CJJPsaCg+K6Q9mxdFO9fIPIWDW3U6psvC
	vaLt1HgD3Ru+fEuf4lzI07/Wf9H6Lk0uYDNgzcpPX43GDNZK36ctKgjPuaAvqdZSBpOXlH/lDDD
	S4UH/5XJ9M1+T81fQ4aSp97oKCFIGw1ilQYnDHRlA+bLDpy/Zg==
X-Google-Smtp-Source: AGHT+IHzcKL+Ro+1VDQHtsz6UDXVmnIKRiBvSmLdVRJxOTL6M8DI/p++pzvmcvqih0sTH4Xu9HIUgA==
X-Received: by 2002:a05:600c:3b20:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43f0e5edd6dmr4141455e9.14.1744050838001;
        Mon, 07 Apr 2025 11:33:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec364cb9asm137138975e9.31.2025.04.07.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:33:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 21:33:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <4961949a-75db-4071-a478-fdc543c1dd28@stanley.mountain>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
 <Z_QCYzEJXTnd97Sf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_QCYzEJXTnd97Sf@gmail.com>

On Mon, Apr 07, 2025 at 06:50:43PM +0200, Ingo Molnar wrote:
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 2d8c265fc7d60..1a35165622e1c 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> >         struct mm_struct *dst_mm = dst_vma->vm_mm;
> >         struct mm_struct *src_mm = src_vma->vm_mm;
> >         struct mmu_notifier_range range;
> > -       unsigned long next, pfn;
> > +       unsigned long next, pfn = 0;
> 
> Ack.
> 
> I hate it how uninitialized variables are even a thing in C, and why
> there's no compiler switch to turn it off for the kernel. (At least for
> non-struct variables. Even for structs I would zero-initialize and
> *maybe* allow a non-initialized opt-in for cases where it matters. It
> matters in very few cases in praxis. And don't get me started about the
> stupidity that is to not initialize holes in struct members ...)

Everyone sane uses CONFIG_INIT_STACK_ALL_ZERO these days.

regards,
dan carpenter

