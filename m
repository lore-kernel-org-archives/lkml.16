Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6E1DE88C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224418; cv=none; b=rn0GwHLyWN5ixOgF6sl/PUf6o/H5485bwC4b4V3HyoZpDGIA9QR/0J4ulXcoxjiJHbXL3EL4kl/6vCMFz5eNp3V8xp1rhUwv8Q/+FeHV+pp5VKxvIguXF9FOxZk14ERj+q5cKdxWd7uL/ujPTGrwXuJJ1zzrpfoUDHD3SWTGsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224418; c=relaxed/simple;
	bh=CoanTTMT0CbufX4KvUSMVSuYCLAneonzZauwp79/Uz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqI+nsFMp0wPzeYMw7owaqnlaWahOPnvZrGQpFGHlPe5x5ZvFGA5mTvtU+u2BinkOlntlo4w/fr/7+rtRuImKbAzbTgLjje9/O7okddGWV2DMn5VZ8f3NvB3E4PXqhvHyXkG55n9uAj/U9LPqoXrQlUtE1zBkR0v27K8+SrC3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0v7yDk8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0v7yDk8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e789411187so2116a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744224415; x=1744829215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL64O1VAHEysyhdQpgZlOywhE8fp5eAQ0KtkfehCFRM=;
        b=a0v7yDk8PiLs8fYzjzWqEg2YPe6/gOk3372SMlsf3TdQ3cQhYUR2fF5gPH6RvXdD28
         J/MCCxm4Hoa3Sl9WtYcxEr1/Njayo9QarBsE7YT5ohgNSPko54DhEF44BbkUvi/HsYzH
         z6YKE5s4dmHKZQXyUZFmyOkwz85UgusC0l9eH8Vzz6wpZYinJ6629DYDPKKJhKHcItxM
         9lleq62sGWNsKzzeGkQNbgQjegNgV9qMZm/7NHFnzdCQ0Nz7aMrPbw3JgVmIwvbdmfZ3
         eoLZFoPgEUP3I5CH9fF0ktgqrudSQJzp/ZB/Y/1dA0ppURBFboKLr4p5vG57t13yNQmD
         bjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224415; x=1744829215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL64O1VAHEysyhdQpgZlOywhE8fp5eAQ0KtkfehCFRM=;
        b=T88idPtnuBHIb1geBe/dBqQVhU/p+5VHDvlDK9/vbjGFXuZ7vyLpB8GTa3XZJCs6o9
         oDDtLMKtSUVHXMT1aTWKWgr0VuK4IQpwZhpX2QE1Iv4kiwfedSsDXBykUWd1fRw/HoBZ
         BVBmwEj6+LKWoWvBTScGB3ye3CJzI5ZeV7Wic+D3W7X/cPUxGelQWvjFAxDMKr62vyRc
         3OS2ImD+GQOGTT/wyTMF2eDtxFiDUhAM8gPfkjq1cjyARxRuNCq3+5I0x6duf/sMMKo+
         6fAKpIZ16ZcohDyak/lh0W7ZwGSY/CUjF9K1vIBrso/DzXD6avtKq7yWNjHEqcuW6PI1
         +rqA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3oTHmSLFr4Wn+j5EMZ3qDsXcNXaiBOQgMWE7cFdBiVH+8dXQZHtMtVZsLOZQa4MvHrXSPmMiGNrfPMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTRRl1uNS3fJ2/jm9zd6FLT8a0sbSWl5cZY0IHI88ZWRU3pkC
	SOsTnXNnrr7xQbabMTF3SYEtk916g9nDAzUzPKj16ZviuLaDM+gcb6rHIipv07+KeT6+2ROlhGq
	OSQ8ZfBNptQU2byaZeMKni9WUssAuwUlNuUKI
X-Gm-Gg: ASbGncsNXVhhhMZKC1mglvoxjD3CLrtxDIMA6Je3rZZX+jINQL6PX6KjUiSVYRBJgag
	5W4CJgE9pnrGrSVJT3m+46SGFRKLaV4NVKqqKsTa/Awn8qziCyWMevFTtru/uioIb8e6KClbxLL
	oyxsch/Zbmh/bZb53nlyqBxA==
X-Google-Smtp-Source: AGHT+IEA0hCFNGoOpzSxPL1RWxfu+gtod9jSAlUasewta6jPrr465b7oOTz4uOLf2/FJuHgEEGA//dmDeNFMK5xxuOo=
X-Received: by 2002:aa7:dbce:0:b0:5eb:5d50:4fec with SMTP id
 4fb4d7f45d1cf-5f328d1f297mr872a12.0.1744224414454; Wed, 09 Apr 2025 11:46:54
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743617897.git.jpoimboe@kernel.org> <df47d38d252b5825bc86afaf0d021b016286bf06.1743617897.git.jpoimboe@kernel.org>
 <CALMp9eTGU5edP8JsV59Sktc1_pE+MSyCXw7jFxPs6+kDKBW6iQ@mail.gmail.com>
 <fqkt676ogwaagsdcscpdw3p5i3nkp2ka5vf4hlkxtd6qq7j35y@vsnt3nrgmmo5>
 <CALMp9eTHsPeYi7wLaWtp-NuxE8Hz_LZUFYKUfzcx1+j+4-ZjmQ@mail.gmail.com> <LV3PR12MB92658D9E1EBD4C38C035B19594B42@LV3PR12MB9265.namprd12.prod.outlook.com>
In-Reply-To: <LV3PR12MB92658D9E1EBD4C38C035B19594B42@LV3PR12MB9265.namprd12.prod.outlook.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 9 Apr 2025 11:46:42 -0700
X-Gm-Features: ATxdqUFKbYO0YhG-LPKyugRZVoyXQkxn_BhcPUkID_Chig4x_vZU89LqrTfo_hA
Message-ID: <CALMp9eRwEJ7GcbgtRw5arT+zmtCkOqB5n3qw25EyhdcbDuqthg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/bugs: Use SBPB in __write_ibpb() if applicable
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amit@kernel.org" <amit@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Shah, Amit" <Amit.Shah@amd.com>, 
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "bp@alien8.de" <bp@alien8.de>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org" <peterz@infradead.org>, 
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"seanjc@google.com" <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>, 
	"kai.huang@intel.com" <kai.huang@intel.com>, "Das1, Sandipan" <Sandipan.Das@amd.com>, 
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "Moger, Babu" <Babu.Moger@amd.com>, 
	"dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:29=E2=80=AFAM Kaplan, David <David.Kaplan@amd.com=
> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> > -----Original Message-----
> > From: Jim Mattson <jmattson@google.com>
> > Sent: Wednesday, April 9, 2025 11:07 AM
> > To: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: x86@kernel.org; linux-kernel@vger.kernel.org; amit@kernel.org;
> > kvm@vger.kernel.org; Shah, Amit <Amit.Shah@amd.com>; Lendacky, Thomas
> > <Thomas.Lendacky@amd.com>; bp@alien8.de; tglx@linutronix.de;
> > peterz@infradead.org; pawan.kumar.gupta@linux.intel.com; corbet@lwn.net=
;
> > mingo@redhat.com; dave.hansen@linux.intel.com; hpa@zytor.com;
> > seanjc@google.com; pbonzini@redhat.com; daniel.sneddon@linux.intel.com;
> > kai.huang@intel.com; Das1, Sandipan <Sandipan.Das@amd.com>;
> > boris.ostrovsky@oracle.com; Moger, Babu <Babu.Moger@amd.com>; Kaplan,
> > David <David.Kaplan@amd.com>; dwmw@amazon.co.uk;
> > andrew.cooper3@citrix.com
> > Subject: Re: [PATCH v3 2/6] x86/bugs: Use SBPB in __write_ibpb() if app=
licable
> >
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Wed, Apr 2, 2025 at 7:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.=
org> wrote:
> > >
> > > On Wed, Apr 02, 2025 at 02:04:04PM -0700, Jim Mattson wrote:
> > > > On Wed, Apr 2, 2025 at 11:20=E2=80=AFAM Josh Poimboeuf <jpoimboe@ke=
rnel.org>
> > wrote:
> > > > >
> > > > > __write_ibpb() does IBPB, which (among other things) flushes
> > > > > branch type predictions on AMD.  If the CPU has SRSO_NO, or if th=
e
> > > > > SRSO mitigation has been disabled, branch type flushing isn't
> > > > > needed, in which case the lighter-weight SBPB can be used.
> > > >
> > > > When nested SVM is not supported, should KVM "promote"
> > > > SRSO_USER_KERNEL_NO on the host to SRSO_NO in
> > KVM_GET_SUPPORTED_CPUID?
> > > > Or is a Linux guest clever enough to do the promotion itself if
> > > > CPUID.80000001H:ECX.SVM[bit 2] is clear?
> > >
> > > I'm afraid that question is beyond my pay grade, maybe some AMD or
> > > virt folks can chime in.
> >
> > That question aside, I'm not sure that this series is safe with respect=
 to nested
> > virtualization.
> >
> > If the CPU has SRSO_NO, then KVM will report SRSO_NO in
> > KVM_GET_SUPPORTED_CPUID. However, in nested virtualization, the L1 gues=
t
> > and the L2 guest share a prediction domain. KVM currently ensures isola=
tion
> > between L1 and L2 with a call to
> > indirect_branch_prediction_barrier() in svm_vcpu_load(). I think that p=
articular
> > barrier should *always* be a full IBPB--even if the host has SRSO_NO.
>
> I don't think that's true.
>
> If SRSO_NO=3D1, the indirect_branch_prediction_barrier() in svm_vcpu_load=
() I believe only needs to prevent indirect predictions from leaking from o=
ne VM to another, which is what SBPB provides.  Keep in mind that before SR=
SO came out, IBPB on these parts was only flushing indirect predictions.  S=
BPB become the 'legacy' IBPB functionality while IBPB turned into a full fl=
ush (on certain parts).  If the CPU is immune to SRSO, you don't need the f=
ull flush.
>
> I also don't think promoting SRSO_USER_KERNEL_NO to SRSO_NO should ever b=
e done.  When SRSO_NO=3D1, it tells the OS that it can use SBPB on context =
switches because the only process->process BTB concern is with indirect pre=
dictions.  The OS has to use IBPB if SRSO_NO=3D0 (regardless of SRSO_USER_K=
ERNEL_NO) to prevent SRSO attacks from process->process.

Thanks, David!

Conceptually, it sounds like SRSO_NO =3D (SRSO_USER_KERNEL_NO +
SRSO_SAME_MODE_NO). You don't need an IBPB between L1 and L2 on
SRSO_NO parts, because SRSO_SAME_MODE_NO is implied. Similarly, you
can't "promote" SRSO_USER_KERNEL_NO to SRSO_NO, even absent SVM,
because SRSO_SAME_MODE_NO is missing.
