Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6413B2A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045230; cv=none; b=LtZB6oHL+4Q5coWnKosn3DXBgwys7rY9pjxnMgqNtFTG5L+nZ2Y7tWVIOcSt+XbwzUCZl72btKBLB7Gt9nRr1GqyMx/uNt0V5PysuLMZPX74mWrCdkl5Abkk9qu3vhTGsZPZ6xTgP/OyHNczOYJJSyULO1jZn5R4ttqoJsOVpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045230; c=relaxed/simple;
	bh=lKAOHcFYo8EsD/tPI8lLppLVgny007wif1MAWivMJng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPDXxBvO6TTU9D1TpijrYXa0RBgnuzkWImeFczyeHWfH1/RhJN2ADzhGDruLYwJxQ5Cs/NTks7y66JRhgyf3RAMpCsYk24FmhjvL92yGPGW3m2U6rrrIvntei6wJUetv3RX21iOfpE8a2v6WTQO/Zt3LclVEEbmUwYVqoD6D/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=my6CmnNh; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my6CmnNh"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so9024976d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045228; x=1744650028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/YiCViv84RBjl9Cx+39gU1ba6ZB3RtC4V/ULgvWih8=;
        b=my6CmnNhPRz013bU63Ifjk+nm8liEV+LIdCmnA3F2V6tdHRbNcKvtOJFreUDKshX/z
         S3uZRGYa21VCzzm8Yk5TyOP8dmDcEswa/qHkHceo9nPpTJ9LiBapdcEErrdxytDdtjEV
         /Siq2SJBD46U4NHeudmSED2XBGXy1yN09cddorNZ6gDFJqZhDC8pG3vvG5NMjkAZTsvS
         nct5LOUmrPGc2LcyRSBtzas8/S3wX/M4Q1n8xKx+z+3sYJTgLCmJnZJearSXQvO0/MN5
         bCmgCOniKInSTX5DYp/yK7szRw86/HhzxSJaGWJ/TWRkJEPVjFMOLkHMmJ5KW4aXzOe2
         ahLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045228; x=1744650028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/YiCViv84RBjl9Cx+39gU1ba6ZB3RtC4V/ULgvWih8=;
        b=YluETIDuNB/WooOktrvBacKzGclhseY68+aI1NOK1ICNj71eVQWMDONdgVmtgkxqqu
         y4lwvViTKQANs1izwdowwvPIKj8VlgdcIwc8J7kJ3jZhYaO0curOWeeRK16QtCNeSNrZ
         mnXSyIVp3i/QfQy02hbW2cMXcQLcjfwoNQj0/2G/wwS7joxFmW2fXaTEh8As1tx3FcoY
         9Fwl4HKWedIOzeE7lcsvEZ8tNPVEYMBXbjM2CSauqvRJDBTZ1CtG+ESge2hC/dcZHURO
         m6/F9ZXXvb/Jx1DTEQuOyuzO+pTgY7I4mGgSwy5fu/7L1P97wxFSPPDfn3DkBLgXLUBZ
         brTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj8bXyosr9UJ5+2/o/2ZHm1PuaFiHyl71WLbpUNM8h25rFuYU36sDLDAqPRCgqavCeoZww5SaWhA4KF4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYFmyQjEaNhlb1BE/Lar967vu6A2fQoM2RqaND5yd+odknp5tu
	pUisL28xVlECeSNQ1pyAJdUB1lsK7KervmKUWIZLE2Q3HPq+lf60whZY7zbsZmsKRVC/N6SB0es
	1UYVNN7zjq0p5z1AHT96O0m1CmVk=
X-Gm-Gg: ASbGncuND50Hz1eAcz4JHeUAVJ479k6XlYx2RWybsmJT9kWsUZg/aZk6bw5zWWNFEaU
	9KEP1V/K4pZ6+Pb1rveUwkshI1El8yO49xpNyCec/DGXVA/6LqNZet9pyE2Ow8ye4DAwSuiD3um
	VCUIXP/w/HZEXcfkTJeqTs6AY6BeDH4exoNE23sHaL8pNyFmx62jXwUmlpiw==
X-Google-Smtp-Source: AGHT+IEoSeUdMCryKXSbayP1c+WC2bqZA8FDGNrNRXTbmKGhcK6mNdY5gvJclkhUu41WW3Zv8yZKRT5UMbGHv2f98Q0=
X-Received: by 2002:a05:6214:4116:b0:6e8:ddf6:d136 with SMTP id
 6a1803df08f44-6f064b76a4dmr191213426d6.45.1744045227894; Mon, 07 Apr 2025
 10:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am> <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com> <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
In-Reply-To: <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 7 Apr 2025 10:00:16 -0700
X-Gm-Features: ATxdqUG2qMakDUGu0RhSQrsGq7xAj_E9lQta4YxEQ2uMX-OLhskupLrQ1JiEEiE
Message-ID: <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Igor Belousov <igor.b@beldev.am>
Cc: vitaly.wool@konsulko.se, Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:44=E2=80=AFAM Igor Belousov <igor.b@beldev.am> wro=
te:
>
> Hi Nhat,
>
> 2025-04-07 19:51 skrev Nhat Pham:
> > On Mon, Apr 7, 2025 at 2:00=E2=80=AFAM Igor Belousov <igor.b@beldev.am>=
 wrote:
> >>
> >>
> >> >>> Do you have zswap/zswapped meminfo metrics from these tests?
> >> >> Yep, and those look somewhat similar:
> >> >>  - zblock:
> >> >> Zswap:            234128 kB
> >> >> Zswapped:         733216 kB
> >> >> -  zsmalloc:
> >> >> Zswap:            286080 kB
> >> >> Zswapped:         774688 kB
> >> >
> >> > I tested the kernel build on a 4-core virtual machine with allocated=
 4
> >> > GB RAM running on a Ryzen 9.
> >> >
> >> > The results are the following:
> >> [...]
> >>
> >> Now what's funny is that when I tried to compare how 32 threaded build
> >> would behave on a 8-core VM I couldn't do it because it OOMs with
> >> zsmalloc as zswap backend. With zblock it doesn't, though, and the
> >> results are:
> >> real    12m14.012s
> >> user    39m37.777s
> >> sys     14m6.923s
> >> Zswap:            440148 kB
> >> Zswapped:         924452 kB
> >> zswpin 594812
> >> zswpout 2802454
> >> zswpwb 10878
> >>
> >> /Igor
> >
> > May I ask what compression algorithm you are using?
>
> It's LZ4 for all the test runs.

Can you try zstd and let me know how it goes :)

>
> > And does the zswpwb come from zswap shrinker?
>
> Haven't looked into that, to be honest.

Can you check:

/sys/module/zswap/parameters/shrinker_enabled

>
> /Igor
