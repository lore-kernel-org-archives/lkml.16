Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EA273D9F;
	Tue,  1 Jul 2025 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373646; cv=none; b=KpMbuqzWiU931uyQ93z8bbSf8kIBigh5TXVRI+sUmkQgsQK/4Ck9No1qHT7HUBjjOzJKZH9mho7F4lfelovZP8m4mZooCgEi3ARARi0vWyCxPFu/SegZEDLs2+g0ByAq802bAydD3ftWUakKqKzPwgqbkQu0TdIpRKHPTXsH6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373646; c=relaxed/simple;
	bh=wsrtT7s5b9mhLZIo+sZQI9vjY/IY6SEISkh7aZxU8/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGxB8BEZi+Lp6nF5lSxcSOeFl3nr965CYRtppfCD/ihxlGEm6zVQGzaB97dNbsxPJUFR5dP3tqyHxG/tRlPH6hWpQTp2ZWsSPWO1/7GTDZrb9quTcY9OAsOupZFvQ7VPJ31v/qEPYWnPdQaKUaVSF3J+NO3MwySVIbBWA28YPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll0Me8Pv; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll0Me8Pv"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40b31468da3so636126b6e.0;
        Tue, 01 Jul 2025 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751373644; x=1751978444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdErdFg1vX4gcYQWDTK5wUjoqQS/z3Xz9dvVl3+3m3o=;
        b=ll0Me8PvJe8eDRcWBbxlZVaKBCkqCJxnO/HgvBf4ms0NdQhtcCZckAdq3KhWqQpEDX
         OkMVE/rN8JA7ZtQA38XFCAwTSZS2iUf+cVhPIQB0PGuVDasUkLum5Qa+zNpP4+UQSYxC
         etXfsRgfrnu1D4LBXFO+P4WIWVw+OUygLJdpdCK+F28MinC4ytczr0Iqu05DJ2s0ntSe
         oNcnANUPF97gUHmZtpFMLUWRyJdZUhHYdhL7bzARcds7UeGyMex0GWY8/gtiHMqFEQgt
         4eYYymyrzNObhc59WIW6My27e3aIrGt9fDU6LEOODb+hNJHz/25Nc2hnTNZ7LX7fpGsD
         a9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373644; x=1751978444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdErdFg1vX4gcYQWDTK5wUjoqQS/z3Xz9dvVl3+3m3o=;
        b=CFL1CvyHDvf6hbE8df2E+EJXmrcwdLJia0HTKwPxGOa2uABsG0qGtADNI1OPdFdF1s
         aeZ5vmgFksYDJneh0n986RE/WHK9R0oYp1N3uDk+4BwO6OfTuTrME5El235wd2rS7nvQ
         MChaVwxbGDSvU6o+4YZVOWOUwzL2aKMABALTgbWKz94pDD4QInjuq8LLCdvsuZHyhQxq
         N5g7RJ5xHtEY7d5H8U6LrssyyH5VePzuhpdrD6ZMTICGymY5x+fQ3WnoeR3llwXkCqer
         CVrNPsk4sGGH3DsZujkFhF5A59P3L6JrztjNzsZPQ/01SV0Ext677R3JWdU3wjreFilR
         qnsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsn8fdzKGdTVrWncQ75OkHcbIDY+bil/vFy0VU0U/bZFM4RgedTPImdmuiPPspPGcFvTL4qXUFapm3oMo=@vger.kernel.org, AJvYcCXKv5yUqU7A4uqecGBPWRkKOV93fnEUw+TqYFueLQTVbO5qII8ScQoa0Wmt/cCUixgHWPbBDIRjY2kzZXQ1fKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaz3jSsnJDOgjWtrH5TIXwsyudkVuoD5Y2RwojwJDzB3SPMAb
	RG87V12Hz47MpTEfZF9zgxh+gcc78SrXrtQFJVx5hC4X3/H19okcsTicvi9RUzWc4p1+luS3YgN
	LN9SFzSfQ4hs17v8BIteINvqjDcDYkJI=
X-Gm-Gg: ASbGnctWaqr8VH3PKY7e11U9Sugjay5z+zORsjLZvgXAdnEvDRcADTgPJOCtsNitTkp
	W3luAebsQdaT0j7HdIWNLpw0mRlMogzqzZNTXtSfnt7n047bo2KH4rVXH1mzIZ+4dR1opOt8AwD
	15nxVy3BwKp3wWXk6vPDb5+issStZhUGGA2Gj7XY6HfwWDYsIr+8UULuo=
X-Google-Smtp-Source: AGHT+IGRq/2oJykwL3uDZFjxo47YcFlscjUtTrkIHuzT9+MEUEqLjfzDBT5TFgpVTabshxLl2ugT3p3ZMVzmpxTRxqw=
X-Received: by 2002:a05:6808:124d:b0:403:3e86:ab4c with SMTP id
 5614622812f47-40b33e91df5mr11427821b6e.39.1751373643950; Tue, 01 Jul 2025
 05:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com> <aGPJFw_Ouj8MNbuq@pollux>
In-Reply-To: <aGPJFw_Ouj8MNbuq@pollux>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Tue, 1 Jul 2025 09:40:32 -0300
X-Gm-Features: Ac12FXyjLSiJFJb_uICiNNWJ9sSdOG5Cz6Tn30Lk3KFTMK8_ATlyuHEukx0FnUQ
Message-ID: <CAPZ3m_hRQGQKYhS+Vw5EQiYOfy4iDKH-0xaqWrEcMTyj2c_WAA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 1 de jul. de 2025 =C3=A0s 08:40, Danilo Krummrich
<dakr@kernel.org> escreveu:
>
> On Tue, Jul 01, 2025 at 01:27:17PM +0200, Alice Ryhl wrote:
> > On Thu, Jun 26, 2025 at 6:59=E2=80=AFPM Marcelo Moreira
> > <marcelomoreira1905@gmail.com> wrote:
> > >
> > > This patch series brings documentation and refactorings to the `Revoc=
able` type.
> > >
> > > Changes include:
> > > - Clarifying the write invariant and updating associated safety comme=
nts for `Revocable<T>`.
> > > - Splitting the internal `revoke_internal` function into two distinct=
, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke=
_nosync()` (unsafe, without RCU synchronization), now returning `bool` to i=
ndicate revocation status.
> > >
> > > Marcelo Moreira (2):
> > >   rust: revocable: Refactor revocation mechanism to remove generic
> > >     revoke_internal
> > >   rust: revocable: Clarify write invariant and update safety comments
> >
> > Danilo, did you have Revocable / Devres changes that conflict with this=
?
>
> Yes, but I sent them to Linus for -rc3 already. Given that rust-next is b=
ased on
> -rc3, we should be good. There shouldn't be any further conflicts.

Hi guys!

I resolved the conflicts. I hope it is the way you expected.

--=20
Cheers,
Marcelo Moreira
