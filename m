Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF04B1E64
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383330; cv=none; b=NHGjusmhTja7/qaiyiDdDRbvPVndNmCeWJCP03nO4np9sF0u28t5Kni/t2ywVumU7b4tlqOOqjBZEFt77VIb//43T79p6+9aB/p/aXrSIgWAobgOUiEcdOZgO4lJic01gr2Xe18g0piuFNbY/+jocngor05V0/0Z3gGwL4vTmZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383330; c=relaxed/simple;
	bh=9ZNkRdwONS7qvGd42AtX9wAgFRBEOY3NBFvCnRP/jYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CB4vwEV/sGhN1L1A5cuw/bKou4taG1jbayF4R2HSK22B5W9UqM9AU9BDdZsluGKPYJQNhXgJ20DPkWOIW9Qbn5uxghuYf0nLF6cwGViEnGSBVkl9gWQg+7+NFd60csmxsojZSn38nhc75m2ypmwiC4wcsd/VwJryDzQO9XJmDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3b7Xnyg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3b7Xnyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747383326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8X7UgmJKajU4TZT46ozMqAUfHFxvpJGjty5ItbveC+s=;
	b=G3b7Xnygtzw3qxlLZI6XQDh+xIbWlSfbE3joCxCOAc3wrT8hlA48ixT9UgeG9jnd/8PZtR
	j33eTqJqB/QVIwO5oLKUdiA/ErHToI7FAxdv34w5LQwb8p2ueSvC+CmSiiOUL41wTtklkn
	fwPozKo2eNfAEiCVxhu0qop4WkK95yc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-vfHEdwvBM82ckE0dWCwokA-1; Fri, 16 May 2025 04:15:25 -0400
X-MC-Unique: vfHEdwvBM82ckE0dWCwokA-1
X-Mimecast-MFC-AGG-ID: vfHEdwvBM82ckE0dWCwokA_1747383324
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f90418b0so6869765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383324; x=1747988124;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X7UgmJKajU4TZT46ozMqAUfHFxvpJGjty5ItbveC+s=;
        b=ayQic6OOQZa20hGGnl9eS6L5rkW1rQdH7kXF1ZThg3/FmM5jTZ82WHG6jylMSezprz
         ml+9sZQ+hn58W3uTwW8QisMwD/0JaoGy7AeHeo+VBAQR2z1iXlfqiHgaXLJ7LAfc1F+K
         JToNdrB9eK+8Dr2hzb7EKkDc9qL2FuQKHrIl90uD0C0dX1S2irUCNkiACUYeG5oqn9Zy
         oODJ0TgawitI9BHmdeeR9Ot2TY2s7xVWGYVjcnbIdHloYyhxqstg9eZIEJM5OO55CPZN
         ky9HEtWlV9gZG7CMKv90jo+P68STqMPBD9yGHS5qzBjPAvcGpVzMTD8YGMpr3uTotU8t
         xaxw==
X-Forwarded-Encrypted: i=1; AJvYcCVPWp3ptjO2M0Pj6iN126IL17nymUk9z3E7hiEBdv26+bUUPdVbuEpkqIk9oa6HqixV/+g2pRTiKO/tq7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaYAcUdUuJU/VCLSmCWqA5lWLP9XXz60BtL5w2yesjSQ8lhNL
	xmeeEYoU00QLV7gVgsBLzG/KBMRyXJUObmM8QBELBX0x4vVIsJRZn+F8wzAhZyOBnlFIclKYzTe
	mKEJ50i8euVpnKElrPfPUxs6OG4DrjxQMaGh3k5av2j2kocCFr8Cmg931qXqQ6clGMfDx4xUSDg
	==
X-Gm-Gg: ASbGncuq0xtCwqWxuoszWmC7/i6mQ6IDHYRGKC/01myiczuBO6VAfIyGSY/qNCHEYhU
	ibRPyoknF6Hu+jkJzGTdzYcaO5lLrpxljzW6FcOgEVsYXKl44tX+m4p2kTyuSMbMMXVl5/f3ZFt
	/VvK9kZYPnTXs5saSW2dE8yhTJjkvb+upzeP3mLaE4hTg3g1M7qzgjH14cQuNbzcgZRW18bTjMb
	DDTzu7wKKTylkbTHgd05GbSiSglCntF6QUmbdxKbA7DB/BtsrVod/48/2h9J2FOAsJGUE6pB+7J
	2ecuofI=
X-Received: by 2002:a05:600c:154a:b0:442:eaa9:31c9 with SMTP id 5b1f17b1804b1-442fd66dd78mr18993615e9.22.1747383324185;
        Fri, 16 May 2025 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRHIs4xWpYFfpHEI5+7dXiKC0rCNxbN8YqiwS9H5M0wJJWqPcnwKGRCQg+aQXguxVWNbcqiA==
X-Received: by 2002:a05:600c:154a:b0:442:eaa9:31c9 with SMTP id 5b1f17b1804b1-442fd66dd78mr18993285e9.22.1747383323786;
        Fri, 16 May 2025 01:15:23 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85a8f8sm69107805e9.0.2025.05.16.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:15:22 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, Ingo Molnar <mingo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>, David
 Woodhouse <dwmw@amazon.co.uk>, Elena Reshetova
 <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX
 and Hyper-V
In-Reply-To: <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Fri, 16 May 2025 10:15:21 +0200
Message-ID: <87o6vtnf8m.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michael Kelley <mhklinux@outlook.com> writes:

> From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 AM
>> 
>> Since the x86 defconfig aims to be a distro kernel work-alike with
>> fewer drivers and a shorter build time, refresh all the virtualization
>> guest Kconfig features, enabling paravirt spinlocks, and
>> enabling the guest support code for the following guests:
>> 
>>  - Xen
>>  - Xen_PVH
>>  - Jailhouse
>>  - ACRN
>>  - Intel TDX
>>  - Hyper-V
>
> I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
> and keyboard drivers are pulled in automatically, so my previous
> comment about them being "missing" is moot.
>
> But the Linux console for each Hyper-V guest is a synthetic graphics
> console, and that didn't work with the DRM_HYPERV driver. Missing
> the console pretty much kills any usefulness. DRM doesn't have 
> Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
> to be set, and defconfig doesn't have it.
>
> So either CONFIG_DRM_FBDEV_EMULATION needs to be added, or
> defconfig should switch to the older HYPERV_FB driver. I think we'd
> rather do the former. Vitaly -- any thoughts?
>

Yea, my vote goes to the same option: let's enable
CONFIG_DRM_FBDEV_EMULATION.

> Michael
>
>> 
>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
>> Cc: David Woodhouse <dwmw@amazon.co.uk>
>> Cc: Elena Reshetova <elena.reshetova@intel.com>
>> Cc: Fei Li <fei1.li@intel.com>
>> Cc: H. Peter Anvin <hpa@zytor.com>
>> Cc: Jan Kiszka <jan.kiszka@siemens.com>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: Michal Marek <michal.lkml@markovi.net>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Sean Christopherson <seanjc@google.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  arch/x86/configs/x86_64_defconfig | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
>> index 156e9490e29b..df786b8b4e85 100644
>> --- a/arch/x86/configs/x86_64_defconfig
>> +++ b/arch/x86/configs/x86_64_defconfig
>> @@ -30,7 +30,12 @@ CONFIG_PROFILING=y
>>  CONFIG_KEXEC=y
>>  CONFIG_SMP=y
>>  CONFIG_HYPERVISOR_GUEST=y
>> -CONFIG_PARAVIRT=y
>> +CONFIG_PARAVIRT_SPINLOCKS=y
>> +CONFIG_XEN=y
>> +CONFIG_XEN_PVH=y
>> +CONFIG_JAILHOUSE_GUEST=y
>> +CONFIG_ACRN_GUEST=y
>> +CONFIG_INTEL_TDX_GUEST=y
>>  CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
>>  CONFIG_X86_MSR=y
>>  CONFIG_X86_CPUID=y
>> @@ -128,6 +133,7 @@ CONFIG_NET_9P=y
>>  CONFIG_NET_9P_VIRTIO=y
>>  CONFIG_PCI=y
>>  CONFIG_PCIEPORTBUS=y
>> +CONFIG_PCI_HYPERV=y
>>  CONFIG_HOTPLUG_PCI=y
>>  CONFIG_PCCARD=y
>>  CONFIG_YENTA=y
>> @@ -168,6 +174,7 @@ CONFIG_SKY2=y
>>  CONFIG_FORCEDETH=y
>>  CONFIG_8139TOO=y
>>  CONFIG_R8169=y
>> +CONFIG_HYPERV_NET=y
>>  CONFIG_INPUT_EVDEV=y
>>  CONFIG_INPUT_JOYSTICK=y
>>  CONFIG_INPUT_TABLET=y
>> @@ -198,6 +205,7 @@ CONFIG_AGP_INTEL=y
>>  CONFIG_DRM=y
>>  CONFIG_DRM_I915=y
>>  CONFIG_DRM_VIRTIO_GPU=y
>> +CONFIG_DRM_HYPERV=y
>>  CONFIG_SOUND=y
>>  CONFIG_SND=y
>>  CONFIG_SND_HRTIMER=y
>> @@ -214,6 +222,7 @@ CONFIG_HID_PETALYNX=y
>>  CONFIG_HID_SAMSUNG=y
>>  CONFIG_HID_SONY=y
>>  CONFIG_HID_SUNPLUS=y
>> +CONFIG_HID_HYPERV_MOUSE=y
>>  CONFIG_HID_TOPSEED=y
>>  CONFIG_HID_PID=y
>>  CONFIG_USB_HIDDEV=y
>> @@ -231,6 +240,9 @@ CONFIG_RTC_CLASS=y
>>  CONFIG_DMADEVICES=y
>>  CONFIG_VIRTIO_PCI=y
>>  CONFIG_VIRTIO_INPUT=y
>> +CONFIG_HYPERV=y
>> +CONFIG_HYPERV_UTILS=y
>> +CONFIG_HYPERV_BALLOON=y
>>  CONFIG_EEEPC_LAPTOP=y
>>  CONFIG_AMD_IOMMU=y
>>  CONFIG_INTEL_IOMMU=y
>> --
>> 2.45.2
>> 
>

-- 
Vitaly

