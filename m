Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD825E44D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856349; cv=none; b=ubsLk0KPLF+V8aJGvpTewErYpzztwnPbjVy1m6rmFrjDOq/qW0q78kbK/kQxniQ+jNn1F7nbBJiCFXnUwTgtZs15/xsifQlucuSz+sqPI4yiSRmIqFQM5wOvBUxd2dWIAv9gvNrmvL1q9LGDJ/ymoaLUvBYKYThjVNt4Q53+Zuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856349; c=relaxed/simple;
	bh=omSb4qtffp8wKfjxeF+cs4XkxHLiftOc0485WaPmKr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X15sU6ZZdvTZmdtCoj4eDLhZDZKUh0zZ7bl3d/W14aZ5jryaTjR38b43wLYY640jNtz9Bz4Yqn5/QtnTGZ2aWwEcr9NYcamJI4O9YTUwlMlEqgg2RNUGBDQHg3Yglr8NB+odjZqNTTCENc8ibFbvQiCc4wiihIoxJ1J12CMfo/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgD2rISE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgD2rISE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b3184712fd8so5148984a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750856346; x=1751461146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxIJ4aQC+IjPoRxmkOWSPu5mR2v1UrY8osqVxd/rWGo=;
        b=YgD2rISEmIjCkeWL/GZXsDdayMEREwYQ72YwmK8Q7XiBgVMKgtr1mKgNy/agb5bljK
         1bPr8VlnBGqZ3DtaHo3CB9JSTzgrfia6iZWyP0ssZ9+VFW04VKYN1z11Tu8mdnWTryZ3
         cu7JgJX42jDoQoAGaOVcp/6Vc6/mcwh2lCNC1b+RD5ifEMeqR6+zVW5ShTCH6fzDrk9U
         1LafOplOV0jW+STFin7QukSMGb/W9HCwRt900K+DpsAucaBDkmV77m+WegZmHvcAbMug
         k/K1XjdTH0TI5GAh7gaZMEk0HR1eHW63xpxicPOm8aO9ot3lMI0vTOlN/7/ymsHSP9yM
         M4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856346; x=1751461146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxIJ4aQC+IjPoRxmkOWSPu5mR2v1UrY8osqVxd/rWGo=;
        b=IZzojj3qxaCxo8+0hUFDveVy5r3Sg3/ue6ieQSYwbZl11v8+641kak2VazzVSfn3F/
         Q0NyKV9dnMl3zJfaFm0iuznJ1nL2dARf08kMebumv3sgyd7bKlTLYQwv7hqTePo0eBAq
         HAMbWxJc2HTwajRhk3J5YVCULKf65InISCQ4UCXSEGuUqZV8INbL3QFYRB2E/4aopBGl
         cNc8Wgi9/P0MpFVyze9b+IYdQTGl1wA/4evia3onE5pVuESLC3XHHDr9F8lJELjh2SJR
         IkolzOFEa2897nGhSTlXv/7j5kHl23ZLyUmqvPYRB1qQIX1gdPNVQKbUA69bECozXjK1
         +yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2pJFDixjPHOSPh1Gq1f6Jf7BoWMwrZtPYqT6Jree5Bu+7bHoohaHB/Bbrnc9zM8u2zfOh2jtElzED6ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZfnPmFybArg0TQveFa9w9NdSIgIzzUZd2tU/KfQUrJpWLjyp
	Tk7UxvhWipVhJShtdFnnHKpNkaIqI9JiyrDOa+/op5+x8u8FHwvS6wPN3qrmtW6Ujt/0WRmWKcu
	1Z0CP6g==
X-Google-Smtp-Source: AGHT+IEhIwcr6ikR86NXDpgfcAQublPKVJCRuEFifK28YdTxbvKmmfgddvnr2t043GixUvzzZ12CrvVkj/A=
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:311:eb65:e269])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0c:b0:315:9ac2:8700
 with SMTP id 98e67ed59e1d1-315f269caabmr4382059a91.24.1750856346092; Wed, 25
 Jun 2025 05:59:06 -0700 (PDT)
Date: Wed, 25 Jun 2025 05:59:04 -0700
In-Reply-To: <24675ed2-e3ae-4473-9d8e-acd378da220c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610175424.209796-1-Neeraj.Upadhyay@amd.com>
 <20250610175424.209796-4-Neeraj.Upadhyay@amd.com> <20250623114910.GGaFk_NqzGmR81fG8f@fat_crate.local>
 <24675ed2-e3ae-4473-9d8e-acd378da220c@amd.com>
Message-ID: <aFvymAS-pXMwkmjX@google.com>
Subject: Re: [RFC PATCH v7 03/37] x86/apic: KVM: Deduplicate APIC vector =>
 register+bit math
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com, tiala@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 25, 2025, Neeraj Upadhyay wrote:
> 
> 
> On 6/23/2025 5:19 PM, Borislav Petkov wrote:
> > On Tue, Jun 10, 2025 at 11:23:50PM +0530, Neeraj Upadhyay wrote:
> >> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> >> index 23d86c9750b9..c84d4e86fe4e 100644
> >> --- a/arch/x86/include/asm/apic.h
> >> +++ b/arch/x86/include/asm/apic.h
> >> @@ -488,11 +488,14 @@ static inline void apic_setup_apic_calls(void) { }
> >>  
> >>  extern void apic_ack_irq(struct irq_data *data);
> >>  
> >> +#define APIC_VECTOR_TO_BIT_NUMBER(v) ((unsigned int)(v) % 32)
> >> +#define APIC_VECTOR_TO_REG_OFFSET(v) ((unsigned int)(v) / 32 * 0x10)
> > 
> > Dunno - I'd probably shorten those macro names:
> > 
> > APIC_VEC_TO_BITNUM()
> > APIC_VEC_TO_REGOFF()
> > 
> > because this way of shortening those words is very common and is still very
> > readable, even if not fully written out...
> > 
> 
> Sounds good to me. Will change this in next version (will also wait for Sean's
> comment on this).

My vote is for the long names.  I find REG_OFFSET in particular to be much more
self-documenting.  My brain gets there eventually with REGOFF, but I just don't
see the point in shortening the names.  The only uses where line lengths get a
bit too long are apic_set_isr() and apic_clear_isr(), and the lines are still
quite long with the shorter names.
