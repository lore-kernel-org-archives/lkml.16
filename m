Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B8225405;
	Tue, 29 Apr 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961632; cv=none; b=XZso++wHmmp/jlfcXX7tbfSgOBfpV7nTaGhKsryptbbT55Ogye+467QbVjRuIIYKXX0uKUuqVHQwWATEQKRpVd1OIy1id3ncExqzT32WsIuTuGZK7DV9YEy3hvCB7GBM9vDACtDhC/YtGCG3F2cQR4hB30RaL8Rdwe/0dEoZEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961632; c=relaxed/simple;
	bh=Nc8aBTnIKfrJZS9eBFscfQWugrCaRlFMW/WcJ6BU07g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPfuwTzab17gn4YjoSj0x/WNnVr3+6tZ6zepFkzczfQSK+qIf2KLxaaQNnHeJNAYqrlr8UBNsuIZHlYIqQriHeKvcnlJbSrRhHN4jFCLI1Uimh1HANIMuovCP88m9KShf6nWRCeBS7CJml3pPb/BC12uOYQ8pmGUB2oEvnBHbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ8APVN7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ8APVN7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227e29b6c55so12062975ad.1;
        Tue, 29 Apr 2025 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745961630; x=1746566430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuEwpUiS1Ijorc0+ZjEUdCrIger40NnHEM6HilN26Ys=;
        b=AZ8APVN7UtqGhBvCVyyk0gbDVEH2rOUrdFtH2HPbLo0CHUR/gE1bw6K/DeYNhRCmQh
         uozoY5vl/pjmMk72AdrUGCnaAaAFd0FBUYLwfNFH7hF9vKshWo7wYe6Gin+M28jmS7bb
         Y7oB3NRqULC8vRcSU6+0GE5PR/84JeBbP8vTod3QH+Y111c/hh90oJKQ9tYOS5XNqbrB
         v8ZInFvtAzoMs8Gy/g8uHnC2WFXSn+WD2SUYgC1z2YUdxvZnK9tFfJIOZSsbCbolOCBJ
         qlAaoIzStfdUxdo0vNEjshsioWVeBWgW2cr9rUWd8HoVdZSEdn8CYv79D/FAY3jPpF/g
         yBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745961630; x=1746566430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuEwpUiS1Ijorc0+ZjEUdCrIger40NnHEM6HilN26Ys=;
        b=ZRoKAPiqY7Ut0qKxGdoekfmOTu+v1BSSXflwOjBcl2Sr3WDiVYBv0ODVr/RPF4LfT4
         Xocu2EM0kafTHuPGSravHtOgPoNkxKi9oGwXCKP7eT1FRcg6QCEJpz2Haju3GaRvoiEf
         +1pSKTG17DRCz8Oe/bhmcXWpyv0I1ZGc8AZDUD+r8he59Y7bGHiawCbNzNaMkaXWCzV+
         SX+gcocTTjONQWGFgl/mfoUOXLD+Qu4mn67q5NFtuuCIG8yeuYJXSYmrZMEs837g/Q4q
         aXl/CJCz5u9CqBnDmzibfaEIrwpsFoCmIkVv8f8ve2oMQS4jr7+my2CoGvbnrNzPJlEs
         V6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYjNDdJXBAMBG1UtmyYuliMnwohEjAeZuCsWDvl8nK5zr0xQInMuteQqUO8poiePHKnJ28o/OYjbsBgY=@vger.kernel.org, AJvYcCXT0FFIBCyPlUPRCDPtfRpqTGUCWqOdIz4xfd/ZGhiiqcK7epo9H0iAx+IKscDh4xIZXlWLcpO2O9NyW5HewZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyp7RLWumCvXf9+3AO8Y98bskm16rla2j2DTJNV2qmSHFgLzHj
	kxADbAjgZpXsA+BQ18dZj5i/R5IY0nYvLh/YMqutOyzK0T7H2GgZVpu4i5A05ShytKb24m+us5d
	JBMg9kVz+/Dtt38julZqkP2e6VAc=
X-Gm-Gg: ASbGncuxOlagAaS2feUSaAjxZkmleP/0iiRkxP6BQ/Mp5WTqYl9OYz98rZDIX0CM2qr
	FRhAR/Wv45NrH+sRD+W1/uoDcn39Uc3iLnhoo3G2IxN36YZ7cYy6jx7CJzs90zbvsqhmz8yUQkE
	p/wK/REY++f9VNLM+Fqli4izN7355/gwfv
X-Google-Smtp-Source: AGHT+IHx6LSagutwWXWlXWcT66mNZZN+2hua2TKdaMPOojePVst4PzjYeGrk56iqzEJdy0eKxnLLmvUlDVvxgEZDNLc=
X-Received: by 2002:a17:90b:4b8f:b0:309:f0d4:6e7f with SMTP id
 98e67ed59e1d1-30a34a96e51mr4788a91.5.1745961630133; Tue, 29 Apr 2025 14:20:30
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429210629.513521-1-ojeda@kernel.org>
In-Reply-To: <20250429210629.513521-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 23:20:18 +0200
X-Gm-Features: ATxdqUFLuTg4gTSoOk2wtfwNi9ZMgfkk-gHPkVREbWARr9S1gL-bnI_2gdfy1bA
Message-ID: <CANiq72=vWNZ_y_5R45Kd6KrnBwfd55bh8yAqxtvZcVrrHr5eWA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: device: allow `Device<DeviceContext>::parent()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> When `CONFIG_AUXILIARY_BUS` is disabled, `parent()` is still dead code:
>
>     error: method `parent` is never used
>       --> rust/kernel/device.rs:71:19
>        |
>     64 | impl<Ctx: DeviceContext> Device<Ctx> {
>        | ------------------------------------ method in this implementati=
on
>     ...
>     71 |     pub(crate) fn parent(&self) -> Option<&Self> {
>        |                   ^^^^^^
>        |
>        =3D note: `-D dead-code` implied by `-D warnings`
>        =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>
> Thus reintroduce the `expect`, but now as a conditional one. Do so as
> `dead_code` since that is narrower.
>
> An `allow` would also be possible, but Danilo wants to catch new users
> in the future [1].
>
> Link: https://lore.kernel.org/rust-for-linux/aBE8qQrpXOfru_K3@pollux/ [1]
> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abst=
ractions")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Great, I updated this message and somehow broke the title completely
-- please assume it was:

    rust: device: conditionally expect `dead_code` for
`Device<DeviceContext>::parent()`

And, again, please feel free to just `fixup` this patch if preferred.

Cheers,
Miguel
