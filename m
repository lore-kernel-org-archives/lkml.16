Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADA268FEC
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746083622; cv=none; b=ExREC58z0hEoJ23g/qqMcw5RADd5fIFhkmc6rgUAsWSEB1wCDTAbgBnbn8K/N/bMFTlmb6O9dUkI1ZxF3c5z7qLKZyigrknBGM77KiMQ5M/TyV8Qrh7K4t7GjwhL74TJjzwRfmL1bKsXZZmcFw6rPfU1IEKyfxeB7GTxtaaK3xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746083622; c=relaxed/simple;
	bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1IgdeyKD4ux67gXISR+tGlIe3aTBW+8t1a/KhAvLe04h7dN2FQ5Ih9WkO4uL+JNxHllu+kVVWlgeh+BWxrtC9H9U1noJiq97oH9JxJp+ttTSkCrZWEncETMuesmMop8tORdjnkEqboHCle9lBuUNDM0wgDgLfH4R0Ljw60qYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJyCDxgI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJyCDxgI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac9aea656so620360f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746083619; x=1746688419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
        b=WJyCDxgIVnVemuoy4+jDE9QanbmUs7X2yg/SEb0RfdES2Wojd9PTe3vJz0wJHTQ1T1
         0YJAsfD5vs7lMu2X9J3sYq7QM1XMPeTemYlVgky+VZ5FzlIovHV4UKfJ0WuonMvOA4uP
         NpZ+XsTo3qI5EqPSQXYl8MSyrgv18o/uQlPbn/adKoU7ZypqC+csJXZLshjad7Pv1ksR
         2y/8GCgmbu9idQaFBLoD+erN9s9jDY/0K1MrJVUYxbKt7zVBNEYMjkMPO8pK9LDvZi72
         8jDtS+hSo2F7VZbha8LS9yGJDiIEDcdkkNb73SOxA/Nd9NiTk02xRtUAqCt4SXR630zp
         nLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746083619; x=1746688419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSceKILHuAqpArLvBrvn1WkL3zQ7RTNaWnjS/zM11MY=;
        b=aKDukkitdUmLQvtVrT73mtC6KLsjXfvHp/Of9wocRB+rHRNqJ2AF9NH5095lnnVA0o
         yRjnm5pYDunUlsVNtf6HQW1YnlCks2h0Uc2LLB2GADYIRFuL+AWpWN0ygIY/iE6F4brM
         kqHgNG2aPN/HSXa8XDOv0/A7ahrUiSAvhBOdong+tlBmzgDk4Dc2FmhoiIv5rPdANr/b
         eH1e1d8UUP3fMm0J0MbU9Er1LvoYiphft6UoUQ2QHlVeRNwx5mK2v/TRfNl+k94LGjdg
         lDvDUena/wxj1yuBfGq4UHzFZKwEcD/IeW2glVdInhmS1zpjv2qv5qmCitq4RrRCRgDI
         DC7w==
X-Forwarded-Encrypted: i=1; AJvYcCVDtnSGJKklUfSQ6iZQlXOCdZIWmKPHzWXWktVCrzj2QyXP9DoK+97Fg5LWATvP4Lo0lZ9HbxM9oSx5KNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/5sCl9AbiYA/SAltzpkkF51bDeT1Qui0QqVYH/+fge6QHtYN
	CIVuaaMlsbw35Xn1DXtojRN4EQ2I0M0r95xOmlnM4RF+BNGyU2rOK6z/N3U/JN4X0I4tPL4UYWl
	6r6nWh11iKbkvhk1CM01aTFp+cCP0xlz3lrvb
X-Gm-Gg: ASbGnctx6A8G3jCrF2yZZuoGh4TKR+JG2hvcxfT8BKsaMalOHT5qELyPt4LCS+qmx+m
	GpnhZilqh6PoyfeGCNsNw7sT89kRAmeS1K6nhZ1L6nTXNJDX27lUS/M9HIaZQIDhn+PM3UFYMLM
	vsG2fMlFG8aTqX7Qg8OvgFFDs=
X-Google-Smtp-Source: AGHT+IGN3TCVYF0QhPUHuMTXlmMoT5bvOUHFWUt0TCL/e5cKhJDlof9p+ZsQRcjZYfw9VK8lVZJZGWzzaKYax13SJKA=
X-Received: by 2002:a05:6000:2403:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-3a094044002mr875832f8f.7.1746083619006; Thu, 01 May 2025
 00:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-configfs-v5-0-c40e8dc3b9cd@kernel.org> <20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org>
In-Reply-To: <20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 May 2025 09:13:25 +0200
X-Gm-Features: ATxdqUGO2CyyZYzRoShGEfmJdbqkfUThUZw7qk03SErsEjIyLXmJS5-laQdv5uk
Message-ID: <CAH5fLggDwPBzMO2Z48oMjDm4qgoNM0NQs_63TxmVEGy+gtMpOA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo`
 to `T`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Joel Becker <jlbec@evilplan.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Fiona Behrens <me@kloenk.dev>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:36=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Using `ArcInner` as `PoinedTo` in the `ForeignOwnable` implementation for
> `Arc` is a bit unfortunate. Using `T` as `PointedTo` does not remove any
> functionality, but allows `ArcInner` to be private. Further, it allows
> downstream users to write code that is generic over `Box` and `Arc`, when
> downstream users need access to `T` after calling `into_foreign`.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

We discussed this in the meeting yesterday, but just to summarize:

This isn't correct use of the trait. The trait is intended for cases
where you pass a void pointer into C code, and the C code treats that
void pointer entirely opaquely. That's why the docs for `into_foreign`
say this:

The foreign representation is a pointer to void. There are no
guarantees for this pointer. For example, it might be invalid,
dangling or pointing to uninitialized memory. Using it in any way
except for [`from_foreign`], [`try_from_foreign`], [`borrow`], or
[`borrow_mut`] can result in undefined behavior.

In this case, you want to make this change because the C code in
configfs will dereference the void pointer and read from it. But
that's not allowed with the ForeignOwnable trait. You need a new trait
if you want pointers that are not opaque.

Alice
