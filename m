Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90FA1CAA9E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151813; cv=none; b=JqP6zCk8lno2nIjH1yxU/poZFZG2nndF7Tcr3mvBerZd7WNToZ5wioj9Ljk2Qch1DdRy6ejSNy1P+ZM130ZH5H+OxPohCe2qOpXZ7pux5E8+lBhjBXx4H0JdQ/bdGRiKjhms4RAR1HzkrR5zujn8CPZAbYvIgukbXRnwB6ulYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151813; c=relaxed/simple;
	bh=+L94eFi2uDp+TIXCc3hnZ2vtGNEe9Tc6lJ4xzdwbfVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9cAiFyCnwRZHiVqekUVKEQSA8XaaUS1CUPbfXr3lMVDoooEvUDoESTEENEXZznHzfebW3LQTBrYjqy2XqdNvBzFo9soW70PiYJ7KTk+C6HCXOVNlF19CV2UMspy9JO9MCNozcenkaTkQhxkodUJV5AcpE0bsmOXmdezxN7Wtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86715793b1fso848730241.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151810; x=1743756610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpAT1tp71GtIV4y+dKOaxRDAz6+mZM4xo94aujVs+Xw=;
        b=rp8fzsRtLSVDoMidnYjbaoevA4o76nWAizWPUj1FRL7+LsCjrcnlMyFJ3stk2eFVo2
         kTD77IO3c33iABgeYbdcWnsKlMDrcVUbzgfG052DVHz2fMc6xDepqSSzGJyKc1ozo4yw
         yQEPo94G7EeIs0PmErb6gEvjH9u/MLYHHIrNwSuDHaiv39nsqCTqhyMol7T1dvQtgADq
         1Ft13MxQ0EdMcynAKLRt7fPISt3YEN/2JbbnVEH4cUvvyBU/NWgIBxXwjdh+FOCTF3HK
         QE0GtSftgQ9i2C63JgmAgAeKRgCW46Upyd+0zNcd7f7AuDPBKY2PJHctE/Hu+krdm2yq
         A9gA==
X-Forwarded-Encrypted: i=1; AJvYcCVV/F0Bqg3JHqRNeW9nWvIYm+hkNzAQdQmOCov5E624wPD0s0SH1lPOZi5fuEwvKqpnNZpEdwR1tq0ylIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzneJetoBN0sQRwPomOF2A2tZuEL1V4hMPdcuLsfLPw8yfrNMoa
	/YG6MD9Sd7/hMSpdDC0LtH4LSTPbd2fvxhpL0QQ0QFzYVwFyrICDVXhfNvXm
X-Gm-Gg: ASbGncvDeevF7UOqyUCrtjX+WEcxqd7zFogccu3VsbXE8QaWD3wz5z3p7PH+2EvvSc5
	xyhyjTaaFmAF2TSLeIKHLHHFr3pYyOKcv50GynF4QDC6GlpJWWdzpigzhcnJDiViNS1cdV20QOZ
	BDqKpH3QgWYGRwd942sI8No9BZ6rwVeIuEFmx8Urxz8jc6DM6MhldvR6xyUv1gFFHs+PI+5wnaf
	Vzl9rqtSY9r9Z4WU9S9f5dw6Yvsg30R6UI/ltwpjtWAu1DO8hMue+mtJDz033iAQDZ0RNr4YgI/
	hkKOOrkWuFq9WRHt4dx+bAA8KRlh3r8fAREF0co1VcnMSDNDJDk9U68ipgZHABZSpi+qo21ABu9
	3+JJQz0Y=
X-Google-Smtp-Source: AGHT+IFHRa/H5t5p+xLu1jeFtGiZoaqCOXezRyqNZf8cHj8L2IQRr/i709FCGxIZD0Kqi1wFl2kbng==
X-Received: by 2002:a67:e70b:0:b0:4c1:8e95:24f3 with SMTP id ada2fe7eead31-4c5870bfcf2mr6581990137.24.1743151809821;
        Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfe5410bsm304656137.25.2025.03.28.01.50.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso848723241.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSPqdQYAW5dYaEZ6Qk9UHZh/Ja4BW5IE1B4blN1OKPkUUj1BsPgStqiuKrwtIpBqDLq0N3Dt4C9oDfdpo=@vger.kernel.org
X-Received: by 2002:a05:6102:3e16:b0:4c1:93df:e838 with SMTP id
 ada2fe7eead31-4c5870b7dd5mr6510011137.23.1743151809258; Fri, 28 Mar 2025
 01:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
In-Reply-To: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Mar 2025 09:49:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
X-Gm-Features: AQ5f1JogoBv3k8B-Hk6th8seQNyRgUeRzbavl9KEknZeWimUvBFTQJUJQ3kzQ_s
Message-ID: <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Thu, 27 Mar 2025 at 23:39, Finn Thain <fthain@linux-m68k.org> wrote:
> When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
> generate console output. That will continue to work even after
> debug_cons_nputs() becomes unavailable so there's no need to
> unregister the boot console.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/early_printk.c
> +++ b/arch/m68k/kernel/early_printk.c
> @@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
>
>  static int __init unregister_early_console(void)
>  {
> -       if (!early_console || MACH_IS_MVME16x)
> +       if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
>                 return 0;
>
>         return unregister_console(early_console);

Perhaps the whole function and the late_initcall() can just be removed?

When the real console kicks in, it usually replaces the early console
(unless "keep_bootcon" is specified on the kernel command line, which
causes all kernel messages to be printed to both the early and normal
console (and thus may cause duplication, if they are the same device)).

Or does that apply only to earlycon early consoles, and not to
earlyprintk?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
