Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5C6A33F;
	Sun, 25 May 2025 21:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748208016; cv=none; b=Bp2mxL+mWT6iA+D6W12kwQxEz4Q1OIedObXRWhtupT1nV+mCTYDGXEhnkdfY4ysikcSYp2ZLPDMUN2VCTHKMCBrxTBsS0c43rSiS1PPDf6IdRIF3LXDwiKzfgifQMq29oiQ4wby3309IF7v9Dzkx7cRBQ/PbsVVwt5C+uf0gRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748208016; c=relaxed/simple;
	bh=CtxtRwDTR28nIt7yQX7wy/U1STuHSVsVc/E0okr7YUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2Op1VP69CC3/hVIm4JgXbumE9wLDO1zsUqzoWRYaFmuQMiCjPnzijbovQ3va0Tw/mW2Hw4KBn2qRunb6z1SYejQTrVDKr0+htAbQCYQwO3ifk+OpvTHmPpW4z/z5r7S8olCRZ/LoLY23ZowIyA8FdXd+mCZ2nS34SCqspfgOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhuA619Y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhuA619Y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31141a8e6c9so249290a91.3;
        Sun, 25 May 2025 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748208014; x=1748812814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmWnKirvTrbRAF99NBR2VG1q0jOLkLFX2IdBmlI2PXw=;
        b=hhuA619Y70hJbEhFqeOg6S6EvPpF08YcGA4/Vnz4D9Upm7s7KhVjirxlJf/fy3pXWD
         RI9a6Ekd1TtSRNdfF0H5cIkCiyy7LZ2pS0pRfZnnVYELdsengiSkdICo5WmCPUui0poK
         YX4R/eEv8bsZyrZZVOnCQGsKjm+29a2kYrd0ZyP5yoDu6yJto4qTgDXU/6q1/G5AqJ2x
         s0ZCxHxBl1n4aEUxGsFMl52MjZ/umwcQlCTyYP++idN3b82hXFMgSTYHQTF99Oc7a300
         Lh/SvBWIDaKkD1nmgx1Xw9o5b6rdYM95xo1dYHIBnUNXtSU1Ae0F1ZxwnMwAioieFYXp
         UC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748208014; x=1748812814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmWnKirvTrbRAF99NBR2VG1q0jOLkLFX2IdBmlI2PXw=;
        b=lojUV+vIQh/E4Gn/UkvjHOCVA5TDb1vTKv8/ZsXYq8qcDDTYROSH5OeMnlhQolCFfD
         gh66yMxc2mirOWcWnPynxZz9R3DTsbkA0cVMpVbKA9VMJu2T+4ZB09Nr8xyIsjNN946g
         hchill0EwvGpeK3FiEiy3HoK6VWZXkWyDcvm63gddDFllS2LD1vFHvlPIa7lkgjuq3OU
         8nboKtV1L96WwFq8Zw2zPaiX7MgnAwGYewJZlEOLbR+jifuIc2DlHTmxyBb+SpL5z69b
         LqGihR0v6B6f75GQUbU2bWrOj9LAW0+KwBCwp9N3GtloXXuLDdBVkZfBFVpwfD4qI2Rj
         1e2A==
X-Forwarded-Encrypted: i=1; AJvYcCVattWZ1l0Vfgarj0gEyKBW+xX41fgSk/tdRgty9uxq87pKnorFxlK25vl8rIRc9v1ROHWYk/XV8s55zBt11zc=@vger.kernel.org, AJvYcCWJl129S1FvMsnro6q1Iz0OSAUR6k6kjt6hR373/IL6Ti728haVQ9LMyBFGxhDj7jJ3o3g3JuNdMah6HCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0G9DAvn94KN4+cRN7ZuEy0I+pKO6QBCnjmpRljaRl7rZIJNLC
	a3lPamux9gPifqRLvMQ30HD18PHlsT9h6pS+lbsqEl/ekF1miGAHMAKE6OhkLAOyGUndIGG8ZHx
	cCTePO0J5fFyd47aO9S9uUydFttb7WD0=
X-Gm-Gg: ASbGncux8QBxz8OQaXFT8Fkrg5dXPxF/RE2o7N8rry8bfw0/JOq5RxP0ibuvRYCpWdR
	T8Kn9w3thFRcJEPzfPOneLXEUERemg/hzfN7Zl0iQcuG/ek+i9eGfuC8xZgy8vPx939e13h4ux5
	3J6s9F8Cqb9Co/mtuRcUtjlJ9so62Jzk2BoBwaVqm8tSo=
X-Google-Smtp-Source: AGHT+IFI2L9HEpcXUL2n1dOY11pYnE9SYgzumm6Zp5ZskDrngut5ibiWGR/QoaPWKN2gBGmkQN9pV4HPpMPvEyovHrU=
X-Received: by 2002:a17:90b:3891:b0:30a:80bc:ad5 with SMTP id
 98e67ed59e1d1-311108a46ccmr4050471a91.3.1748208014391; Sun, 25 May 2025
 14:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324210359.1199574-1-ojeda@kernel.org>
In-Reply-To: <20250324210359.1199574-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 May 2025 23:20:02 +0200
X-Gm-Features: AX0GCFtZP7bKNBRZxMsP9gqMbVfG1KIKxBTIvF-5yVsuAAVeygiPhHKFp8-mJAs
Message-ID: <CANiq72mRtMDaDmgv4v1+wgN=NbyLSDSeXB=e=r6sNydBmvJXww@mail.gmail.com>
Subject: Re: [PATCH 00/10] rust: clean and enable Clippy `doc_markdown` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:04=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
>   rust: alloc: add missing Markdown code spans
>   rust: alloc: add missing Markdown code span
>   rust: dma: add missing Markdown code span
>   rust: pci: fix docs related to missing Markdown code spans
>   rust: platform: fix docs related to missing Markdown code spans
>   rust: task: add missing Markdown code spans and intra-doc links

Applied to `rust-next`-- thanks everyone!

I picked the ones Acked by Greg and Danilo (thanks!), plus Jocelyn
picked the drm/panic ones a while ago. So now only the `of` one is
pending, but there are new cases coming, so I may send another version
of the series to clean them and possibly enable the lint.

Cheers,
Miguel
