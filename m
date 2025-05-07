Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D724A35
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576420; cv=none; b=Zd+oV2qC/yuQ3pYFo+XCWdYhgGtjwR4zcB9BjGaqXZKZZavvFd9CwokCEmi/AK5w4VI85zCcgqNTa/mhnugTVlf4/GRFbbbLSxvxXdsEUJnxwLntswd/VN0P92DjIQBeoDUWYEqMNr5d6pRB+pL60NUhkgIgcJz0FALkZBTr9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576420; c=relaxed/simple;
	bh=B/Q1rqo7fV2BZ1TxyIdMZoX0YUYdDfRp12zBu+jtqb4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i6LnYWfXWE0NN4rdJqFyn8RgsRk33xLfWyFEdXKHSg0amcrc7rP7eiuK8SfHg+/bMsnq+NlB3k7gFd13W3BIRlQu2bC90kLot2pVk8E1xJ1wvFvWGln8eehDjYUWUVMgywhBYrJXaKYdPpHe6MQsA4P66QbHKOwdi9Y8KQVhlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rR7uu1kp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rR7uu1kp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so4884269a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 17:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576418; x=1747181218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=btn3LhqGUmuW2q5LXm3m4DGAhqR2o0uzT2Xd87u051w=;
        b=rR7uu1kpVYFXvhjvvl10Lxwq58At7fHL+9D6BjFYf37cuUz6bpKL4NLEXKNA+zR2kl
         QpPSn6NpkON3DkCvAyrt4RuU4DOu4gZwaZE+OLnWvaPiNwzUkayqwsuPLanSEKXjUwQs
         pzdPF0gwLnqp6tlm2pbS8c7VjHZE4z0Smc9AN5Rc9W0kZq0zrfsxjRphDtbvvHxfMU1Y
         A+0SPqTDSkTMYEKIrb6RZEuoUKzSjSrpJDdLEahaLYGc+S9VcNb1OwzQseXVlI0GaayL
         jub344ms6tnR62ey40sMOLB/e5uSsBcNj51SbY5EgMczx3VnDltPJPyTW9FJs6FxbFsJ
         5Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576418; x=1747181218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btn3LhqGUmuW2q5LXm3m4DGAhqR2o0uzT2Xd87u051w=;
        b=omcPFqdy4+gButCvT2jw86s6o3efLZBca9wr1FWw63lyoy3/RYWYYP2Dv1jgR+K+iz
         XD7QEtYzMyuL68VIDfgfthpkzp0VWKpJa0DaSKzkt/Sqt9NUEcoV2SKJjG627klMzsKC
         RnEGMwFqPb+MbSC4WQlA/GknGEXbU7qyf2cPZEwox0yMoD8P1TNphIjWeR20bZJwhhoC
         uRZZmMPDIwyMZlXo+0BD5ZeJxp+buPtaZesqxUlDEuWUhc4u/btyxXtdAiT4C4vQCdf+
         EUCL/bTWh3iVF4JFTKfqJqSVSzU4N4SOoEfIFMppEcdI+xj44VGjhvHayfX/7C6PpCIf
         Sg3A==
X-Forwarded-Encrypted: i=1; AJvYcCWSHViTpkxdn0Kvjy42GDHBJGyoBPppD+WDjaF+JfvFFyfZ4XFNHvLa7J8dhxmQIzwet+vT8/1QoNjm2Dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMNs/HXzLZueeFEIdBFmdJXT0VC9hWCZ+ZEr/s8B0Kag4d6Jj
	buWMUHx6qf6hLSnDsiaOXTwZSbFcYKc7hOCEn1NyK1Sk4zkYP4Xk45yjt9Uu0o30mFWqPD53MN+
	EwA==
X-Google-Smtp-Source: AGHT+IE5kiyt3mLLPMmlAjvZ9sp27wxLvnJ1rcyvQV12u4OmcEbBS1ad1jPVl9wL0g7JEjpFk80jEUXWV/s=
X-Received: from pjyf14.prod.google.com ([2002:a17:90a:ec8e:b0:301:4260:4d23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc5:b0:2fe:99cf:f579
 with SMTP id 98e67ed59e1d1-30aac15ed4amr2041810a91.4.1746576417804; Tue, 06
 May 2025 17:06:57 -0700 (PDT)
Date: Tue, 6 May 2025 17:06:56 -0700
In-Reply-To: <20250109204929.1106563-7-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-7-jthoughton@google.com>
Message-ID: <aBqkINKO9PUAzZeS@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 09, 2025, James Houghton wrote:
> @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 new_flags = new ? new->flags : 0;
> +	u32 changed_flags = (new_flags) ^ (old ? old->flags : 0);

This is a bit hard to read, and there's only one use of log_dirty_pages.  With
zapping handled in common KVM, just do:

@@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
                                   const struct kvm_memory_slot *new,
                                   enum kvm_mr_change change)
 {
-       bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+       u32 old_flags = old ? old->flags : 0;
+       u32 new_flags = new ? new->flags : 0;
+
+       /* Nothing to do if not toggling dirty logging. */
+       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+               return;
 
        /*
         * At this point memslot has been committed and there is an
         * allocated dirty_bitmap[], dirty pages will be tracked while the
         * memory slot is write protected.
         */
-       if (log_dirty_pages) {
+       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
 
                if (change == KVM_MR_DELETE)
                        return;
