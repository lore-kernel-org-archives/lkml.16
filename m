Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15B1A23AF;
	Thu,  6 Feb 2025 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870641; cv=none; b=Z62rYXKQBuuo7I3BDs08vLm6Lai8roEYQVNhYzSZknI96x12OCtg0sRLHCcUHw8mRHMYUPp7qG5Pn1wRdBtBhlvYnSoaJxyYjopw5NO56JD+oCzVfphvmlLots/htQmKwT7V28VCORnH1qVIbDNtAEIuNFZ3i9Bw2cXiIZfUpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870641; c=relaxed/simple;
	bh=LolUPIjCNY4xoF+IK7w9hdb2J0/cgr+bdsC4x4ET6EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJzqKFQaTeI52LBRMuhsOHvKla1KqQ4qIOzvw1IGlXXTm3+ZWBFjz3vghPI3AWLWQCjDWujWf/maGBosfPIEJAEqdwMu3kLtd6SK4ljNMidL6wIgSlvBQ4gKnEpi9Q1PbrQhPVNNRJv4rwt2RhxWE17K/TW/PTb1CXR7mKuw6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKa4jMNm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKa4jMNm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso299861a91.1;
        Thu, 06 Feb 2025 11:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738870640; x=1739475440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZy94NXBUnb+e1VI3K2Y/MRHGM4HZl+fK7CC9Hvo8W8=;
        b=HKa4jMNmUGRlsjColT94T2lQTyJdSphhLtBVcQS8OU6FonmjP3vqhBb7wj0HxO5sXa
         zvazQgWRq7n9M/S81P0kARI9HJtxIRODl3YHlGDV13WkpC+PkiE4sPPRrsYR8lwLd0En
         jRoSgUpeViUvYM6L+MPm64lHb0RD4i74VrGUjgs9XTHvzplw2T+NvE0w3kEA/oQQ9tzY
         0CMBxM2qVC+hMSrcXjDY6E+XIgRBTizJrWkBR3V9YAwV+pQGIr1Xt7JsDbV6R9inIRWk
         gfnZkNosTPT9K0IJJxspBI0bTGOvhcsGjrliPMZfrSdW2ImtMy2OTWr7yVMsVNW3rISo
         pz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870640; x=1739475440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZy94NXBUnb+e1VI3K2Y/MRHGM4HZl+fK7CC9Hvo8W8=;
        b=YBpXRRBW68BPyoA/MdnkvcbRN22sPvrPpLD3380w2C6PCandHe43CwmC9ePL5kW/CC
         +nxz21iYiKRPl3LZKJjGPiS3mbwvW7A2Jm9RQyOy46w6N0vTR+WpSIv2bwPbVztYJZW8
         yLgY51dxzMYOZySv/kB/jnO3nDFwrKCUShgVMWEPnZxaRS8+X0EfdfjccXsddOWUNWoh
         9/NUdWvsfc3c0fbB6sbyScCWFt6U+iI7IDJs5aIh3IB/wnyAWAhuHn/JAOAZK6/bf463
         dDuWms0bu9fk3Np1eoZQe5iHf4rrjCYcn9KnxhIOqZU8Nva8UJgJZZP6Sndag6SnWVO5
         UoWw==
X-Forwarded-Encrypted: i=1; AJvYcCWY/C2bPLjU3K8dJ8VdVyCcx41HqakpPSZEdwm6vSPW/kQZhSp+b8YoO2jOmX9W4n2u1MUXvorytx2887w=@vger.kernel.org, AJvYcCXZ61Q4q1/MLdlfVDeZmoXjjnEb7NUAiQPdYo6O2tEUVWd6wwczO3A2p7NDTVJjvbmp4KwIEkOP2TAl7ZYiu7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTPiQYdpk6cGvMaqUDrx5a891a5wwz2qCp1ThKksXHBz+3xpy2
	3hykBBaffRYi8k0jaORJB79rgoRopqmIZWCvYq/tTKeCnaJDbQv1CFt8B2mIb3qIuY8zlD3os24
	l+6SOnvG6At5Carxv84N5vNyvYZs=
X-Gm-Gg: ASbGncviPNT7WqcI3hyQMAVahp/RQUBAYoU30u31DGiJc3fny8dKZpwqrmS3Pt9bYAN
	hzDyRBTgfnJHzzhZY16CgTmZJEF/a1BcxPK4BKn7LIrjqDGI1oq1kgZrhi/LvE1lHheMcSXb/
X-Google-Smtp-Source: AGHT+IFdZYs6OuTtdHLEKD5iURppjxd/I59ogtMzdfWLlKkxvqbwoccg/QI35xERsj0vGXc6ok1e2B9BZGNTMBRGBaI=
X-Received: by 2002:a17:90b:4ac7:b0:2fa:17d2:158 with SMTP id
 98e67ed59e1d1-2fa22b8cf33mr209003a91.0.1738870639635; Thu, 06 Feb 2025
 11:37:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux> <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>
 <Z6UGNbowcvqTN0-T@pollux>
In-Reply-To: <Z6UGNbowcvqTN0-T@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 20:37:07 +0100
X-Gm-Features: AWEUYZkEMf99KNF98PN8CrejR2rKH7kpxyF6nvUvCnBcemVMOqylIWreWkCMR_g
Message-ID: <CANiq72=BGFp95jyyF6-uQWT8K8dS5qBpBD55duUYpF4hJDbFxw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>, Alejandro Colomar <alx@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:58=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> What makes you think so?
>
> AFAICS, the man page applies for posix_memalign, aligned_alloc, memalign,
> valloc and pvalloc.
>
> In case behavior differs between the functions, this is stated explicitly=
, e.g.
> in the "RETURN VALUE" section.
>
> The "ERRORS" setion does not differentiate, hence it should apply to all =
the
> functions above, including aligned_alloc.
>
> Do I miss anything?

The explanation of the requirements (in the Linux man page) mention
different requirements for each function.

Moreover, in practice, glibc seemed to allow almost any alignment up
to 2023, and since then they have this:

    +/* Similar to memalign, but starting with ISO C17 the standard
    +   requires an error for alignments that are not supported by the
    +   implementation.  Valid alignments for the current implementation
    +   are non-negative powers of two.  */
    +  if (!powerof2 (alignment) || alignment =3D=3D 0)
    +    {
    +      __set_errno (EINVAL);
    +      return 0;
    +    }

Including a test that does not fail for a degenerate alignment (1).
Thus I don't think the "multiple of sizeof" part applies today or in
the past for that implementation (again, in practice).

But I don't know how those sections are formally supposed to work or
what requirements (and/or behavior) the man pages are supposed to be
documenting -- Cc'ing Alejandro. It seems clarifying the page would
help.

Cheers,
Miguel
