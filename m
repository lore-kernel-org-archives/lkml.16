Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C7A32
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538473; cv=none; b=heUop9yUR1ipehfFyKMgF+O0A3wo565HcsLnV8XmF7gr6Bfn/MDx7neORf3kxOTfYo1x6rJAPX8rPKK9xYvEFAMIxEb5/1NozDcmmooYAa8QeW+55Fki7xP3xfwcV8BlwydlvbNuV2XgMzc5FELGnyvvr3pG3mo5h0Cs4Qf7gJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538473; c=relaxed/simple;
	bh=jgkvDAiCh8sZ4E07avQI1bfj2TBCOO6ehDku2E89fYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FAYpJ0qKAa5NvQAGCiNuUyoDdQjDrJlFmbD18jGnRcc7ynTxcdtjrZC++Jbn+6ulpVTJPk+kTSvpFwGFrureB2ZiFJaPmgzZwN4JonFR5OscE3+hNLlHuLILQ9RjbNOFL6KKD8OHMUDuEK9CyVgx1a9iYTbM0jfCyyNV5fN5VAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e0TuywAX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e0TuywAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746538470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pDIyqhiHmIK98omQcXk13FyrxFyNXWqbJOdo4DpbxVs=;
	b=e0TuywAXhVh75Gx3BYtMcyTV6wfrID8bvbymV0V8tI62qn14086PtOlV8nZHq+7HUyOBj1
	D6z0HD2x266P+81VAxLsPBtNLFKvwyvmzn2KTGLqtRdA3yI8PIWlIy7iH8TBa4VUZTAB1D
	f4asJIbMN/9KzzgDlmavdYHCBIpmlhk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-cmurS6hdMvWAXKrA0BADJA-1; Tue, 06 May 2025 09:34:28 -0400
X-MC-Unique: cmurS6hdMvWAXKrA0BADJA-1
X-Mimecast-MFC-AGG-ID: cmurS6hdMvWAXKrA0BADJA_1746538468
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so31956445e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538468; x=1747143268;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDIyqhiHmIK98omQcXk13FyrxFyNXWqbJOdo4DpbxVs=;
        b=fk4X8XXoeLMsIXHiacihbm9y1uviOlcsH6vAtZfthoTHr8njCIdNgOGjQY+kOeXLN1
         YhJmk8idOX7hHt/iz/SlSrF63tY3ttRhodCU4OEs3k8Ve5TRrfDfZoRkJP8yazcyutEB
         Xx56pF+3y8emwCVRuaMgvCLRD0OeecMPhfWomnHgJmBYORMHS2ZqTbWA+1Cj/42GApx2
         wogWAsSAOaCHI3yCzVOMG+kIsBvGv/d43J0MqD70ZbqzKvemcB9UEk1V2Nw0pQxTOlQo
         41E8gYJLA7IDhgRwqGDZB+KVwHTxvddq4Y58Ab1gtUF7zTHrMQwXVZVbgy0BBHFveuYF
         a3cg==
X-Forwarded-Encrypted: i=1; AJvYcCU4eGEFOwhy1DLTE5p54aN0Z4xOo5l7KpTBBFkCHMw/z79Y4gsEn9ryUM2ovR2NRUZiy7AcT/eD/mkB4Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiBfbyPtPj+068+Hr4zErhDZDLyGQjt0PwLQ45NvGa04E3csU
	qYrnPJP+atj0DbQlGBdfveAeFrmq49IkYPspkxspd9mopFM+e7SId8e1kqNIb802Vp7z9Q4QpNN
	Vr8AQkMcdAgMKs6z2dOFX4PGAQd+5Y6xbk2OEIDUhWataZvaZtz2ezj1Fgo6E4A==
X-Gm-Gg: ASbGncs1j9rfQoBldOizlLou1ftZrOPqikrnVgypLciSPRwXN2tiJZJjTCv8JauG7mS
	Q1xNaasgnbp9hA+3NUKvuz7n73d3+Lp32fE9lnOUH4XoYiHMC0h9RPJbZLE3U91yo7HYY+w4g0C
	A15lv0WBvioHEj2+2se21riTynFKHREeIhkBk5EGNeUituhckHZGmY6pu1bSoRuVfb1z7EU/GfB
	jBDzmzv8T9Lez8tOQmaAKNZR+rz/hGY2+Vn07o3lbkjUYqgHcE830a5isOJaBRClLbPLCoe8gfP
	cDE8v9U=
X-Received: by 2002:a05:600c:34c7:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-441c491fcb6mr87016935e9.22.1746538467845;
        Tue, 06 May 2025 06:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdTZ01rB3K+KDb9dyjz8aIQ1HdnjPeS9RfHZCrNcZCcO52ut9BuipgIdWg2ntXZpGuEyANSw==
X-Received: by 2002:a05:600c:34c7:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-441c491fcb6mr87016635e9.22.1746538467424;
        Tue, 06 May 2025 06:34:27 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d1636sm169563715e9.13.2025.05.06.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:34:26 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Elena Reshetova <elena.reshetova@intel.com>, Fei Li
 <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, Juergen Gross
 <jgross@suse.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN and Intel
 TDX
In-Reply-To: <20250505110946.1095363-10-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-10-mingo@kernel.org>
Date: Tue, 06 May 2025 15:34:25 +0200
Message-ID: <87msbp278e.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ingo Molnar <mingo@kernel.org> writes:

> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, refresh all the virtualization
> guest Kconfig features, enabling paravirt spinlocks, and
> enabling the guest support code for the following guests:
>
>  - Xen
>  - Xen_PVH
>  - Jailhouse
>  - ACRN
>  - Intel TDX

Out of curiosity and to get the idea what's good for defconfig and
what's not: do we want to enable Hyper-V and its drivers as well? I
think all popular distros enable it nowdays because of Azure. E.g.

CONFIG_PCI_HYPERV=m
CONFIG_HYPERV_STORAGE=m
CONFIG_HYPERV_NET=m
CONFIG_HYPERV_KEYBOARD=m
CONFIG_DRM_HYPERV=m
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HYPERV=m
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m

>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Fei Li <fei1.li@intel.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  arch/x86/configs/defconfig.x86_64 | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
> index 156e9490e29b..514f8fdc2102 100644
> --- a/arch/x86/configs/defconfig.x86_64
> +++ b/arch/x86/configs/defconfig.x86_64
> @@ -31,6 +31,12 @@ CONFIG_KEXEC=y
>  CONFIG_SMP=y
>  CONFIG_HYPERVISOR_GUEST=y
>  CONFIG_PARAVIRT=y
> +CONFIG_PARAVIRT_SPINLOCKS=y
> +CONFIG_XEN=y
> +CONFIG_XEN_PVH=y
> +CONFIG_JAILHOUSE_GUEST=y
> +CONFIG_ACRN_GUEST=y
> +CONFIG_INTEL_TDX_GUEST=y
>  CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
>  CONFIG_X86_MSR=y
>  CONFIG_X86_CPUID=y

-- 
Vitaly

