Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB42BE0E4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919642; cv=none; b=TWJZQnVJ/iEMzzoqCZ1pjCm6nI68ARmMh+48L+VNuoOPd6sok02fZDsvKFmL8GB4ojstMtMKzYruFTKSVzK9Yt3h6BwlEyfv4XyAa4f8zXxEnzpZDu+8ip8c/yiWjNaUSOlEhuZpno63AY7cCroMMW9C7ZCUL0io7lZkohepqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919642; c=relaxed/simple;
	bh=/JQROEEgImgO+JOeHRU9r6p86RRgBwjPKvd+UfNhEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVHSu2GxPwCLVxFveY4uoRF14RiTF3b0+gz/6x8CKtlFSOe6hLTPHtaaIYF2dtqgx8BiZH2ILb5uH29hcRYkskdgji/QlR49y1kon+MvSIrTpiuxW3x6acBGT1hAUip1NNYBnA06nRfb+95rue0keO4o1wml6X26SU2jIDvjatk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ac4x+ehR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ac4x+ehR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745919639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlWJ5SOttcQupos3aVHbzKCM3KJZPFw+aL6yodCqXTg=;
	b=Ac4x+ehRHx14Q5JCcul9w5kvU4IEIeUiQZjng+caE7VELBbetNBSyQFGf2fGOooOcQipP2
	vBI2nEFWlk0JXYJ8XKa6h5kuQ8OdP9+9IYJ0HTfixlhPFafb/igyQTl/d6d+OZkiP1R2lk
	jeEF8FSvBYuBw52nojV3Y1Pi07L8X1g=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-2yUsiZlGNT2-vKIUgHn5ig-1; Tue, 29 Apr 2025 05:40:37 -0400
X-MC-Unique: 2yUsiZlGNT2-vKIUgHn5ig-1
X-Mimecast-MFC-AGG-ID: 2yUsiZlGNT2-vKIUgHn5ig_1745919636
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b048d1abbbfso5699965a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919636; x=1746524436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlWJ5SOttcQupos3aVHbzKCM3KJZPFw+aL6yodCqXTg=;
        b=GXOwwvFSBKsnq3j9V30X4WPjXun3YgaIA54v10ASKWyb/Pxlaz9M6sSXPGd06YriRu
         co85yWlc4UmyAfxXzZ2wjO0GIPdzsjxM79lV0m27HPscSaJao61Xpb2Ixhovi6qKvYR5
         PV4ntRwstutg/KBUc71DZF8ooIL4AHVhQ4O2LBOmzXtR5yOB/ZsYYAZdWXXKm1WF8pyG
         /XAy2wVk4nCIrt6Vb9arohGtu3i7d4vkFHaqRheehfms0wXlHM7ckTquyutU0NXCBhxs
         X5NFSBp+wMjbVFFNiphdkXKCCy0bNcuAb1Pp3CYOvOk/zSOiDYX1SX5J3nk+BehsnCGU
         9snA==
X-Forwarded-Encrypted: i=1; AJvYcCVAKhNeJ/7BLQ76mZ2UB0aCC5Di2yUyXUtsejHoAPileRYPQm/XnkuEMtNaojmfcqnSZ4K3RbdpfeH/UI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtvgzd6YT55JnEhK8JZ58jkI6NzgxpVW5Ugr8rUWXpUOqLHdlQ
	rp7cVKBKidAAOCdY1iSysBI7usU6sxMe9/j9BhCbMQZ9FNVKl20wV3Oa7qb6Bb+/bzwk43pJDn1
	mvLS53vX2CFOWsKsnhXPcueLZCmyO+6EellcAHaGlsePiQ0wRRZdjkGU5ouVQFw==
X-Gm-Gg: ASbGncvnOrSekt2eR0HQf38WXthKr3vhZRNVaQ3MuKLyAhcd495MiLBi118lxyFW7Nc
	HHsG3k/XVSZG3/Z/DGtS8uX1GWyr/HoL8sgKrJKs9yHe4pHOENZUaidMCUm/CJdvVqsFNd+m0S5
	+Jgfr+jRgjIc99yQf2jixNn9iR9E3g+iEiu8awpex4ZC/sL6forJQJpdeKGItpZ0w2gvsl+xUh8
	WbOA8aa1eqCWdyTWHf66ixmmRoG98fbU9zohB1BLdPbV7EHhXdB+WHVOziIwggeKOOGhQGvtchL
	nnM=
X-Received: by 2002:a05:6a20:d48b:b0:1f5:8678:183d with SMTP id adf61e73a8af0-2046a4664c2mr16009549637.14.1745919636511;
        Tue, 29 Apr 2025 02:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7gEjku+ZpVt/qDtNHhW6HIJZl8Z51nAZpzs1vZoq3o460vaQWQG9eqlKMDsZkZdnRqTXCEg==
X-Received: by 2002:a05:6a20:d48b:b0:1f5:8678:183d with SMTP id adf61e73a8af0-2046a4664c2mr16009502637.14.1745919636084;
        Tue, 29 Apr 2025 02:40:36 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca38fsm9778532b3a.171.2025.04.29.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:40:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:40:21 +0800
From: Coiby Xu <coxu@redhat.com>
To: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 6/7] x86/crash: pass dm crypt keys to kdump kernel
Message-ID: <rwetpbjimryr7g7xmdmaeuwkdasyqdpejsy4sdee3kzlssm32s@5xnznwqa3ivm>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-7-coxu@redhat.com>
 <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>

On Wed, Apr 23, 2025 at 10:59:06PM +0200, Arnaud Lefebvre wrote:
>>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>>index 68530fad05f7..5604a5109858 100644
>>--- a/arch/x86/kernel/kexec-bzimage64.c
>>+++ b/arch/x86/kernel/kexec-bzimage64.c
>>@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
>>	if (image->type == KEXEC_TYPE_CRASH) {
>>		len = sprintf(cmdline_ptr,
>>			"elfcorehdr=0x%lx ", image->elf_load_addr);
>>+
>>+		if (image->dm_crypt_keys_addr != 0)
>>+			len += sprintf(cmdline_ptr + len,
>>+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);

sprintf will return the length of dmcryptkey=xxx which will be added to
len.

>>	}
>>	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
>>	cmdline_len += len;

Then cmdline_len will included the new len.

>
>You are adding another kernel parameter but I believe without taking its
>length into account. See the MAX_ELFCOREHDR_STR_LEN constant which is added to the
>params_cmdline_sz variable for the elfcorehdr= parameter.

Thanks for raising the concern! I believe this issue has already been
took care of. Please check the above two inline comments:)


>
>This will (at least during my tests) truncate the cmdline given to the crash kernel because
>the next section (efi_map_offset) will have an offset starting inside the cmdline section
>and it might overwrite the end of it:
>
>kexec-bzimage64.c:480:
>params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
>			MAX_ELFCOREHDR_STR_LEN; <<< Should have + 31 here for "dmcryptkeys=0x<ptr> "
>params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
>kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
>			sizeof(struct setup_data) +
>			sizeof(struct efi_setup_data) +
>			sizeof(struct setup_data) +
>			RNG_SEED_LENGTH;
>
>And I believe the buffer might be too small.
>
>Also, there is another check a few lines above that needs to take the size into account:
>
>/*
> * In case of crash dump, we will append elfcorehdr=<addr> to
> * command line. Make sure it does not overflow
> */
>if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
>	pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
>	return ERR_PTR(-EINVAL);
>}
>

-- 
Best regards,
Coiby

