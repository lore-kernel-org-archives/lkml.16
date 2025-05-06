Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC64283FEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548618; cv=none; b=F7eA78UcbFLBLMSMQTKMPoWDK729nPCrvqbOL59yJeITkkV8qnu8Xd4XxMbrOHAqlgf0X83mxkdwzu/cWvyGEp/1y2HQvU9XlOWZUPEUK6X9NMbSi6FRRWipmXWJCSHifNVm21Vg20PvMp0dTYBa5k2VWdNIU+PSey5AngIT7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548618; c=relaxed/simple;
	bh=WtKtvmfSeM+CosrA7WBfW3cus3HCiCQxwukcBISp8s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASmFp5cc4VYxklIxWHYGgoCluPM3W80c4hq7ZXC0/lvlmqvKnp5MCV9zlo47xahVDv9qLkP07Jrbzo1g4qGx7M8t1tegCAmIARXolx1u2/L7FegST5GXcnB5UBohp42PPY9TGuJX/q+ZyWLNosiZCN9MXgrH2iubijU76qJnVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BNCTG0Kl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BNCTG0Kl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso11069463a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746548614; x=1747153414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bV0A804SbQkDMDC2KCXBs+c8nlYV9A3qmknsw/yVz0g=;
        b=BNCTG0KloM7xGTLj/2h5qNrGrdBm9UlhbzAD/H0zg20Hqr/kEh0lLMq4HW0V4cuUed
         6vElY8qB6WaE1aTN19GK/uHS8ppEI0IPvJlyOTB6BrAPa8OLAI5ptFp6rEz6BBs9CCiN
         nLX7qXBLkyDy7UoIHX6x61Pz8Srj23eSDZF2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548614; x=1747153414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV0A804SbQkDMDC2KCXBs+c8nlYV9A3qmknsw/yVz0g=;
        b=nH+K5wK6Dl377Pk2axwIq5aOJdVloKb0bEpugIhZD1ZS7i/z5SZggYziNfllgRZlcV
         SEq0t6dCDUO43qrNegUmMisi2tv1v1nXrX6xWPyU5+v/ENANemKtJK+RC4IznixBQB/R
         OG0ZgyNFXrfLEMNO+CecWZT61T55tUlwzGmfHbRH+AN8eEe0dcnsIG27v4BQ9ocetnqg
         wpA4cl7ECAobhvPeq+WzjauOxEZmy5Q6G5uwyYe58vrwqxjeVWlfAjLYR04eXgRdrdga
         d54auXunS1nPFjp+4X+FEnNth07XJ5x2Gsg1bGfPRyN+hBVflEEdHfzIcNFtJGHcc4v+
         mrhQ==
X-Gm-Message-State: AOJu0Yx4A4HAxhAAOmwKZgMWynjeAcY1whZkOHqIq6uyElxMmLTmNuTH
	5vDFJMCt08+phSYDsfBZ/EM6w4mKr0LbkXeoGn+VQB56zb5c49esOP+CVKvfPvPszKCBL+34yNA
	gAsg=
X-Gm-Gg: ASbGncvneTXuk0nqibJR1Uf/Pvce/IMnQRNo8XYcgYeO2h33Mz+ooiu/P+A84z0a8fj
	WWhfB5KVVl64pbDfQkH9fli+3VEcSQi0tT6uKkk9g4y2UgTm8z/XQSNyeYxzjKycs0OikA/BDCk
	6aYOytqnpIh4flgOoKo9ZqkOEElvRq1YbkrUd3oGSIO2Jop1wjUL5+RiCtRYYG06loW5QHGk0vr
	/6SX+WH4hLl/FtRriJuHzij4DLrFl+EHsiQht6PI6u3fwjJ3oIvnH7Q5ILtNujIry9rrcywZ2Sy
	6EPT41IabXhTtf2I4FRHQZ66/qvd48U54QRTlRK2M5q0qOZkYFPqVyaEr52plxiMdY6Bljh+sud
	7zKOwuktUMBKyYm0=
X-Google-Smtp-Source: AGHT+IEXYr/OsDHAntfTzqsYS43/nYNL4Bq/2NelixezAbRSbMRkA9EmcarbrmKbAX7fD760mrYibA==
X-Received: by 2002:a05:6402:354b:b0:5f0:48df:25ae with SMTP id 4fb4d7f45d1cf-5fab056dd6dmr10013065a12.2.1746548614243;
        Tue, 06 May 2025 09:23:34 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7792bdbcsm8159423a12.42.2025.05.06.09.23.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 09:23:33 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso11069370a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:23:32 -0700 (PDT)
X-Received: by 2002:a05:6402:51c9:b0:5fa:964f:b8b3 with SMTP id
 4fb4d7f45d1cf-5fab05c1592mr10611115a12.25.1746548611758; Tue, 06 May 2025
 09:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
In-Reply-To: <20250506154532.1281909-8-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 09:23:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
X-Gm-Features: ATxdqUEUxtQexeiSFubPfGMOQ2_V3eoqd05uif6u60sRHqOzmMOzBQKGKQwXeGI
Message-ID: <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 08:49, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> +       asm_inline(ALTERNATIVE_TERNARY("jmp 6f; 8:", %c[feat], "movl %[yes], %[ret]", "")
> +               "       .pushsection .altinstr_aux,\"ax\"       \n"
> +               "6:     pushfq                                  \n"
> +               "       testb   $1, %a[l5en]                    \n"
> +               "       jz      7f                              \n"
> +               "       movl    %[yes], %[ret]                  \n"
> +               "7:     popfq                                   \n"
> +               "       jmp     8b                              \n"
> +               "       .popsection                             \n"
> +               : [ret]  "+rm" (ret)
> +               : [feat] "i" (X86_FEATURE_LA57),
> +                 [yes]  "i" (yes),
> +                 [l5en] "i" (&__pgtable_l5_enabled));

I really detest these things. I don't think it's worth the complexity.
Is there really such a hot path somewhere that we should do something
like this?

If we can't use some existing infrastructure for this, we should just
keep it simple. Not write ten lines of specialized inline asm.

             Linus
