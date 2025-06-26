Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33D214236
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959283; cv=none; b=Sonxujf/JCTZhHNFzuvW20SJhqi2vgreNhCPT+tWH9R4Pa5HeuW2kjjKRMCEfQK6ikEUoidCG/Adki1dSvTwz5HuBT3aPBUSbdubfIOLdAKDKW5ERDBakVvYYyGjpZM6jlAWwu06++Zfcw8OubvxRh7KJQ3119RbZPK84eN9iko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959283; c=relaxed/simple;
	bh=Fm7OXsTPzhqvXnDiVTwsw4b/QRazbLf0sV35ZjXHK/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eeBDUjbUXjQUGp9/EHVmiwLmmBAFjKZL2p/udl4uA5+3rImkbLckkipMTaG5PmWezXPu+YWEathdzECwNVyon9CDsVW6mwb++HI/icFo8Q7JpeufWI3ajCpNLkAekoQkT/J+4z7x50Js/oS9tznqFNehfNHgLBBVvspSEtgzDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VLv52Vzf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VLv52Vzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750959280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccgRMg8Dfr12xc0dnqWKHwWSVpDRdG1c9yQQ1X6tT4w=;
	b=VLv52VzfvJza8FD1zA/347wwy/FXDK9y0y5FtmJ60eob/6dsIZ+btSy4UMRFbGGU6vFHjr
	Zt6H/XY+ZLVDBJ7EA1tmBD7Wtid85ZTRi0VIS7XIrsSXtNaaBJfJ0QZJVe4lgdj50c3wU8
	/78aMFJy8FZol+iWf7RDSi5Q1qP7UI0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-YlkxXj_7MemElSSL_0Z3Hw-1; Thu, 26 Jun 2025 13:34:37 -0400
X-MC-Unique: YlkxXj_7MemElSSL_0Z3Hw-1
X-Mimecast-MFC-AGG-ID: YlkxXj_7MemElSSL_0Z3Hw_1750959277
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabd295d12so25489456d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959277; x=1751564077;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccgRMg8Dfr12xc0dnqWKHwWSVpDRdG1c9yQQ1X6tT4w=;
        b=HEezNn44Zh8nY8IS+T/P+K+YiTujua49iIpc7NlUCMgSkF2NOMLzeu4VW6o7taefT5
         4r3fykHggM5W6Dsn9QnZhkD1fKvbChZqOdJqakDLlgUm4X2RHvxrlhnvfup9lPhrfu4z
         oN9MXIeAt83cLjaKL3qHDeIn5sqr8yAodDeiaI22JASmNBFjf0heCEoPXglaS+gR3maf
         WUY8263r4TsWLebG3tTsXZMEGpv5ziN4yQD3NRI59rDLSQRYWSq6fwOtvW6PFgfOpE+o
         tvDacHS6oy+Q6ih1Ulg2BhaiTWTWZSUirp/18dL3pdS5TpdYtScNG7kCNrxgfAFETUiW
         +JBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYtNLscAGdoAT8hQLi9ZEkRwULMAPXkA1lb6HTCzZ8SXglX5mre6XwfDUB7qImZl3Hgy+WBCxjn058cDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXU8Me8+9GBj6qwvOLXKRDKMWkiNFEOAI+3131hhnBNDp57C54
	YiWjkTOqtxoJ3/0zf5HpysfnofbLAmvjmVH5hrIMzD0I2d/uh7/+9msgpXIZsJiuTosKRZexis4
	3zAMaXs43Jw30QaHhYyf5ODLF4WE0yw+sJhq3Zn4dLipL5gopz2RTHVzgTz8N2uzGjA==
X-Gm-Gg: ASbGncsB67KEOdnWT5CEk6yEa9YKBmjpXnCroeogu89JCbP2be3qVv/neZ/hsN/jS6L
	oTRnGh9IBMbpuHKSDViamKqpuz6CdJ4mg0NFLb+XsFW/rcw7/uRFgSmpM9pRuCyY4/Lw8yUr+YT
	fNrnNFuUMsxrFEqAH31/EnZOB0R1iep7T+0Jqj5olbNHAYSmcmSrG8GDNrwX0ezGT09MzlRHA84
	xeWMNp9BSU32SCV45dIIDERo91lqGF1QEuoD1wCkr+mDyaKgVGv+izJZlodnUah22e9k82Hf1zo
	E09ijWpVSob0ptApJs0LbkZZqD9+gYsCD2t2/aMpqorLOSVRdt3JPpW1kGqAkGWvzyZbxw==
X-Received: by 2002:a05:6214:460a:b0:6fa:9e00:d458 with SMTP id 6a1803df08f44-70014038d71mr4969746d6.45.1750959276509;
        Thu, 26 Jun 2025 10:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy1nkyeeijB2E3MzKV27+9pONkSIoGZJqYCAjcnplHXSYdDKuOM4E39tl8BR8u5eF5xIy/qQ==
X-Received: by 2002:a05:6214:460a:b0:6fa:9e00:d458 with SMTP id 6a1803df08f44-70014038d71mr4969316d6.45.1750959276040;
        Thu, 26 Jun 2025 10:34:36 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718e635sm10091926d6.3.2025.06.26.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:34:35 -0700 (PDT)
Message-ID: <66bab47847aa378216c39f46e072d1b2039c3e0e.camel@redhat.com>
Subject: Re: [EARLY RFC] KVM: SVM: Enable AVIC by default from Zen 4
From: mlevitsk@redhat.com
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, Sean Christopherson
	 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Vasant Hegde
 <vasant.hegde@amd.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Date: Thu, 26 Jun 2025 13:34:34 -0400
In-Reply-To: <20250626145122.2228258-1-naveen@kernel.org>
References: <20250626145122.2228258-1-naveen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-26 at 20:21 +0530, Naveen N Rao (AMD) wrote:
> This is early RFC to understand if there are any concerns with enabling
> AVIC by default from Zen 4. There are a few issues related to irq window
> inhibits (*) that will need to be addressed before we can enable AVIC,
> but I wanted to understand if there are other issues that I may not be
> aware of. I will split up the changes and turn this into a proper patch
> series once there is agreement on how to proceed.
>=20
> AVIC (and x2AVIC) is fully functional since Zen 4, and has so far been
> working well in our tests across various workloads. So, enable AVIC by
> default from Zen 4.
>=20
> CPUs prior to Zen 4 are affected by hardware errata related to AVIC and
> workaround for those (erratum #1235) is only just landing upstream. So,
> it is unlikely that anyone was using AVIC on those CPUs. Start requiring
> users on those CPUs to pass force_avic=3D1 to explicitly enable AVIC goin=
g
> forward. This helps convey that AVIC isn't fully enabled (so users are
> aware of what they are signing up for), while allowing us to make
> kvm_amd module parameter 'avic' as an alias for 'enable_apicv'
> simplifying the code.=C2=A0 The only downside is that force_avic taints t=
he
> kernel, but if this is otherwise agreeable, the taint can be restricted
> to the AVIC feature bit not being enabled.
>=20
> Finally, stop complaining that x2AVIC CPUID feature bit is present
> without basic AVIC feature bit, since that looks to be the way AVIC is
> being disabled on certain systems and enabling AVIC by default will
> start printing this warning on systems that have AVIC disabled.
>=20

Hi,


IMHO making AVIC default on on Zen4 is a good idea.

About older systems, I don't know if I fully support the idea of hiding
the support under force_avic, because AFAIK, other that errata #1235
there are no other significant issues with AVIC.

In fact errata #1235 is not present on Zen3, and I won't be surprised that
AVIC was soft-disabled on Zen3 wrongly.

IMHO the cleanest way is probably:

On Zen2 - enable_apicv off by default, when forced to 1, activate
the workaround for it. AFAIK with my workaround, there really should
not be any issues, but since hardware is quite old, I am OK to keep it disa=
bled.

On Zen3, AFAIK the errata #1235 is not present, so its likely that AVIC is
fully functional as well, except that it is also disabled in IOMMU,
and that one AFAIK can't be force-enabled.

I won't object if we remove force_avic altogether and just let the user als=
o explicitly=C2=A0
enable avic with enable_apicv=3D1 on Zen3 as well.

And on Zen4, enable_apicv can be true by default.

But if you insist on to have this patch instead I won't object strongly,
as long as it can be enabled by the user, it doesn't matter that much.

Best regards,
	Maxim Levitsky


> (*) http://lkml.kernel.org/r/Z6JoInXNntIoHLQ8@google.com
>=20
> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> ---
> =C2=A0arch/x86/kvm/svm/avic.c | 11 +++++------
> =C2=A0arch/x86/kvm/svm/svm.c=C2=A0 | 10 +++-------
> =C2=A02 files changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index a34c5c3b164e..bf7f91f41a6e 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -1101,12 +1101,11 @@ bool avic_hardware_setup(void)
> =C2=A0	if (!npt_enabled)
> =C2=A0		return false;
> =C2=A0
> -	/* AVIC is a prerequisite for x2AVIC. */
> -	if (!boot_cpu_has(X86_FEATURE_AVIC) && !force_avic) {
> -		if (boot_cpu_has(X86_FEATURE_X2AVIC)) {
> -			pr_warn(FW_BUG "Cannot support x2AVIC due to AVIC is disabled");
> -			pr_warn(FW_BUG "Try enable AVIC using force_avic option");
> -		}
> +	if (!boot_cpu_has(X86_FEATURE_AVIC) && !force_avic)
> +		return false;
> +
> +	if (!force_avic && (boot_cpu_data.x86 < 0x19 || boot_cpu_has(X86_FEATUR=
E_ZEN3))) {
> +		pr_warn("AVIC disabled due to hardware errata. Use force_avic=3D1 if y=
ou really want to enable AVIC.\n");
> =C2=A0		return false;
> =C2=A0	}
> =C2=A0
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index ab11d1d0ec51..9b5356e74384 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -158,12 +158,7 @@ module_param(lbrv, int, 0444);
> =C2=A0static int tsc_scaling =3D true;
> =C2=A0module_param(tsc_scaling, int, 0444);
> =C2=A0
> -/*
> - * enable / disable AVIC.=C2=A0 Because the defaults differ for APICv
> - * support between VMX and SVM we cannot use module_param_named.
> - */
> -static bool avic;
> -module_param(avic, bool, 0444);
> +module_param_named(avic, enable_apicv, bool, 0444);
> =C2=A0module_param(enable_ipiv, bool, 0444);
> =C2=A0
> =C2=A0module_param(enable_device_posted_irqs, bool, 0444);
> @@ -5404,7 +5399,8 @@ static __init int svm_hardware_setup(void)
> =C2=A0			goto err;
> =C2=A0	}
> =C2=A0
> -	enable_apicv =3D avic =3D avic && avic_hardware_setup();
> +	if (enable_apicv)
> +		enable_apicv =3D avic_hardware_setup();
> =C2=A0
> =C2=A0	if (!enable_apicv) {
> =C2=A0		enable_ipiv =3D false;
>=20
> base-commit: 7ee45fdd644b138e7a213c6936474161b28d0e1a

