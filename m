Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263519F10A;
	Thu, 29 May 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748537784; cv=none; b=F8+LWHuuiqsWSo4FXagO2fd+c0Qdi3uYk7a7g0yo0UMbLyX9jDfk1D/FlRLnEFHfC0i8Pv2HxqYqt1ueJs/57297mZFLwftqs0LIG9GuDWNnRuuPqMbntk+GwXquQGG2UFZ8F0z449b36ozKECt1/QjA4R/2neNQBz7yI8mNnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748537784; c=relaxed/simple;
	bh=ARnJfr05XHG7iQyo5Ewu7Aauq6BJusIxGyh41sGJnpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbiMRyiM73/2vsLk+PnGRWGZqn3hIhLoWPxl63UkaFcvAURmX5gBJbY+yfpNT0vbYYDokJZ8yPeEQR6Z2kMFObjd+BQV4nKRAUy4Gy+LaaSprm+u/yKqqeX+N5SnhxUNjhvoEnh/0N7sWUCp2iWnyH30A3EuorQKo3zHUTIxL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A48aAP92; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A48aAP92"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso11604451fa.0;
        Thu, 29 May 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537779; x=1749142579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARnJfr05XHG7iQyo5Ewu7Aauq6BJusIxGyh41sGJnpk=;
        b=A48aAP928UwfSrNpUvcq47/Dn4R0dogmTUtEGDuClin00sb2FdLBTAHzh7V70n2xVs
         vTKRs4SM9IsveFzsBQp//eJJyK1ZiZK5kkViUuP5o3g7AY+nt7yBf1nplooWHMxpp1FF
         UtqL1nqFc8Jj8ieCxTOGJLL7pxSus8M4pI1kixgLADv6j0ZP0AAbcN1/mQepnVbmwgmp
         aUdtMaVcLHs/y765RO/grcve74KFBV2qgX7cW9X/LmkwzBdY3k4DS9hk7Zr4g3EI3duz
         fB13/weCWxiku5eg4EcgtIHZ70yIiCMxnezFhciLqCqKdJzw86osqvzSXF+n/xCAyIrq
         d/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537779; x=1749142579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARnJfr05XHG7iQyo5Ewu7Aauq6BJusIxGyh41sGJnpk=;
        b=X36FqjmqGrY7EMPtwMjwha7MPkGMmJbBkc+Ok9yAcN12m6mGyuWNTe+sygVdGlvJ2E
         KqwuDcEKApXc6FQRa22KOxS0plJwTnJn/uyIzpmEukoh/yy7eSsZuCjrB5emUn2Mzwzu
         kckAmX0IlggZz409pCkaDXVuwO82qS/AqQYTaqBS3PJS+Wm+yDWVgzzgbEKc1N9OVdxh
         v72DRb5HjJ1jRobmyGO5VKYszJp/yj8jYVoekGwNAN0mHOhJWT5ZmydZq3arQpmxfyIM
         Cmcdoz0ZQjVn+dbMnfWDYgTniXo+B6iS9wJC2TbArL9PbYJ0GRhfEqp1mtqGoAeJ2XrZ
         axvg==
X-Forwarded-Encrypted: i=1; AJvYcCV7dMal0A/7uXnaS1c9s6SQ0MVkCSvCzr1Y63s1c1yu0SehBkgyDi8mbA6Si44HYykFOXHekz7M7cK7RPxTjas=@vger.kernel.org, AJvYcCWmInMACZbYrxC9JfRwafs7a9BJjAY/0ZUctMRIVJaVNmHDUPTUcMmfS3uPVTPcxIC1aGGaxFdpdUMH55I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGahXAwZEm8mjh4+mpnBRx34bIipu1VPmlQK8+Qa0W2y5fwT8G
	MUQoWeUXy45gXlICogpQcncbxRwTyi+F72BuAr13gdHyuuySKU+reNR6yAPMutOYCUt4VsNsvp4
	oVTs7W/HTJzzlyHCEtqgKeAR91s0Mc+U=
X-Gm-Gg: ASbGncvRdZByAl6WbWMwiZ8hUz/uhiO1q5oyAqaFvSvaM1ZpgPOd7KuthsGXVSi3mPU
	J65kIskLlzJ1XvHl4fnxH/9cVcxl8FhDWYbrgo4W24hU5Jg9+D40Mxu/sZ0RZ+nx0pLqsiijbLa
	yXmh1YwXhiJXqLss6CMCe6xALax26W8tw764flD3RBNEi8V1kyMiTQKu+dEaRuymhpmQ==
X-Google-Smtp-Source: AGHT+IFDgepQWhCkc/vEIU0aCiNxkKyZH/EgPLlDVBxNQgcXh4hWM4hiahWqE4zFOjMevGyE4ZkiRQdbU78QCNOcehg=
X-Received: by 2002:a05:651c:2113:b0:32a:84f6:a868 with SMTP id
 38308e7fff4ca-32a8ce49367mr2143221fa.37.1748537779123; Thu, 29 May 2025
 09:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
 <CANiq72=B4JMK4eqK0tL5ECWFAKcBGm0O9LsZ74dd38N2GrZOMg@mail.gmail.com>
 <CAJ-ks9nTrOuDK1W-qFpsMow5Wf7XG9hGBbf6h_kS2Xo16wyHjA@mail.gmail.com> <CANiq72m6dCQafKUvF5k+Fc5jo1FnGAoDA4XpGU-qNkQe+e-gew@mail.gmail.com>
In-Reply-To: <CANiq72m6dCQafKUvF5k+Fc5jo1FnGAoDA4XpGU-qNkQe+e-gew@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 12:55:43 -0400
X-Gm-Features: AX0GCFsH0QbqO5-XVQnhpHd8ruRFAWYZ_nS-4fbtF3g-7F7OXPvAY0aTZnVFRjo
Message-ID: <CAJ-ks9kd73fYV2+u+7PequU4Ae5o1oCubZ6FemcTENP+U5-HhA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 12:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, May 29, 2025 at 4:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > All fine. The only problem with the version you pushed is that it
> > evaluates $ptr twice, which was flagged by Alice in the v1 review.
>
> Right -- this one also has the `&raw` too, and Benno provided the tag,
> so let me take this one. The error is a tiny bit worse with the
> `$crate::` in front now, but I think it is still good enough.

Great! Thanks!
