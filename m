Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFB28937A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225358; cv=none; b=Gq/2qkaWA3YTTtbzDP7WeAztzdO43bMbmKAQKP2fYqLQeg/GA5hlLqvG/bSvfof/u9kCRTkqc8gEzvQ639WChcAeuwI4xEax7hQYRrNq7o960qRQ+RcEAbI/FaySmS7Bf7G2KWJXKRCdMhcf3wIoqT4MPTIKNKdpgzSA1SkDAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225358; c=relaxed/simple;
	bh=jc0tWlW3poGCs9I7QlcyCKaGlhaRWGW9bX1l7hil6K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP09LH3Or2D6Bd0f8kCJV7Eith7Dpu3vSzFMexIQKtCC2vS4N4DsrF1D58N+toI0YBta9gF36zH0JxAThyq5NKxPy380LGnuy3TkYChn/+6M6thOXZtT4k63YbyJa6jJmOPS+p1pRWewMnd+gcssMA4uVw4dmGaZ/Z2Vse2ykX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X57Dy0Ic; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X57Dy0Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749225354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfQokHHUXGOQjxz/5AuJ61NClHmro/6qokU3ot4Jqhk=;
	b=X57Dy0IcP71sVZYxBO5S/2gjWt/V3z2GXSTAy1geUkIrc7lxtZHo7EGtfvNFsCN3CF9iRb
	BI3T0wiZVYBGXmJWD3XyvnEnXhn5PzWJ/7Jt93nG92LhQscUfwrP28if6/249lNBKi0Y1i
	ztEVA2i4NLkPDMy7KEoDw+q9y33VshI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-ju-tH5rjP0-1d_OhrL87oQ-1; Fri, 06 Jun 2025 11:55:53 -0400
X-MC-Unique: ju-tH5rjP0-1d_OhrL87oQ-1
X-Mimecast-MFC-AGG-ID: ju-tH5rjP0-1d_OhrL87oQ_1749225352
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso360929585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225352; x=1749830152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfQokHHUXGOQjxz/5AuJ61NClHmro/6qokU3ot4Jqhk=;
        b=fkYhF8ilGDFymGf8pYYKBzlAbWk2yZCtfWYy+avA+gUag06XhWNMhZciM/Ya9TMbU9
         DW6IhtRKj7+Ct5eK5suoVPoxH/MaMOhNuVOphxPJ0/Bwt+NjgE0s465aEMD0lI/BFhZA
         usGPM6L4MS2AG4BpAawKcrwvalM8NN3qm96birR1qs99aFf5BOTPJiVhXcFvZa+dDkFL
         Kt4lgAzyilM4qRPvhS7IiDWHa2Y9Dq1f5Hz0iQrEmENPiHz1F8jCXzI8TU7tyVpIJyUT
         Qup/8ZSJcA5/Wj+1r9zjF69FHDwrWdQei+BMO71M8yCc2ebc3OHbTAlWBBogC67x0+js
         4hEw==
X-Forwarded-Encrypted: i=1; AJvYcCX1ygwdWgBa342iZVtOQDVZLJq9zywlKI3x8BEL1ugC3BeCMSSwcFd8v11GXVtzB/Z56KVmRGiWz0dIMJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPTV0KQXEpD/cL4Nw5In3r19lM+cnIeLyBPAcNTARla/0cWRe
	KTKIBnpz1mKaeMv0e5v/WNWmuGKV5kTGJ/M/gEEwDkpvktWBkR/7Jq9ApEUpprOHuvlxHoZmD0f
	ijSHYvz636LdJvbrF22Ab8oWcWhQUHpNsTfDsT0AMzuVYcLaoXRV09lq6lQQzoQGb5g==
X-Gm-Gg: ASbGncuEfHYPESAxyXd+dU27yMprHrfslMBvy+EGJdnV0/wl3u3WJZoImWvT5/+hpt3
	LzsnwOkyr64ZbosjOda05zqSdUaUkw7a4/2vG+600sD8YG9nMvrVwr2FcV1LyIEdTLOgmwAcKut
	8TXf4zrpveAMxwmXy3qfvbDRPqriKf7euU2P7pe2vN4zoS9mNDIU0IoRreLA1lqRzGEMqx4s+R2
	tBgEe2TbSt37BZhTjwEeGiXpbtKdymjneBIaYm26w6xW2rrHDlal659tkXAXH8/XYEL5eVUPxqy
	/If1ma+S4QUvRAY=
X-Received: by 2002:a05:622a:90e:b0:494:b251:d216 with SMTP id d75a77b69052e-4a5b9a29356mr73621491cf.18.1749225352614;
        Fri, 06 Jun 2025 08:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuOyO5kabPQZM7spveJfj/HNOoyNh+ZrupHbDyKgLpVySZrx0OECv0h4zkDFJ84/rW+XA9DQ==
X-Received: by 2002:a05:622a:90e:b0:494:b251:d216 with SMTP id d75a77b69052e-4a5b9a29356mr73621001cf.18.1749225352261;
        Fri, 06 Jun 2025 08:55:52 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab948dsm12887176d6.11.2025.06.06.08.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 08:55:52 -0700 (PDT)
Message-ID: <256ad7fc-c6d4-470d-a434-7b5556c3b8f6@redhat.com>
Date: Fri, 6 Jun 2025 11:55:41 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: Drop preprocessor directives from zboot.lds
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250606154112.311565-1-vkuznets@redhat.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250606154112.311565-1-vkuznets@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-06 11:41, Vitaly Kuznetsov wrote:
> Older versions of `ld` don't seem to support preprocessor directives in
> linker scripts, e.g. on RHEL9's ld-2.35.2-63.el9 the build fails with:
> 
>   ld:./drivers/firmware/efi/libstub/zboot.lds:32: ignoring invalid character `#' in expression
>   ld:./drivers/firmware/efi/libstub/zboot.lds:33: syntax error
> 
> We don't seem to need these '#ifdef', no empty .sbat section is created
> when CONFIG_EFI_SBAT_FILE="":
> 
>   # objdump -h arch/arm64/boot/vmlinuz.efi
> 
>   arch/arm64/boot/vmlinuz.efi:     file format pei-aarch64-little
> 
>   Sections:
>   Idx Name          Size      VMA               LMA               File off  Algn
>     0 .text         00b94000  0000000000001000  0000000000001000  00001000  2**2
>                     CONTENTS, ALLOC, LOAD, READONLY, CODE
>     1 .data         00000200  0000000000b95000  0000000000b95000  00b95000  2**2
>                     CONTENTS, ALLOC, LOAD, DATA
> 
> Fixes: 0f9a1739dd0e ("efi: zboot specific mechanism for embedding SBAT section")
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Thanks for fixing Vitaly:

Tested-by: Luiz Capitulino <luizcap@redhat.com>

(this is for the build test, not SBAT testing).

> ---
> Note: not-yet-merged x86 version of 0f9a1739dd0e does not seem to be affected
> as vmlinux.lds script is a pre-processed version of vmlinux.lds.S.
> ---
>   drivers/firmware/efi/libstub/zboot.lds | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
> index c3a166675450..4b8d5cd3dfa2 100644
> --- a/drivers/firmware/efi/libstub/zboot.lds
> +++ b/drivers/firmware/efi/libstub/zboot.lds
> @@ -29,14 +29,12 @@ SECTIONS
>   		. = _etext;
>   	}
>   
> -#ifdef CONFIG_EFI_SBAT
>           .sbat : ALIGN(4096) {
>   		_sbat = .;
>   		*(.sbat)
>   		_esbat = ALIGN(4096);
>   		. = _esbat;
>   	}
> -#endif
>   
>   	.data : ALIGN(4096) {
>   		_data = .;

