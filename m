Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB641F4CA9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793298; cv=none; b=cEDHhmpxgDsw9sFYHZ9p9P5K4SQAv3ikgUtFidsBnh8vx2kbP+F/kzHOMC9ui83YY2+UCER4nrHUrLvG0d7mlSTpdpt1FUvzwiV3ITh9WTe+RG9K1Zer7Q9dNIPiuBoq+O41QfGtx9n6AUgkpC2jbBQRlym9hSeetmVIDY6Wy6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793298; c=relaxed/simple;
	bh=twZ1h0h+CQ9kTU/nw+VRZxQm4n4WHFaaH6OVkJMmsOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoRcHyW2prCXeeJkkd9diKINng7/d44Gh6xfrsXjtCVG1NqiyEFdvYkXpztVQ9Us79ed0yiz04kWZQHkHk2IwPE9W+dAMsfXA6vjyHQE2K56tV+yVoKolDjYoOW7sTGd6U2Xd+qMzWs9FYM9yhPVtb3llDwNjOJGiXmSsardqfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5315acf37b6so687412e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751793296; x=1752398096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpuiKWSlRb5/DqpudyVJ+WdnWHVq+LpxT+xZy46xwLo=;
        b=afE1eoVJyCqt9L0T+5CgGMMOw0Bp3v0HTYAf3Y813ZDuVpVWdajgx36NmIrydE1Jwm
         PbhsTP/pfrdg5yWWshqh+k9vBnZXuAT+w4/5PY7oFBSQd06S0fUJ8GQPfmb5h+9xPIte
         zN1YShMoCztldfkwzWm/639dZEZhSdefzRPn59nCm4oeQ60pvxJ7nT+35po0M/rYuOoo
         loSiqew7o58tSBtbqdidQzIDDPsFQ/6Z+eWRVDrCf3GOAWbVFWLfIPwia+wZVPeGUE7K
         3R91hu6STPMLjcIDKXh1STfITXv0xcnXfNzpMB4A2fOEC4DPErQGea2WCCDoMW1ySZ3E
         9k3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfMp/vBuIj10kOFBJVUnFj6fqvS7vrMJ4bgH8NEYWoF52He0Yl9id0yt3YCxPyw6wvNOvXgzrRpm413NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmhU96yAvJkhbhuit5QQC4F4lEqYllX8TQ1hE7t2JnjMI6YYN
	ajqKM/neLdOtJlknw3xw4cPF5qd0SMBim9ugNJ6Z/kJD7GvL9gt0zouFW/fcNLQR
X-Gm-Gg: ASbGncuAM+A5ZSdUNgy1BDvyE/FV7J+3dwkbi53ABamU3OCzzWod0w0QtgMxOhrvArA
	UIa24Lx5CVSav8/S5DeXyaDF2CWn+LY3MUgjfmCGh+PeT/QpdwlcqwLZJQmJTCSGP2KFvdg56Nq
	m4U9gjKM5AeR5j7Xao+6o50XtrfjLT7vmjYEsVPb1AR4HaGO2PkJUHIQA00m7GdTqB/LwvRl3x/
	p4GXHvV1tS9DKL9JvxcJREfKG41mg0O2RbPhSwPolXhohtRtkzaf50m9loj6t24h5ahpvIQ03mv
	htZ+QF0PrK3bFYHjR2YASzy/Bm/zsH/Y/ajlPmUx5Zc3bN+iC17h3JbtjE4F7zf69IV3UhkHPW+
	5oRqYSoxudvIzcvpennQRXY30OxuJwuKysYkLTq8=
X-Google-Smtp-Source: AGHT+IHxvd7REFBtPcm97BQaEVY+9o3oqqISR5/DXkccUEmSM1cM4I81BqsTkLS9SzzzlbzdPfdS+Q==
X-Received: by 2002:a05:6102:3c83:b0:4e9:b793:1977 with SMTP id ada2fe7eead31-4f2f198657bmr5026941137.0.1751793295712;
        Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea5422a3sm808571137.10.2025.07.06.02.14.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-531b4da8189so756942e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV/8NQENAS/E5nfnYHQ1xQ5c5FsKEWp/Xv5Mx2dEGfXYamLJk/wsCdaEw6R/tEIOrO3bASP4Q3wMOq8cE=@vger.kernel.org
X-Received: by 2002:a05:6102:2b99:b0:4ec:c53f:bd10 with SMTP id
 ada2fe7eead31-4f2f244587dmr4452386137.16.1751793295210; Sun, 06 Jul 2025
 02:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com>
In-Reply-To: <20250416114240.2929832-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:14:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
X-Gm-Features: Ac12FXyQW-WG3mw_EKqvXFLQCZ4RQUwBXhuOprCzm3XwKexOdAmS9FqFoXGWDNw
Message-ID: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 16 Apr 2025 at 13:42, Daniel Palmer <daniel@0x0f.com> wrote:
> Allow the experimental dead code elimination config to be enabled.
>
> For my 68000 nommu config this frees up a few hundred K of memory
> so seems worth while.
>
> Boot and build tested on nommu and mmu enabled configs.
>
> Before:
> Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
>
> After
> Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

Note that enabling this requires enabling CONFIG_EXPERT first, which is
currently enabled in the Coldfire defconfigs, but not in the Classic
defconfigs.  For atari_defconfig, I see a size reduction of ca. 150 KiB
(gcc 13.3.0).

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
