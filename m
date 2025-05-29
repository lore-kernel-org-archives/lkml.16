Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E210B226527;
	Thu, 29 May 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525338; cv=none; b=UmBMI9xTnGM76G+PMX26iuj2Lq7dmHVBWvltw2vtx7MoE7fh+993isZh928+pb5VQFixJHlKrFsHN5okZg346UTOGrkzouVm7eAyFS0VF8ED8UZiEEzuJVWTowW7oIXLNYMfVJRv0touc6+/JccfjEN2TKis6ZwCFaRWyPbTmIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525338; c=relaxed/simple;
	bh=KkYz32Trfq7SamxgMNROeJDs8dDQfe+qHhSaPMbUW7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gzh7Dbbihec2QLVxRuBorb/ainTwaeblPxGIAjsij8X8AWzPEdB5EMdOijxwKV2z+GFjq3BDx7KEI2JhXI91HTBwBmSVixvVWcdZdUO+xy6ObCGdU+bnaV5KPwMSyWSYvoY+WfVQx+qQvqFXUUSV0+fCcVuNqqL0LBCMNVe/11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YscI2kTw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YscI2kTw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30e7ee5fe74so136446a91.3;
        Thu, 29 May 2025 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748525336; x=1749130136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNGihgT4QhXhCGAq+zxWlUIvoWDD4hq4zx3pCShC04s=;
        b=YscI2kTw/hsicYfEXSlJgyMdQI9L6Ojf7zF7fRUSE5S6FWY13HRrWRvUqVcf1/LmP5
         lq8dVezR6KEyWSHZJREVmIgjvIYtZvTzOvE14f6MmEL4PYFC83acud5er1Pxoh8Sk0kw
         Jt6XDzGe6BZNjqx9iYf4OvRQZvJ8BB02FC6ThVnr72PbmDeu6SIeqwtjlSObaxPnYsHa
         8iUQQMoxu2QNtaRE+Syl3h2s1MOXurVr3F2fyYEMgTBGG8TTVEzZRnLoLMrFjGBktabb
         Nc4S39UNI5S3yp8KHok06X8wsR3UWL8JQGqzp6ZPim0jI7W/LnNsSnnYq+2kDcmIHGKo
         LCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525336; x=1749130136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNGihgT4QhXhCGAq+zxWlUIvoWDD4hq4zx3pCShC04s=;
        b=dkwa2jZo+nafqGIehebq3jZ2FL2C6bHIWjRaX3OIdwwZ5IghYEX/JgtFm5pj+oNjmv
         8Mh2XXa1Dx0l/DUhFJCQXBBb0NuIGa37g0l/qzzy8PWcRv79tOmJfpyrHigtExmt6M7G
         dp21ZGdsTvB05C1KMqPhSY2D9oJXvHNt6QxledaJcIZ8k4BShIaLt8pS0HxIw7bDZUca
         9+qADNJ/9n0qSR8UdpcaEY/pdIBanofTdx0FS1UUUsCTumrNHLrP+d6OyNDq2Y00M+oS
         TIZbrcjXI0RcCHNz0Mz8rvs6Ixwy8PYVIXyhbyTRHmfLQjKXybxu0Tl4m1jqxUl7gFoT
         WyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIVkLznQxYFVOMiJabF6QzY6UywhYiMBHHTCr6fHKfoVOsoExm1UqE+6i7H5EnENuiH3HAUFWOV8Cai0I=@vger.kernel.org, AJvYcCVACqTmyF8KUv+NnQ+WAa6EKAEPDcWqa1s7u4Ie2twJx2dJI5M1wHAX1WoYSEXS2j598IGtAE0XnsblGl9NUFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6B3gQcb8EvodmbNkEVz2pTkv9I9oaOfUQDc+q6y+VINCM+kS
	NFeUFmlyEqJ6A9jXHadIFZqDBV3PA++CKTpgdvLeD87WX0ZWbUarRW0wy16xyeXCTgzvpOiLjF8
	dYtjTnw7iVF/h6TbMrgVuc7dbr7uS43w=
X-Gm-Gg: ASbGncst/7O7radwpgAZjE6Xs5dLb+aXTqJIZ95UlxRxX9hEO/A7tTtTH8zhEud3wIU
	43m5Xju2sZnXPJThnb9LfWscVbNXmVAJzhVOGEEN3kZnx765ahm10Ptsj+ntMmQvJ8Le+WXYHH+
	3TGvv2sy50HUzHAkGEGfi79s3dZlYgySFC4ixEP+j36+E=
X-Google-Smtp-Source: AGHT+IFGDy2s1ce74qQC1vfTsdC+HO7buD9QG8v8iXEfu4mTCnJricWyj500BN8RnRhyunUsCvcZy6Q0gtV6D8o859Y=
X-Received: by 2002:a17:90b:4d8f:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-311e03a7f6amr3834937a91.0.1748525336037; Thu, 29 May 2025
 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
In-Reply-To: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 15:28:41 +0200
X-Gm-Features: AX0GCFtaY6vYdcm5nKRryOdntfVU0xkoA_50wVTCFyygR0ApAbv0Du0o3tFbpIA
Message-ID: <CANiq72kmGPF+MmYcYmPz93g5L2rr5AspZGYYLfG=gYSfF703+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wB=
uGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks!

    [ I went with v1, since it seems to me like the obvious approach, the
      error messages seemed good enough and the debug performance should be
      fine, given the kernel is always built with -O2. Moreover, we could
      move the function out of this -- see [1]:

        With v1, we could also just put `assert_same_type` outside as a
        utility for others to use, i.e. in the `kernel` crate, which
        simplifies things and makes the error a bit shorter. Moving the
        function out makes the error slightly shorter, would also allow us =
to
        document its usage, including the suggestion to use `if false` in a=
n
        example.

        Regarding the `if false`, the kernel is always built with at least
        -O2. Benno mentioned debug performance -- was that related to
        something like debug assertions being enabled or just optimization
        level? Either way, even with the assertions enabled, I don't see it=
 in
        codegen.

      In particular, the error message for a example mistake like the one
      showcased by Tamir in v2 and v3:

          diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
          index 8d978c896747..6a7089149878 100644
          --- a/rust/kernel/rbtree.rs
          +++ b/rust/kernel/rbtree.rs
          @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) ->
RawEntry<'_, K, V> {
                   while !(*child_field_of_parent).is_null() {
                       let curr =3D *child_field_of_parent;
                       // SAFETY: All links fields we create are in a
`Node<K, V>`.
          -            let node =3D unsafe { container_of!(curr, Node<K,
V>, links) };
          +            let node =3D unsafe { container_of!(curr, Node<K,
V>, key) };

                       // SAFETY: `node` is a non-null node so it is
valid by the type invariants.
                       match key.cmp(unsafe { &(*node).key }) {

      looks like this (plus more details):

          error[E0308]: mismatched types
             --> rust/kernel/lib.rs:219:32
              |
          219 |         assert_same_type($ptr,
::core::ptr::addr_of!((*container).$($f)*).cast_mut());
              |         ----------------
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut
rb_node`, found `*mut K`
              |         |
              |         arguments to this function are incorrect

          - Miguel ]

    [ Fixed `mem` -> `ptr`. - Miguel ]

This caught three cases that require an extra cast in -next -- those
will be fixed on merge.

Cheers,
Miguel
