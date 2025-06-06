Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB81EF09D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749249718; cv=none; b=QpFgEVPFcpwPtlDcPfoi0zlGu51WD3xdAe31zJAUU+SrfY2/RWHFYteRVEGFo1J7GNkVGHBJhxngo/vx4TQVkd/O5E9lSt1KrsKYNx1JznM5kZGcSma85IfqtSewGt9m4dXU8Ah5X8+NGJZUlYJx2RaVjinMotBqdpSlsX10D4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749249718; c=relaxed/simple;
	bh=AfFvJzb4MQFPYprIsT1kp3eEJ8Mfo2gMrav1f09J9ik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cgUzchHJKCursUA0x+Xf4XlMTm2+8vLvcl/d1lT6t0T6HEIo1uinBWr8K7wBxoplsqE4Py3kmZvzxIRohxem/PU6qV7qcXp0sa/d1uf9eLxLjZX5lSS964BZx6pgu8fHRpLe7gsF8I3zeh+S0xc3RjDRThEjguVksHZqoRT0lEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4HKdiKyb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4HKdiKyb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3113a29e1fdso3485913a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749249715; x=1749854515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYoTu+bMCHUoVpZNp96TkhxLozCIXTPEx6r4fnUaXIg=;
        b=4HKdiKyboPoVWF5v1OR06ngT8lv8GrqGq2GlKjS3KswHZ5FNMMjSYOGgM71LQHHFkS
         kGjWApSgpXKz9afOB5Gy+ie1gfrbod9azd0yaY9wXobbbCzljrxEmh6q1SJTbvuz7YJZ
         QrV2W0feGD1s5GH2NjDdUK/NeIuXgD543W4v4xZG9+9uS49c/c9Vs65EsNCBxzd+WkzF
         Nde6Sq9nvsOfvq/Z3dUl3QeCzcbeZmXMti649hzXJEXOhw6Tk7Z0rz7U7VtXdwSUOJfU
         mDzfA9U+c/JMTkoagXr3njuxW93umCh5LOBFl5Rrevq2PWqmGX1NBDXFGDZqPmTOLgeN
         OCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749249715; x=1749854515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYoTu+bMCHUoVpZNp96TkhxLozCIXTPEx6r4fnUaXIg=;
        b=usWdVag2gg/2Qo7JdJCP5gVQFx/PCVPtY8RkMxOWxqeoPX2Uu7CcmcA2nz+5lB+FAC
         ZNrUJ7d2FeBD71DJOFFZvt/r3NHC5h6BCPtLFVJrBW5ygd23V4dAQQdk/nHILq7bBD6l
         V6fgvoin1EICpUpsVyh0grQkeFkdEjZyg4eDXNHycGHyaDmg9o+bZki3ZG6Eev8Re2EV
         tal4i6pmgb4l8c7Gv36tHL+a1zzCeK3r9LVkmVk8eLGeHu7vWFR/0UDEJrqZNcTEJdyx
         2LEpv6WtabHKjDlso9RaMCfkN7yhGcO8LdHmNIKDUzVvWl0m3hJGFm0nT3yhiEbAAbrr
         YnGw==
X-Gm-Message-State: AOJu0YwM0XQsoErmiHjOfyNjwpy4MFr79mDDksxuPNimBVHFEgbUU0Ig
	CUSVqapZMk87FIKM5KfpYmuy873IEVym4kimbojq7Xf2+5i9SlpSCxBPeYUpUIoZR3/zH4sQ1tP
	lahwPJw==
X-Google-Smtp-Source: AGHT+IHypEL2f87RRyk8KcwnXrUV1xs9cPNm7T9Zs+gygo3vvDD6Q8p5T967Pdv+Sm6z+/JiXtJkkspYdKQ=
X-Received: from pjbqo14.prod.google.com ([2002:a17:90b:3dce:b0:2ff:84e6:b2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:520a:b0:313:28f1:fc33
 with SMTP id 98e67ed59e1d1-313472fb0ddmr8343577a91.10.1749249715474; Fri, 06
 Jun 2025 15:41:55 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:41:54 -0700
In-Reply-To: <20250401161106.790710-27-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com> <20250401161106.790710-27-pbonzini@redhat.com>
Message-ID: <aENushMhwV_csfU_@google.com>
Subject: Re: [PATCH 26/29] KVM: x86: enable up to 16 planes
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com, 
	thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 01, 2025, Paolo Bonzini wrote:
> Allow up to 16 VM planes, it's a nice round number.
> 
> FIXME: online_vcpus is used by x86 code that deals with TSC synchronization.
> Maybe kvmclock should be moved to planex.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 3 +++
>  arch/x86/kvm/x86.c              | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 0344e8bed319..d0cb177b6f52 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2339,6 +2339,8 @@ enum {
>  # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
>  #endif
>  
> +#define KVM_MAX_VCPU_PLANES	16

I'm pretty sure x86 can't support 16 planes.  "union kvm_mmu_page_role" needs
to incorporate the plane, otherwise per-plane memory attributes will won't work.
And adding four bits to the plane would theoretically put us in danger of
overflowing gfn_write_track (in practice, I highly, highly doubt that can happen).

Why not start with 4 planes?  Or even 2?  Expanding the number of planes should
be much easier than contracting.  Based on the VTL and VMPL roadmaps, 4 planes
will probably be enough for many years to come.
