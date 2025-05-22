Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4CE2512D8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935757; cv=none; b=MwnTuw+elIBxc5SnKfdZsW+vnn9RnqSzjKUU+vnHEJ/lkZK8MMEzlDDNgXD8g2K3FtcnwaBycUkj3hu6pb7EmU/cWecSBBbEyhDU4DAvvDGayFmlS17W63if5OsnazFE4gul1EKZvJqs+mMGSqC7bl8dMU0Jn4/IpMFTm74Py+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935757; c=relaxed/simple;
	bh=T193aeRyJ1OGv0+6AYB8t+pbinpVG0oKPxn8mbqLW6U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ef+JmsvE3wG0JanjRuZLNsFbAROv+Z6vVHiYO9Glaip5xWJqYhBUZAWKRs5FJ5uKyNBwnJlHofMijSWlQIxg+79xFPr3amcbT1Qu6sQok2qGULpRKkMWEJQ8DOo6sQ95A5v2rjWHhaViGHMgyBOlxtUQknf2H2Gt4Szw8XM909U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBJXvqDE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBJXvqDE"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231e6e1d988so87589095ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747935755; x=1748540555; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTZzTjxME0+T407CR9T2jnDVgTWuq2jRrI32jdizTLI=;
        b=cBJXvqDEqJIxW7JlmSh8HwYJaAeJCwpZZdrzzV6AqwElBgTsOg7RECpAVDDINCwiax
         l4T0i3VcXZA7bv9FxQaI0xAjrd9cEr2DwN7UOPz++d5Ah+v8GtXAT04UGqmkC5SGo0lW
         Uj7LN8/i8f6zIwFpFjH6ZRJn8g5XSnUC6HKR47ojTYjQkiR0WCfo7B5e89Ngh5Zqrduy
         fDBSEvdMIi0IOOD+jm3sTHG9mhzZ4W4hCPtAFlc+V9SVaZUnfydQk1b1NQJpUeVKryGd
         2jbKgGynOqctBoKqMPbYbjp8SPQAtIttIiT1jJo1JPuleIXXhjIh6qlX4wWQXN+vf/y9
         Jc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935755; x=1748540555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTZzTjxME0+T407CR9T2jnDVgTWuq2jRrI32jdizTLI=;
        b=N4jIVhw7Ftbci0kEUBEktdArw4W7ICc3gBV2u8YHAKtL/ABbKKeHifwtngLi0T3P0j
         kc+hCKA2XO0jJnuWupuyczjq90M/mltqxzgVSRXo0SCbvT3fycBsdscZfMLA+V8k2mdI
         ITC70P6s/htYSaq8zb/RmPMOAJkBuwSnnhGC4EjkCJkFcSwb4vJHQvPGw2QDGjKnHUKT
         Y4eWP7S2UbSIOdv7v12DDhs8m+JkPZwlP6dp5bjNGNQ7pv3n6r2RcL1y2H0WDt4oHco+
         VkddIDQl4YF/odxabUg3LmhedQ+YeTyksF0S4pLSRUmiB4V8Znq39xRSI7kxH5b5yU/i
         kzew==
X-Forwarded-Encrypted: i=1; AJvYcCWOY9MsOGOzbmULOpLs6VENNSc/A9vtD7sS9OEcIDMcnH7/ehnUTLpCp3GWqZE8wXLSrjKWaoBQK4bcfYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKOe99SGMuuWJ8UrpV/nufcNB0nT/wwHv6g2UnJOL092A5d5E
	gOZXvKC6FKn1n+PNe6+PHgPC6iEiH05621NGriSwPPAK5fWE90QrKem69e+xVNo9kMhrsr/RYnT
	8cwoykQ==
X-Google-Smtp-Source: AGHT+IEitcbqn8Ct6EIf9jvCMYvrO0otsPo/CrQ4mPp/jVLneyxQpCIIYoWk6Q6DEqLI2Pu1VXOQ/PvNORU=
X-Received: from pjbph7.prod.google.com ([2002:a17:90b:3bc7:b0:30a:9cb5:7622])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54ce:b0:306:b593:4557
 with SMTP id 98e67ed59e1d1-30e830ca012mr41799466a91.4.1747935744786; Thu, 22
 May 2025 10:42:24 -0700 (PDT)
Date: Thu, 22 May 2025 10:42:23 -0700
In-Reply-To: <20250522005555.55705-3-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522005555.55705-1-mlevitsk@redhat.com> <20250522005555.55705-3-mlevitsk@redhat.com>
Message-ID: <aC9h_9CyZ4DMAAi_@google.com>
Subject: Re: [PATCH v5 2/5] KVM: x86: Drop kvm_x86_ops.set_dr6() in favor of a
 new KVM_RUN flag
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 21, 2025, Maxim Levitsky wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Instruct vendor code to load the guest's DR6 into hardware via a new
> KVM_RUN flag, and remove kvm_x86_ops.set_dr6(), whose sole purpose was to
> load vcpu->arch.dr6 into hardware when DR6 can be read/written directly
> by the guest.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  1 -
>  arch/x86/include/asm/kvm_host.h    |  2 +-
>  arch/x86/kvm/svm/svm.c             | 10 ++++++----
>  arch/x86/kvm/vmx/main.c            |  9 ---------
>  arch/x86/kvm/vmx/vmx.c             |  9 +++------
>  arch/x86/kvm/x86.c                 |  2 +-
>  6 files changed, 11 insertions(+), 22 deletions(-)

As alluded to in the previous patch, TDX should WARN, because guest DR6 is owned
by the TDX module (the KVM_DEBUGREG_AUTO_SWITCH guard prevents KVM_RUN_LOAD_GUEST_DR6
from being set).
