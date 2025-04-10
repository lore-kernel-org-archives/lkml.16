Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E102857E2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294733; cv=none; b=QOUWes/wroeuKQgjMmjRi6Z7smSbF9cDgfZO2vUiyR2ezLrb236HCBlWuZXrvcGb2XPwcBcZtWgDstVR+8qtl2AQBSTJZbAluFNTfrZPZV2qVbObfQ/5QftDkstmqfzcUr/Bz2TAIunTd3Gxw+fY80nV+rfmorDDZis/jlNKf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294733; c=relaxed/simple;
	bh=SWQ+PO07d5UqSiUZlr//Fs/ME3IAMb/DOUimXTj0cyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb5UrktFOdGm9tVYFxL/1WJSLrInRLjZg+bzCZPIWvnXxPe5aR+WI3mPqCU6tSunEJfIvxkH5USEZDL5no9v9hY+igvHxLZXR2nLd7fF9NlAF8kC82cCXRPqqqpiNO7RSPpUSQ5DEAn10PAwXYlpG10sz0S5kVjV+eLnA1YGg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaecf50578eso154695066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294727; x=1744899527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdSoTiFrBKyNtxOX3muUasy2YSOI6Sn7jCp2NmeOuXM=;
        b=NGLtVvbGgKA6KDzCxXM8sJ2h1lGRdxAHf4NcdDd96FUEXax8E4fpqt2TDcwpw+ZKye
         yJD1o/61bjcnvxKWFMDAiTnm6rIDjzkRSUw8TW52jMhZeuqo4VNgtpXh2IvJA8Cv+Gnx
         ldIkeaaxBdcida8K1IaPoGiqGVUXnbtPHr6vBNjmXFI1BU3YqSwNn1Yf8DnMyFx482Nu
         JLWhXg1i3Q/Wu/SqAzeWUH2pckT3CegeJYebXM+pGTTrvIBj6SzIMCaQiIK5Fky1rfVi
         6MQH49LCAVV+57WOw9GJC+K/sVZQuvEY5tVrguuiWZpJifC6iFEuFvaiU1ws8Vznj6QH
         mhDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTo7Gn9RVaiNhshrSQr/5xaFsCc3IOO0BOPm1UHXwVOYq8Rtw/+uVKVoQ71nTUNsaBLZRm7NPAzd/NbyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr68lvOn9DCf514AKI7LyCRlrB3yOn2BHmaDPBFqZCUBtVKgAv
	fusPyUpiL40mR47J0J5ZgdCef0TLh38DIr9mNrwOdSJKttG3TPHlEmZ9PJLBjeE=
X-Gm-Gg: ASbGnctYHtMFL17bl3osW933QvCrRXNNXHk7yPOTyn2hZGYebv1TwFSIFEIzYEvwRW7
	CJKKraaK3Vzym6ypiLm6gSGL7sDPY25m2e1Ebf/SR+UlOr5vmpHUUuOx1T3+90IlPnGFVAibuW9
	BLhOxOYiUgLAt+zBOuwwCwCuFJcNs7OWswMMPZxuqOmwfZuY8O1kFcgxFhY+qi+kPVM30PZ9Hgk
	1N6F+o7RDWNyAVHwrBiB78BdRMySDbm8Sry/aezz2bB6IXKERFGgLrHROPjScR6RxlPY2Zzclg2
	OiYwsBeZz+k6rjsSAPXQMks05ftVfWzkJmYSSvKbPPcpAEZJ10nhk/xLoZhmUzfeAMXryUDV6fV
	aou5CTPNwZGgWvA==
X-Google-Smtp-Source: AGHT+IHvIXoWOEJAFV3lyqgBCQOJHcXtSBhnnOdBt6HMvtpC+Tt/kkwfHs6YQPcxgJ3cj6OF3TBQUA==
X-Received: by 2002:a17:907:1b0d:b0:aca:a161:f113 with SMTP id a640c23a62f3a-acabd20d1b6mr291567366b.33.1744294726336;
        Thu, 10 Apr 2025 07:18:46 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce711fsm278311266b.169.2025.04.10.07.18.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:18:44 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so156302566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqPS8JGrYoYqZUItuuAdOiq9l5eEHoQYtg3K3ebyraQs90j3Qbk7pQl0PeBI7RoEj/WXh17IzF5oKuSFU=@vger.kernel.org
X-Received: by 2002:a17:907:7f0d:b0:ac7:3323:cfdc with SMTP id
 a640c23a62f3a-acabd123a89mr274752666b.10.1744294724513; Thu, 10 Apr 2025
 07:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409153650.84433-2-ajones@ventanamicro.com>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 16:18:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjxWais7O32zO-aX3tzVKA=aWUfttADn9OD+dxFp7HoA@mail.gmail.com>
X-Gm-Features: ATxdqUF2BhrEGJtMhKie_nWpHtZyJHSNFLWdzfe8DuYkkq82db_rzyPZQc5ZMYc
Message-ID: <CAMuHMdVjxWais7O32zO-aX3tzVKA=aWUfttADn9OD+dxFp7HoA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 9 Apr 2025 at 17:36, Andrew Jones <ajones@ventanamicro.com> wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
>
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks, this gets rid of the bogus messages!

Impact on SiPEED MAiX BiT:

    -scalar unaligned access speed set to '(null)' by command line
    -vector unaligned access speed set to 'unsupported' by command line

BeagleV Beta Starlight:

    -vector unaligned access speed set to 'unsupported' by command line

Renesas RZ/Five:

    -vector unaligned access speed set to 'unsupported' by command line

MPFS Icicle:

    -vector unaligned access speed set to 'unsupported' by command line

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
