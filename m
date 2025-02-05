Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA51F473C;
	Wed,  5 Feb 2025 23:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797253; cv=none; b=RYoAPtSN3cUylXAqXSawYfLIzCkE9W+iVI9+l4B2yZm/DH0SQHT9c98ml1MOmXL5WLbHdXQxmMmH8hT7dvj7Z+E5QRHFJT8KMqsS2zAiVbmybSZjMJqITf8BzpvvmP7IKgYXKuSp3lrCbENs97XrkzC1XMg1LTfFHPa4DPkjkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797253; c=relaxed/simple;
	bh=XBak1xKg27C24pRGkiTIhk8Ym8BsGSEKHgG87Z70UmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEaJzQVL5UmUDgadetiGvyAEOPdm/7yaE7mTcZhUFXuJGUpoqlP/BzOMmZc5xD1EoixN5h287Ci+uRqLp2uAYmWPgPb6QonLieX3wzNKtRJINBOBnjKpYgW9s1L+8hu4PhSRlu4THZqUmEfIp5LUR+dPX8BGwaMZvhFrXWyvSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cpla6oZg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cpla6oZg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f09fe247dso662635ad.3;
        Wed, 05 Feb 2025 15:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738797251; x=1739402051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBak1xKg27C24pRGkiTIhk8Ym8BsGSEKHgG87Z70UmY=;
        b=Cpla6oZgHvpz0grSVJJHLjXILV696AKoVEazOzF6Vv1JLZOZrzG41th4el2pS5Wgkj
         jOr7GMWSQg2jio2vsamdIXk3DkJ1ZJdAsPC6W8n1oBL46KjNZ0l0VysexhfFLYuv9KtG
         WBVuznJvOMqbdfX8RPz3GK4S6I7JkoGvOTIn6TYh/kxYqAZt4wPlv8KZtTSTz0D8opTv
         MTyRjxLaqWnkp7sjSJNtY7T9Hmfsr0Ro9Qt3EwAlL/nAJGKl01boePukP6do0btnC/a+
         2NMvYQghxGRZvt7hIpFtCFq+mKyAjmeZXxmUbdtPkHxxxL5s8GknLjnSyXeEeJYUY5mV
         yAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797251; x=1739402051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBak1xKg27C24pRGkiTIhk8Ym8BsGSEKHgG87Z70UmY=;
        b=f3auK78ZrNkSjj/NyG5N8Gnxw3ZepRlesjamvmP6ZM/JurLuNY+VfdW1oMGTCWIIwL
         HVAfvRUM3rKW9H4ag+FpORi2X4aozm+S6eVgIlioxhJK5r6XSYxlpGNHxEu47KVC9Zhb
         1MSR/WRGcbZOnggZbGC9mT7rh6t6lSTMnTJnKqoFXknYqhxkbXGsimow0Essh83jJ6A+
         U99nn5BM7uz+mzQPFNZ3Ji/oLMvOeotQq7AUHKvyNaM3BGZ9Qcg5K4f1rnHhpA0vJVe+
         9YQPb1wLBd6mK0U/yFMbtnUrRA/niSl/g80fomfZMyTJi/zrsXW7SVIZNCS4t7xtYTIS
         HCgA==
X-Forwarded-Encrypted: i=1; AJvYcCUE/jllReXVWmsEGXGUmClNslpnli7cMkEkWXccV6LXG3kJdqj0udQY7KKTZ++xAG5ZQ682zhkd5oV17sY=@vger.kernel.org, AJvYcCVXWiVqK7Tv9RHpYI86Nbxh9rDsEGuLana0Jb6n1izMK/abrQJ6Cdh42aUEDmCkQ0t7LI68zPydLyqmu/W9c7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyK6jLJvQoSe4WuVne0BfuRRurtOY0RD4pnk7kCJgWLUvxjHs
	XAsy3JDUFOnJq3MnFddrM+q0Z8P9al6iCq6cxgCwIiNSErgTv6mxwl1LOGEc+JV6Uri6Rm4lY2I
	Q94zMrDwqnCJBK6SRuVRjzV3d7Sw=
X-Gm-Gg: ASbGncsdGNqv6TqgsY2DaSCLSguN3Ptcir7/bfc5E+NVCiGbHwuQ1rSGK2QDCvsY+BX
	JNwKQxdftzuI8uRja7EJJ2aERpmFGBOzjWRzt/plx2oXut/WkHAQBJrrOrF56xuwuvlrjBDjT
X-Google-Smtp-Source: AGHT+IE47H5+v8jfJ8Y2IwYB6H+MRbx/jP5G13Au1qZmx8XKD1VopKmgdUZ9IcWArGG1wLri2VIuSv7NnkLe+wfRs2U=
X-Received: by 2002:a17:902:f550:b0:215:8721:30b7 with SMTP id
 d9443c01a7336-21f17eb4230mr28109845ad.11.1738797251096; Wed, 05 Feb 2025
 15:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
 <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
 <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
 <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com>
 <CAGSQo00uUYdjeiRHEz465WyN_kDyiV2L0Ojaomr8ckMYipmp6w@mail.gmail.com>
 <CANiq72ksOc_ncUXycySPS+JUur8GZZSHSSEQYOg9aKtpBRvnPg@mail.gmail.com> <CAGSQo02wJrawHfCJ7HTo+_o0wgk2zv+SefMmORoNcM5NNS7LqA@mail.gmail.com>
In-Reply-To: <CAGSQo02wJrawHfCJ7HTo+_o0wgk2zv+SefMmORoNcM5NNS7LqA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:13:58 +0100
X-Gm-Features: AWEUYZn8h5_SZM9ngK5OYZr7WrtyI84ZWB3G2pCKGR91Y2JF6muvemEXoFZZ1lk
Message-ID: <CANiq72m63F41Ee4cNx5w3SVhvYauzNRBo9ojZtSvGYcNhcs5ig@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:12=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Correct, I don't believe it needs to be backported. `gendwarfksyms` is
> the only in-tree tool I am aware of breaking on this. It is possible
> someone else is dumping DWARF for all exported symbols, but I don't
> know of anyone specific other than Android for kernel ABI monitoring,
> who already has this patch in-tree, and does that monitoring on
> non-ASAN builds.

Then I guess we could add a Fixes tag to one of those recent commits
(i.e. where `gendwarfksyms` is added), so that it doesn't trigger the
stable team into a backport.

But it is not a big deal -- if no recent commit really fits, I can
still apply it into `rust-fixes` without a tag.

Cheers,
Miguel
