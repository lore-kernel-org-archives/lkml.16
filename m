Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAA3263F5E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441952; cv=none; b=YX2R9Gw7Ypx794XrmydhWb7eTOi8Vw8mZ2Cd2ykbxQkE9kryrZmXk9ka7UgKy5S9X3XrmOsIf5Nr1ucJGIxxqnqpJ39pO9zBAN7DOH8xPgLK2HmO23bjk4Agy2I2gGzDms/39aJv+2bz9YD9eKMNzLhrvR+FkvSRZA0yssrXiag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441952; c=relaxed/simple;
	bh=pZjRj+FNkJ75G+DRq94pEn+eARqdISny+XwLAQ6jwr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+OKTSfmRmDxZMjnpkzjjobMVhOJiAv4Vr6YkAbAy2trkrNUudADXGAs+TTO+nuIC26lkmoC4JQjFwaIH6yIxv7tnj7SvyYruoeeLzJxqecmFvsnAHOvNbkf/hUGqccCNTr9NPglqCIX8tvZZky/vqNKeSaJ6mdKm+uYVQfiNOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com; spf=pass smtp.mailfrom=clever-cloud.com; dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b=DnmB9Q1t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b="DnmB9Q1t"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso206732f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clever-cloud.com; s=google; t=1745441948; x=1746046748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8rBmkOf4aIvYi3I8FgBy0awmrD8H509/EVP5Ei1ytI=;
        b=DnmB9Q1tq95RlHPzbiD7g5YEneg2BxCa3N0QG3F5aOUyMDPgA4EP2aCl/3x1anF2AG
         8qKmTH4NTmj2+c0PvKd6y4hEApV9Lo+MbvBPjykBjuaBSPzouE4EPRfEB+io6cOGvqf4
         WO4PgUmhQM3XFsl3ErynO7DVSxm/ECEpr7b81DTf1OTCNcXpii1t+1KDhBTJIjWWcorx
         F8KAu0MeBTHmuNGDGDAJXByRODNGb1NQmicc/ydoGY+v/c5CJqUagjUcDtTX8/VXojwb
         RoqEL9NcDeiLdqZ2S4GzZBw1FQFwJ5FxCiVvLMX8PcD9FRxA4yaGrkq5wEQbd+qyos/j
         pwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441948; x=1746046748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8rBmkOf4aIvYi3I8FgBy0awmrD8H509/EVP5Ei1ytI=;
        b=FWSWCtz/718lGmfkdpoZn+2xjNBdsw+vXnR/nmtcTsxNqSoMsu5XylgabgcRNQxucm
         X7XGQWT8roKHgWXPxGy5t3OtXQIRHp0g2VThVmbhXlumSjYi5Q/6Snb+GjwA1tAzu/vJ
         E+YFdWyeZGxmzSiANTU+daY7baDOUMo43A5vnlcm03jqNmkbN4lOw1YlSKftraUvOQBV
         Qj7aQsC4RCMh54hl1uoGC9E2TdAmgJLbsi0bqZEgsyCYocj8ai/ykr6y17cnKOP6VcQe
         X2gffC3L3fxx69T6RDc4C6ZevKzFAEeCJPXLipxVRjWNHfTHh9aUv3bUtfjDITZSg1HL
         caew==
X-Forwarded-Encrypted: i=1; AJvYcCW4Xd8c6EqC1MnumnLjl44u30q3PO1m5xO9OoBeL3xher3MnJ3Uc0ojyq7KBkfNdv6leYb8cXYlq3S5tt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/gjtwY/vEx04Bsy+cE6kfvFy1vN6Z1pnQCR/qNBohGxpHv/H
	9KD3rmqEvVJtJqpB0dbMjGBV5bn+raqqPEuCVK7cAPtSyYgqml/kojNGAjf251E=
X-Gm-Gg: ASbGncv0w9TpQk4zZwiZpfWV5QUnAln+fk4nnf0UPYn+BiPHI9kNi7jCrJumAjMGAie
	PUcXtpa8/VEucnRvjs2QO8uiVXq0ABrxjvqmqBl9MaUpYZswTq5aS+QDM7QD2VIzEFUJautji2l
	kmn4IPNCJC4SNwqkk1mzjhnmaYp9HljuVa4wnB2LT6E5TV/100TEixQAXYxV/f9tG5cMO/6iG3G
	eFXMRySHqkRb78ZXCyJ/ShOCwjpiruMw8FJMSwOeaPdLE/YK3c08JzJ1WAEhSZGfWF65hbvMtjb
	kv7dOMaqNsVWiOX5gullbOuYamAhhZ/0XeeNAzHqDA1txaC4/4e8OQtd
X-Google-Smtp-Source: AGHT+IEC8NhWZ4nFelT85eBp6fi4TvPQ6Kzx7d5h/Km9A9mjgSdikufYzNisns3RJyMikFxJ1y2KBQ==
X-Received: by 2002:a5d:5f4e:0:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-3a06ced244emr13792f8f.21.1745441947688;
        Wed, 23 Apr 2025 13:59:07 -0700 (PDT)
Received: from exherswag ([2a01:e34:ec5f:fb40:df48:ecab:7887:deaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm19625573f8f.80.2025.04.23.13.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:59:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:59:06 +0200
From: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
To: Coiby Xu <coxu@redhat.com>
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
Message-ID: <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-7-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250207080818.129165-7-coxu@redhat.com>

>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>index 68530fad05f7..5604a5109858 100644
>--- a/arch/x86/kernel/kexec-bzimage64.c
>+++ b/arch/x86/kernel/kexec-bzimage64.c
>@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
> 	if (image->type == KEXEC_TYPE_CRASH) {
> 		len = sprintf(cmdline_ptr,
> 			"elfcorehdr=0x%lx ", image->elf_load_addr);
>+
>+		if (image->dm_crypt_keys_addr != 0)
>+			len += sprintf(cmdline_ptr + len,
>+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
> 	}
> 	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
> 	cmdline_len += len;

You are adding another kernel parameter but I believe without taking its
length into account. See the MAX_ELFCOREHDR_STR_LEN constant which is added to the
params_cmdline_sz variable for the elfcorehdr= parameter.

This will (at least during my tests) truncate the cmdline given to the crash kernel because
the next section (efi_map_offset) will have an offset starting inside the cmdline section
and it might overwrite the end of it:

kexec-bzimage64.c:480:
params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
			MAX_ELFCOREHDR_STR_LEN; <<< Should have + 31 here for "dmcryptkeys=0x<ptr> "
params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
			sizeof(struct setup_data) +
			sizeof(struct efi_setup_data) +
			sizeof(struct setup_data) +
			RNG_SEED_LENGTH;

And I believe the buffer might be too small.

Also, there is another check a few lines above that needs to take the size into account:

/*
  * In case of crash dump, we will append elfcorehdr=<addr> to
  * command line. Make sure it does not overflow
  */
if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
	pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
	return ERR_PTR(-EINVAL);
}
