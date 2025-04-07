Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F31ACEAC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034150; cv=none; b=cQesbKcnB9OKYqyMC+IItxQ1iT3aPmmLCDETn/4qr/jKQDJSOuUGJKRcGRqvVFynQZZmxW23TmhD1k1zXEP6RoXbWwoihmQdyEZPgdKkDrkZcmVAmvgyjMMrf76G1XUaTRdtLvL+0KcouaVkxU70qAltuo0q8X1vJsaCyuinXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034150; c=relaxed/simple;
	bh=yEvItmRbBs1el1RtwL//6PnMz3t8uIdcQ2VH+97QDYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcqIYLvOtHMg+3jgxpSXO0Rl5ypvgMOlleXkv38yxGg9IQS5VghiqOdA/gXIW7YIxh6SRhVlP2oeEuQjwY7kcBkT+EEYxHjauhhFqz9is2uAVIpVqHE2FRI/VO+kaOMOj7f9JDFzxBuw844pxKdNdYsUAsnbtKi45B1FD1YKABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YyDLzEmm; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YyDLzEmm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 13A6740E01A8;
	Mon,  7 Apr 2025 13:55:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jlTz7Hq7JsVl; Mon,  7 Apr 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744034142; bh=T9VNCKs4GFMzeh5QK3Go6LcQv6xuP7+1VAAyXXx0Yx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyDLzEmm5bAEY7UqC8r0sAqVEyXoMtKHW/XzXKyDQK/WsX81WXzMeSL2MJT2tFN9l
	 HgvwkTlZe+YuAsLf3tsrHnzGBpSsdiyaXieBM/rzr42bNyAsLonjFsZTI/H2ZPLbAa
	 3+EiQRxVVUSEN1ZhfsP+0Y846EW+8y9SCrBIpmChNpthyZJaEQMGGsQEyJ1QFzOreD
	 Nkyv1PunYczm9CoYbRa/RnX+wZeVzIz4bJp/ncdIVrimOontVH7IsQNnU4El84huad
	 qBzV9ng4etCT0YFz/hlz4Jy24W1Hd3sG5GGyDWQwUTQKIr3kgKtfHrri2gr9K6JLbU
	 w2z1l2KZpW0v2cI6eQhvWR1pye2q9ri2RDPXGCKmKOPh25UNW99JiO31OhXoNM/tmu
	 3/eEyBYv/BrOHQ/cXTsGxag3ycvc6metnU8yafdcxPEXee061tkv956LCcZNp9RzSU
	 CZCjArax1CEQOxQqpam33HpUVYDsJ3AxQHdqg01WTTxU/NDjpRyKZQ5NVXAaO/clbo
	 HwAzby+pXLhvkgyRSNJAAA5Ed+o7cb43BI4tsH2WuOmP5KXjtv9kjVzbkWuhaCFWce
	 +3rv21Gi8aZFprW4nZDzVRIYatMzDmdF/CtmZ+sLVxixZ2dtqO2BS47ORzfcSWXPCQ
	 8A9aXZOsYooKVqWR+XWms9GY=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8842740E0215;
	Mon,  7 Apr 2025 13:55:34 +0000 (UTC)
Date: Mon, 7 Apr 2025 15:55:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kevin Koster <lkml@ombertech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>

On Tue, Apr 08, 2025 at 12:21:50AM +1000, Kevin Koster wrote:
> To rephrase: I like knowing that "CONFIG_M486=y" works, in the kernel
> configuration. If not, then I know to use other OSs if I want to boot a
> 486.

Lemme put it this way: off and on the topic about removing 32-bit support
altogether comes up but we never go through with it. One day we might though.

:-)

> For email/news every morning, then a (newer) laptop afterwards.

Oh boy.

> --- a/arch/x86/kernel/cpu/microcode/amd.c
> +++ b/arch/x86/kernel/cpu/microcode/amd.c
> @@ -1093,7 +1093,7 @@
>  
>  static int __init save_microcode_in_initrd(void)
>  {
> -	unsigned int cpuid_1_eax = native_cpuid_eax(1);
> +	unsigned int cpuid_1_eax;
> 	struct cpuinfo_x86 *c = &boot_cpu_data;
> 	struct cont_desc desc = { 0 };
> 	enum ucode_state ret;
> @@ -1102,6 +1102,8 @@
> 	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> 		return 0;
>  
> +	cpuid_1_eax = native_cpuid_eax(1);
> +
> 	if (!find_blobs_in_containers(&cp))
> 		return -EINVAL;

Yah, thanks. I must be going blind. :-(

It is all clear now - I'll run the fix on my machines some more and then post
a proper patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
