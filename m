Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9A20E028
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606925; cv=none; b=F/L09GLBRY/jczhRXkksiSGlmziWrcx8i5LwyUSTP9qUGmfPJht7Cp2WDba1NCE8kuD8CDKXg4v70yrjf6298xoUy8fu78wfVE8St/npV+0AyMjVIOQ9v74i9x/+KQFd1E4eZIaBrYAInxqXOGm60Rj6MVkmykvZ/oy4GCcihHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606925; c=relaxed/simple;
	bh=28LdHPYUIggbRJom5lYWWfHr3ToftE4xYha+OX3oJpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU6zUrCj/TGl6vgVbx/BF2n+3YTmCYOyna/1rC4aaMzDdFUEi5OZKY90LsmCNmq1pMPL79TRe9CXoMNUFcNZlsoG75AebGnKqo2WBzCFdWt+JQqBdzyISL2U9AnFE9zErsAQnSTU3zc6EHToIH70J1tmBhcdXom98BmJ1cgClik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoSSEJ2S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoSSEJ2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738606922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2nlFOMn1lH29kDa2Jrx7xgjpzbwJvO/qQCiLXJ/5Xg=;
	b=EoSSEJ2SzGb4FRZN48UE6TAw1Eu032cp8ZzfQAUy9JOX0G9A48938zEg9DHKzt2S4vBLi3
	lAiT/xGIcklvr1ngE9qcL7mAGeOBAQEtHGvJOo94DNNjG541LM38KiI/+km44uq3yCr+hm
	FCZa7gYtFc1FM8EoiJHmbybAH10FHIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-v1dHouQIPYq0DS6_PzJUXA-1; Mon, 03 Feb 2025 13:22:00 -0500
X-MC-Unique: v1dHouQIPYq0DS6_PzJUXA-1
X-Mimecast-MFC-AGG-ID: v1dHouQIPYq0DS6_PzJUXA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43628594d34so24661605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738606919; x=1739211719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2nlFOMn1lH29kDa2Jrx7xgjpzbwJvO/qQCiLXJ/5Xg=;
        b=VUd27s3gwfwzwjXbc2g/MtIe8E24yLX8EmkA8saDG0XFOy/xMFTADXpfn6yaoIyetH
         Pnlf+BV/hSgLzPsONHbNcQT0sAwNI+P5fiYOD6NkLdAfRDJLxzro/CUQ/1cHqm8BwEj8
         86RA19X7nDr0Qi1R4xK3AFCJDqXIvRcSdx7tfa01OCGq6T4bMuH0cBfEitMxJ8qKga/W
         enSKshW7k0bcJtVdhrGQVABYjmfweeH5n8iS2C9yR46DGjw9Ubqr0UI5gXQ2QFHSIiCt
         HDTPs0spm0pTR+3c+S6ZifQpE8FVm7NVM0sJy/LZzof/I7jksPKooXvu1yBFp0Rxf69u
         tHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO7mKsEpR4uXU9nWSZGB+96Lf6mAKyRvPX5cNRpDpEnWomH2zWgpSQgct8qe6OYyjfket1Eqe8HRhmORI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww388t1/kvTZz78eExO0judmKBbyXg6lusBuBSVA/IqjAk7JeF
	uteKV0sKwtNKAwzW15Tp9RAofQqVWJFyYmb+0CGcNkHjrjTXgv1pVHNl0acHpUZgvc5H0C/eAkP
	ViDHhA47K6aQI/3EGSBFQOmKJfeRJf8Czaw7HKcNqfOHQ0n/K+84HpA2ibPtmWQQZef5hW6IVCv
	74cHSAGGoJE/FavEY+xfhRWHlM5DlyO4eraRJS
X-Gm-Gg: ASbGncvvQdvR72plASe+rc7YT4Nroqj/lOkg2o9TgFN3RNYclW6V0a+b//sFiosIJVW
	IYUfPgeP3MjtkzJUHCs0lr3XrSJCq53A+w2wW1fgORn1a1faWU70FZ8kCS3sA
X-Received: by 2002:a05:600c:35d3:b0:438:d9f1:f5cc with SMTP id 5b1f17b1804b1-438dc3c3983mr208354615e9.8.1738606919487;
        Mon, 03 Feb 2025 10:21:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz7WFFlkh702aL2lV+rs/ZKODFLjI/rvxvV7aVp0t9rlFGn4otyohrTVaegFBxoOtK19Bv6wDrLLCiUaiWHss=
X-Received: by 2002:a05:600c:35d3:b0:438:d9f1:f5cc with SMTP id
 5b1f17b1804b1-438dc3c3983mr208354385e9.8.1738606919110; Mon, 03 Feb 2025
 10:21:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=0YZ3j2gGhgmaFRdCFg@mail.gmail.com>
 <c3026876-8061-4ab2-9321-97cc05bad510@redhat.com> <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
 <CABgObfZEyCQMiq6CKBOE7pAVzUDkWjqT2cgfbwjW-RseH8VkLw@mail.gmail.com>
 <CADH9ctA_C1dAOus1K+wOH_SOKTb=-X1sVawt5R=dkH1iGt8QUg@mail.gmail.com>
 <CABgObfZrTyft-3vqMz5w0ZiAhp-v6c32brgftynZGJO8OafrdA@mail.gmail.com>
 <CADH9ctBYp-LMbW4hm3+QwNoXvAc5ryVeB0L1jLY0uDWSe3vbag@mail.gmail.com>
 <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com> <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com>
 <Z2IXvsM0olS5GvbR@google.com> <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
 <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
In-Reply-To: <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Feb 2025 19:21:47 +0100
X-Gm-Features: AWEUYZkfTYWUXYOngTDyrNZ6kf3UUSURUuAlnD5-9-ZGJoFpmKmFYKS0QywhxK0
Message-ID: <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Doug Covelli <doug.covelli@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 5:35=E2=80=AFPM Doug Covelli <doug.covelli@broadcom.=
com> wrote:
> OK.  It seems like fully embracing the in-kernel APIC is the way to go
> especially considering it really simplifies using KVM's support for neste=
d
> virtualization.  Speaking of nested virtualization we have been working o=
n
> adding support for that and would like to propose a couple of changes:
>
> - Add an option for L0 to handle backdoor accesses from CPL3 code running=
 in L2.
> On a #GP nested_vmx_l0_wants_exit can check if this option is enabled and=
 KVM
> can handle the #GP like it would if it had been from L1 (exit to userleve=
l iff
> it is a backdoor access otherwwise deliver the fault to L2).  When combin=
ed with
> enable_vmware_backdoor this will allow L0 to optionally handle backdoor a=
ccesses
> from CPL3 code running in L2.  This is needed for cases such as running V=
Mware
> tools in a Windows VM with VBS enabled.  For other cases such as running =
tools
> in a Windows VM in an ESX VM we still want L1 to handle the backdoor acce=
sses
> from L2.

I think this makes sense and could be an argument to KVM_ENABLE_CAP.

> - Extend KVM_EXIT_MEMORY_FAULT for permission faults (e.g the guest attem=
pting
> to write to a page that has been protected by userlevel calling mprotect)=
.  This
> is useful for cases where we want synchronous detection of guest writes s=
uch as
> lazy snapshots (dirty page tracking is no good for this case).  Currently
> permission faults result in KVM_RUN returning EFAULT which we handle by
> interpreting the instruction as we do not know the guest physical address
> associated with the fault.

Yes, this makes sense too, though you might want to look into
userfaultfd as well.

We had something planned using attributes, but I don't see any issue
extending it to EFAULT. Maybe it would have to be yet another
KVM_ENABLE_CAP; considering that it would break your existing code,
there might be someone else in the wild doing it.

Paolo

