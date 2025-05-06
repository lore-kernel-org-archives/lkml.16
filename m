Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4B27A932
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539642; cv=none; b=OtKZ0wL2i4/MQZOHqXi1FYToAcxYCY2PnwuHWtNUWHRdlpLp0HTsXWB2551ySuWAsmqwWECa27Gv4wo/Bo4mkNnvuQnMXmpnAXmoK3zG8rjrNo+BfgaEZp5xLqVgbB0TW7X2EvOX8K1fMwrNL5SOIM0eW4QU+TZ+m4448nR3Lts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539642; c=relaxed/simple;
	bh=E0MBUYNrGvgPtAL3Tx7u0b3fFrGahJZFgt+I8HqEuHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KcnKJF5NmHTfI8xckWz38isYSScHR4Gj+ByQeneR75ZcYbqpTnW/LkAf1SUyg4iaM9NcOuub5Y8f7N7mBAQdYmkIe8oB9HnAnTnQuwO0VY1e7zKLI1X8hH2zvrjb8Y78/0c9PYclZ22nJK02hTGMQRVNqFgZ+CGOTiKvirpd/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0f7f0SU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0f7f0SU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so5112103a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746539639; x=1747144439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mgKVk1+LFsbcw1jY+XDoGyAfQKN78O8ZSwvvMcxjVY=;
        b=P0f7f0SUoUXReXvEU6KXkqBYdGAgWlRfUSJj7TITpoHYvTIRDo0+VWtiaSo2yoiDmC
         wGRXuW76LLtatbPDQOK70T77SRNQqu8gZPG1dPi/GCMSPDFtHrhOz3td6Qk1jy73s7ET
         8mDEle5IB94zT2RoKRAh3kmOXlmbJ+TI46h+M3iWDWTQELvL5lrY+B+ynO4gkam9hiPO
         4O1Zcy/orlEjqaR969okNJ1E+MX6c7c8hKOqu5P3y7c8RBDksyJROlq4Mukk4vZYegfQ
         EpXf1ONr2I5uu6XnN15OVZEhFGgZuVeZOrbKNOEVo3lBVvz3Q6f2VapWVaLB7h7sFJyk
         d8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539639; x=1747144439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mgKVk1+LFsbcw1jY+XDoGyAfQKN78O8ZSwvvMcxjVY=;
        b=uRYg0BNX+OCA06fols3JoSv5RwoJQif3BqhxzivWPelbnr2tMTF0hnwGvb7miJ0PBQ
         PLjJZjTQHLIp/C5Vu4/+7qLeJrsdn7C04OWPjDgYxw5p/zLcMlJgFPzzbltVjd/8qm0J
         yu6RH43+dT+wUSyxFDGTgocrzypcuFBfvjFkwHaZXCh3njWhWplt1Vdgts9WtPNI15Tw
         blWsfk86Oyyo8uYtEG97U01xFneQJppyFuntm1ON6sWcOk+/7LhgyuR15+MG5wD+0lCf
         ydAlylzZLBKER9vxAVHyL6TervNpl2puZwiIECQ+0twORDkxLpPRqKD+aIZV9znhXXPZ
         kv4A==
X-Gm-Message-State: AOJu0YyMJhFD6B8ynrAMiSAlQrKofGjkqz9tNUMQyhV73JOvNzzitweJ
	f/QVVL382j4fiGmAGHxWZ42z7kuWGLKEi5mVICw0qkmi4bDswpu5PRLCro3JPzkDxi4SW+SO1pa
	xhQ==
X-Google-Smtp-Source: AGHT+IGO1ZCu2E3J9DQSTbuCStxaXGcWf0OefdURtnN38ZAiX+JOfZJg+SVs+beWPtRWk/oQ9WoWHf6IzJc=
X-Received: from pjbsc5.prod.google.com ([2002:a17:90b:5105:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5704:b0:2fc:3264:3666
 with SMTP id 98e67ed59e1d1-30a4e6914cemr24620709a91.30.1746539639028; Tue, 06
 May 2025 06:53:59 -0700 (PDT)
Date: Tue, 6 May 2025 06:53:56 -0700
In-Reply-To: <20250506092015.1849-3-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506092015.1849-1-jgross@suse.com> <20250506092015.1849-3-jgross@suse.com>
Message-ID: <aBoUdApwSgnr3r9V@google.com>
Subject: Re: [PATCH 2/6] x86/kvm: Rename the KVM private read_msr() function
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	xin@zytor.com, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 06, 2025, Juergen Gross wrote:
> Avoid a name clash with a new general MSR access helper after a future
> MSR infrastructure rework by renaming the KVM specific read_msr() to
> kvm_read_msr().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 2 +-
>  arch/x86/kvm/vmx/vmx.c          | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 9c971f846108..308f7020dc9d 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2275,7 +2275,7 @@ static inline void kvm_load_ldt(u16 sel)
>  }
>  
>  #ifdef CONFIG_X86_64
> -static inline unsigned long read_msr(unsigned long msr)

Ewwww.  Eww, eww, eww.  I forgot this thing existed.

Please just delete this and use rdmsrq() directly (or is it still rdmsrl()? at
this point?).
