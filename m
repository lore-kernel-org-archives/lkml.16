Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B62512D5;
	Thu,  3 Apr 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701773; cv=none; b=CWI2ikNUgrRwLsRTZ0PZ2wqx40s48hXQO7JuS/SrGM2M2xHEyuJFZ/1/tzuxZSGCz0tTmLCyLEqvldcPGGOAVezIGj3ypd9G7fnFBlFhZdLDu9rFQK4loK6IOLBmoBOXDPJHigyZwtCAAA4Df2P0OaoHfZ7O3damPACqQC9nHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701773; c=relaxed/simple;
	bh=wUGCmmOo2C1eoS77TbjLuyHor/JBQbJ1BdThFBZP1TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qC+SNwfu9S7m96/ve5RqnnoOcbFAw7c+ujiAi4oOZOsURd7fWfL7KJOjpmkRcs5TUrty9bAtleUVnHEIBbuSJmlcC7scEWqF6nwxq5hMshD9/NJDHdKneHZDZZa/BNhmVhej9uBPQ0d2nGyczVkExLv7la8Lco8eclmu2/MKTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd9Wcaj/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd9Wcaj/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff7255b8c6so135250a91.0;
        Thu, 03 Apr 2025 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743701771; x=1744306571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUGCmmOo2C1eoS77TbjLuyHor/JBQbJ1BdThFBZP1TE=;
        b=Xd9Wcaj/A3hfh61Me/8wMGIThsiTNrkyAUP4XtTY/a+JKCb72Lz0waye4+XzIWLB6p
         U73dr1g+X09iTvhVB4IZaLNWTHcgOxcbmiIhgRIi4U1FwkCAL6RIf8azW+eQoTwiR9tO
         S+JRSvlNol7Rw/jA/vi/N+VCAOY5EF2nbjxRqrV7Z9E1uOPVKadxUAXBCByouO6C7X3z
         ik1jPh0In2Qwreo+aJP/F7jbVuCbtEkejOZxS8lb9sdQihlPF/IK4KoR+3LowtsxCTW4
         hQIxoZDuk4G5XMs1XGSTn1sNSXRs9b5j46M9gZd5mw/8naX6oeMi/mtbRMxgEsfYfHzJ
         q/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743701771; x=1744306571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUGCmmOo2C1eoS77TbjLuyHor/JBQbJ1BdThFBZP1TE=;
        b=FvaLRo2ncdT0ygDi4Me0CRbfMzz/13JAlMwskvnGhpKJCHiotWojpzc0pwHcJgbcWp
         azmbP8GNT9SynQe6JUlFnJkB122dt+EhueeMvajMZvDTe3A9PnsxQzpQKgqDv8AijZYG
         NS91lb1jDJKU96eVaq3/aN8EAOBFkVeFEvBJjmPT9m9Ncvhf4p9QgO7BrHLWYZYefWvM
         pPEcVEYpyd+D4esC1nmV3soGEXO5s2KEJmo3VqF+To/GAFFhwrflSK2MwD3kaC5CopZE
         tTLe5myV+nXrKGBn+JcFmRkDYmZGrZQk7en0jFL+PQK4IhFLXooQ8aqHYhkuQJCFVeh6
         xn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUobvP62god33uWk1Xkpbdlxgb47Xcu3dVNx2UsAy1xwg9vFp7hKPxUGBEW783l5bysvIHfbzYGtZZNtes=@vger.kernel.org, AJvYcCXBul1iHCB7rx+P15IUtQTUjNlvHrZ1LrfJlkaIZEwLWqj4ExnLsRKIGl/wchRbBaZ9DBuZwePMBte8eWP1F6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kj++5X3Q7SlVlzTzUUX1uqrMpyX3oK6YoXo6bwoXeDtRkhej
	KacLjVLygKPEIb+iPnN51tLNAaMO1LX4qsHkklYGKlA4zIwlRkQaJwoLMMN05WJ8iCiwnhApu0N
	vITVb5lMqKoZYrncWOoj93W+Wh0g=
X-Gm-Gg: ASbGncs/qzY4aAUA3tQKgAGqFSGg/ojPlwGeiBpQCaGooJJS6q6acESTTppfuXWbvZN
	Pm/sc/Ir2T4G8IoZjnDv/veyjKPkEpG5hYLoq//30VQ/ILOZHCgB4/4dtQY5/70LAcgpopEgJAE
	p6XklYo5F6OI1ELurMd44sHYbUhg==
X-Google-Smtp-Source: AGHT+IG7VQfKhUI3ewajC5k1DnE4SbEI7NRFqrdHZB62bG69IvTMR0HCLjZM0+G09K4O2LAyweHi9oVeWXxsvbbGPII=
X-Received: by 2002:a17:90b:3890:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-306a48bf3f7mr213677a91.8.1743701771512; Thu, 03 Apr 2025
 10:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
 <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
 <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com>
 <CAJ-ks9nfEg=sdn_-q+xOc+k9mU0pdMuumwRb76LXzE3RcOtg6w@mail.gmail.com>
 <CANiq72mERwbmXYq-pi=WUAZ_VYGcBVS7tzH4P5zSUVCMcL4-CQ@mail.gmail.com> <CAJ-ks9kJiCGAkzW9M6q-62kcyvwBea5Zt2EoeeY0T3aN7jK+ng@mail.gmail.com>
In-Reply-To: <CAJ-ks9kJiCGAkzW9M6q-62kcyvwBea5Zt2EoeeY0T3aN7jK+ng@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Apr 2025 19:35:59 +0200
X-Gm-Features: ATxdqUHj2RySMUlzfIJcf0gmHpZ8mus-BT_w4kJiHspLhXKJ1gM7QUWT0uqBcBI
Message-ID: <CANiq72=Mo71rrVSnPzg00EfiY+PCf9KCA-EXmaoNUCb2-adAyQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:09=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> My experience in industrial settings is that this happens very rarely.

We enable lints from time to time -- this would be no different.

> =F0=9F=91=8D
>
> I don't have any new information to inject into this debate. It's a
> judgement call.

Thanks for the feedback, it was useful.

I submitted a new patch to disable it and sent the feedback upstream.

Cheers,
Miguel
