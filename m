Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA5221D90
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613360; cv=none; b=Hsub7MMWvLdwZg+LPIM6WRaXW8MvjeNplyOxEb2pkYE5+BwJMJG5ER4dx7xyD+9W9XxLz/ZsqOZCZDWlXq4GUng3aFO1O0OnlUkkJB2yNCSSqjhv98skzfeLdYSJZVOHqJfdyuHZ91krvLCPmSp/m15LRBjyj3OnrjYnMzwPeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613360; c=relaxed/simple;
	bh=SQExu4w4hPgGkdy5kCAct+RvK8+FjV4snNR+nLyJBNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyDRYm3Oh3bL34Prgnv5LaWzvP+bdVc9/Ev/ChzwKAzAy1Ztk8idgMPukV1DHkH4IizQuW0Dcq0UdyF24/vIZuizT5IgY7ZGhlAnL9tUDro3sdqrCiEemHcFeVuS8Lc2i4zLftIhctQSE/ktCGFot+iajCk+0LpKV1nu/h9lxmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AcqdYf7s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AcqdYf7s"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3b12e8518so471877866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745613355; x=1746218155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qHF1zPVwXD8IdJu/yf1YIr/T0XDnrM1CQwq7Bj5CPDw=;
        b=AcqdYf7sEb5O+p7PVg+SZBBLgQsUwDcGRQTQc2JJgrlVDWdBnJNhSSZvwB9Y/uq95v
         SFZOHoWJVu8NVIHqXNYAkdH/DMLXOVm+keHTgYF5b4Ka8r3hg0WEDUVNB49RjBh7Z12x
         Jj5oHdUODbq4ly6ayEpYN6M10Qjlnt3VJEsL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745613355; x=1746218155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHF1zPVwXD8IdJu/yf1YIr/T0XDnrM1CQwq7Bj5CPDw=;
        b=fBgtZKTsF5alYrUpM0P/JtNJ9OPnqyKDAp4L77HnHGLcvQkpEXVdQmDK/tvDiasaIZ
         8aaXmTm0atDrZeNnXj9HLDvPjSQswbPWTfcMlzGYoFnakQHPI8CX8p9xIQsU4izg8Xhw
         oM9CbHLQUASdvKt+lcnV+OAR7o8Y+jRlnSsF5oy2OCRXQsmNdjeajQSO7GPfCPgUKMvw
         XeksqMEXiryMZEeJL90k5ZrFdbLYhdXUP5XYI+tCw72lGfV1KGWQTJsS7v9OIwOBmeu2
         aTkRxzFVHrAKI5SXOeixuKufO6hfSB12/LyzDdAef5Hxu6MKEk4kitJ606xgqZfsWy+W
         0yoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHIBo/I99Dl5UXFf006prpsp5E2tIVcal9V3Izd0hmEAbNhi6AusRF3st3s/PJO72xGnwdQVDCFBqJ6Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZ2yU6aab5eNHckCDSzwhBcRbtr3ZgVkOlVdSyYTtlQD+s8PR
	YILRku6P93BDTi/YKusaYBF2Be/uEVKa99MrUTKYjGDt5GXBC2whW2TvIYNiSxBN3f8eHpYfRkC
	foI8=
X-Gm-Gg: ASbGncvZZ9/UgsWShrLuXObihINHR8A8+SA17lvzBlnYOy59Qexh1HQHlVhE6ppcRRb
	TWaH5TLA1C4ZHMT9HqrXNejZpRguHW4c+wDD9wYYFr2dQhCtYf4catayYvOgpYNAhSUzWBLtaoJ
	u2R9cM04M645h+xoMo8EQeUasPIY8T+UZEP1vsGePnXNS+zG4mKysjrYFf4Zdb9U+6eLI0rqRyS
	UNql8X3qw0XrflIux0HO7hoHVL6gUZuGIvCF50i97chX1EN4uwmDd/dtzgRvTDgIqxR8KLx+UfC
	Bz6t7gWWLq16NDRPtwQzvrYGdnaLLG2tU0n5NGr5a55QTGsc+0/WUte/wV4pfv0Hb2VyiVeVAiT
	7lrsuIHQpx3gxujk=
X-Google-Smtp-Source: AGHT+IH6S6z1HMUsIEc7xWD6SNmQBgE7vR1LJ94DbdUG5y376ahLA8X+0ZS1sPA9btGkED0UeOi28g==
X-Received: by 2002:a17:907:6d27:b0:ace:37c1:d4f5 with SMTP id a640c23a62f3a-ace8493db93mr61522566b.36.1745613355301;
        Fri, 25 Apr 2025 13:35:55 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7a0esm184458266b.163.2025.04.25.13.35.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:35:54 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac339f53df9so513353366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:35:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtXkppVsL57T7IStGyAP6AHHEmpAYfO1qAmgqN+B3Wh5twpxoEGHHtEbniyKtZt7xTwuz7SUoGl7FNB3M=@vger.kernel.org
X-Received: by 2002:a17:907:7f24:b0:acb:107e:95af with SMTP id
 a640c23a62f3a-ace84ad7774mr62978366b.39.1745613353476; Fri, 25 Apr 2025
 13:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com> <aAvlM1G1k94kvCs9@casper.infradead.org>
In-Reply-To: <aAvlM1G1k94kvCs9@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 13:35:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiX-CVhm0S2Ba4+pLO2U=3dY0x56jcunMyOz2TEHAgnYg@mail.gmail.com>
X-Gm-Features: ATxdqUGwKlTpu4bheZKrvcER-qlO-D6uY_4AgFPDdEUKnYAjfRZ_s0Tk9V5ZhUc
Message-ID: <CAHk-=wiX-CVhm0S2Ba4+pLO2U=3dY0x56jcunMyOz2TEHAgnYg@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Matthew Wilcox <willy@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 12:40, Matthew Wilcox <willy@infradead.org> wrote:
>
> I think this is something that NTFS actually got right.  Each filesystem
> carries with it a 128KiB table that maps each codepoint to its
> case-insensitive equivalent.

I agree that that is indeed a technically correct way to deal with
case sensitivity at least from a filesystem standpoint.

It does have some usability issues - exactly because of that "fixed at
filesystem creation time" - but since in *practice* nobody actually
cares about the odd cases, that isn't really much of a real issue.

And the fixed translation table means that it at least gets versioning
right, and you hopefully filled the table up sanely and don't end up
with the crazy cases (ie the nonprinting characters etc) so hopefully
it contains only the completely unambiguous stuff.

That said, I really suspect that in practice, folding even just the
7-bit ASCII subset would have been ok and would have obviated even
that table. And I say that as somebody who grew up in an environment
that used a bigger character set than that.

Of course, the NTFS stuff came about because FAT had code pages for
just the 8-bit cases - and people used them, and that then caused odd
issues when moving data around.

Again - 8-bit tables were entirely sufficient in practice but actually
caused more problems than not doing it at all would have. And then
people go "we switched to 16-bit wide characters, so we need to expand
on the code table too".

Which is obviously exactly how you end up with that 128kB table.

But you have to ask yourself: do you think that the people who made
the incredibly bad choice to use a fixed 16-bit wide character set -
which caused literally decades of trouble in Windows, and still shows
up today - then made the perfect choice when dealing with case
folding? Yeah, no.

Still, I very much agree it was a better choice than "let's call
random unicode routines we don't really appreciate the complexity of".

            Linus
