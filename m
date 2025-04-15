Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E518EAC7;
	Tue, 15 Apr 2025 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734518; cv=none; b=dg9G66X1U6jrbaBEwwJCgVbFKiOu84yXqrgEUWRHh4rFgj6Klvqk/iVbO3zSJk7AkuWNGO0MVJjXszs0JR4YtLsAtcuXhX4Pj31yMukzLUWtZEl0tKk8l98wHxpJDOThumzM2mPO2SdQfeePV/ZVxUEhuz87HhHlYn818S+ta4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734518; c=relaxed/simple;
	bh=16k+D1kzWNJPkhaotffNzTSM5A9nH61MwSAOOqgRjo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kc5D7o3lNjhiXCFE9mS4aoCsNkAJdeqf8MSETtFUGgBzQcAEgXBonVYc4GOAUe0Ugd7nHAGGOzAhIAiLXyXwj512jXu6wgSMKYpU8DNzU9lMZVIgXwIkXyRd9VVZYQLsmUGLGLaHRnIEHD4epuKCtaes/ybu2FC+JcwqcdfD7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvcWM2h8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvcWM2h8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so1034887a91.2;
        Tue, 15 Apr 2025 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744734515; x=1745339315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhGX2Gld5nEWaX//R4Z1bBeTvGhalt1zlNsb95NKu50=;
        b=JvcWM2h8RY5v6XpIxNWYbvYVjhqT4kjxpQX6cuNTK7Nfuqhzp2thrHZ7QxvC5PULHZ
         SQJJ2jLgqMkNjnBxYdeZX6vt/SSmsWSCB6SVvr4w+tDWQG7k6CIiLoZfwXnkOSgGuIZf
         vRSCX+W8J+yOUU6NekAuE0vL79pVXs0XHA1hy6GNUksai98HhVG8Cmc3FOWQoom2WqAn
         CNV6xsV3vRzm5EEt2YDQRwZ71OkkEJebK/RtNmAfjnlZO/2s5zcaT3cgO62oxl63pibj
         s19r/2lXuHMPTX5k+/E2KRW2qXbweuwp3bzKwcfOHibaU1t8lRID7qboz86cKiRgbMlO
         RNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744734515; x=1745339315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhGX2Gld5nEWaX//R4Z1bBeTvGhalt1zlNsb95NKu50=;
        b=BUA1MHPE8IYd+Rp+3IrZT96Iutv6gG8LMK4cWt1WS/Y//2n6QXuKbwAobxxf9XVC74
         M/47IzTCXWr2P7nWRIVJ+qAw6VQrSAbkNyeccRv70craU/OP9zz0uaDGa+7aLB4+8MZ/
         eQK6J3VxBU5h0scjzxPIY5q9eJd8dmD+J56KfLQNqEqk39GXg2hCFBdUa9UkC73b0ucv
         h89jQlJGHmZ2Z5LDYGYvbK9Gi8vK/PASSdHPd304vP0JF7bYe6Pt8LEpS2GRa1DNw1YE
         zh7bDua4IsrZ8jDBxL50glPQeJZxKj2YxOSb96XkJ+6MVdmcxledQe5blfiGUD4bx50x
         W3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc3ytzlpy5MfDpq1wph3ZvluR/GfymGa651iMoKwa1gHVmDtOxjQhQVvggHp99N637ViimkeEmYxZ6rAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOZqQ7B0dopohRCKp6ky+jJN3JASWoW3LUrWoDXEOTaF3GxnB
	Re+LNbRk2GJfPbyyZrX9EpRW538MSd4WtgTSw6JRZ0Mo2f3927aKJyhPGf47OiMZy+/E6fx2W6X
	5z6WGVv045muruNfsOZ1bmbjuW14=
X-Gm-Gg: ASbGncsYFk07IFAFR7Da9UPjrkvHBWl4tpQS+t7KmsgemZofKbePHm0bVFYYJdgtOQp
	FR31/aq4XeozyfGYrwJvJrwk1wRBW3QURSNFlpELOx41wL10HoWRDojx/Z2W9DarSuouqE/xpjC
	jSGQbZJHKBIXIFXiw83Z0RadKlVlsF6TaB
X-Google-Smtp-Source: AGHT+IH7DuWw2+Ji1/JVUUE6uHhtXC92IfxsebFP/13Uv3c8VTSL84EUu6WlHqcTmwxo8LeGFx2QSi+jDgjGVV/VHOE=
X-Received: by 2002:a17:90b:384b:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-3084e75753emr2484613a91.3.1744734515441; Tue, 15 Apr 2025
 09:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412005341.157150-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250412005341.157150-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 18:28:23 +0200
X-Gm-Features: ATxdqUE4hmSdsGSuyUlL13WPDkdl-YxIKEIGL8veqbyYbS6fb8zNgY_VAJuTw28
Message-ID: <CANiq72=Grg+T-c0+TxcyubHj4kvHPQKiVm3AZp5DgeUVXsitEQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, geert@linux-m68k.org, logang@deltatee.com, 
	sbates@raithlin.com, dakr@kernel.org, dinguyen@kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:54=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Remove the `volatile` qualifier used with __iomem in helper functions
> in io.c. These helper functions are just wrappers around the
> corresponding accessors so they are unnecessary.
>
> This fixes the following UML build error with CONFIG_RUST enabled:
>
> In file included from /home/fujita/git/linux-rust/rust/helpers/helpers.c:=
19:
> /home/fujita/git/linux-rust/rust/helpers/io.c:12:10: error: passing 'vola=
tile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wi=
ncompatible-pointer-types-discards-qualifiers]
>    12 |         iounmap(addr);
>       |                 ^~~~
> /home/fujita/git/linux-rust/arch/um/include/asm/io.h:19:42: note: passing=
 argument to parameter 'addr' here
>    19 | static inline void iounmap(void __iomem *addr)
>       |                                          ^
> 1 error generated.
>
> Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I don't particularly like having different signatures than the other
side (since we could e.g. eventually have a check that they match
etc.), but given v1 it seems they could also be eventually gone from
the C side anyway.

Cc: stable, I assume, too?

Thanks!

Cheers,
Miguel
