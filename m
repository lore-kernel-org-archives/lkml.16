Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2728373
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649233; cv=none; b=dEbaoY2FJSfZwnMnKvgjeIVRwVXrjOGK0kUkaXdPq6g1EqCU195NgIGFI4xfxYUbQORNshaBnJ+MomK+ut6FH4umHMYW8GYOevMjeHNEnumcpxL6qE+jwb6o6ioOeCS6zRjHjpH8xmefktrIBd3/GUBCmqMjrbo/aFOawfTzKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649233; c=relaxed/simple;
	bh=QWgKk3rlpNB1FghPQdseTO3Ox2Q3ajMEvVZ+8yV2nTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCohAq44ekdBn/Wm4EAY8WVoorjEccqM8DOCzDvpqQ90nkKJTLc9F15HjT21PA8639mb9g5LgdmmF7D0gnhYtLBUEEvcAVkfbeDJZTze48oWroljAdhu0gDe3jP6x4cfGyHJCogDUcNBuj58FKCgJzQY3Nio956UHIghzsn8RTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFOyh6j3; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFOyh6j3"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3fa6c54cc1aso193030b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649230; x=1747254030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbNUqgHSQF2ubI6P24XlUmz50WOVhS68byJoC4GVdtY=;
        b=YFOyh6j3dh1b3NHbqv/24dfaRlvwEYmF7edPG1dXSSccpFzrXb3HUJ4i4Y1qJhyh8f
         T9OUOevJ8LrQa4JGHRoO+8o8SbejEstSMc3poIz340cC0o9D61wFG9pdC7JZ+oFENV9u
         f9omNWAlp1SC1PSPZ8cqcKWJgaWwHA9zraUDUL3zNrTMr9Z/o/PGbHlU1GI3RwyLv09+
         Tz7rJoy6hx0MoMkfbmc40WxUJ+dSX2O6DX7rZ4uM5u8fI7zKLBu6v9w/b5QHIa2WNpH1
         eDqRNjVJ+R79pOA3tOixgH9/39w0QW5JCS5ZbZCxSnP+hMZyZ9WRUbqOsYeIPB26CE2m
         DnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649230; x=1747254030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbNUqgHSQF2ubI6P24XlUmz50WOVhS68byJoC4GVdtY=;
        b=OKTfrAFy1LBRYheE5Lf7iTiaksCIa2xWMTe2cvdx/mp1A9Gcra76m0wX+TaEbNk9T6
         Z62DPI8nkNMOBzpYmcBiRE/S2jL64U57b5VavFCMaX63hbRLJW0pQF6iv6Zrn4AucbQh
         FWcV+G4EJ63ybUM0xwSZy/9O5uKtYIX50dmCnUpjKJeOQPSOQhgI72ASnhil04+BKwPD
         GaasCaWySu+MUFI35XIYITLWZsdcf0lZRNm0q+Jzc+Q/NbGUreGWANJDjFEbhjdsv67b
         3K9XKNUVll4EgZGd7zAstsFKqGZTh63jmzvdqtWpWxZAnNs7S8vc5eUmvsmAZcv5CYED
         mKGA==
X-Forwarded-Encrypted: i=1; AJvYcCUnI1bNgAlFEjdoepn4XX2I/Ya7SBSI6vTJHkMkrhuYcvS1igI7qSApfRKhAIvYAoBrHB/6TDzvWcI6Kkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHhWrXQ7FmXsl+zP52ypJWu6+jy14qOFTzw9PqU9LDKEUtWmG
	649J6yGkow4s+9PJxxhsMXmjD+GAeJJI0MerWeQuSAK2GfNe0gzu
X-Gm-Gg: ASbGncvnJGmdZ9uktgBY06t5dPL/+uho52HqAGg+H8OlsIvZw4APjBG4kbpUi/dNNgl
	JuOLBVp44D6pqcxxSH3bLa8IBQLc6ltH69/yo5AAFU15bWpoGvpmg4O7ib53z5SRvapGCk/6M2m
	DV2potv1ZiAsjU2Zx3JOQfrs08Ps61kr5Q02HF3eMr3L85CKDsERs+EHJj6tNG26Ofwkt0xGRSB
	DoWUCTU5YlkgB4xiWwYRFM1Hu8SJtGa7girQn3IaSYB3K8TZjPUD6iH7nIOQ7557hpjFe4jQsem
	STtwBqyrU+7S+ksbUNywXDa3nKx2AwW0hhsNI5nvr18y03nijPdQQvTTf3/2vwNR6sT9ZFySZGY
	OIIKrNXd5AMzMMWeUF6wFZD93V2xI
X-Google-Smtp-Source: AGHT+IFb8VwJn/VbxJLHvFvMl5aoFMmfsOcs2xBmMJ4MGpDPZVsU/uwc3pUlkngMRb2J6sWbbl7fXw==
X-Received: by 2002:a05:6808:1925:b0:403:36aa:e085 with SMTP id 5614622812f47-4036f085a23mr3110673b6e.23.1746649230406;
        Wed, 07 May 2025 13:20:30 -0700 (PDT)
Received: from ?IPV6:2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b? ([2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4036f3b1604sm725591b6e.50.2025.05.07.13.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 13:20:29 -0700 (PDT)
Message-ID: <832be7b3-7f1a-4c9a-9dfc-6b9120eb30db@gmail.com>
Date: Wed, 7 May 2025 14:55:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN and Intel TDX
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Elena Reshetova <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Juergen Gross <jgross@suse.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-10-mingo@kernel.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20250505110946.1095363-10-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 06:09, Ingo Molnar wrote:

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


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

