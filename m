Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB781E89C;
	Mon, 16 Jun 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107908; cv=none; b=ssDqSHTiJkFPeeVrFJUGu2oiRTUj/KRNv8gMq5o98cCBs4/PJ06vRYtMHCIZ/CEU3PhoF3un0BLUNJYCdyxik1zhKJqWKmbn2EH6OqqEp/IxVpIPxa9/2sqoMeLzg9X9zzpvM5wt2Ky8hbxbzwc5ZQb4gMRB+/AJyf9zgRRDl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107908; c=relaxed/simple;
	bh=+qn2H6nfevlQ7wKmJdpRn7FFdR32WZSW7opnHstQ6Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBkBMBWw6H1TftSZVes65QnyjurfdtKPG/K4rC3xHpsVUcL7Of/rvWSFOZ53q//F8Te3sE9Ha2tVwTjsdzeErwiAANYeJ/4bRsrwsvisunhNF3vJiJjw5XcxNcpQoQHrhDJU+POc0OhB529PzVtJ1K99QWETPWIBst7kCWUWP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kgx13JBE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kgx13JBE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23496600df1so6190785ad.2;
        Mon, 16 Jun 2025 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750107906; x=1750712706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qn2H6nfevlQ7wKmJdpRn7FFdR32WZSW7opnHstQ6Qg=;
        b=Kgx13JBEL5xgGP2iPEzljdK+iJPrR+8Hm/w+N/GTsee7iX+gojSB+ZS/W82jqq0rnM
         tnFeLoOQX3e8DlJ14R9Ids0oO8elMn20r3xFfJNkMjWAXB3g/uPYERHQZgHXFJHFoxKT
         x5/XqbLQlAqe0nXrCGlTgeqccZPvAo0fWjlBJj/4vWjYifZJVTLXekdXGL84uM4YVoFw
         Cj4nnFsfcldgO+am+MsZ1dMWL/DR20OGoqAOy+esittXRHNdlmce5LwKk7e1mxvn6jfo
         zR45UcLfesaySOqzfylE9vsqYnWOgHwmC1k/xELPCpBvgAgLE9mKERgIi+wZBzwnhj51
         HuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107906; x=1750712706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qn2H6nfevlQ7wKmJdpRn7FFdR32WZSW7opnHstQ6Qg=;
        b=JXeV7DYZolOa5FTNhYz3AgnE1FV0gaRb5XcRpMKDwBDmZSGaCgSSdaMeg7yIH6Rv32
         69I6F8Higptt1DzD2UUsEKZ35a4doO+0dzA14eYv35CHQvJNvnkO8WFp9qRnkW7QasOF
         wzzFkoS8GEWE0VDt13v7yBIbPzwCIJ8hzD2hoKdPTLYODZmQbtP9x92LO8xN1zmBmUXD
         ONnpoNYMjxFLiLLxPcGFbdWrY4nuh2vQO9Ex3E1sC/ybKjbE4Aey5tmwBr0GpxLk3tjB
         bNZOctbK6RxQVW30Ein1JrKlr4d+Mu8663VdDZbBHSwIZBxxNruKCqKo4Task8MzlkmT
         Vt8A==
X-Forwarded-Encrypted: i=1; AJvYcCUWzssFx7+rngT5r7bup56xZnFChkFkBDWQLf/kv5nUgmFxzFYJ/ukK8YJRYxoYk5mnB1FLKwblfaUfvDM=@vger.kernel.org, AJvYcCV3Ymx10zOFxOrsiEih+Dq2KIt42Put4bSBM0c/cXRJ3ElzheG+BBmQlbMbW9/WMGVU7iv4OQx4wpjcIwaa6Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEoNXurXNIYpEWguAa1hAjC0bkXIqcS0AnNBcmsi1sqfEtLaL2
	nwI/7GDU2Wj16iO4IKsdF+Vuty8MivWazvupNo5qKc0HBG/IYORcA3XrPCSII8wE+0xsOSCbl36
	8VJaD6Sjh+zO2VUIS341CQDqg6TKPjoQ=
X-Gm-Gg: ASbGncv8KuBkO5xM+9wkoszioLPhIXlYtUobamEXAQ3x1gMtkFFqHaEZM3ONxaxAIfg
	RfW5nK4wQLtOOJfUzgdi7pRelUDXMsZNjcXKAR/TDor9exkalrTFp5Hllbm5PSTu8mNfI1VBIhH
	XeuOdBrKPFjs5Q+iZ2vqlUZlHrCXKFLutRStAjjZrwF0c=
X-Google-Smtp-Source: AGHT+IF1S2axf3PVB3z4DKxY9YfUqh2ejZWFt0fQTJLprfKx3NOg48dOG4XgpLdVmaqM9PC31GirVgLnCzf+nO1mg/0=
X-Received: by 2002:a17:902:d2c5:b0:234:ef42:5d52 with SMTP id
 d9443c01a7336-2366b202b0fmr58019545ad.6.1750107906018; Mon, 16 Jun 2025
 14:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-userptr-newtype-v3-1-5ff7b2d18d9e@google.com>
In-Reply-To: <20250616-userptr-newtype-v3-1-5ff7b2d18d9e@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 23:04:53 +0200
X-Gm-Features: AX0GCFsYLflQK_lRNgAyhjylwzyLukxWj1tfGGW3HXaI5xOsGTLYwG_iZQuKH78
Message-ID: <CANiq72nGU4A5ZgzrNnpC8LRpnFEZis0U1G7-m41MCPihRZcxXw@mail.gmail.com>
Subject: Re: [PATCH v3] uaccess: rust: use newtype for user pointers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrefl <chrisi.schrefl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:46=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This is based on top of the strncpy_from_user for Rust patch.
> https://lore.kernel.org/r/20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@go=
ogle.com
>
> I don't see a clear owner of uaccess in MAINTAINERS, so I suggest that
> it lands through Miguel's tree.

Sounds good to me, also for the dependency, unless someone really
needs it earlier.

Cheers,
Miguel
