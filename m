Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F8182B4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620204; cv=none; b=eiBTB7irquQl5Y+Oaz7h7eLRwaEypVPQi/Su/zI0lk30Y4Qkm7lp5fYRxWzK64BjcaDA/J7HlCD4k7Sfzvw9A7qlWg8ZqGPmqKx/5iv8ruyR9mhCO0Ip5WcO9NvZGAA2/+lFLyBv3AkiFByIVHJ7d7f5xlo6yt68ixPvdswJ99s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620204; c=relaxed/simple;
	bh=eUs8Te/3qXoZlaU+lsAvePAAnsKpOkJeJh7kJfdkLCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SZXZtzS6vUS8r8J4m4z7Q4sLqtiPzKtz1qlDjQ3dUSqRXRqBgFO24vf1F6pIDksJ44bipE/GnAK/I5mACHlEHWArK6nvyLvoy9EP+mHpaKqP95ZWVHM2rZDSwN2vLYDk4/WMOC0yWHAkxAtgwbAQ5O2+iMEQv07AlG7qGRDjDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPJ2uRMi; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPJ2uRMi"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166855029eso100398315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738620201; x=1739225001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=WPJ2uRMiUJgM3bQQsNM0Pkc059XwMwbqMjwDrLf12HbZazcBH6CoADNUnHYoD+jAs9
         Rz+YAr0JLfqY2XYXrNhfRt+Zossr5jIUb6Pqiw6aXH+Q5UTRDPKLWNQ0OXD9BBEQq9+W
         qUJS9XK6OoJh9bBXWhk4zGremufxG+KfWicSX5TbiFEgPnT2Th9+MZ8aHV0GKmNvc2Xd
         Y3N8uuxzAYuG3RuSDRiNs77a9c9f58rwxduJW8XD6iPtSAB7pDPRq9PtkyHsYOFnpOTo
         piNErgqNgahCjZXwYAzpEpBCIPfZZ79SHj+DC3GIb9SqgrE+dQZdaovkGtBSYGJWqzzQ
         Lvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620201; x=1739225001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=FNuqUXdHGcl1xLE/4yMpnDKPaeSlShXV00eFG75k+Y7k8GhvHJqFalku2OIkx7QYIZ
         Zp+01oi9LGCFgpTeb4Ck+gLkmIHoLzLPWVkYnl2xiGz5TEh9lWEI9u0E8SxyYBjfjJx1
         KDeWKbm9lonXeF0h+/33UTdlsLCySpdPDTwN3tQyN/SiaETIDpnx7rRUpYE8dOJAIAeT
         fPlAvDrHepMwLGwsFnLecpaOwZ8mLAwwANDGXiapiVnjzFKytBKk17xpY7g0DsKMcgyU
         tIq4WHfKbIZXU6L9ga+s3ZANBqcTwr/umdG0zP2CzUjZUtHgOgfBvYyoM1fMPrDHuY+p
         fqdg==
X-Forwarded-Encrypted: i=1; AJvYcCX2SeU/7VLuFlzxPBW13az4MlG5HSMTdjsdizF593DbNKx8wzXIKCkwKldvpw5FxwMa4nejiOBtsxDzNn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDYpMg0QUUHznz7PdHQme76i7+5hjPwb/cXTD88zHP7IfwcSm
	XO9BOARCopJE1AvVr5vSaS/8MHT83rLqkepy1NdXV5aO3F0SRFcUV+Ot6OkmT6qa6koKGOLXqUD
	wCw==
X-Google-Smtp-Source: AGHT+IFdBp/YFKt3tvbP89npJlfJHjx2Z4+9Qkgevwe01Rjz28QPVaPLsqR/RKs2uDbYm8l82lXHNvJ4gI0=
X-Received: from pfbfb39.prod.google.com ([2002:a05:6a00:2da7:b0:728:e945:d2c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:acc:b0:71d:f2e3:a878
 with SMTP id d2e1a72fcca58-72fd0bc6c50mr33717772b3a.5.1738620200924; Mon, 03
 Feb 2025 14:03:20 -0800 (PST)
Date: Mon, 3 Feb 2025 14:03:19 -0800
In-Reply-To: <855xlra7yh.fsf@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <855xlra7yh.fsf@amd.com>
Message-ID: <Z6E9JyybI6SUWlcG@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 03, 2025, Nikunj A Dadhania wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> 
> s/kvmlock/kvmclock
> 
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> 
> ...
> 
> > +
> > +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> > +				     unsigned int *crystal_khz)
> 
> Should we add this in patch 6/16 where it is being used for the first time ?

No strong preference on my end.  I put it here mostly to keep each patch focused
on a single subsystem where possible, since the series touches so many areas.  I
also wanted to show the "full" API in a single patch, but I agree that adding a
helper without a user is generally undesirable.
