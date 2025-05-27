Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345662749DB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354079; cv=none; b=qWvsTwbpHwxSESSB1gzboBd6uH3XZE1G3+myzZatpGVwS9xHsFZUk8y+8hndaXQu93ANUOxqgKkW4tyfeXEMWNYk9L+DZM3gZm/nw8w4O/VE9ldZZcxtcoZyAf1YM9phDZbgrwetIucPL89TaZbn8KU+xpvyNbgEbOTPBKhnkCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354079; c=relaxed/simple;
	bh=WyMNpqztpjfa+E473WIvmcqYfcW83p9X49HBe7T78fg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QoetF+Bu3oFYczriMM+xS4+KDstwxJDRZB+PwcbiJVsPrbiBIBjicEgFS0/y791B0qtD1Eg+0JVJSTY9aPXaDNqIlrW6m6gL3eFotfT4osCsgwykpGojdrl2nMDbXxt9uacMHAy6HUs9dqYlnHhXpM/P++llYqio3MyU1pFZhMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LwY+0Eu6; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LwY+0Eu6"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742c7227d7dso2379072b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748354077; x=1748958877; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYFzI/Pf8LYT1E4MZH+9++OI5c0JxcdnTmZFR5CBiQ=;
        b=LwY+0Eu6+NpdnmmArIzD+6jh9onZj93NCCXbEnjjf5/J6UvmKWSJ9z5/SW2Mm2HwMO
         08uDu68UacvMCLzh+Od3Gv2kF+lsWOlGjqu/15JrIxeW41OGwQdEzlkNekVcxw3290B0
         Ch5Um+jxNxwwrdRY0Kv3e7E5AlIOf4u09hZ+jP7BZ+353r58yjYaID+tDfjssce3peiJ
         4Yt67NtmEOHrZIHL7waN7gY0h3TaCHZEttiCCY3fzZxZsP6q/ebgowIY/I9yKgcBeO2J
         GkgwOYhV7RWyftR2R4aZWYyLvqFXwYc2vidluhysDVP8jL3GKovjmZf9+aAwQdgHBo3N
         LPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354077; x=1748958877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYFzI/Pf8LYT1E4MZH+9++OI5c0JxcdnTmZFR5CBiQ=;
        b=TsuMz2CcDzvLeWHV3wrhNuto3iwj9ASXSkub6dmY2p9YgDYZ0O+hRWCHuYhkD+rtyN
         98ZKg84ZT6n5x8oCv3r2QxM9AcTPnKgd2vT2g8dT6oayXMhagZtvoqh0L4QnqIhYnfJC
         pb5wJ42jZU/BqfqAwOYgwPdVpKMw63pYpm3rimJpLq+64thrigxaCieQfkGKGMlYUY/9
         OozHWPX6ZzebexY4KRCVvoW/himLCIzrcqTTpjasW0YkBkzi9jNU3sVIkfDFrEH4eES6
         b4g5qiBUdATGZsjc39hA+dNmIehgFoUCMpmAwGe0GXhjG5M3Z/ZlAMQRpG32ahQGZTtr
         Ni4w==
X-Gm-Message-State: AOJu0Yzl+ssLJgpT3lHy9xyWVZvSvHa9+/cYzmPO+aq9m+cB1bIEY9BV
	LWlxgb4/GBqajPzk02mKki5/7MQ0w5hdaSpQfuPOZ6cA6TajS5CPUhszHuOWCw5W6IWe96lMbvG
	5EIPPKA==
X-Google-Smtp-Source: AGHT+IElK72n6Kg2OfmwiNnouPnnAZ7NqRk4GrFRrXNNUReM0GMEWV/ZHjlhM/z2w5LX9eqnH/EukKWJB58=
X-Received: from pfjc6.prod.google.com ([2002:a05:6a00:86:b0:746:1eb5:7f3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:39a7:b0:736:b402:533a
 with SMTP id d2e1a72fcca58-745fde5fd86mr18449968b3a.1.1748354077259; Tue, 27
 May 2025 06:54:37 -0700 (PDT)
Date: Tue, 27 May 2025 13:54:35 +0000
In-Reply-To: <20250526204523.562665-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250526204523.562665-1-pbonzini@redhat.com>
Message-ID: <aDXEG5tXRfsSO0Hf@google.com>
Subject: Re: [PATCH] x86/tdx: mark tdh_vp_enter() as __flatten
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 26, 2025, Paolo Bonzini wrote:
> In some cases tdx_tdvpr_pa() is not fully inlined into tdh_vp_enter(), which
> causes the following warning:
> 
>   vmlinux.o: warning: objtool: tdh_vp_enter+0x8: call to tdx_tdvpr_pa() leaves .noinstr.text section
> 
> This happens if the compiler considers tdx_tdvpr_pa() to be "large", for example
> because CONFIG_SPARSEMEM adds two function calls to page_to_section() and
> __section_mem_map_addr():
> 
> ({      const struct page *__pg = (pg);                         \
>         int __sec = page_to_section(__pg);                      \
>         (unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));
> \
> })
> 
> Because exiting the noinstr section is a no-no, just mark tdh_vp_enter() for
> full inlining.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Analyzed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505240530.5KktQ5mX-lkp@intel.com/
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/virt/vmx/tdx/tdx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index f5e2a937c1e7..2457d13c3f9e 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1517,7 +1517,7 @@ static void tdx_clflush_page(struct page *page)
>  	clflush_cache_range(page_to_virt(page), PAGE_SIZE);
>  }
>  
> -noinstr u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
> +noinstr __flatten u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
>  {
>  	args->rcx = tdx_tdvpr_pa(td);

The "standard" kernel way of handling this it to mark the offending helper
__always_inline, i.e. tag tdx_tdvpr_pa() __always_inline.  Ditto for tdx_tdr_pa().
Especially since they're already "inline".
