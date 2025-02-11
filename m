Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B041FDA94
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275839; cv=none; b=oiVl0BjESWMB86Y+d5bolmrDhI/24zJO8GrkLXC0GLhzsfDWw7pUSsBJi5AVvtb2ggEZYCxoafQgBbpKYe2S9/UYedrOKbjdsKXq/9uT4WpKDirFfNSnCHYJTEMAwfimEh9++YVTPB6x1bFtd0oaBsKExFFbqPXA2506QiFpiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275839; c=relaxed/simple;
	bh=1N4BjHm0w2ueghlCuqmC8WLv26kWSsqWLwCdcxZhQnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6NXUZ8aSniKWcAOiwRZILzrRnho5r8kXFjxZ60RgdyaymWwcngfAe3Fs3SiT+iFXHFUpMyK23DQVvvfvSmlspHi7YV/3/D/HGg6zLUX9Qqn+lQoRyNb/bakWVUbO/nd/OaurmbKsvM6r9xNd6ROoUd69P7y5P3BCVbT7HFxcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y8gHaBpr; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y8gHaBpr"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47190a013d4so176431cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275837; x=1739880637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1N4BjHm0w2ueghlCuqmC8WLv26kWSsqWLwCdcxZhQnM=;
        b=y8gHaBpr87+HP2qjoZiAkXlYx1soVOqNR73Jk5YGsLv2LR9HgbjXFQ4FRGCQhe5wgL
         hlJ0Nr6fq3YY0oc26CqNDbKKSqpYZzc8XlntVg21JqDK22yywkf5HgmWXh0gM2Pl6PNn
         KQT7JcXMhu5kJFstfrWc7utkBPK03dp4kwoV+EMa3AuYyDqjQso9vb+UDE1nSB5IAg1x
         cs0L0qfbWifTUldObn0uvnKw22JzBUZv4tUmHk1WLUoXqQHOpZ63VQBMB5o9WiyzR81j
         cTimS6dn4Wzveyq5b9pRAT619lRxvRylpkWZIEYh6UhoPNV0AZGXor5W2JWWclT5lPi/
         r84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275837; x=1739880637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N4BjHm0w2ueghlCuqmC8WLv26kWSsqWLwCdcxZhQnM=;
        b=JtG+n+xAqZcAql9kvmAIP0YZHdvjRJYRJJkm+jHZ3TLEzso5cYk7bDGqtZX1ry3cLH
         Raa11ZGTSSztIXkhSP/3Evn0q2vrUaVfP7IsKhOYuaZq18TOqYKaB+dqemETov91snYm
         DaHGKUfAhhd+oFoMNn6hb+sIp078DrafI2XBVn0PR5LHA6PrJuK00A/62Vv+INua+b8q
         tYTDSapwL55uPRu4mrUhiKyTnkRLqxBZzLimoEo8a3hirqBF4Fz/ihQ+DRz0jKOTmz60
         rY179pSoQohB1WYTPsVckwV+HNYQION6OxP47t74VnYw02k26e/wzqOX3QI+VYI3z8NH
         gixA==
X-Forwarded-Encrypted: i=1; AJvYcCWn9Lsud6mQ8AsKqUCs6S6UMmifW+lfkcC3YlfrpCGKYXN4sERsarpx8KcKGxl9wdAhr4HwbfGkgSZ3zuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fuTCgsbN01KP/UAKqQ4I3+Qe3Ocqp0X4wVMnyKGmu2llkCux
	fK1U8NBGNgugTHqrcNfyC4pOvLYASH672BNKa/e65XTFS2xiKQYYHnouX4KxEymnB5sU+0ackwU
	o6leW2Ry89b8tVWiv4a2i5M87xYcCFbHzx31l
X-Gm-Gg: ASbGncss99rHBtL3mmu6TlJXLAIxStl9jL3oGvXAAc+9jgc2jm4QTecxAh4TDZcKah8
	C99SUaN3Jt6WXOB3b8aFVE+iveWUIVomghIwo/e2jeH0ephFqCewy6QltltVk14gNPHYBfsZaJG
	nGzHZQasLuFiZRkRVZqVOhB/zCJI8=
X-Google-Smtp-Source: AGHT+IEQwEibAWc+RRxuuCdpPikFutJWVyXCzGKs+LngcPsqCNYBwJbz+eXEOrOLxm9bhPvIWlaknhQUeYYoGDpRBGw=
X-Received: by 2002:a05:622a:24e:b0:471:92af:bf73 with SMTP id
 d75a77b69052e-471a24015b0mr3512441cf.22.1739275836415; Tue, 11 Feb 2025
 04:10:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-2-riel@surriel.com>
 <CA+i-1C2QgSTq4gbGZqjyzGcuscsFZvymHvXnfJYuT-CNjPPuMQ@mail.gmail.com> <20250211110721.GF29593@noisy.programming.kicks-ass.net>
In-Reply-To: <20250211110721.GF29593@noisy.programming.kicks-ass.net>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 11 Feb 2025 13:10:25 +0100
X-Gm-Features: AWEUYZl1qEIZlSom7v3otMg44tgV0viN6Er_o6RhnpuRLrgH7vOxr6PrKq5XL4Q
Message-ID: <CA+i-1C1fP+Lk4FGO+-sLMq+LmjVjm-1r-wG15oKtDDu0=gi+Gg@mail.gmail.com>
Subject: Re: [PATCH v9 01/12] x86/mm: make MMU_GATHER_RCU_TABLE_FREE unconditional
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	bp@alien8.de, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 12:07, Peter Zijlstra <peterz@infradead.org> wrote:
> > It would be nice to update the CONFIG_MMU_GATHER_RCU_TABLE_FREE
> > comment in mm/mmu_gather.c to mention INVLPG alongside "Architectures
> > that do not have this (PPC)"
>
> Why? This is just one more architecture that does broadcast.

Hmm yeah, I didn't really make the leap from "doesn't do an IPI" to
"that just means it uses broadcast TLB flush". In that light I can see
how it's "just another architecture".

I do think it would make sense to be more explicit about that, even
though it seems obvious now you point it out. But it's not really
relevant to this patchset.

> - and while that's being updated it would
> > also be useful to note down the paravirt thing you explained above,
> > IMO it's pretty helpful to have more examples of the concrete usecases
> > for this logic.
>
> Look at kvm_flush_tlb_multi() if you're interested. The notable detail
> is that is avoids flushing TLB for vCPUs that are preempted, and instead
> lets the vCPU resume code do the invalidate.

Oh that actually looks like a slightly different case from what Rik mentioned?

> some paravirt TLB flush implementations
> handle the TLB flush in the hypervisor, and will do the flush
> even when the target CPU has interrupts disabled.

Do we have

a) Systems where the flush gets completely pushed into the hypervisor
- xen_flush_tlb_multi()?

b) Systems where the guest coordinates with the hypervisor to avoid
IPI-ing preempted vCPUs?

Maybe I can send a separate patch to note this in the commentary, it's
interesting and useful to know.
