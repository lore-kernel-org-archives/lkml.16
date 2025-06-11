Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EDF43151
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620826; cv=none; b=YQ20+umzwkH0cHUf5XPh/L6saZzfth5jhXy9SiG7D2MGFj34WJF966WJgPhnmw1ZiC0wry0C11mqhwbMuWUNVSWQdsI/UEa1+W+IUUEotN+PT3JBdRZ3BGO3ZpDBcW2x+Y10WSdlUwtfn0Gfsf1F0Mvbl/6tpRDRxhPGgpZC3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620826; c=relaxed/simple;
	bh=K4YpENB7iNEnnpJGzBtoAAXxiexPDlVW+dNKiACP+N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlnDpggFsUsRFrfH3CTMANBhjVzaq+jQAZ3HnFSt/h/jP0i1fTn2bf0qg0jZ+6+/M/kPsMsdVkgeWnX/F9/siBPKX5sOalr+Q/mDbXRxI7CE0cAIbo33wNcu7y2LQMAD3UD7bAQ8/BT5HIXJJk1TL2CH4IHbAOhVLh9EeEPV9TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/EDo4GE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/EDo4GE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5359867a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749620824; x=1750225624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TU59eKRSCrO5cELvPyG4AtCwG0gwydsdZ1KPBC29Bc=;
        b=b/EDo4GEybK+9GO2wEPFPF/GYYAwyZ16OpcIGOIpHpOGXXwwpG4qymvkbWRzZ8ORFK
         Ri3uU7karbd9EhLPrdtZKpnVJOyIZzDNLViaBSDX3vBKbTFtdM4V4zPi1/gFKBa9Dgwb
         4TyCcQmSmaIH46wNNJRlpaLQ6Y3mZImf/XTF3YOHPJWdOx7/+Bqqj3pPiWt4FHrYnbLw
         Jj5VnxYeu1VBTUimAo2+3uYEDxnLJEgv8WtNUeo96QtenRoICigWhrNqaTsMRQl5249v
         KV6u15f5lreZS6YzAx3NvA9bKw4YbqlgjsBnrLdZkH1CT2G2NdAQi/gZTKMlPnTJ2u46
         Dn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620824; x=1750225624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TU59eKRSCrO5cELvPyG4AtCwG0gwydsdZ1KPBC29Bc=;
        b=WQ+tj44J+wEiNghTeBk7QJGXFZGu+zdhdtYiQd4EYEuDI38K0ZvEsdxJ5MR+ISnqAZ
         mJWwVkGnv9d2/LhRmP8EDzoHJYYljsm/hCdWTyIsvQYwcGGNjtwyAih4Xfl10sCl8rrQ
         ivdFQFsQygWCR7Nvg2W9ym0azIgYDlr2rqzyJGPRITMEgQ6hMTLpmni+se0dh+N5vV/g
         qKLUB1OiyDYkWffwt9K6Q5sq984nvSVoI6b2kmpQrtN25mGOvnnbs3Qic0Lq6Xzyc0mE
         bhXOg90DpHHVb4NYkhvKd44WQluqQw8I5xR3NBWimy7X/GI0wMFsiHOPBBM9tAiGvpfQ
         NTkw==
X-Forwarded-Encrypted: i=1; AJvYcCW/MWvmfDoA7ioETF4equQnA8AJj1i51CnIxAQVBuPQcdp520Qgq310WU4CzoLZ9P2qy7YmiLSzUrOcAnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcCkYnF7WoFRiqgcGnYXLCYEEmqO2o18i2+m3Ctz27pd9LB5l
	R0RGu+DVhu5hRiz7tWz3ZSpIkbH0fCzpbELmsyV0UB0EpU5CnxFlDbkX
X-Gm-Gg: ASbGncuUaGPDagQ1YxIduoQInNECDDYUOC/pUQhlEa9qgJIDM8H3R/z+7KYav5jG2Xv
	3a6hkPkhsbjM5sz/0qeFycM6gXnw/jbH6kO5JLdREVXnQHEeiLzMYGjmRF6St3yePPkvsd4u6+B
	9XwGc9GOF2tJzQbXp6afxqUJhnm5SYfm6jNm4wDK+qYKP9TC7IBgcI4xhpTv79yJY2L0lcAyiGZ
	bJ6q2xVcCIMetVPoyJpXEVdmb+K47PL2Ifg/USFSayWPTAJIMiHxUj/buCPT2n6vIOaK5L6tWog
	cIRxjX3AWIk/dB2ZgQNkBW1m1fTDnjKdp/5EiWgjp2tSYZ7MNXRwit80rUvxCbjrFrtJ6Wc9vl4
	=
X-Google-Smtp-Source: AGHT+IF2uAUARXMreM1pRjUHzUOuPeAwpmuQxMZLWN1mBJvLCmBcqtagsD+JLZcC907KxwQEmum+nQ==
X-Received: by 2002:a17:90b:3902:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-313af0dd7e0mr2849783a91.3.1749620823736;
        Tue, 10 Jun 2025 22:47:03 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:1:3903:b29e:43c0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b201a6d0sm520831a91.21.2025.06.10.22.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:47:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:46:54 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v2] clocksource: Replace loop within
 clocks_calc_mult_shift() with clz-based calculation for sftacc
Message-ID: <aEkYTq5JdwGwWcCF@vaxr-BM6660-BM6360>
References: <20250611033001.707396-1-richard120310@gmail.com>
 <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>

On Tue, Jun 10, 2025 at 09:31:49PM -0700, John Stultz wrote:
> On Tue, Jun 10, 2025 at 8:30 PM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > v1 -> v2:
> >         - Refine commit message to explain more about "why"
> >         - Check the frequency of "clocks_calc_mult_shift()" get called,
> >           it's not in hotpath on my machine, refine the commit message
> >       to avoid overselling it
> >         - Add comments for the code to explain the implementation in
> >           more detail
> >         - Handle case for "tmp == 0" to avoid undefined behavior
> >     - Experiment using ffs() but it's used for finding the LSB of
> >       a number, which isn't MSB as we want. It would still need
> >       looping when intended to use ffs() in this scenario
> 
> Oh, apologies for mixing that up and leading you astray!
> 
> 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index 2a7802ec480c..59145d762f1e 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
> >          * range:
> >          */
> >         tmp = ((u64)maxsec * from) >> 32;
> > -       while (tmp) {
> > -               tmp >>=1;
> > -               sftacc--;
> > -       }
> > +
> > +       /*
> > +        * Decrement "sftacc" by the number of bits needed to represent "tmp".
> > +        * Using (32 - __builtin_clz(tmp)) to ge the bit width:
> > +        * - __builtin_clz(tmp) returns the count of leading zero bits
> > +        * - (32 - __builtin_clz(tmp)) gives us the number of significant bits
> > +        *
> > +        * Note: It use 32 instead of 31 because we want bit width (0-index MSB
> > +        * position + 1), not just the MSB position itself.
> > +        *
> > +        * Handle tmp == 0 separately since __builtin_clz(0) has undefined behavior.
> > +        */
> > +       if (tmp)
> > +               sftacc -= (32 - __builtin_clz(tmp));
> 
> Still think the detail that __builtin_clz only works on the bottom
> 32bits is good to highlight in the comment.
> Though maybe, would explicitly casting tmp to a u32 help it be more clear here?
> 
> thanks
> -john
>

Hi John,

Sure thing, sorry I missed the part to mention it onlys works on the
lower 32 bits of "tmp". I'll amend that ASAP.

Btw I just realized it's more appropriate to use "find_last_bit()"
instead of __builtin_clz(). Most of the in-tree use cases utilize
find_last_bit() as it support more optimization. I'll cc to bitmap's
maintainer in the next version and see what suggestion he gives so we
can make sure we consider everything as much as possible.

Thanks !

Best regards,
I Hsin Cheng
