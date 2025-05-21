Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C921E082
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846255; cv=none; b=HItjvV9uwyc0poWelwuUvtpAW7ZglN9jp94pYy2WtAZARISWyp803XP0+Y2DkNMixJpxX+0tkosokQzM6DtQWRFy8EspkECs9Iqdz542GnFkpoi3/Qk1MDjOTl19ThGYeIuiaOdUY+o2woNV1yhGVldF+r1fdFILn1g+eplqXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846255; c=relaxed/simple;
	bh=ZqmTp0vdqeL6cANi7f/FJrj8wXnKnJZKTFI5l8ldFmM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oV9BIYEtP8DMTQMKDVhm+u9g77Fy/k9qUiaUX/QpDV9pwmNGV4LOs63KSq1qFJp6tXd2u4yyJ9T6bVJ0K8WGu/Tmr/6oaUKLiypSrMxbN99ihCZ6/FQ5ONnXhuwCwu8oLfgdjAndlsY1myACPg6QOyoudJ8kTlKB2ZuKnvOTO6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMT/BI8t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMT/BI8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747846251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjAixvvVyD2iBD9dJkuzfmZPAxf2QpS0W+zdD24rYYk=;
	b=KMT/BI8t7zJ2/Q1Uj2CHC+XAXsbdoCSL6ypETBEgLigzsuSjpAqaUNOh2E25VAZYzDLflj
	Il4P1Sig2J7A/vqqRfR4teRwUxTfD1RnBl7dciQ/cb3I9ok5Q1/JmiVW7KnrZFa5BLw0yq
	W2U/NXGsG+Fboa2JNjP4SA8LCktUKxA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-AYYbJrO6MzKahRVZ9tPzBg-1; Wed, 21 May 2025 12:50:50 -0400
X-MC-Unique: AYYbJrO6MzKahRVZ9tPzBg-1
X-Mimecast-MFC-AGG-ID: AYYbJrO6MzKahRVZ9tPzBg_1747846250
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so1241017685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846250; x=1748451050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjAixvvVyD2iBD9dJkuzfmZPAxf2QpS0W+zdD24rYYk=;
        b=QCepFqglzPusdF7hg5o5KW0icb4QZ9I4tdQA6ZV8nyTjiWd6KUTblH8whPhNPsuMCE
         QHHGpDhEzQT45uhqSNcP5zGGPYavQjfnbJrEiezOTDJ1O9goQSATZ4HyUO6VLghM2dct
         ONxKgr8+XWEaOS0hgTmApHnX8WS/YCioFki1aYOfTho82zzDqITWpBe5GelDRL+HEhuH
         GdmUuS28Ftf4GJjvqZuvsirozdMW0FRYgfJQ1TDVe4OyY2yFWGPipyeagAcC7LoBvzVb
         kW9FYiVTb+R1g4t24H8y9x8vkfrO8gbgaq266t0eVBgXlvgQFxbRJWu34IGMQUb8KbSj
         Exxg==
X-Forwarded-Encrypted: i=1; AJvYcCUF91qqUYQLPsO9keAxkJKGY49ldc1tn2YGsE90lo6YJhmW9IErjb4ri/W0gdOVY3LWtBhIABrd3AbQ6VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymacm3OiuwqvHOfJdtjwvpbnkVAqC5QYF4F3g/qWEiBdt/rXD3
	4dznjx20a5YJJeky7TNdj8oQxy/k6HhoNUOoDSpNqA88pA2DGmJoRMiovRg4OD30jlmhXt4mIzI
	8W9yz0d/uXHT4D/4D7nwxE3lNqIG2FYW+x1i3R/LI1KqmT29jKqtxr0/YPN9ZDKSWcQ==
X-Gm-Gg: ASbGncugT5nq9fJVVmSLUGBWbKRTEWYGdRSjBjjEbk4kUZvmYJL7b9DEbmpR33tBD6p
	TDDiMFr6uxHoCQ0vhFiEFBt1M1X7kDOCUVm4ybF9mmZFwazt4IYw6ZHB1IEujJjk4dmmV7J9cwu
	t7FQQyXWgGcK2Gi24aXO5I6ZLlTWjg2sIzbJVmEua1SG45/0C1CNpWGK+x8NyDCwyJu5qOzyg6X
	JdZUvglGb37e1YJ4tKF8n7Uy86hSKvTT9I3bHx0fAwGecD5sWIKLXOaGBPIWPva3XkvgC8pnm+7
	VZo9IvvmWUQScexM9JlwycbIV1eYebnXrZ+0GQzq/CE+c1BEIPDSMQvUYuo=
X-Received: by 2002:a05:620a:4454:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cd467affddmr3790930785a.53.1747846249864;
        Wed, 21 May 2025 09:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX3Vc1M1uoBzgve6vIVsbAt/e/9oWjTfkwdOyCXc0Sv8G9dYFq/4+D0r5mWMxD9yGbILZnLQ==
X-Received: by 2002:a05:620a:4454:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cd467affddmr3790927385a.53.1747846249549;
        Wed, 21 May 2025 09:50:49 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d7e65sm895887785a.35.2025.05.21.09.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:50:49 -0700 (PDT)
Message-ID: <dfd52ae3c91f28d31ef1aa176a1aee4a4b596df2.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] x86: nVMX: check vmcs12->guest_ia32_debugctl
 value given by L2
From: mlevitsk@redhat.com
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean
 Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, 
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 May 2025 12:50:48 -0400
In-Reply-To: <aC0fOC8IiQJShYOe@intel.com>
References: <20250515005353.952707-1-mlevitsk@redhat.com>
	 <20250515005353.952707-4-mlevitsk@redhat.com> <aCaxlS+juu1Rl7Mv@intel.com>
	 <d9ea18ac1148c9596755c4df8548cdb8394f2ee0.camel@redhat.com>
	 <fababe6628c448a4aa96e1ad47ad862eddf90c24.camel@redhat.com>
	 <aC0fOC8IiQJShYOe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-05-21 at 08:32 +0800, Chao Gao wrote:
> On Tue, May 20, 2025 at 05:48:44PM -0400, mlevitsk@redhat.com=C2=A0wrote:
> > On Fri, 2025-05-16 at 10:50 -0400, mlevitsk@redhat.com=C2=A0wrote:
> > > On Fri, 2025-05-16 at 11:31 +0800, Chao Gao wrote:
> > > > On Wed, May 14, 2025 at 08:53:52PM -0400, Maxim Levitsky wrote:
> > > > > Check the vmcs12 guest_ia32_debugctl value before loading it, to =
avoid L2
> > > > > being able to load arbitrary values to hardware IA32_DEBUGCTL.
> > > > >=20
> > > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > > ---
> > > > > arch/x86/kvm/vmx/nested.c | 4 ++++
> > > > > arch/x86/kvm/vmx/vmx.c=C2=A0=C2=A0=C2=A0 | 2 +-
> > > > > arch/x86/kvm/vmx/vmx.h=C2=A0=C2=A0=C2=A0 | 2 ++
> > > > > 3 files changed, 7 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.=
c
> > > > > index e073e3008b16..0bda6400e30a 100644
> > > > > --- a/arch/x86/kvm/vmx/nested.c
> > > > > +++ b/arch/x86/kvm/vmx/nested.c
> > > > > @@ -3193,6 +3193,10 @@ static int nested_vmx_check_guest_state(st=
ruct kvm_vcpu *vcpu,
> > > > > 	=C2=A0=C2=A0=C2=A0=C2=A0 CC((vmcs12->guest_bndcfgs & MSR_IA32_BN=
DCFGS_RSVD))))
> > > > > 		return -EINVAL;
> > > > >=20
> > > > > +	if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) =
&&
> > > > > +	=C2=A0=C2=A0=C2=A0=C2=A0 CC(vmcs12->guest_ia32_debugctl & ~vmx_=
get_supported_debugctl(vcpu, false)))
> > > > > +		return -EINVAL;
> > > > > +
> > > >=20
> > > > How about grouping this check with the one against DR7 a few lines =
above?
> > >=20
> > > Good idea, will do.
> >=20
> > Besides the above change, is there anything else to change in this patc=
hset?
> > If not I'll sent a new version soon.
>=20
> ...
>=20
> > > > > diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> > > > > index 6d1e40ecc024..1b80479505d3 100644
> > > > > --- a/arch/x86/kvm/vmx/vmx.h
> > > > > +++ b/arch/x86/kvm/vmx/vmx.h
> > > > > @@ -413,7 +413,9 @@ static inline void vmx_set_intercept_for_msr(=
struct kvm_vcpu *vcpu, u32 msr,
> > > > > 		vmx_disable_intercept_for_msr(vcpu, msr, type);
> > > > > }
> > > > >=20
> > > > > +
> > > >=20
> > > > stray newline.
>=20
> Can you remove this newline? (not sure if you've already noticed this)
Sure thing!

>=20
> Also, the shortlogs for patches 3-4 don't follow the convention. They sho=
uld be
> "KVM: nVMX" and "KVM: VMX". With these fixed,

Sure thing - I wish it was more consistent but you are right.=20



>=20
> Reviewed-by: Chao Gao <chao.gao@intel.com>
>=20

Thank you very much!
Best regards,
	Maxim Levitsky

