Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12031E834E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751792906; cv=none; b=cD6yf3juvFp5WBAkZVrc3mqmbQK8unaHc424Ukf0QdhwgHDm15IW/yT/RxLbscrRC64nl7yvMdpJ/uQ7jtUC6elgP4Seef+/vHDQj1TzLRsrif6RraYXVAFw5gRkJtSpb7oIhpMrDHGfiq6avtpT44qhVCLRPKPwVE+3bS8YmyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751792906; c=relaxed/simple;
	bh=YeSqhPGOCSEzC/m1idgMdrl239XEwVQUOkljmT/rhbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp5ipxLSgiRXKrwfmyY6hzAuLih1Vb3t0q2S65c7yGYWIPcwYsFgJJYP2HQgfRO/pcHiT52+hHnbkEz0Hj0m2Bugn/mKdCb40HlrdnFTQcayuTzo2HH4h6OWLRfxw59b/ZVUAwUAdezuR178uOTInvNeJLufikpbthxjNy6WycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso272141241.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751792903; x=1752397703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKNWfzLihse4/vZiPvnOVJrcOayLdn1DUR/G7sfcSvI=;
        b=BaLuTTfVikBtTuDiSoTaA/aH6ZI5qg5PnnJQInWHjdvXqwm2SMOijCg0Q+c9qxW2WU
         /XM1gIFRK0KKrknD1txrYR4aK2F+qH++SREpjvbs92QJ5b8iNByusd0sUHfG5W1G01v6
         REIGtxgaT+XUu2Sws+0y4n/KER6IJREE0G5qaJjxmeJL1Sfe/7kSBHgM9J9AKH0IGOM2
         Bj8Lpu1fdTNtRKGV60AsM0Mwdr2YysxLG2ksGzmozFDJ7Iw9zjS8X0ya5bY4D0ne0JtQ
         mN5Gp7mIZjSNVYXKFX3NhDml01Hu2KqqqiSL4wyzVI0foFCrPfApQyp9dnWirWPV9HQ6
         hwag==
X-Forwarded-Encrypted: i=1; AJvYcCUONEWuAbiJRc5kAmBVH1jRKq6Lj1ScB/Q6Ebl/FecXSExZlkNiysv0wzGjX/FTK1RVWgmde6QzpLfXvCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmifIYY8FT3y7rneVguvxcL2bNp8ENFp4e0Y8hBrp8VxYy02O
	sPJR9Oosfwk799arfwPFC+mHLMIrxjWBBf9htR2Wr7/oiAfzVH0KkMPa3W2UrX5R
X-Gm-Gg: ASbGncuGQ3VOgrNy5nDHzL14jIVuAUbJug3M8XAUYyB0yrJ2s3dtxQw1418vi8zVAz+
	HLFzM+5JYLjXo/XgUYExrqUK55D86H7PLQQb9921QCXaLfrdu9fpfXbZ8j5tkeagcf0Ly69AoMO
	kIqi3TT4qMBbdZRW49nI0SMVt9qSw7Bv6WskFcVQGUMX7hbvsuFIXq8/ZtuiGRzOj/KuNpYDAxc
	ej9tU4e4GDoUp6EhM6GdmOAXjuHhe4DWirOhe0H303pdzAbHdbwZV0ig3fLVBX30xnXqNEMobmc
	SneRA063c8ElxF13wknxYe2dHtNw8a3IUQQg/OTz+32qlAYWl/X/F/JjFLZKVWMENf8HrGemZ1m
	XK02yzlrkM3MQkRpysG3YD365
X-Google-Smtp-Source: AGHT+IGsm3iNjE4c3o1t31BaSUavriov95zBsbTcrSFtl1SkIPmyD4sukPzlbL761jQYpjn2Xhcy0w==
X-Received: by 2002:a05:6102:4188:b0:4e7:5f31:7443 with SMTP id ada2fe7eead31-4f2ee08c375mr5044722137.9.1751792903287;
        Sun, 06 Jul 2025 02:08:23 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e922ee7dsm968540241.5.2025.07.06.02.08.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:08:22 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso272136241.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo+fUrSLWhfuCCJQ9dmU6A+SQMdRSL1ul7mvgcf+gpyyeMNA+ky4vbXHncJjr69njBKxI2/v8b9zNqlsw=@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:4eb:e04c:f5ed with SMTP id
 ada2fe7eead31-4f2edff096emr5969957137.2.1751792902713; Sun, 06 Jul 2025
 02:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f7b4c02a1c8ed74ccceb5535d7e1e202deada8ce.1750739568.git.fthain@linux-m68k.org>
In-Reply-To: <f7b4c02a1c8ed74ccceb5535d7e1e202deada8ce.1750739568.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:08:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmxV03tza_4M3+YJg9TT6yJKuvmNh9=JvdM7r-r-kR7A@mail.gmail.com>
X-Gm-Features: Ac12FXxXbSZrezpm03lRHY3251vjUFPmaJuue3zNaD3M3TNEGWEHUr-PZeSeB6A
Message-ID: <CAMuHMdXmxV03tza_4M3+YJg9TT6yJKuvmNh9=JvdM7r-r-kR7A@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/mac: Improve clocksource driver commentary
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 06:36, Finn Thain <fthain@linux-m68k.org> wrote:
> qemu-system-m68k -M q800 has an old bug that causes the kernel to
> occasionally complain about a soft lockup:
>
>     watchdog: BUG: soft lockup - CPU#0 stuck for 5107s!
>
> There isn't any actual lockup. The via1 clocksource produced a large
> jump in jiffies, causing the watchdog to detect a stale timestamp.
>
> The 32-bit clocksource counter runs at 783360 Hz and its period is
> about 5482 seconds. Applying the "nanosecond" approximation used in
> get_timestamp() in kernel/watchdog.c then yields the duration reported
> in the log message above (always 5107 or 5108 in my tests):
>
> 0xffffffff / VIA_CLOCK_FREQ * 10**9 / 2**30 = 5106.209 seconds
>
> It is notoriously difficult to correctly emulate a MOS6522 VIA chip. So
> it seems wise to document the VIA clocksource driver better, especially
> those hardware behaviours which the kernel relies upon.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v1:
>  - The letters A through E could be mistaken for hex digits so number the
>    states using roman numerals instead.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
