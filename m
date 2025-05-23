Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28AD29374D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022539; cv=none; b=dBGrDo3rL1aAs5bHQF3raaNYns3koQip/ypgWH8oS4LFB/HO6Z99KRU0FbJenXMOFPmSOxNeA/AVmUjqiDgfoFgKvV9vkr9Y2IpYJnpia/KEne++uTP1E+CLo8lPhCcgQukYFb3MF93ZPi0Kzmgc7LsQynje35T2SqC0tQDoETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022539; c=relaxed/simple;
	bh=YdxTLRyayHOS5UpkeNQKmvSD0XC3jAg8KZ9fVAPOWLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TsNZQh4viaPwVTSEnekq363TPYKX7Uzy54LllchvIEs0yhwcoxQAewxyOPTiN3qvz75W2ytle5PUZ9InKxO8yJPfte/4tePsnXUFHZX0Qu1KurBOA2i4KClV7SnkqubsLBTi5TXjRmh7cWbPWzdYqai+euG5ZCGGb+CIIKQMI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oyWkBaZ6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oyWkBaZ6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-232054aa634so981225ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748022537; x=1748627337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mo5bMDbHVSJazQ1e/pcH3/N64EdMqiQcACWP47NA950=;
        b=oyWkBaZ6QsMkpr3qdkezuv1/iiQZsg9UOmCJOTlJbbpR/dTGM0Q9VBWkWeaJKLwDNE
         Dtas65zlVu+ARgU2upM0wk0ENHxcDfw/mBOLXFOH1KBlGRR8TpvUQkhVUGWZmCpMDrli
         VAx9xlVw5XI105jle/H5QzMoQf88DiPSznM2cMlNbf3f9w7uFr7cTVf3E0wVuPBH9flR
         EhyHbsh0L1QeXMO1SqxRtBWVfzVSWfaGBXVvjv9lvFamUEWsDffi3UT2qeiEEZfXzJ9m
         JQvCsBicRyTzw4nMB6kUXPuld9DyjMfgP01SZWkHm3Go9SVJE1IB7EvaH2guzN13ew5W
         uoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748022537; x=1748627337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mo5bMDbHVSJazQ1e/pcH3/N64EdMqiQcACWP47NA950=;
        b=kNFCUiraS7aPNJaSjBrKLTEEJCV3sHsN/p0KnZJSYU6k2uF8UpllpyxDbOITo3DkeH
         IM8CY3CzB5bybvca+Tcdgw4itqTd6om5TMOdJY4RXWAnMUDvLYX/fATaOf9KSXmml9N9
         sTfpHoejsCsm0p4Gg+XA/4hXpy7E2oKR0XLw9Ry2FdyUwzr5z8fC0ePxvbbKuESyEuiq
         +XgvQ7xRXaKv5yGFqOcycnhBObZBw5Kw899+R3HkfipFFc3CNUnjIvftumC3tB5jvoKa
         SkWYrupHv5kyYPM0rJ41lxw8bmdfTzsI1Hh3HReA099scSR2fGlRgYU07L7MzHeHSL/P
         F5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZfhcf0qVUCKz8qmFsM4g7gV+owQ6DZipJs/v7Amq+FWymhWWRzGcjU9iP6bLmehImgeTLwUmD+WtOStU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdag4mA0yG5DaMRbUstMpxEINHDxiJlrQGGeMqjFs16WEedwkr
	tyVRcn+sT1P4tncwbByu+iH0bpI5Ne3Yqp04KERm7fUX7pJt4TrdaeOpzPlPNKwFKVv/M/532OH
	DlsOAYg==
X-Google-Smtp-Source: AGHT+IGx2i+SqkzSF8nq3OQu87/rV+LA/G68zm9ksb1Iva+HscegTRNIOUK9OkttU2BD53WwIKsXNAjwyTA=
X-Received: from plbay9.prod.google.com ([2002:a17:902:8b89:b0:234:11ef:3a93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19f0:b0:224:10a2:cae7
 with SMTP id d9443c01a7336-23414fb2509mr4395795ad.40.1748022536950; Fri, 23
 May 2025 10:48:56 -0700 (PDT)
Date: Fri, 23 May 2025 10:48:55 -0700
In-Reply-To: <f575567b-0d1f-4631-ad48-1ef5aaca1f75@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522151031.426788-1-chao.gao@intel.com> <aDCo_SczQOUaB2rS@google.com>
 <f575567b-0d1f-4631-ad48-1ef5aaca1f75@intel.com>
Message-ID: <aDC1B-ngse3HGh-7@google.com>
Subject: Re: [PATCH v8 0/6] Introduce CET supervisor state support
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, tglx@linutronix.de, pbonzini@redhat.com, 
	peterz@infradead.org, rick.p.edgecombe@intel.com, weijiang.yang@intel.com, 
	john.allen@amd.com, bp@alien8.de, chang.seok.bae@intel.com, xin3.li@intel.com, 
	Dave Hansen <dave.hansen@linux.intel.com>, Eric Biggers <ebiggers@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, Oleg Nesterov <oleg@redhat.com>, 
	Sohil Mehta <sohil.mehta@intel.com>, Stanislav Spassov <stanspas@amazon.de>, 
	Vignesh Balasubramanian <vigbalas@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 23, 2025, Dave Hansen wrote:
> On 5/23/25 09:57, Sean Christopherson wrote:
> > Side topic, and *probably* unrelated to this series, I tripped the following
> > WARN when running it through the KVM tests (though I don't think it has anything
> > to do with KVM?).  The WARN is the version of xfd_validate_state() that's guarded
> > by CONFIG_X86_DEBUG_FPU=y.
> > 
> >    WARNING: CPU: 232 PID: 15391 at arch/x86/kernel/fpu/xstate.c:1543 xfd_validate_state+0x65/0x70
> 
> Huh, and the two processes getting hit by it:
> 
>    CPU: 232 UID: 0 PID: 15391 Comm: DefaultEventMan ...
>    CPU: 77  UID: 0 PID: 14821 Comm: futex-default-S ...
> 
> don't _look_ like KVM test processes.

Yeah, that's why I haven't dug into it, I don't really know where to start, and
I don't even really know what triggered it.

> My guess would be it's some mixture of KVM and a signal handler fighting with
> XFD state.
> 
> I take it this is a Sapphire Rapids system?

Emerald Rapids

> Is there anything interesting about the config other than CONFIG_X86_DEBUG_FPU?

The only thing I can think of that's remotely interesting is CONFIG_PROVE_LOCKING=y.
Other than that, it's a pretty vanilla config.
