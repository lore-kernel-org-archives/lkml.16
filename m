Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E32BEFED;
	Mon, 16 Jun 2025 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109025; cv=none; b=HfjUOW34u1Xq/MCEyqES6ndG8Cdcnt4KnHNEUH9NzkIasvqKMbrGwmn8qtUte17pPP5PlgEsWTRz54kgU777vrkMjeI2E0LGzTFx3f7waFOSa8fxv/6pF22OI9K6BHYdnSJGbhekfgePmkzeNX2h5GQuKEudiNRnznkhDfvAo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109025; c=relaxed/simple;
	bh=d95uYNA+qHBnKVR/s9FPPkJ8oxqbnwmVAa9sGVJwP+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y42PYHrRMFIXrzn8AvWa0xRPygUkYD+MCkawrJ2/fZ2tjPRQ7LFRJJBnhHUrs1lUDmriLAsW7iv71UIPOZbXReH+8MPV1P7vQsfc50rlN88oOgqgZRp+cZXmsumB4lT6r+uPywPkvsr9sLFkRnx4qa5CsoPMyx4Iqp9cE6qTeC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQo3fQwM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQo3fQwM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234a45e69c8so3562435ad.2;
        Mon, 16 Jun 2025 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109023; x=1750713823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d95uYNA+qHBnKVR/s9FPPkJ8oxqbnwmVAa9sGVJwP+I=;
        b=PQo3fQwM7OGdaEYLdz1BjDlKwLbJhBKMUV4qlTGwzm3xElq/uSBI0fejf42OM2tgax
         XnuoBc1SULVgTQ+zStYUtoL+GOT4wToLJrZzxObWAXpOg/h09A+D81vFL03b41OO2+9R
         W0x+qpNPjhdg7YYgHiU72FwzQwoC+bMxnVpMb2ywd5ogZG+Qlf+EgSBCLZ6AbDF7vxOr
         doWG9uAcmekv3fYLPXJU8geOpmHa9ZWlm7wYdMyXG3NRYupwjN8bSAhPmIGZy7c4v2kr
         M/5AaLFLKXmmxr9AOsreWoqVKGgPwp71gtrbPMetyIs/BNi3fF3yMNVneoeJIaFjsLsR
         5/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109023; x=1750713823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d95uYNA+qHBnKVR/s9FPPkJ8oxqbnwmVAa9sGVJwP+I=;
        b=Eq4dN+HwsghXCWxu77orUX188uDo7QpqAbLvbBdzeHmdYcpYr+UOa88NXs9j5mkBqz
         8ofCCllxuROFCAf2LVOeHS0tmP7mklmZRQFZMHxj1NB8aQXpdQMp1DaussfLCK+qx610
         bDDcQv+P8lJ5flthufXwvo6XsC/4oe7+zLK1M8/jxlrF9PJjhLYW9mC2sUzyUAYZVvLt
         crPWpGKE8jS6xoiEpHP207rU350YaKVOP1151+hY5JhZ8laBtOaJ/bkedS2hm2Ux+Sxc
         3N5AlUpbHI+lQDVQ98FZX3Tb5B664rC2xl6eN14qiPWiGxnQlr7cis39IIoc1ytuvYXP
         otJA==
X-Forwarded-Encrypted: i=1; AJvYcCUZDpoSER3fL6HBrL4LR6BVkzVRgPFHi8IcX+WNxFBMZDkAZG5bfX0UOYd3t/tIYqGkw0xA9X256pP+gOo=@vger.kernel.org, AJvYcCUthTtGursGJP1zAxK6O8CCFMOcTiEJknrB2dqTzrZTAQy8jgqqZ0Y6ZBmdjsrZi+qgvUHofIGlFi4hAseq+s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt44fSNtxBugraXObwlHdThBn76326ahaqOcRxuJy3R8FkcLdV
	1U7OJXwJVDO3aeQOuJ5etYi3C0WveW7JY+zZejqTULAwjBzJFoS4H3PONo4PezD3J6Zg86NILxI
	qgIc+pv8eFSsUqd7UkFLbMPW78XZIJ4A=
X-Gm-Gg: ASbGncvxwXSUl1bJtRgcjVdtn5mkwMTfpjM6IV3ShOxssb4gVFLyxnn4ye6am+3vlEO
	njShLvLUoc5ljXtq6PjiVaoHZ+9jLtjZZzXOyubo4IEjAS1WtBUiLzbKhxfZfdyvbMLpqZPCXx8
	bEdLnfDUgm5XCOnU2gRy/l+Z3gOet2su0KLaaKNT8AVnU=
X-Google-Smtp-Source: AGHT+IGTCVFlE+jAZCqa1TImuqxuuHFlZFaIUVaOzy6TS2kVGm3wib1sMfeHG9Uc6JYsZfAqIfMyIXuOxZnmzFI3nis=
X-Received: by 2002:a17:902:d2cc:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-2368eca476dmr6350155ad.4.1750109023104; Mon, 16 Jun 2025
 14:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
 <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
 <CANiq72=s6Ugqrf5Ot6fJOMyCug2XyvKpjFCzya_Mr5iBkpitLA@mail.gmail.com> <CABm2a9e+XJsess6XY5ukz8vav30ADcmBrufmek+Bd-TNJpR2aQ@mail.gmail.com>
In-Reply-To: <CABm2a9e+XJsess6XY5ukz8vav30ADcmBrufmek+Bd-TNJpR2aQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 23:23:30 +0200
X-Gm-Features: AX0GCFtT-gKuoP083LhJniF8uXA9-2rFn2pMTJ_mxVkBeIFy0Ly57UElPki82Zw
Message-ID: <CANiq72kY=sSnhzYPRo3Zuj-7RjULMpRfCBYfoDDCpCHttX-3-A@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Christian <christiansantoslima21@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:11=E2=80=AFPM Christian
<christiansantoslima21@gmail.com> wrote:
>
> I mean, using something like `use core::mem;` globally since we use a
> lot of core stuff and so, it would make the code less verbose just
> importing size_of, align_of and etc.

Do you mean adding some more `core` bits to the `kernel` prelude?
Yeah, we are always considering which ones to add -- if you want to
propose particular ones, then it can be discussed of course. Perhaps
in Zulip?

However, since these are macros, unless we get a proper custom prelude
feature in the compiler (which we requested a long time ago), we
probably want to still to refer to everything in full, even if it is
in the `kernel` prelude.

Thanks!

Cheers,
Miguel
