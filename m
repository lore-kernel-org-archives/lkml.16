Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5C2F50
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853052; cv=none; b=kx5b3PVqq6hc16i97nCA8fOj+rsMF9vdnQ3mqt2HNFEvL/DDZl1GXaZ7fFXQVE4cQrRfdvG0CkewLNhu8F8os75oWcBdjSNFLL257INawgGoppMGWHd39V7Yjf/U8pm4gBmLuuVmmNNONtSSOxyiE8VCyEpF6RKP48fXYl2xKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853052; c=relaxed/simple;
	bh=ns49bkK3CDS/szk2+TQ9dOEMC7e9uFL7vYLWkhS566c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MD+34QLTnas6+o1eWhna3JbnvFdOVLShbrb/FTF8gwcGCLt6bAXkMU+IjNQTy2r3T/0gNMsv3SqP1TIcfyXWAwzfbOCzCA2mByY3pTz46IFmqDhUfHaX3kcVXP9fIZ0GGjA8VrIushK2rzG1ZbnfNZZSDZPrQKpcLjgx/QvFsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2LjX0e8N; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2LjX0e8N"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-605cacf62b7so1037957a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748853049; x=1749457849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TywMR7y70/2Ma+CWu+fUEdXPjI+octXcTv8IdMArRtw=;
        b=2LjX0e8N0BfDySfk3dc+s7Ixt6KrfLpNkjN2qYeNrrQpmerYdp+l9Vn51Fgo/+WA4y
         EZzm8+AGgmxvlTGoXcbhV/JPPL9rhRrGRhK5plw6rZ+VDdwRYPZ1LhfRHCqT/+Or+QT1
         +lqrWwnocFIfJZT0ktNuKtKa3W2+RYBiwc2J0Y3wIn4np4/ANqqfv+ENOax6fnF0dj88
         FUKtJ9Px2Ahc4UIznXQK9VNukXSEm/z0x35iZQ28r+vtyNjgKhSbwddM9bZXbixnSXUn
         jj6OKtNRQOsF6xKTczFXBCotccJ+KqHWOa+OpEvLcp1PzWxbHtEGDORK3xcdUd6EgX9c
         pQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853049; x=1749457849;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TywMR7y70/2Ma+CWu+fUEdXPjI+octXcTv8IdMArRtw=;
        b=dpoyeM8tMohRiF6izcxiBHjCyQ+RFDdc8tGi9v1WVXtPfhE+5u5rXKb68Tew5JnFSF
         nx/CWGrWCyIIiq2sWrzsf/NZ5bUudYl8mun+QGSIEFWiZMZEObZeC5NUwx4Njh+I4nV0
         kqzY/MK1f3TGYAVeLUTbLUkMCX9cudySI+Nh+XyienMVmZxPkaR2MTWSfcPxwuGuDG0q
         tx4f4KXHr1sUO6PB7Hlh3i+AjSAax6pSrRKKXa0GwzbtMlA3HRtnb+2Vr+0VMLlbp/Xa
         0Z9TbjaoM9gAjLWLK4xswL+MV+2zHLJfJ4VyuWRc/8NCeztj+wn+syvFMVHCUOH6/5C4
         oySQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwwuv3Pt9Vhy2JCSLWeFL9ap6nMVosq0Q6SDzfUC7YxrUik1C2u5Krj7qQeRchBbhV+MXn2kN6y14W3Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YynpmWnJNZbTKwJJvguHOVfZtOfZVJRnsuicHT9uBiOnPTuDE2/
	d0X/UrUo0ZpcraQtpzdYIepdkUU3qVoj6kv8nKYpRJWivXy3RpXEUe2CK6FktXfPuUDiMpG/nlz
	b9SCsB8evtKoYjD4ojA==
X-Google-Smtp-Source: AGHT+IGV2U9U17LPEUPNxc6eU7TihpVD2gyF0A6GZFV7pQNqkXSGeluQ1886domh1Zqik8CIwrhg6Bp3hBPQ2pU=
X-Received: from ejctp16.prod.google.com ([2002:a17:907:c490:b0:ad9:18c:7b55])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72c3:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-adb494d5bc4mr719727466b.33.1748853049333;
 Mon, 02 Jun 2025 01:30:49 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:30:47 +0000
In-Reply-To: <DABBSL9WTE9P.DX3I6CFIYH7P@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com> <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
 <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org> <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
 <DAAMVOZJDNNT.1JR5YY3ICI0Q5@kernel.org> <CAH5fLgj8WkjDs6qCmzxYsYTH=_knWyZDrwqLopvGZEBk931aXQ@mail.gmail.com>
 <DABBSL9WTE9P.DX3I6CFIYH7P@kernel.org>
Message-ID: <aD1hN2w2__fZ2hWH@google.com>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2025 at 06:09:26PM +0200, Benno Lossin wrote:
> On Sat May 31, 2025 at 11:09 PM CEST, Alice Ryhl wrote:
> > On Sat, May 31, 2025 at 10:38=E2=80=AFPM Benno Lossin <lossin@kernel.or=
g> wrote:
> >> Maybe I misunderstood the code, but if you do this:
> >>
> >>     let slice =3D UserSlice::new(ptr, 1024);
> >>     let mut buf =3D [0; 42];
> >>     let s =3D slice.strcpy_into_buf(&mut buf)?;
> >>
> >> Then it will read 42 characters from userspace and (if there was no nu=
l
> >> byte) overwrite the last character with `\0`. If we now do
> >>
> >>     let mut buf2 =3D [0; 42];
> >>     let s2 =3D slice.strcpy_into_buf(&mut buf2)?;
> >>
> >> Then that will continue the read at index 42, but effectively one
> >> character will get skipped.
> >>
> >> (Now it's not possible to call `strcpy_into_buf` multiple times, but I
> >> see no real reason why it isn't a `&mut self` method. Also a user coul=
d
> >> call `clone_reader` and then manually `skip` 42 bytes. Although they
> >> might only skip 41 bytes, since that's the length of the CStr. But tha=
t
> >> runs into the problem that if there was a `\0` at index 41, then
> >> repeated uses of the pattern above will yield empty strings.)
> >
> > I removed the ability to call it multiple times to avoid dealing with
> > this kind of question. You may submit a follow-up patch to change it
> > if you have a use-case.
>=20
> I don't have a use-case, but we should document this behavior somewhere
> especially since the ability to only call this function once guarantees
> the correctness.

I'll add a comment, though I would note that what we pass to
strncpy_from_user isn't really relevant here, even if the method was
&mut self. In that case, the thing that matters is how much we change
self.length by.

Alice
