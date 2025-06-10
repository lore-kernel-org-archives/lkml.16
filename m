Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772B29AAF9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561583; cv=none; b=rjVfAfLNoGraRNo/GSAFlQywGUzGT7lhFzmWmucrM/ba6oxreXt9z/A5Srv3pnUb3svboht2HdD1onHl+J3f+8a25OO7fqqAyCZkZz1kcxmsldAu3fe/dJEeppEDSH/M+fj6VWo2yVo73NQhJjJ6JGn6oXf5d3ZqcD4Idvshf8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561583; c=relaxed/simple;
	bh=Jsox4AqmuF0T2eC0/6nvbkiWzIT0wulj3TrnpMEznbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3Hzz9bO18lqabMCvIV+rEJQ57CIC1jyrFqENKyTRea6i/uvyxRONKFYUPmoGsBseA/+Xkt9OEHp/RjCYxszi7WTuN0QuiaTOLQ4qDB6mFik94pR7sqiOTeAq8rV2+MTzp+YwZHIr0YueJLGc0UgooJNEzhaj2NLWgEGB50ME9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=y9daLEYn; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="y9daLEYn"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so4406699a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1749561579; x=1750166379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VIDU90Ie38fuojjens1gbZ5zc8b8xPeZNLiJttT95T8=;
        b=y9daLEYnpUPrAhadRt/z3MtezGP+VQuzDNw/UVdUWwR3SRQrSYJgP8IF7DEmVwvxXR
         SRAiBuKkoj80vVgDDpHftL7757QjwPiCirMMcW6VYu1XrnxYZW9c5zfQI2nmK+f37YUa
         VI6PCl7gKuzt1DqjafemiCKqRv7gy9gWixJitxChMbu6K6cWRAUZTiEd2j4tZ/33OwxO
         NhO73jiktOfU90JUZp0lWfdtioQmTldw26DpEB9Ico8gdY5Anuf/g/MrPbbnsreMKGFA
         6fCTcdasldf+QSeRgqlhrFirTTJcwsyROJE688JNJDCyMtem1oPNPMIjJdHow8jAHtVo
         qKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561579; x=1750166379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIDU90Ie38fuojjens1gbZ5zc8b8xPeZNLiJttT95T8=;
        b=gtNCKENGHjG0taJ4g0cyWIQDbCVTEfQwYXayyC5VcemQlkjPmI0KAAS0Pfy3kaPbaa
         u8o6P09lbJWOgRDi8qrMvUm5TwxapEGiNI7z4DgCr5DA1ZEtKFEQK9LTIjdMBiFhdLJn
         yjHnxrVl/qOscZBNk5ldVwhYPfptSIB3UiNdjXMQ+guIrAeP5Rmqf0txEoaggZTRLAjm
         CaLefEjRilsMki49x53jP3QAo/N2111ou/FxKHjTrgZQQlcQ3kyk8btOpCRgvJO5yVzF
         KfM0yhqqh7GXkYdR+OE2yokT1jRuErtFGpWL7Sr8k39M5g5P/cbK+wdF+cyDD8PVZS/4
         g/7w==
X-Forwarded-Encrypted: i=1; AJvYcCX1LB5eEko0MtWZWBba9DEKuyeFnAyYb389c/1gkgapK5Hgd2ZgMkXtkLnn5gB/D9l+qYP6klWYh/Lzb8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9f/pkP2810Ax2K9+3bSJGcKDqggZRbFgNJ+wPDVo26vR6Nmqw
	K41yPVUptZOzRA9q1RS32dOPlFi0EamF8sKyW1h/ska4WBY6337oHbhuXYCPPdmutQ==
X-Gm-Gg: ASbGnct/iGAUxZhRQUh0pG485coj9ye6D5YV8zTcXg27+dTFbJakFY3KpSDDL8tm8bd
	mkVIYnBOVDKltxyE7MkcG98W6cso2WurLl5fOUy+qgcrgOY0e+Pq3c/Od+X9QsiR5gX1NRUTX2t
	LLbxUiJ2Gu4m3joAKgjzvGvJVRXcI3V4HI34OrGI3kLdZg/aGGB0RH7+55cAnwgFMGECQ8PzSxc
	DfqipPgfQieiJMW85oF5jW8J5hIPCxRiakQQ+XwJYx+2NnzN7aZCgqHQAe6dG6uSADWezqX1pku
	iQn8mbn+QqYku9xtNZ2S1Bdujte2fAQxEzeZRFt+mc2yDzcYshsaIJckKzj1j+NqKZ/9zYYQxtJ
	aIOrV
X-Google-Smtp-Source: AGHT+IG/cCzTcGiirGBsHHHWeDKwdsnsEz2/ln/aWRJ/eCbaXghL1SbCEuAcFeYlYWL4UWTOVK/saw==
X-Received: by 2002:a17:907:1ca3:b0:ad8:9778:4e51 with SMTP id a640c23a62f3a-ade1a978b6cmr1508784666b.30.1749561578630;
        Tue, 10 Jun 2025 06:19:38 -0700 (PDT)
Received: from [192.168.0.105] (nat-108.starnet.cz. [178.255.168.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7d2d8sm724943666b.180.2025.06.10.06.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:19:38 -0700 (PDT)
Message-ID: <2d365f8e-de15-4321-bc69-e83721e5e7b4@monstr.eu>
Date: Tue, 10 Jun 2025 15:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/41] microblaze: Replace __ASSEMBLY__ with __ASSEMBLER__
 in uapi headers
To: Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-18-thuth@redhat.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20250314071013.1575167-18-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/14/25 08:09, Thomas Huth wrote:
> __ASSEMBLY__ is only defined by the Makefile of the kernel, so
> this is not really useful for uapi headers (unless the userspace
> Makefile defines it, too). Let's switch to __ASSEMBLER__ which
> gets set automatically by the compiler when compiling assembly
> code.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/microblaze/include/uapi/asm/ptrace.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/microblaze/include/uapi/asm/ptrace.h b/arch/microblaze/include/uapi/asm/ptrace.h
> index 46dd94cb78021..8039957a1a9cd 100644
> --- a/arch/microblaze/include/uapi/asm/ptrace.h
> +++ b/arch/microblaze/include/uapi/asm/ptrace.h
> @@ -10,7 +10,7 @@
>   #ifndef _UAPI_ASM_MICROBLAZE_PTRACE_H
>   #define _UAPI_ASM_MICROBLAZE_PTRACE_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   typedef unsigned long microblaze_reg_t;
>   
> @@ -68,6 +68,6 @@ struct pt_regs {
>   
>   #endif /* __KERNEL */
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif /* _UAPI_ASM_MICROBLAZE_PTRACE_H */

Applied.
M


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


