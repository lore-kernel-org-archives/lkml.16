Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECE2135CE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153731; cv=none; b=HnkZoqjdb2H2mLkwBzvK+7NQBTYRbexzYmZK07iKx4IY5xCBPrzhRcu1bfakMVv/4Gk8U2E+PoBdspPb75hwFc2eG03i4TQBP4U2kGd0aK6nNer9BlOrV0j2JorTUYhG3CxVXnr8NC85stpM69otCZxFUtBY/hZJXsncOBg7GPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153731; c=relaxed/simple;
	bh=9DkuysWlNaEvoYWvlSH0B5y/tCvLrBaUM02uJS2OsWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxSCabJ9FJI2UGJCV9TmsbyvzhmEWRplFzr+RwAV5ISU33FJq3Z0k2HPWXxL07Zn3ASwXZaV6V3fpP2yp2Z8fynOcaGOzza6HdyT6uXd04HuJkG9iCcP53YqH4evRO8g+6U9mSRbDNYQ+1J98f0OYHsYpYvWzPEXNWsBuyuZqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmZfYm5i; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmZfYm5i"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo10645057a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750153728; x=1750758528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DkuysWlNaEvoYWvlSH0B5y/tCvLrBaUM02uJS2OsWk=;
        b=OmZfYm5i3P/kBr5xwu+qyYsYSkNpQJE8MJGezWTQLaVs0uoN4BxzIpabIodaU7Twfk
         ShMp3wpqX1QXPfQZsACT45UPEDHNfaaLI7+oi/1D7k4bNbxH6a6KMHbZyfSjT7qC2xoi
         7uMo35nsHEHXi+LwlZFV1qDaOqe6JkYza3WvYbGfY/mZ208EOhKY77fqE04vA6lzyybE
         urKZCqkiC4qIUUJ3tCvRKsuUXYswcRiCF9/7ybhYXfdlNBPS78dU/p6Ks5gS468Rfxvr
         6GttEFfZ68pMqXspqI0lcmaj7FwZsKeSUoOEEJs31kubsGlEXuKXmLcGNMb7q9HOpTlV
         oUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153728; x=1750758528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DkuysWlNaEvoYWvlSH0B5y/tCvLrBaUM02uJS2OsWk=;
        b=LMNTxp+40lbU3WjP5PTVYi2KI4B6d2aiNSs55Mj3/1y9XoxSLVt8rniOfTB+szPHaI
         HDV4mxUt83QR1GuuQV2WHFrxCA540tWwXPVVRQQUIGD85vuChXbuzgCFFzpZW1mxPkdp
         ZEPoM4CrecPoBwFyWY7HldsTp8N2RvMZSeY/azNVtlRB8hAIA0JolGOAYPq3AvIjlN2e
         NRa9TsT2PH3+JEz/QsQyMAWWI+i+4yw3ZGJ92JUZHx3E8Tlm/bNuAbLds6n6076Kloh5
         PFPr45LwWATtyhLI9SiIr1Y07GZIAbK7a9fRlGwChiTl0akVdZnfr3BMiSWkVPrepHjS
         jpdg==
X-Forwarded-Encrypted: i=1; AJvYcCULywkec5Dnrw2c78hKkp69sOc4EXxFDrQHAQksU6R/s+tEgHYqv0RRhhBfgbnqNAWGXPdsLk7WJ4a6OZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbgyhhqg0fto8zMxPquQlktkv6Pbcwivs/Bk9UFwbQ1p8lnrkG
	gUp0Ha47ma23UNXbf2aenPFyQ/iBFJFKf+Qd05YzUgQyiV48tz7mioDnbPM7qVPkq8Ckqkjem0k
	rHtQcO/dcLSp5SAFdFxIebYNieyoPsXci6G20F9iq
X-Gm-Gg: ASbGncvCmNHLRWIuBAd7ZvkT7QhXvuj39VlTD4VYOcaUnC1T5n+K+dz/0148KzWZXz7
	1LHm0aAM8v8TYhvsRPx699FO04dELM8nU60irIfFbuljkF398J3pzHAF3CZGDruL3mw1fJprK2V
	ZNDqvCGZUqvbV8yDHrfbB8ttdmGos/s+xppSgsn+Miq39UVZsDai0AgO36q0BeqdlR+3fk651Te
	VlvPzEvKI8=
X-Google-Smtp-Source: AGHT+IGxJ/+hSyr2gNBDCExA5aN7uTYi8ZegfjnYTodx8GGEjXxZ5WnT4AkolwnayQwqylcNFPloTyiWduziC9USG5A=
X-Received: by 2002:a17:906:c105:b0:ad9:85d3:e141 with SMTP id
 a640c23a62f3a-adfad52b9e4mr1223752866b.53.1750153727535; Tue, 17 Jun 2025
 02:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6850d3bd.a70a0220.395abc.01fa.GAE@google.com> <CANp29Y68ZaQnb0R2fZSLjcCxiOE3uZyW4b7wLEYMAycF0WHNUg@mail.gmail.com>
 <97d6493279ab5c63e8844e8b0f349b2528d2832b.camel@sipsolutions.net>
In-Reply-To: <97d6493279ab5c63e8844e8b0f349b2528d2832b.camel@sipsolutions.net>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 17 Jun 2025 11:48:33 +0200
X-Gm-Features: AX0GCFv6Czlrb0GcMMCvwTkEltQ2PwbAAXxRRCc_-jICqq7SqhBA80DDGlCg2CY
Message-ID: <CANp29Y5+W426u0jUz0PT=zVde+QqSD9H1fLpTuaKSzCLrt5FcA@mail.gmail.com>
Subject: Re: [syzbot] [wireless?] WARNING: net/mac80211/tx.c:LINE at
 __ieee80211_beacon_get, CPU: syz.NUM.NUM/NUM
To: Johannes Berg <johannes@sipsolutions.net>
Cc: syzbot <syzbot+468656785707b0e995df@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:43=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> On Tue, 2025-06-17 at 11:34 +0200, Aleksandr Nogikh wrote:
> > #syz dup: WARNING in __ieee80211_beacon_get
> >
>
> Not just this one :)
>
> https://lore.kernel.org/linux-wireless/20250617104902.146e10919be1.I85f35=
2ca4a2dce6f556e5ff45ceaa5f3769cb5ce@changeid/
>

Ah, interesting :)

FWIW, in this particular case, syzbot sent the duplicate report
because the WARNING format has somewhat changed in the latest
linux-next. So before we updated syzbot's parsing rules, it had
managed to re-report quite a few duplicates.

--=20
Aleksandr

> johannes
