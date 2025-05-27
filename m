Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9537C27C149
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364296; cv=none; b=nNpEu2y81ew1zpnf7BkkfLQBdk0qDJe6SRzzIoc6uhCJSis22MAKALbwPhPZZTJ3ftaIN0SnrjMQ1Nb8uOUDMk0h+i4eEUG2n8KZ8FX9cBo9Y/04ZIMCs/FwQRSOv+jHS4Xxs6YVlJfjmHE0XSLfQHWep4j+u6bQgb0gdM6HQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364296; c=relaxed/simple;
	bh=YQJ5Y/glLmAKoQr5dvAuvWJqArl6gIzSqIc37GUdMUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+fCfQi3iVoMbZg1jToTNGP/tURCPNRRjRKEmiiyNncpWZXbEV56u77iJBr9v4eAvLF7rMJwomxp5LLD0n/lggZ+H1XkzvkaSul6BeIde7YToXeGnphayauZIEUIHB27bcGq04SJ+sp9x3l6j9XrmyoRe5hJ9qkPrwenSkgSMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNkLricT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNkLricT"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso4567936e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748364292; x=1748969092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5A4z8idvhrlOUm9it3KkLJXHuCr29pgoYIORSBD9TU=;
        b=iNkLricTcmkQ32pNTImHeOIQfSWJHuSFcDAMoB2DZqmn2qEsRKp2MQYRByPZ4h94cC
         XdreZsnhcvZ/UQ5HC9Oty/UFf7Ywg0bGIlIZUfEMjl3KuUxz+xtqeF3uB/78g8RbmfBh
         VO13Tgs2Zl/1vmit6lLQ9sZSlGlNDGu7p7UXPtVpTbT1F7dKlLO4JyBBK1JM44cuQ0DX
         12He8xWAH0AOLIOfbymi+K6djY/S/4/Z+H2goWqgue+7ceMoY5EDcs1E9Tdtb2Ji7n8D
         PHqJag984rxMY1OOTNnFnI0xIMYICsrr+14l1P22XOLrnXblbmh0TcNJSWq4HELDgpl2
         ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364292; x=1748969092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5A4z8idvhrlOUm9it3KkLJXHuCr29pgoYIORSBD9TU=;
        b=C82Rl+oQzvZ0fXqeqahdZw6GJD05qe2GnvDqC5wiUiOuncvl/zvLdVv3b5+dE4hR/y
         QLphtCOwAHgJZEPC1/1k9vig0KmhpAab4fPBXn7TVNZpaSyxsf22s1c21AVHKdC4VNLm
         TR8b+N4Hhry5fMo23fjBvQKcu7cHCLcvO8U1Ya6/H8XSPxSL9O2ExMJKVyPAoBx42LKJ
         C9uZnEQ132VM7vYf9w1izX+FxE3VbkBYOcY+Y3NsojKQ1P45iUcSnq7yO/9Qrxi6/lDs
         DCqKxfWrMHBcLrtFHFkumfJoqQghijmx7a+mQOGH+knMAG+8yCyLiDdvFKsjMzNVyRml
         FQdg==
X-Forwarded-Encrypted: i=1; AJvYcCX7fEDTC+yiVvYvlcufqFl92Cb37S4LLgEcZ7lvlyEVFbXssbs1pEStkFJmjJ9vZZuzklaGw7IyM+0MUMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiS37x6S/UeYF08hTzcjSagmeJKX08anzLSyDzGoZ3R91nhox
	nB6CqCbLUrgK74EYLHeC/AE1C0/EBaIvKXuU6S4FOSc/KfJiCAeJ4VOMEukq5MRhJd79S0L7+JX
	LT+iyI26gJJuVVFOx1/4ZyNbjK7XplK4RkmuAk3KJ
X-Gm-Gg: ASbGncsOH/RnVrRNJ0k1DqkT+bkyyFbd9a2MmPU+fS2rbYLd3kNBtpnLFVhPDQ/H5ab
	5eug1HFWTlqDXSnHHG+nzPBalX+Z51WnJaOKq2iKAvsS3Exz31ewgrKwhqU0FqY3MZ8GAl9aOer
	4EcbBGRv57mKF3QTletzg2EC0x7W3wzbNiKdkCE0Zqu9fb
X-Google-Smtp-Source: AGHT+IG/h8v06G9ALBq3kMuLuMnCc0pX6R8Hsw0GvHZOftlFSEKI/3wDPROoYBwYqNq8NJ4g87AN4IhUq9rx89c3iII=
X-Received: by 2002:a05:6512:3b84:b0:54e:752a:ae5f with SMTP id
 2adb3069b0e04-5521c7a99e5mr4056444e87.8.1748364291421; Tue, 27 May 2025
 09:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527144546.42981-1-kraxel@redhat.com> <20250527144546.42981-2-kraxel@redhat.com>
In-Reply-To: <20250527144546.42981-2-kraxel@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 27 May 2025 09:44:34 -0700
X-Gm-Features: AX0GCFsUUiLqSU3MxdqUqyI_mJiFndCPXUTUWQVzFQES0xVHvwC1G3rVIaB4HrM
Message-ID: <CAAH4kHYMyJ0Td47KShOJGntRPs6RLcJ97oajA7z9VPdUbjT+WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/sev: let sev_es_efi_map_ghcbs map the caa pages too
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> index a4b4ebd41b8f..1136c576831f 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -215,7 +215,7 @@ int __init efi_setup_page_tables(unsigned long pa_memmap, unsigned num_pages)
>          * When SEV-ES is active, the GHCB as set by the kernel will be used
>          * by firmware. Create a 1:1 unencrypted mapping for each GHCB.
>          */
> -       if (sev_es_efi_map_ghcbs(pgd)) {
> +       if (sev_es_efi_map_ghcbs_caas(pgd)) {
>                 pr_err("Failed to create 1:1 mapping for the GHCBs!\n");

nit: update error to reflect the expanded scope?

>                 return 1;
>         }
> --
> 2.49.0
>
>


-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
