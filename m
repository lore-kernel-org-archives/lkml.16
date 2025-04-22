Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529619F471
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339306; cv=none; b=RGJx3bwufQjVJY2MDww9DomnXvIUk5VFdpQhXC6qiGGiDwTQo9xNNMBPnt9NlG0/RuEl8RFf+RYWo39Xdf8mwn8dT7AWv1xePq/5oERk6yLo0Lq5gxBkayxTFVh9T8KuZlTJhQDeQpo8SQARkXbvTrKKGKQyrAQP9BzcvF46cIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339306; c=relaxed/simple;
	bh=j+iWAa0suooh/9BbheNTpR15KyC7Wrafy4/wZyt0F8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMpoY0DvXVNfXZkP7uzRGJZBtcM5VWO+uzglO+n4cl5zE59+xOczcGmPaBpqfAtWKIygw1pQT5sQTVW5qNNoPWo4eeLkzdSE5hfgSLMr1bf1xziXQYZfDikm3y2wefhY+zU+e0GfrBcUDDp0ykaNc9wLyZatjo9uGCjXzHx+Rqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=gOmHCpRH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="gOmHCpRH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7080dd5fe92so9657677b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745339302; x=1745944102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ/h+SRKg3HKK8qDeGxWSA4UTfkR8SBnHYf8ziXdKBc=;
        b=gOmHCpRHyfwMjWGfVsBTu+W5AOcjKiVXVkKzWE0yS9nwwqCiXnUami/1nRwoUELhPD
         Rv4LStcEtWNyIhMjSP/OVcN2xVH04PH94WYY5AlOtcK17zU8OW3ghM5z0g82LgS3SMiR
         Rfn77PJkuatFRUy90V2HUhiwzt7M1fNuxKYNgba/rNqztu/6DKZZsiYqS1LjTKhHWotY
         de3JCT5+S++6HJ4recCKxQ5C2NPuZ6dSi3MidLzYxJHA1Mj9tMKkasGLWH9ek7eyxW1J
         ZYcCAz56IVvuPhGt1lkZSbahlybyBgSaJume5Cj3xB6N7b45KgNARDxCxI+W6xeBushM
         NqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339302; x=1745944102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ/h+SRKg3HKK8qDeGxWSA4UTfkR8SBnHYf8ziXdKBc=;
        b=qR8MyroyhSxn25IQw0glAkHoFUA0sdaQZQyOnZQrZF5VumknjVHsDvwAQInl9x5D3c
         sv6u3t3lUOTihbm6z0Fv52VpAI6Ob78ejL5to+DE49oyaaM3TUcF799daXh5HVL/rceE
         4RGKAC7Ilb3HOSqt9NMzYJQ8d6E68vJWpecR4WP4eh1rt2GY9unyxO+n8sf2+Kd74Ca0
         tycgDMOHoChrvYSZSH9znG6mR7nSqDsFxqxNqXGZwqYtC85LAOirgnCjjRzTpRtHh3MZ
         V4fmyR3s8Zqq0eyIqRG/xoJROM6TaNk6JOCRDkj/tQkDjRkXuCgsFus1XyK2Sm1SDCsF
         rnaA==
X-Forwarded-Encrypted: i=1; AJvYcCWOX04s+5Up4EqlGNklWLCrnghx2c2ufGgJd8rFiYuf1nv7M9g7JchTWVWi+MlaTHPp+QN6vIiTV5mda4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+4VPdVdQ2hwfufFp/3MLpA/yJl7VfRrBIMw1QGAYgL1fWJo/
	4QmoE1opVWTDVeIBfpQzwv0zqRaKbxR0tnOWveMJDm/BmUky0WiuVPDp9P/yCL1d/SC8lvU7Oh+
	p7Ol9BILHg/BPn2XCrRcQ7ARnem10lTq/C0JA
X-Gm-Gg: ASbGncsmoUx17hyrdHZq6ARR2EOkDdCDUK/LYp/AxB4JTxqQ89i0QAeh+6ZGMdvX68m
	EZplMdPUqsBwMyEFplt6PuxeDyVeqmU2WhKEH8bcnuM+lxaS+Rkuq0OH7FGdpCmuZeuNWm6Z6Q4
	EXAoG6rCYnqPv09kelWYuA/w==
X-Google-Smtp-Source: AGHT+IFQDSL/ncnLOWK5LRznb2NXOaof3/0NlcAW1YBboG+fEljKszmHQmxJ1eEYy42tv3YqfQtVf9ZlPwKPijpnNCE=
X-Received: by 2002:a05:690c:4443:b0:6fe:bf9d:5de6 with SMTP id
 00721157ae682-706ccb04f2emr232424337b3.0.1745339302344; Tue, 22 Apr 2025
 09:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416213206.26060-2-kernel@o1oo11oo.de> <CAHC9VhS=jWEZqb3MqCtUAJhY9ci8d_N4H6CqWsYU0YmEG=8_yA@mail.gmail.com>
 <c1eb852b-f8aa-4ab0-9579-19eb0d383cb9@o1oo11oo.de>
In-Reply-To: <c1eb852b-f8aa-4ab0-9579-19eb0d383cb9@o1oo11oo.de>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 22 Apr 2025 12:28:11 -0400
X-Gm-Features: ATxdqUHPzGOFeKXTqUOAMaQToBxYYiJZ5vV_2qPozFgBaVAUE1O_hbEaQPAua4U
Message-ID: <CAHC9VhQ2NWr3-zQ8mnQEOV9KzY6A_Vd7AR8uzp5ZZ-FLhkG=yQ@mail.gmail.com>
Subject: Re: [RFC PATCH] lsm: Add Rust bindings with example LSM
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:22=E2=80=AFAM Lukas Fischer <kernel@o1oo11oo.de> =
wrote:
> On 21.04.25 21:09, Paul Moore wrote:
> > Thanks for sharing this Lukas.  My Rust knowledge is still far too
> > basic to offer any constructive review of the Rust code, but I'm happy
> > to see some effort being put into looking at what would be required to
> > support a LSM written in Rust.
>
> Hi Paul,
>
> that's alright, I was mainly asking the Rust for Linux contributors for f=
eedback
> on that, but I wanted to keep you in the loop as well.
>
> > It isn't clear to me if this is simply an exercise in seeing what
> > Rust/C interfaces would be needed to implement a Rust based LSM, or if
> > you ultimately have a LSM you would like to submit upstream and this
> > is the necessary groundwork so you can implement it in Rust.  Unless
> > it is the latter, I'm not sure this is something that is a candidate
> > for merging into the upstream Linux kernel as we don't merge "demo"
> > type LSMs.  If you are intending to develop a proper LSM, we do have
> > some guidelines that may help explain what is expected:
> >
> > * https://github.com/LinuxSecurityModule/kernel/blob/main/README.md
> thanks for the feedback, I guess I was missing some context in the initia=
l mail.
> The LSM I'm using it for in my thesis is more of a research testbed (or "=
demo"),
> so I never intended to upstream that. Since I still needed to create bind=
ings to
> implement that in Rust, I figured I would post them to the lists to get s=
ome
> feedback and to get things started in case someone wants to implement an =
actual
> upstreamed LSM in Rust in the future. This is why I marked this "RFC PATC=
H", it
> is not intended for upstreaming, only for feedback.
>
> If there is interest in it, I might polish the bindings after the thesis,=
 so
> that they can be properly used for an actual LSM. In the state they are
> currently in they do allow writing an LSM in Rust, but not in a way a saf=
e Rust
> abstraction should.

Thanks for the background, that's helpful.  If anything changes and
you decide that you do want to implement a proper LSM in Rust and
propose it for upstream inclusion please let me know.

--=20
paul-moore.com
