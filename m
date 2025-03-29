Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12981E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207745; cv=none; b=diBcoQKdrUwnbEpQ+O+95v5wig57WdamzDflZXi7sJ/5bIG68sjeQIuz65QVg7Y8PkoDH3OvVXmgrdUbdLnW6P/MACI7j//vja+LZXXXLDy8xoAfOcb0NpubtD6ZPdRnbaKgUVDZBRRtyvy8U9BT4SRTdn8zunGNcCeZfumknBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207745; c=relaxed/simple;
	bh=pyhQ4v2pIxms82NoC3L7PRR3Y8OAMA432q70l8NEUs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERlLH6DKAmYp/htR8zZylwx1ipiJZ8VnHQfLjgKJofjWwNCVmyTlH6Qev4wt6Ii9+q5A8GU4BeliYerEVW/cpW/C24npqPnsYGBtGw88YPrIbBklQ1xc5AvO/HM3wOfakRLcMj5Bv/bWbB8lgI4syUB+YirhtaG9GzexJSwmv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LQI0FlG/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LQI0FlG/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso4424061a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743207742; x=1743812542; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=byfYszpEtVSquMlbBLKP8awcDMbu5BfZM07xuHxXNc4=;
        b=LQI0FlG/W4f5LXzx8NrK7Nnh0MrI2kGtWjS9s7yI91yOCugdz9ludhYjHgy8fWxnzW
         si7IMZc3F7vGTsWZ9ee0aqNkWlNjLATERMKA5iShRUbUmgSqGSqjNL9mfA4ohD8i1iMH
         f2S4QgsvU8icdQWxVpPw+OeYQkW6yhP/9SuYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743207742; x=1743812542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byfYszpEtVSquMlbBLKP8awcDMbu5BfZM07xuHxXNc4=;
        b=k8ZxjlE1OQA2HadAwWPzs4ut/irB2tR6Bt1//AVq5jg3xiMj3iRisOFDMQVA/XfQ8e
         crvHnC4kr6BItHmuDAXESPpQc20O0kPDEZTJyPlZgkuiFdFhCziwmnDltMzBil2PuxQu
         PdD3nJT6tw32wRYcDpmdc1T7CczPmFh7u8ty4p82rbZZgjuf0H/Canv3MUUCXh3t+yyC
         OlOpC+tRtgVx1GZw89AgRrkTqWDl/FXsKNGaGolmFMKcQBoGCu8qCuC3JWHRIcDu/ZRK
         QjUpW32xGL2fSx2/kvs30oPSxOFpcUdL1Ize7HklCGsmsVC6B0K+3ZlshSM+a55Adymo
         LVdA==
X-Forwarded-Encrypted: i=1; AJvYcCXKoRCwZbzsImCUZMLGfqQaFl93b3Bm+3X4201cBzaqrOkiVyQpOi2gxId9SmzjFPsagct1KxHRxO33iiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3y9SlZJhYsak0WdblDppX5sF2Qq/FfEQP1jh7P3pYMXpJKkS
	HOeoapyIzXkIZikfHeycryTFCGc160brAcLcALajzfLfPgaQiqHlR0uXudPGhnUbhRd21MPJ0NV
	A00Y=
X-Gm-Gg: ASbGncvjnXozqET5iNlq6JuQGFtw50zDpRjYgHis/mTa9iO63RdyXKaL8Jsv2USl72r
	Oo72ereMKfHsddweJ53bXJrD5sXRs7booCSREvzDX2s5KB4qEkGE2wmQcG+q2tG221Ucc7ZlPAz
	wG4k0K2bC92U9sW9C9qg7/ia6OTqfaT7ghM2Mb1vuNSO6ScTAJ0fvT9FqPO3+9EFSKunSqEjgyO
	qTGERgNew3pKt28U5uqGDYYwSu9io4UbkMiK4C6Fw5l/ZYRnxejW9HZGr+aEEMdoGaoehGJWTUm
	cGbboA7XvnRw0rdwtS9orlAvCvqhrp4TawJcUWvVO6vAmubk+e9NfMKXyGh8MVsFeDzj57KVcKN
	JUcdBGxRhex4N+xMykNo=
X-Google-Smtp-Source: AGHT+IEERXfBunAsh5CNPSifCLVKu+9iLbhnNVmgnr3L/BfjzBv4hiUeRN6H05suYQ9zoQeu7WeR3w==
X-Received: by 2002:a05:6402:2694:b0:5e0:2e70:c2af with SMTP id 4fb4d7f45d1cf-5edfdafb097mr939380a12.26.1743207741633;
        Fri, 28 Mar 2025 17:22:21 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f3895sm2096590a12.48.2025.03.28.17.22.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 17:22:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac339f53df9so484878766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:22:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqGN5LUsnkE06baVP7D/HkKZOUKAVVS05SuWoSLZAAzSJb/kpgovnXGIbH9b1sdqEsI1RaPK/lXwiQpnI=@vger.kernel.org
X-Received: by 2002:a17:907:97c9:b0:ac4:3d0:8bc6 with SMTP id
 a640c23a62f3a-ac7389e1864mr100148866b.13.1743207740593; Fri, 28 Mar 2025
 17:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305184725.3341760-3-xin@zytor.com> <174238223959.14745.6970497940010271580.tip-bot2@tip-bot2>
 <SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com>
 <CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com>
 <SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250328162311.08134fa6@kernel.org> <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
In-Reply-To: <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Mar 2025 17:22:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6ctZjvrheYwZs86rsR3MkDQ7xGh6KOiBsHBmzHRzP8ysH2wVmfQ_Iu7c
Message-ID: <CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>
Subject: Re: [tip: x86/core] x86/cpufeatures: Generate the <asm/cpufeaturemasks.h>
 header based on build config
To: Jakub Kicinski <kuba@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: "H. Peter Anvin (Intel)" <hpa@zytor.com>, Michael Kelley <mhklinux@outlook.com>, 
	"Xin Li (Intel)" <xin@zytor.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 17:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So I think the real fix is something like this ENTIRELY UNTESTED
> patch.  Whitespace-damaged again to make sure people don't apply this
> mindlessly, it needs more thought:

.. and that ended up being even more whitespace-damaged than I meant
to make it, because it also line-wrapped.

Oh well. Not pretty, but I hope people still get the idea.

And I just actually tried doing a build after touching the .config
file, and it did seem to work.

But since I had _also_ messed with the config file on purpose earlier,
I'm not sure I'm actually testing the thing the networking builds
trigger. So I might be entirely missing something.

Adding Masahiro to the cc, so that somebody competent can actually
check my thinking.

Masahiro, see the complaint (and my reply) in

    https://lore.kernel.org/all/20250328162311.08134fa6@kernel.org/

for background...

          Linus
