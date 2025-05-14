Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C0C223DC1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264880; cv=none; b=h2Y1VWkT1qgG5YQ7+yAiCAJ3y0Z1FEFsyr40V4+gH5svrHGhWtmCOM0wWy/hHAC7InWz/pKnP2MUrU8uKVkb+RylPBCc9iexy0qZNK8aZRQyl6fmL+XhEwDCaKU1Mz++JCOxOTNZTMn66FrfcKaYy4xZEgmC7sI9nMEnOZaPoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264880; c=relaxed/simple;
	bh=YEKXLYRf3Z91CVsnsWfdQ9wfCYW5gqK6f8e442q5Hiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dzJO3RWK9NUbQE6e3icys8cxAYeOvs6qfbKrx4so3sJ+B1w9Q8YWf0uqvim2q0csndRYDdC1o1UuaAV8V5QmHxoJhSovIdHlTyn/VIX3pgAeNSH0T5Rxd42XHnk4nOkpoCquWjAXexJrwfonjF5TjUEMQCI21NtPDd0UTqDXzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xd7F1Oye; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xd7F1Oye"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26cdc70befso159094a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747264878; x=1747869678; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0W5oRAU5Tx1bBNWhYqi9a+fsUdga8B/qghEhaqvlHzU=;
        b=xd7F1OyehJBJvB2ccUvc1pKbtQVY5d09+V8IxScIfm8ZLwDX9UjVOD56BcsIxCzNzn
         rOyIJsHArhieQweztEahZnvtMw/USUgm+zMrAaFzNUbNARnmgoiSfn0FNt3M7WU8WyUj
         m2itZn6ay/9gZwfo5OTyWFLWgI1rGPzRndG2NK8orSxQCGnavft5U0RgLQTOMRn64+8e
         LYmDrkJNfgyeIi42TES2rhHKsPnDzsVosuz/GhQ7KPWfa0UcSz/cXSB2LlL+z6Ua4/EZ
         KxiBo+q+aCJKIBGZkpU8dtKGBEl0Eetv3/wIEvqA85lixJW4B3dD6oNqCCNm7iVoupP8
         O+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264878; x=1747869678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0W5oRAU5Tx1bBNWhYqi9a+fsUdga8B/qghEhaqvlHzU=;
        b=WD78POxGNwyFyOHj93zHQA/5wGNcyf1TyfHJ/DJvqMNyuodlJ7wFN0GNkUFV5cKasI
         9h4vjo5sSSQ3yj8mVU+UdoBKNSeJFCpSCWexpZr5Rmsl5EuojC8sseVCb3o0T21DHuvJ
         njtm2tBB97xiea4H595LRJXprv5LVm9uSfu6S8w/qUHoyuAYtY2ZUbQVjUdZqs65KJ7b
         l/QEsRvSLrB1mk/lXA1XS42wGIQ5vKRhPzN+bnSnde0jBUAqC0THC/xc9kUtvRW+wFlb
         jEX3ks5hCfkJAjylaO28FsB0GscPEuN97wnyQirk+WniQr5EWCrQqffJeOWQJL9c7r2b
         F95Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOH4CpNsCk7rcaTz8qKUoKav3M5DaxQfrAUsOv30Gttg+xsM4i6CqG4gzQNeJ00QpPol7+YJwA1iJdSmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf0vBzDvqg7d+zOHbFrJPrC4dRLBNhjMwO4Ct8btHb0LW2ECY7
	68uQ+/xhN4dm1AJCrncYyRNCGE4jpxjyMfloRWXVHMYveOmfE1UHLZtT3em1WLN1zVfClqIH2mo
	U7Q==
X-Google-Smtp-Source: AGHT+IGTO73AIKyjnTSCUICJ5vVeiHlgCc/yVjvzHrQyDqfhwzwnQP3wljVXsvhihVqXHqt1ySm+522Vois=
X-Received: from pjuj4.prod.google.com ([2002:a17:90a:d004:b0:2ff:852c:ceb8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:564d:b0:2ef:31a9:95c6
 with SMTP id 98e67ed59e1d1-30e2e5c3177mr9009619a91.14.1747264878446; Wed, 14
 May 2025 16:21:18 -0700 (PDT)
Date: Wed, 14 May 2025 16:21:16 -0700
In-Reply-To: <20250324173121.1275209-7-mizhang@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324173121.1275209-1-mizhang@google.com> <20250324173121.1275209-7-mizhang@google.com>
Message-ID: <aCUlbDNoxQ-65mc0@google.com>
Subject: Re: [PATCH v4 06/38] x86/irq: Factor out common code for installing
 kvm irq handler
From: Sean Christopherson <seanjc@google.com>
To: Mingwei Zhang <mizhang@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Liang@google.com, 
	Kan <kan.liang@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yongwei Ma <yongwei.ma@intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Jim Mattson <jmattson@google.com>, 
	Sandipan Das <sandipan.das@amd.com>, Zide Chen <zide.chen@intel.com>, 
	Eranian Stephane <eranian@google.com>, Shukla Manali <Manali.Shukla@amd.com>, 
	Nikunj Dadhania <nikunj.dadhania@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 24, 2025, Mingwei Zhang wrote:
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index 385e3a5fc304..18cd418fe106 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -312,16 +312,22 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_x86_platform_ipi)
>  static void dummy_handler(void) {}
>  static void (*kvm_posted_intr_wakeup_handler)(void) = dummy_handler;
>  
> -void kvm_set_posted_intr_wakeup_handler(void (*handler)(void))
> +void x86_set_kvm_irq_handler(u8 vector, void (*handler)(void))
>  {
> -	if (handler)
> +	if (!handler)
> +		handler = dummy_handler;
> +
> +	if (vector == POSTED_INTR_WAKEUP_VECTOR &&
> +	    (handler == dummy_handler ||
> +	     kvm_posted_intr_wakeup_handler == dummy_handler))
>  		kvm_posted_intr_wakeup_handler = handler;
> -	else {
> -		kvm_posted_intr_wakeup_handler = dummy_handler;
> +	else
> +		WARN_ON_ONCE(1);
> +
> +	if (handler == dummy_handler)

Eww.  Aside from the fact that the dummy_handler implementation is pointless
overhead, I don't think KVM should own the IRQ vector.  Given that perf owns the
LVTPC, i.e. responsible for switching between NMI and the medited PMI IRQ, I
think perf should also own the vector.  KVM can then use the existing perf guest
callbacks to wire up its PMI handler.

And with that, this patch can be dropped.
