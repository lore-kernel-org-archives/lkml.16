Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8815A848
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844317; cv=none; b=jg1UYoBnckw/+hhrqto2UJCv6aBEHqD2YzCP7+31sBdO2OiNzqgQF9ntwZfenndWLXBTMMQnl+yuA2FGHKPxcVmu/8Jxk7MpLSnAi7KumZrd4PLffhWhCDR/U0lx4oMs9I3R3ZD/cgcHFKRUYQtgrxt0exVlbSiKJC5DRCBX7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844317; c=relaxed/simple;
	bh=WOMYa8K2NFuTiYjPw455ali5c1qxWdaSnodChnPmTqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQHzfl1YO/fRKholkbz19kCQ2XB85jj54mawhf1HV+8xieGml58KZBQKwq1UwE2NRV0UiJiAkTr1shqdwI/ZAT8dzl9f7cD6+lfmMV/rj8qLO1AndzBZ9g3mXMVOjOb943a7Hkkka+s8g6iLqkkuz0nqtPgICRVayOEEI+xlu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=abIua/qw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="abIua/qw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38da66ce63bso432476f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 04:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738844314; x=1739449114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOMYa8K2NFuTiYjPw455ali5c1qxWdaSnodChnPmTqI=;
        b=abIua/qwo0L8mqcm4mMKrWQz/y6gyFgBM62fBmk91uF9wz2JdSe1k0C3KuBIk5mSIi
         ToScA1AOtdcqOeMANusLPuQB0u4btxmLxvnRLg4INlDtInpNwjMbJEy6DHfNzijwl98F
         XlYYTuOlNHNkTarAiEyvvMxHmLrW6vGJNgofljBekw8hu2n2uchkjhGXtar+5VFs34De
         fQ5dOsxTF0mAZ99D2E+YVPipMFLy9Xhxf7WA/suJp1lB9Fu+FZilWEx8hAKV12UF9CCh
         CRsrQndtlF+lxeGLXp7sMkCtX7GRiBr+FZzyDoqoLpVMvFKr1wTOqEXlp49nKppHZBrc
         5PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844314; x=1739449114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOMYa8K2NFuTiYjPw455ali5c1qxWdaSnodChnPmTqI=;
        b=NMprDz1GCZHHm0EIJX3VbRo19ml5oc+KgLJcd3sKxOs0DIgF68IUX0QBLQY9WQdS3i
         EpR9ubeqU4GktWsHv3PBkTP111i7f1qCLXgKtpeDnIdkFkzDwMIKOAU20ry87RQflOEr
         grB5TxcZ8nLJBDA6rPlWXLh6wji+bUcMIfGPLM4PHVYt65dF7nemGOv0HmIelkE9yeLq
         +BNTCYUjKjI//tmM4OEhGPzsUSJMVb9+HdC03fm4qZRi74TcC/yxeFwA3kn7b4eQOxxP
         GEwAmlLw1wU6YLD6gt7mnC5IxsU+vpUEnd6PgrVPcDixSOv6wcydCsqRnKJq9wWxdJ6E
         JPyA==
X-Forwarded-Encrypted: i=1; AJvYcCWWfH51fpGugxHoFYeAmK5ZoBJV43sJTN3qMIH2ThVqElLd8mK9ldVpQ4A5CZCI3SdGb6nkRojkBFUKE7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uV2bTqt/cTNVmDE59haVrQOyZvpPRSMfU/3Hv4qF5gHuEMXm
	H6XIQ7GuVdheIwfIDEgkjO5Sxl3bJv7sJyg/H1x42be0pYzVGSSmFC2mNZphsTUcH9QhgStcBQ8
	odM7UiU499uX8IULOzVcgyVZTphMUji/F2Yma
X-Gm-Gg: ASbGnct5ELNaFDjB2TrvgfpHQhItxdOPXose7dtQtqXj6WRwshta+QBsi/+N8ZKg5qg
	rfDp1VewaQBOo3hlsDOixcbdGmucnWQ1H2KSxLiCgMebTJrVkjXGJt1W6fJUWuVKBzNHEwGYetL
	WBGCeCiD2ixHT7Bcnjbf6ARxjWn9g=
X-Google-Smtp-Source: AGHT+IFOoKb+OzuWf9fUikCWQwPXbC7CmrKQsMcm5bpYPVABC49nZhXS+WRvvbgynB14UA8L48nGGTwTH45X2LJuuRw=
X-Received: by 2002:adf:e74b:0:b0:385:f195:2a8 with SMTP id
 ffacd0b85a97d-38db489cc29mr3809901f8f.30.1738844313955; Thu, 06 Feb 2025
 04:18:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-configfs-v1-0-87947611401c@kernel.org> <20250131-configfs-v1-1-87947611401c@kernel.org>
In-Reply-To: <20250131-configfs-v1-1-87947611401c@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 6 Feb 2025 13:18:22 +0100
X-Gm-Features: AWEUYZmlHwHwwUI64UoRJt9bg3KwcBSLQQZ-F8Yg7yTDgIzxt0BHYMKwVLSFXg8
Message-ID: <CAH5fLgiaxPyC88wCvm4-2zSxx=O+q+eji-guB_tpRXM__Do+Dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: types: add `ForeignOwnable::PointedTo`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Allow implementors to specify the foreign pointer type; this exposes
> information about the pointed-to type such as its alignment.
>
> This requires the trait to be `unsafe` since it is now possible for
> implementors to break soundness by returning a misaligned pointer.
>
> Encoding the pointer type in the trait (and avoiding pointer casts)
> allows the compiler to check that implementors return the correct
> pointer type. This is preferable to directly encoding the alignment in
> the trait using a constant as the compiler would be unable to check it.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I would have gone a different route with this API, but I won't block it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
