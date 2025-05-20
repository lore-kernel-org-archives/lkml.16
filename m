Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE51AAA1E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777400; cv=none; b=r2TyxxB9iQ4v4lumzmQNHa9YLnMe7Rn9zkC3JfJO2KzFMNIX3OBKCsJCzM3BL80xI2vrRz0vBCI0zmIkzkg+HZzaVSMfkeQv9KLuJ3t6M5/edkVWptYSff0WIpYe8iphNRIqIpfBjoube/oUMk1Egy9TMMMwdx2Rftx4+r1Xjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777400; c=relaxed/simple;
	bh=3sl3BdL1ct+dtAH32QK/Ai1Jv8LpMEdY0URRoOIs8O4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUtI7MqPkXutg6sHCJuKKtwrUlZCk/7AS+6nLB+na9F+Lx80S6BHHN4Is4b3XjqL8k9zlEJfT141rNUTvp4qBOUQwKdQTwyyWhQZuPkaVsFnZ9vNZWTDQA4olrE2E724h4kXbFDvYjNw9jcqOh78H5a+XAg1q30T04FPeCPARsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6QaAOZY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6QaAOZY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2394026f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747777395; x=1748382195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh7MqeUmsR1MF/otd5CA5HPTwJ0GzlherOZqYvellXA=;
        b=B6QaAOZYCQBMmYMWqmaqvZ1XbThGzKCD9pZs/jb1bZ4S4M+9lmlgswCmU+L3LWso69
         hu6u8YBDxqQdaTc2qcHfxNbLzwT+6LbG5UaiVPRF1vCnqBTN/jNP9qd2HjxYGqtaz4al
         c2A0QG/FeLJO73ofPboZ6JbrIKUG+R9WzZeWG1MpXejvsNxJmkEp31Mh0zyMoMOZMhbw
         pCpY5Sfa2+eeBSvtjXxBV3MKe5Y+4X9bNzTvYEAtc7StXE5JyTNbdR3dpaYLRMSx5JUk
         f2AWgsvfettJTK4LX8gtKGvQ13a+y87m9RLiwLL6V/AfSlQAGtSnsmjLRTC6Kh1M8TSW
         4RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777395; x=1748382195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh7MqeUmsR1MF/otd5CA5HPTwJ0GzlherOZqYvellXA=;
        b=OSg0hhzMRW5FXw7H2wP7vZHkTWepR43Dpo/U2aClCrY65PNL+z7cL5aQvC5f6SPm74
         epBUs4fgOId4Gf+2T7QRhc8AAqCfeyq32el9Nidx/6bAn+0Q4mB/1yUas8ROZeyZBx2C
         MSVu51NAriFMhzTlllIDFHutx3N2jcTEnznhBNmv74gF6/inehx8p4yc6u9VHAx75lZo
         mBBG/Alzm05qryQEnGq0XEXEKkIr5RlofhwaO4zhc0ZS8L5kfoXGtlykTS9nZ8mXE2w6
         LWb6AhgNhIFaD6910KroSljbVOUnQ+r26TtOQQMmA3XFFfUYN/mrCtqvRvvYCxCXJF3z
         aiaA==
X-Forwarded-Encrypted: i=1; AJvYcCVyk02mTRtm7/E0qpQ/p1taMZvAgsGDDafcXT/weP9sYojj3Awp882JiMNhnKzCywohW+T1dA+1TcIS3Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDIEtCKSYUAjgvRVL75krd63X1kls2XrkFt99plqvPSwnnwV0
	oaD2MJuo/PTUmnGr+JDU69NhqFzQ4pjAwJ7jXtroJ3YuHJXWwKyOE65E
X-Gm-Gg: ASbGncs5Q/73JtTGhvsw17hqJBT6VwLf+M14/KbKDPVGt25CWoXkcWhOXoRoSvO4Jpn
	+DAhUWA4HlfWsBJCTM0u8O/5PZVpEvUB31T/zMYqvonMJsO8JbD/djcHUWn5dsx1ItxYKcqnAfK
	ieaypyXOAnZa8PwLm3SqLoyiBAnZgdL1+oo1YIY8mQM3u+LWZzc8DawXo8mZi1kRCf9QV+XHQ5p
	C27WYb7ae5rz2NbdCRNAHSiHzEpdE+6eoEjvJqUb7KmIy74hXf/ssVKS15Bb/Y4uZl66Bu63Nnu
	pDrvBOXUGA0DGEHCftDBITzrFGU7txBK7LJKSS7ny//JKHNdnpgPrxOCgz9eao/E5N0GuJtQq3u
	ITtONuSdS6NDAmg==
X-Google-Smtp-Source: AGHT+IHkv2Ukx6rDhwRG/dF5auc9tH+Q5CQncbCoRj8VzJHzu7v4tzbdYN4OTrFsApKMOPdfRTKqWQ==
X-Received: by 2002:a05:6000:1785:b0:3a3:4bb4:7357 with SMTP id ffacd0b85a97d-3a3600da117mr14385290f8f.37.1747777395370;
        Tue, 20 May 2025 14:43:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm45904255e9.23.2025.05.20.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:43:15 -0700 (PDT)
Date: Tue, 20 May 2025 22:43:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <20250520224314.7f929b5f@pumpkin>
In-Reply-To: <pr79o4o1-5345-popr-r206-8qo76523657s@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
	<20250518133848.5811-3-david.laight.linux@gmail.com>
	<pr79o4o1-5345-popr-r206-8qo76523657s@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 22:21:15 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Sun, 18 May 2025, David Laight wrote:
> 
> > Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> > behaviour' the compiler generated for a compile-time 1/0 is in any
> > way useful.
> > 
> > It may be better to define the function to return ~(u64)0 for
> > divide by zero.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> > 
> > A new change for v2 of the patchset.
> > Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> > continue and generate 'random' results for any 'undefined bahaviour'.  
> 
> clang does exactly the same as gcc.

Did you see the recent 'rant' from Linus about the way clang handles UB.
I'm pretty sure 'divide by zero' is UB, valid options include.
- Jump to random location in the current function (what Linus was ranting).
- Jump to any random location with any register values.
- Enable user access to all kernel memory.
- Permanently damage your cpu.
- Make your computer catch fire.
- Send an ICBM to some unspecified location.

If you want a 'divide by zero' error you better generate one. eg:
	int n = 0;
	OPTIMSER_HIDE_VAR(n);
	i = 1 / n;

    David

> 
> As mentioned earlier, this is a soft NAK from me.
> 
> The above explanation is more speculation than fact. And here we really
> want to duplicate the behavior a regular runtime 32-bit by 32-bit x/0
> would produce, or in other words behave just like div64_u64() for that
> matter.
> 
> >  lib/math/div64.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index a5c966a36836..c426fa0660bc 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
> >  #ifndef mul_u64_u64_div_u64
> >  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> >  {
> > +	/* Trigger exception if divisor is zero */
> > +	BUG_ON(!d);
> > +
> >  	if (ilog2(a) + ilog2(b) <= 62)
> >  		return div64_u64(a * b, d);
> >  
> > @@ -212,13 +215,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> >  
> >  #endif
> >  
> > -	/* make sure d is not zero, trigger exception otherwise */
> > -#pragma GCC diagnostic push
> > -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> > -	if (unlikely(d == 0))
> > -		return 1/0;
> > -#pragma GCC diagnostic pop
> > -
> >  	int shift = __builtin_ctzll(d);
> >  
> >  	/* try reducing the fraction in case the dividend becomes <= 64 bits */
> > -- 
> > 2.39.5
> > 
> >   

