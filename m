Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3917A2E3;
	Thu, 17 Apr 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895683; cv=none; b=pwYV6GR2A2CTPqzX3jycgxIzdxsCoTOWfTjIKPUbAD5Ixg68tvhQ0mzRkdxD+KM67OWubrBMjIY44nt2DQLwsC7FRXDq/tgPhp6X0PGzpzcqv19XmAzBHP2yLnY0xQNkTd64HsHF6NpQRz8s3tLXEBEB63AgB3OCFcdUwyX1o5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895683; c=relaxed/simple;
	bh=W03qAi1C++nKzfnUBzX9aW8BaW2uTNHpM/QzqSC0X0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7sshoXJ6jvjgQMdFRDmCSDPwpbrWJoF0eSkMi8kbxzv5g7OODizQ9l9+28/2XLxtFzSfR/6UJhQL9IoqIrQmSSE3CNoW9BXUX+hOSXQuKXiz8a99XXLjiRzJpF8xC2NcdOA6TX3wjt2Bv3iLR5LSLmcmpk05cJt68vjGprzsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGiWY8+0; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGiWY8+0"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso6944441fa.3;
        Thu, 17 Apr 2025 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744895679; x=1745500479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYrMJu0FPWzC8DJ68HX/qi+NoN6jBeruHW1u5HRV9ok=;
        b=QGiWY8+0TJmrjCmInSnpOQJBfmX+8ORm3mndw2O/6uQId1z7vStyDBhXP7qsGOiHlk
         zcZ6OqOP+JaPn5kU6sj3gT0gxsjw5mg+9vdxKmDgTZjm7hOfmmeBXTcu/9aubyOSlG1C
         PecrfDfkg9x3pygDulr9rVXi+wj2CKfLYBEJWoFVzaDM8sIqgnuM77iUFlbOiF7qZAC1
         RVITOVQMTsoIV/F15tV4/8lhdc3LrzH+RpIhq0DNHiIMyrygoeih4XaXMBr6LPHEC7mF
         Ea474lZRzHDdyuudWEZjaSt7IklN0ps6GZUN7gFHLoOsUQKCwT3Ug9V/4l4H1xeet2L9
         jbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744895679; x=1745500479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYrMJu0FPWzC8DJ68HX/qi+NoN6jBeruHW1u5HRV9ok=;
        b=L+29fiXu7cZ7ynqWxJvvJaGWpsbz8YcMyk6lAIMZ4MN5tXzzJoDh0xGTDsA1hSDCtt
         aLXtlL2Pjg2B8TedbSVpPjV2r19BKHsdkBHTDUc1cQhcpm1HaFH/1pXqScG0lER8xtez
         ujiUEZZFVBEjtOKjmdWm4rfaSbwqlghpOh4a/2yjjdnSOdYSHbal+saSs6uxUEDKGMqd
         LCe3qntpELGDfm0aPCEVyk6qWkpsDC3Eqzpk+znh4FoeaEJvPaTRUkQWlXAZGpwx26/W
         iojJco2u7iutezhfZKCp2oSPysn9mKgeGeStRjuJKRSSE163qHQSV+h476K0qmZ7WBIN
         iAqw==
X-Forwarded-Encrypted: i=1; AJvYcCWX0YZpmOI78Dj9+5dQKPdFIOgyda6ptdNg4Jy4j0qhSK4j0cojbKjoYl0PLCBzEZlI4iC+fMYJ1wrfSo4=@vger.kernel.org, AJvYcCXp1PaV/W3/xqiOMdSzEBOHN0tGfssrJR019WYR4R5josGm8CsyTOHll9g1XHjC3m8MlWotMgZM/oEoXON0FjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRQjiqWoRUuOamlX3FHporKYAVV97a/ryD+M+V9C88ekAOu/l
	ePcbK70U7WxMpr5on0SdGZNuTK/AISxwihrnlxXm44SQymqfO084bjNIoU9qYZ6eF47rOqj1tRp
	Xmfl4qpn9NmNX4ex1bRA6S71ySEE=
X-Gm-Gg: ASbGnctkkWZ8xCwaENRr4NBQl4XIXUA5iN2vEkcCRSs5asNxH0S204OnSQm8kM5gvT4
	ioadnEQB4g8Uxbo18WSoQayQ79blnQkH23yd61C5WjqvrW74DSneyN/OR0Z2fn4mLtGBRFkA5ey
	BbtBZrhV64D8HVrhfdnC/8WtyyS23y66dKRGYMV6Gak2yFtxIA07gTjdwp
X-Google-Smtp-Source: AGHT+IEXwCF48fNKIUx7Gqqebry8C2sFPXHPU7jx0rxt+VwKd/nnnLZHThmvSMldjtr5Q2XhKHcogNYOaBSLEhzk0Oo=
X-Received: by 2002:a05:651c:512:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-3107f73b104mr21481591fa.34.1744895678579; Thu, 17 Apr 2025
 06:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-13-385e7f1e1e23@gmail.com> <CALNs47vcB9A7Q66Xvh+_dQKkn5PE6BSw0VpO1S_2KQQ_p5AVSg@mail.gmail.com>
In-Reply-To: <CALNs47vcB9A7Q66Xvh+_dQKkn5PE6BSw0VpO1S_2KQQ_p5AVSg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 09:14:02 -0400
X-Gm-Features: ATxdqUGR8UZOskGlGIFMVBRL68ka2ZZ1O-4cACFG5AUAgWHZ4HvJh2j_oKz1Z-w
Message-ID: <CAJ-ks9nZCi+LHw1-RPpeFEqTe8DRPnj0c7+rc_vFDVPWak0KEA@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] scripts: generate_rust_analyzer.py: use `cfg_groups`
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 3:29=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Declare common `cfg`s just once to reduce the size of rust-analyzer.jso=
n
> > from 30619 to 2624 lines.
> >
> > Link: https://github.com/rust-lang/rust-analyzer/commit/2607c09fddef36d=
a0d6f0a84625db5e20a5ebde3
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  scripts/generate_rust_analyzer.py | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
>
> > @@ -76,6 +70,7 @@ def generate_crates(
> >              "root_module": str(root_module),
> >              "is_workspace_member": is_workspace_member,
> >              "deps": deps,
> > +            "cfg_groups": cfg_groups if is_workspace_member else [],
>
> Does r-a just expect cfg_groups for workspace members or is there
> logic here? Maybe worth a comment.

r-a doesn't have opinions, but our configs apply only to our crates as
opposed to sysroot crates. That's not entirely true for core, but the
configs we apply there are narrow, whereas our workspace crates get
all of KConfig, which is huge.

I'll add a comment.

> Reviewed-by: Trevor Gross <tmgross@umich.edu>

Thanks for the reviews! I need to rebase on rust-fixes which picked up
the ffi crate anyway, so I picked up your suggestions:
- generators instead of `map`.
- `Pathlib.path.stem`.
- `Pathlib.path.read_text`.
- Add a comment about cfg_groups.

Cheers.

Tamir
