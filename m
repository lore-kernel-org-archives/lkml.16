Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190E20370C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040723; cv=none; b=uOJDENweE1me1MCeTsTnSX+5sDBBW/qlf5jdGdt+WroVb66stNb9MwaAc/IoWo6A1XAZr133Fd3M0ZPEBzi0m/e4rRxg1AB+M2eHIATrJGSknoiMa3Am243UCRF6ToT242+mG50AMin9MIQ2WVtRgUmgoIMQSqhoiK6sn9Vu0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040723; c=relaxed/simple;
	bh=8rczIshB1ndjUPA2IIqxasn8K81KQvQWE4FXH/fl0DI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LZOTi10C/ujYwFpJjK9Tfg09+zRJy8R9Q3APCVUkf/QBX3YHzYpn9i+CGI4YkLbP6Wk0Qs+r3NIvXy420PwzsjbJlhF8sqkhcT4cnzm3DAXaFI/h7lfPU2J+oCujU9E3meE0tNYn9d7w+lcKViWrspej0E9gz0lDDDwUsc4r2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HjO/dtz9; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HjO/dtz9"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af5156fbe79so5066809a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744040721; x=1744645521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjPEuV0twY2ry4rQMkACzclM+7K2QHMF2uXFHgUviZk=;
        b=HjO/dtz9x8PDliI6hVio1AzTn9EXPs5SSS+Q8NAEvSdb7ClxU3pFYtlIpbH3/XEcxq
         y3u5VLST3lWIxtV9qyC2uVbUY2qVSiSKHDXMTUK276LfnaJOAbl4bUR1ot0aQ60/UwUW
         6eqU+fNBLPn8WFfRkb6or+/ZjfnRGy80vwoJKolL/AVWaYMcatY4sB+WEZj8WWyRobhR
         rm0QuRYKjWOIliVmvzre396YZvKDBb/94rf9+o6NcG1b0aKJMhe2kWunqs3cOtzwfo4C
         dLhr1GHoLpwEfUwgo4fynpSwrz83Z+pj1n1K2XuQLOfl/jTvpZDUdsLadir8SGIKPzHQ
         pz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040721; x=1744645521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjPEuV0twY2ry4rQMkACzclM+7K2QHMF2uXFHgUviZk=;
        b=rePQEEmyGVi8Cr04esAU13BGyY2bxAgvZcS6i6iQ+WAAx0F0NRs8hdfKUekjmI4hSv
         hBgmFdbdjZmS3XKtLVNfVZk4hxOIMMoAywok+6xet6JT75w0F1L5bgp4DtNCqAsL2lSr
         l6SPtN8mZBZP/3Y9LA4XdP1nMKxA1HYt+G4CB6c14McYGwxZVGNSgVVARavDb6oEnq83
         L704Iq05DBnJB9u9OQmo49KqsU5ZYeKWOb0b4YlrTX0WHGu0X6JqYtv5mXEK/XlxXMSC
         e2P2InU1c0Q6TYQfgBwmlvQp7GPKHlB6Uhh7D//Wfj6vyNtvg88xmL4EKdGQZ8DoA11R
         n5aQ==
X-Gm-Message-State: AOJu0YwpEGrhGPH8GmqzQpEAr+AAn3NxP15kNUe05AntxlVlD2fvIZJf
	DNnxNDSjGk1QvJBIR6GSeVt9C/oGIZU5D+b4WSBMpPFq+kVxVNlj8RGFbVuqxANAt9vh/VDQx0V
	eeA==
X-Google-Smtp-Source: AGHT+IGAUO0UWTLAsUPDgxRWew05pcp0azizLiFsAkexoecMWcjbM9rZST8Tz2AIA7MAICQmH61wUobQpx8=
X-Received: from pfbbn6.prod.google.com ([2002:a05:6a00:3246:b0:736:5b36:db8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e801:b0:21f:1202:f2f5
 with SMTP id d9443c01a7336-22a8a042a6bmr141409015ad.8.1744040721565; Mon, 07
 Apr 2025 08:45:21 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:45:19 -0700
In-Reply-To: <20250401113616.204203-14-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401113616.204203-1-Neeraj.Upadhyay@amd.com> <20250401113616.204203-14-Neeraj.Upadhyay@amd.com>
Message-ID: <Z_PzDyiyLGq2tJl8@google.com>
Subject: Re: [PATCH v3 13/17] x86/apic: Handle EOI writes for SAVIC guests
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 01, 2025, Neeraj Upadhyay wrote:
> Secure AVIC accelerates guest's EOI msr writes for edge-triggered
> interrupts. For level-triggered interrupts, EOI msr writes trigger
> VC exception with SVM_EXIT_AVIC_UNACCELERATED_ACCESS error code. The
> VC handler would need to trigger a GHCB protocol MSR write event to
> to notify the Hypervisor about completion of the level-triggered
> interrupt. This is required for cases like emulated IOAPIC. VC exception
> handling adds extra performance overhead for APIC register write. In
> addition, some unaccelerated APIC register msr writes are trapped,
> whereas others are faulted. This results in additional complexity in
> VC exception handling for unacclerated accesses. So, directly do a GHCB
> protocol based EOI write from apic->eoi() callback for level-triggered
> interrupts. Use wrmsr for edge-triggered interrupts, so that hardware
> re-evaluates any pending interrupt which can be delivered to guest vCPU.
> For level-triggered interrupts, re-evaluation happens on return from
> VMGEXIT corresponding to the GHCB event for EOI msr write.
> 
> Signed-off-by: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
> ---
> Changes since v2:
>  - Reuse find_highest_vector() from kvm/lapic.c
>  - Misc cleanups.
> 
>  arch/x86/include/asm/apic-emul.h    | 28 +++++++++++++
>  arch/x86/kernel/apic/x2apic_savic.c | 62 +++++++++++++++++++++++++----
>  arch/x86/kvm/lapic.c                | 23 ++---------

Please isolate the KVM changes to a standalone patch.

>  3 files changed, 85 insertions(+), 28 deletions(-)
>  create mode 100644 arch/x86/include/asm/apic-emul.h
> 
> diff --git a/arch/x86/include/asm/apic-emul.h b/arch/x86/include/asm/apic-emul.h
> new file mode 100644
> index 000000000000..60d9e88fefc6
> --- /dev/null
> +++ b/arch/x86/include/asm/apic-emul.h

I don't see any reason for a new file.  arch/x86/include/asm/apic.h already has
is_vector_pending() and lapic_vector_set_in_irr(), this functionality is more or
less the same.
