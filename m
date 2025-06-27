Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64E2F1FD0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034019; cv=none; b=AqAWncaCDdlGo+sOyl+oSmzCsds5lfBrDItZUimC0+urZCpSJ3a4cOybQHNPEjvYMwaETn+ngjEhMAA1ZgM4y+4h+WYB554LKDMgMmyLXBmzzS18XvBckBBgIr8ikpW/MWv/ppnIPfEK0Xjnx9zZBcgT6kw03IZw26jZo17GoMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034019; c=relaxed/simple;
	bh=jcgyQ/Wb57DmrTUIgukktQYvJFH3Ks7NSRCZ88mZKhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW0QERFq7FbfIT30f2cYp2zfmqPHC2mfS8mc8cArGqblJuVwBNp2u8mQZkM1pMaUawa4+FCVKefNFe5DDdjQz/mBA8tg/0r1Wf+JKLss31s3fwUnZMdyFBhtmk166we6Z/Bs9mMPwHbMEJJ+U+BdOwmlma8zc48kyJ5x3TTWnkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wj5HvjzU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wj5HvjzU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso13745785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751034013; x=1751638813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewNn7TbsI9nptiuY+MPrd3pQGAHs48Wda8epNcT5ov8=;
        b=Wj5HvjzUmphSjCjlc0YseYt6jUPSbqWIMrqtwWUI/5HIotpAQ5pt21iGxJbOMFyqVT
         G3Xh3aXYpGAGNiYbyFrUvGwjsHw+7EK3zpGnhpEH1/bR3rQWspqs8Ln8mGIRKoBETcWZ
         5XasAQg/R9cYqnGnuUTyCjVvtrPHjHXHDkQdV3SbsrsihDv6LLcmrzNj8hRktupShbrw
         YnM3om895qAQLG6KU4/mS+6JglDdw3cyWr12PTVLVMj3AE+Q1/+qkxMc0m0LarI2PQRa
         sKhuYMW2JqxqFOMAd+R09BNqS2hD6U/40WVJnCuFgqC4MJ0EqrPuX0N6ZhsMtP8pLEru
         ofiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034013; x=1751638813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewNn7TbsI9nptiuY+MPrd3pQGAHs48Wda8epNcT5ov8=;
        b=FudIjnpcqEcq4b1EnxdpdGpMPID8+s0w0gVyNkHvQEInv8w84C8Qcnq14x2vZ+e7T9
         +0OYlaYvpEhh1PeKxSqlo9MJVRZN/yNGrfPVRN8Benz66kjZ42FApc/hUghwZJIV4XSf
         zI5549ZEl51kgk2MYDvMSKX5gebESD+Cq4nonkSgAbRGmHRm5x8SOGu4xAper/QWPhQ0
         LQO7ub1aew5g5OxO34VMQMPVMPHAFKmh5JIgLTd+v1AJgDL0rBz2qmhzltcbT249te93
         LPWs0faFZ/NEKhUw8guYXYmf6P06ZARDLBCQ/Sdmg7LMC7Db/ptJiFMlY9r21Vo3AMYz
         4dEA==
X-Forwarded-Encrypted: i=1; AJvYcCVGihxwuaMyeZbLNOeEapsfLP1sK3yJBPPPRReij7VagSVR7BD/U/aME78oqYCN9aECYIaaPOm7P+WTMTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/gWbg/A15j5QGOZjQilHf4b5LjM5nt1fheNTUDPYP1FTvfKvF
	QqjNSZFtbpyu4UlGSkW3TNzzV/hnsJGCW1fHJDhxVBxF62/vQNh/Q9iaXDZ7H732KJwxwPWQ/mu
	fK8XV99EjQOew/oNq3VdFf9OHkDklT9QHVFiPAZsu
X-Gm-Gg: ASbGnctlT4qFiLcdwjESMd54QWn7dQnAH+Uv/Hj+QHwkW6E2zLu4/Uj70PxWldqh5UA
	SyZCxmNt8GBnXSbzELcblZwNzSRD4N159Jh5MEIAcmiig5bW8dt3H49j3wu6YKlwNuSkThnWIHu
	VXq0qdYL7SECI9mRh3P3oga7JLhAAYge0+DEEdSu+IwKG1
X-Google-Smtp-Source: AGHT+IGGHWkxWyyUt6W5NvWAowE9TgOpr1q1dTjlOVA298j2/3hVnCN4kkLIkapxhylrsGEkNu9XQ0BMWNlolyX/fns=
X-Received: by 2002:a05:600c:8b35:b0:453:79e8:e92d with SMTP id
 5b1f17b1804b1-4538897ac42mr78218735e9.5.1751034013197; Fri, 27 Jun 2025
 07:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-pointed-to-v3-0-b009006d86a1@kernel.org>
In-Reply-To: <20250612-pointed-to-v3-0-b009006d86a1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Jun 2025 16:20:00 +0200
X-Gm-Features: Ac12FXyulcsSB1OX5HOWOJW9F1TKemz6x-0C4Ue0kt788UFAeHm37sy4APARLhw
Message-ID: <CAH5fLghdgP7aBBv3aMrvWP3sfRjM_cc72Wsp=CZczh9dfem3Ow@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: improve `ForeignOwnable`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This series improves `ForeignOwnable` by:
>
>  - changing the way we assert pointer allignment,
>  - improving the safety requirements of the trait.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v3:
> - Remove more instances of absolute paths to `ffi` types.
> - Reword safety requirements in terms of function guarantees.
> - Add a patch to restrict use of null pointers with `ForeignOwnable`.
> - Link to v2: https://lore.kernel.org/r/20250610-pointed-to-v2-1-fad8f92c=
f1e5@kernel.org
>
> Changes in v2:
> - Replace qualified path with `use` for `crate::ffi::c_void`.
> - Fix a typo and rephrase docs for `ForeignOwnable`.
> - Reorganize docs for `ForeignOwnable::into_foreign`.
> - Link to v1: https://lore.kernel.org/r/20250605-pointed-to-v1-1-ee1e2629=
12cc@kernel.org
>
> ---
> Andreas Hindborg (2):
>       rust: types: add FOREIGN_ALIGN to ForeignOwnable
>       rust: types: require `ForeignOwnable::into_foreign` return non-null
>
>  rust/kernel/alloc/kbox.rs | 41 +++++++++++++++++++++++------------------
>  rust/kernel/miscdevice.rs | 10 +++++-----
>  rust/kernel/pci.rs        |  2 +-
>  rust/kernel/platform.rs   |  2 +-
>  rust/kernel/sync/arc.rs   | 24 +++++++++++++-----------
>  rust/kernel/types.rs      | 46 +++++++++++++++++++++++------------------=
-----
>  rust/kernel/xarray.rs     |  9 +++++----
>  7 files changed, 71 insertions(+), 63 deletions(-)

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
