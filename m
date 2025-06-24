Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260C2185B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805045; cv=none; b=Bp0ugwKG2XZpb1egpv+BaLRbqDitY1vlqJ3QVh2+j7mSIVJzHoxO3xZoE6caxMof8slUZX2/c0HKqoMh7PemSL/LUODNpokVVzdrFDdfpyhej5pTar5CCffNvD+QM5wtkwSNns/n2MiDm39Dk9dfXvZlywURcaMGeAXajQLopek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805045; c=relaxed/simple;
	bh=sEjeNz6XVbqxcAMmeIAkOrGragIgi5IlG99hp7QV1qs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IIUHWztQonaAZidKZ1p+3JJUJrzY2rkchYSOFyYmsAwUXEFtPe6sa4Uvb0WmZwbJYXMfvSWjg5roDUm4D4+NeuRzGdxoEsiJvUBOQTHGmaqKMabH/tjrDvOS7uOGOj9LJZvJmlw8K/inAoqzT/OYAOjklq3JmwsuTWINlZwByE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qAkMi97i; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qAkMi97i"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so1283015a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750805043; x=1751409843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlCQKpWDxdcaUfXy65m6pPBMQjRdo74zK+bm+Y7bE4U=;
        b=qAkMi97iD6ZirZm+nh1OLNaXdnlS1aPG/H0w9b7V6dZjYx2Nkb1x7hRxR1+LaunJU5
         5Uz/P2BTv9R5vHHYb+Or8JB4l/DGIZsVdJmQNSTyeqdr/RjX4bxmnzZGnYK7vN4ZNcn5
         j/3F91Typ4isuieTDzeIQol5KP+w3KMmaf/Vpzcc1SQoc/drHopOLB5OBUzpKipwVaVb
         SMmXptZlE9vE3llN57QflkF46+9N4uP4hSRW8XdyqFZZlGVTlmXCIiMnut/+v+G37zR4
         725a+6BnUHWhw7vMughkdVXmbO6oL3T0CDQrXBbxTH05xB9R6uH01jn9KviBmCU/9r+o
         jRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805043; x=1751409843;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QlCQKpWDxdcaUfXy65m6pPBMQjRdo74zK+bm+Y7bE4U=;
        b=wXwa2yQ1OY8mkIPi660K3DBHBJXfJ8+KnxVpAZxEZgAQv6C2f1YbsZXcMPl3HRb8p4
         9zo1UWFYETm8JZnGZCezfgIlEy1UHtD6VEqGfeV6oo+ECUpNkGxkwuqE08zuvTrwG/BR
         GrWqxX8B1dAae77eTh76LOY2LzZsl1HhzVKIhRPKYADo73SHrj53/3aZuTn/I3LZnO5X
         4MErQ1mcJzm5NpsbMiK7IgWm39BMi3HP2fzvIn/QXQy38g5zlyF5Zub9ipXnFHY2qc1a
         b/1DhkE9ZIyDU5gzH9IKYga4evlst77C/F/Jdx50z4yNp0VDY2qWMomojs6vCHvHOyhK
         W3ew==
X-Forwarded-Encrypted: i=1; AJvYcCWqkqkBi3XoIvPs9WFyFVWDynyhZc5jqtGKkw1NEcyh0Qk3YSNxdZth7S3cz4GFIADdFc+PlIdoaArHAW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRnsDqxLqq8+9y53Qg7OBSWF07G4gJJAWFW9JMSIyb90uI565
	YtyoUSmGDcp4FE8B2haW/PsUTeN1k/obnyp10PeryMQiqshXFjRZd5XQHjQwSHi8NRRfDbgRLKh
	8hQEG3Q==
X-Google-Smtp-Source: AGHT+IEtXTnYI5khsafdjTFFpIwBj1/3o9/0USEjUmDImBmy6nlSHMsznydOMkFks6U8uzEKschpfAm31Us=
X-Received: from pjbse4.prod.google.com ([2002:a17:90b:5184:b0:314:29b4:453])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2ce:b0:313:23ed:701
 with SMTP id 98e67ed59e1d1-315f25ce985mr846701a91.4.1750805043666; Tue, 24
 Jun 2025 15:44:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:44:02 -0700
In-Reply-To: <aE9/ayZNEXoA/ZEE@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612081947.94081-1-chao.gao@intel.com> <20250612081947.94081-2-chao.gao@intel.com>
 <0d1e9a86-41aa-46dd-812b-308db5861b16@linux.intel.com> <aE9/ayZNEXoA/ZEE@intel.com>
Message-ID: <aFsqMnjTCZSBTO3m@google.com>
Subject: Re: [PATCH 1/2] KVM: x86: Deduplicate MSR interception enabling and disabling
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, pbonzini@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025, Chao Gao wrote:
> >> --- a/arch/x86/kvm/vmx/vmx.h
> >> +++ b/arch/x86/kvm/vmx/vmx.h
> >> @@ -388,21 +388,13 @@ void vmx_ept_load_pdptrs(struct kvm_vcpu *vcpu);
> >> =20
> >>  void vmx_disable_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, in=
t type);
> >>  void vmx_enable_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, int=
 type);
> >> +void vmx_set_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, int ty=
pe, bool enable);
> >> =20
> >>  u64 vmx_get_l2_tsc_offset(struct kvm_vcpu *vcpu);
> >>  u64 vmx_get_l2_tsc_multiplier(struct kvm_vcpu *vcpu);
> >> =20
> >>  gva_t vmx_get_untagged_addr(struct kvm_vcpu *vcpu, gva_t gva, unsigne=
d int flags);
> >> =20
> >> -static inline void vmx_set_intercept_for_msr(struct kvm_vcpu *vcpu, u=
32 msr,
> >> -					     int type, bool value)
> >> -{
> >> -	if (value)
> >> -		vmx_enable_intercept_for_msr(vcpu, msr, type);
> >> -	else
> >> -		vmx_disable_intercept_for_msr(vcpu, msr, type);
> >> -}
> >> -
> >>  void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
> >> =20
> >>  /*
> >
> >The change looks good to me.=C2=A0
> >
> >Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
>=20
> Thanks.
>=20
> >
> >Just curious, is there a preference on using these 3 interfaces? When
> >should we use the disable/enable interfaces? When should be we use the s=
et
> >interface?=C2=A0 or no preference?
>=20
> I think the set API is to reduce boilerplate code. So, use the set API wh=
en
> you need to perform conditional logic, such as
>=20
> 	if (/*check guest/host caps*/)
> 		//disable intercept
> 	else
> 		//enable intercept
>=20
> otherwise, use the disable/enable APIs.

Yep.  The preference is to use the API that is most appropriate for the cod=
e.
E.g. if the code unconditionally enables/disables interceptions, then it sh=
ould
use the appropriate wrapper.
