Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8305F199EB7;
	Fri,  7 Feb 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952029; cv=none; b=uSlXsRCySDlHvPn/n8TmdUMI4OGfr+s6lKn3BudVsgO8a5LK9sLp8tglxoBPGqBIuaLBDsGafwGWWHZ97Ik4hHSGWfB1HuumXIhWEtVAZvaJeEKEBj191rKD+vcXb8SnEpjzeX+3Pl4cFhGypjn5R0qw3Ynn7P0gMl5O8zn70Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952029; c=relaxed/simple;
	bh=kCJUCb1al564gWEZKmDKxko9CvAjVN9iFffA/t/+h0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXtl4aKQ3bdg+iOlunkQJVKcub9Sc9+GKrIO99JpRN6n3qGlQz5AjqTRfzVDbYPGHaTVdzr0HRBKNI3EXtFaNmiPD2LNL2dbd6oA1Qrwi2actpo+j5d7QFx0DXCSqBGP5LMpEVWMGtgnaV/lTj3fE2YQD4bF6bPJBkcsZluUqu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAeeubZh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAeeubZh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9dcc3f944so493275a91.2;
        Fri, 07 Feb 2025 10:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738952028; x=1739556828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCJUCb1al564gWEZKmDKxko9CvAjVN9iFffA/t/+h0A=;
        b=JAeeubZhk9FE180BZanTf8Cm8pkKYxKQcxapMEvxxAaAr0d7E0KATJksLfnrWsi5Qg
         JZwqZZ8FLWDIbTG3wV6mHcTAoxM7NWWe/5/6Kz/O2HJr0IFq+uqmO8pQ8eaMVk0mmFy4
         voBgGpAGMzFM66ns5pJJUM8ZDvjug/IJrqorEqX/33sfo6F2LRWOoSiBYFEwRUMSrnrd
         evy0AsH+Fc7oFtm9mjeVMVqkjR90bWeRuszVOvu76yWQS281McI3Kd+9ajFtYkGHik3V
         4U0Zg0js2UoIBRfDw2e9wBcPZeFlVX/WXOfOHCVu40lWRHdyRCgT+ouP333j2TEPEhOo
         Dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952028; x=1739556828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCJUCb1al564gWEZKmDKxko9CvAjVN9iFffA/t/+h0A=;
        b=i83bd0WwQk42MH1OGJ3gz4beO0QVLYIB/oL9qZAl21rntGhFdWWGfViAU9TqNb9KTl
         lAFTie6q/ZuFcGH3KOiPZNdMQxws/4Y9hWiENf1ct/Uv32ToZepwLwcwuKbbE7Me37lx
         XzxBYODZKnJZ08Xzhytx76N3TC4C4GxjsC7k+UAjiOCQ1NffkBerqqNAVwp2iFdHAM4V
         TxLZAZCQ2tV2GuXMpC9BKOawXdTFXZtXEEtMV1oWo7O49f868N3BhHL6NH3TiN+6nPtu
         /IJO1LcIWIaFM3/0DGuguMB3ujH+k7XW1ADaORN2KAXjOmd3cG8gnPeCa/SK6oieBVz+
         /nrg==
X-Forwarded-Encrypted: i=1; AJvYcCVb2Ta45XzrfgRrMmDE5TzrfWF1fAd0Ny+o3e2QXEQ3jkEzCdj2NDwzODTNBvwo7jA/D9IW/zFAebaMtpY=@vger.kernel.org, AJvYcCXf0j8e2SW86HEAAe6ITcdY39A+aBlaF8vgEmRlq1g3ggPYzZMQ5MhWoOWi85ESXMIOukXVQVtJWVroVm20NzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlr4nfqCJLZ5jPCJYFW4a9Wrj3/my4wK18MR5Yl9PrkuOkPLar
	perpu0QSw90ctPE7rsHCs2T/Yl3nUGx6RwVI6HEpOj8+w8Jp7NXTeLVbvad1+eNzYRBMhX6XCNk
	pEdmBm341YWNxHHrHm6yhHaeSFYc=
X-Gm-Gg: ASbGnctou0nBSGZp47s2Yh9GjBMw7wEJJ1gEqpRgG0a39vVgcPEDxdgCSP9XHRGh4Qj
	QONaRrD5mzEiIsXWLrIoflFTJY4/8p7FsJZPws2r9RCe2DmYE1BVR3YPI2yuxGH/3adiGGs22Ag
	==
X-Google-Smtp-Source: AGHT+IEnAY695rQ33z8o6cmzY46tPr7vvtwy9jrurgATNpzacnfuWCONrZGp2ErDmnLZxICdOC9Y7x3JeppmfViSOgM=
X-Received: by 2002:a17:90b:180d:b0:2fa:2011:c85d with SMTP id
 98e67ed59e1d1-2fa245281e0mr2284958a91.7.1738952027739; Fri, 07 Feb 2025
 10:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com> <20250207-macros-section-v1-2-8f018cb05a20@gmail.com>
In-Reply-To: <20250207-macros-section-v1-2-8f018cb05a20@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Feb 2025 19:13:34 +0100
X-Gm-Features: AWEUYZk2aXFR-Ad0yHLgDDHw4Us-fwuGZXXF6lGo_lXLuhuiKjjqopyHNjKtTnk
Message-ID: <CANiq72kGvZkpamxEFJqYO3As5POhrVDonFPZvKu8+UZMtVcvFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: fix `make rusttest` build on macOS
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

On Fri, Feb 7, 2025 at 6:22=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Do not emit `#[link_section =3D ".modinfo"]` on macOS (i.e. when building
> userspace tests); .modinfo is not a legal section specifier in mach-o.

I thought the changes we already applied were the ones needed for
macOS support. Oh, well...

Cheers,
Miguel
