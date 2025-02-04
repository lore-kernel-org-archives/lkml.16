Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99C1362
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692049; cv=none; b=cFjGW/SacNFu7LdKGHNYopzLkdeY3VN2s5nbQ5ZDK93GTgqfR1p62nsIj+2WoA2r6AL8QmS2u2Zrp55U3qH/3V/5Y8YAsh4i9jUUmRA0xaZBEo2nuV8mEDA0339YL5cFWMC/9qTQKX9UDrlCqovlHvMc7PMQleA04yCjkwz8Rjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692049; c=relaxed/simple;
	bh=rkuF08b3toVXBAg2So9hcpL/2YJFQqObQasqBIxOskw=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:
	 References:In-Reply-To; b=DeMQuFPj3xiLT7tF+c4kZ3SM+w0HKCHDDk5acndAgqegNOKhr2P25AJtEPxcquQgj2caIcM3aIbLHizHh28xF+8jDQwt+a+b3EsbxMdVmAsGnbqlkibXxcOssTP3iEDOOecLJUvIvLnprgNog5EtU3Yj/tRDhOoOjdvf17FkBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=anaGa5ZR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="anaGa5ZR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166360285dso100784405ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692046; x=1739296846;
        h=in-reply-to:references:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4BrePS0fFQD/QD8FvsbHn3Mfrtvj9wf2XmXlzwXrEE=;
        b=QshWWTVVNzTKJbAmw0PdzquWj/OPQMRot8p1YIk2pBrYYfxQ8iOt3sZ6CB8lq9k6hB
         4rqqvNgaguxC1nsFvtFeV03nZR3cutnb29fP695iTk4+TrEVaHwnMWBlHKuiF0hUNhUS
         xRaLwg3o3qyDzUXgHyY89lEvImpcV7n6Mg+acFUejFJZRimy0djGC3/rzYXvg209Sn4e
         7d4x0+BwVnYdJe6taq/6Vc63B+pr1TwbTTGMytF2vAWLmdBrR9rTggGnbuk6hNM0A+K9
         iwEGxjQSvnCIIHJ5VnmSmth0UxTFnH2qp9/Htcl1wlcfsbyhYE2SQmQys9lO5CrQg7OD
         qIYA==
X-Forwarded-Encrypted: i=1; AJvYcCWzZmLnvnJNDAy8ZqQqa54BNytr489kyOMAkWhEUnwsXaxEZe+TFQG6wNjgJwApyBiZhKmMX9ivlJIPJmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFD+3/7eBX5CIW3aUvKXyveEVhbElkmGsRRxpKrVPn0ouEyykb
	yVGTT5GltEo4wbqwd7IF1tW+DX+BPoLcFdHKg6ETm6+9vqkz8U3C
X-Gm-Gg: ASbGncsySbbiBn77LW0ycH+nS4jxBUXo0aLmLIHiuTBCTuSqPJ9t3ZUslyKTwKLDYFq
	UznKv9EL0iwRP3oxUYsRM+wHHPYrl+EK3VUtx4ot67XP1F00waW01lsskZD5oxjOCkZ9x68lhEU
	LEcEJ1Jl9kH4U7fQA1hQ8/4DcGIcPseDv4Mgx8kr5AWrXJo4dvSOntc3wdYRGulx1CzbcEPLYJs
	u9ySI/DekuvcJfGecwWrQn+jbpnzGhvHiwL0T65xP9EumPV3BzB2nusfcVFXWnNazJ/uwmWzksn
	matB8JyfYOKnmk8f+k7dkJZYwRbfv9Lc
X-Google-Smtp-Source: AGHT+IGqsJHwNzlx6+9TM9JAKnHUvbOEo++rsM4TM/HlHp4qmsIxp1HY8hVcFBZ2xYwbS2nKoso6hg==
X-Received: by 2002:a17:903:41cc:b0:216:73a5:ea16 with SMTP id d9443c01a7336-21dd7c66121mr409530815ad.21.1738692046502;
        Tue, 04 Feb 2025 10:00:46 -0800 (PST)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0b769f64sm12197265ad.238.2025.02.04.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:00:45 -0800 (PST)
From: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1738692043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4BrePS0fFQD/QD8FvsbHn3Mfrtvj9wf2XmXlzwXrEE=;
	b=anaGa5ZRSkGbg9bx9edd8rXVHLwL03LIasVGFRpPg8M2UhoC0fXXpxJEZHIqPwZD8QUhcF
	vqN3dQaag1E2N5chuhAtvsPeC/VLB3ll1uHp+jjQNE4kwrvC3OtHGc6E7Xjf2HO9fV6TFK
	wXUABPRO7O9aM8fe0N9W1kZI+GXXqODG1drWQ261ZREqQ7MJpKZzMiU6Uzftw5HkbEXef1
	uFnQ/Ki/h2Bx+ulTs96GMR+8xzku+HmXpbw6R5rlpUDxHtXBMvkNsAEw6vnZBZ3XbLJ3/h
	QL9bsHKHQe7DeJCgpCQ0Hr7eo613hO+0TiguJW7CaMs5b1AQLZWKviACawaUJg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 15:00:37 -0300
Message-Id: <D7JUVZEI35EG.3CK5XCVGHEFN0@marliere.net>
Subject: Re: [PATCH] powerpc: mpic: Use str_enabled_disabled() helper
 function
Cc: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
To: "Thorsten Blum" <thorsten.blum@linux.dev>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20250204154424.4231-2-thorsten.blum@linux.dev>
In-Reply-To: <20250204154424.4231-2-thorsten.blum@linux.dev>

On Tue Feb 4, 2025 at 12:44 PM -03, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
>
> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
> warning.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Ricardo B. Marli=C3=A8re <ricardo@marliere.net>

> ---
>  arch/powerpc/sysdev/mpic.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index d94cf36b0f65..25fc4ac91814 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -27,6 +27,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/ratelimit.h>
>  #include <linux/pgtable.h>
> @@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic=
, u8 __iomem *devbase,
>  		addr =3D addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
>  	}
> =20
> -	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n=
",
> -		PCI_SLOT(devfn), PCI_FUNC(devfn),
> -		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
> +	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
> +		 PCI_SLOT(devfn), PCI_FUNC(devfn),
> +		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
> =20
>  	if (!(flags & HT_MSI_FLAGS_ENABLE))
>  		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);

