Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8C61DF244;
	Thu, 29 May 2025 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748519985; cv=none; b=VliVTotHi3/gsKeV1eZFbW3TP3AGsH25yllIM3jm5F/RCXV/BoDQzg0KrpX9jLD8WcVcupduKvb+TYRWg+GvWDbaH8/HyKNnkioKSyXdWztcMPL7YWAELQgJ6hll4IV9QW9tZisNPKG9DMLkz4OBaIrfsMvb0hojxvTJUQtcVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748519985; c=relaxed/simple;
	bh=hrQZUfq1HtgJZiMeRsahooZJWcunYC2oMDiMYLc/kdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvyxwNrMdaEco2NbO/aSpBI/Vr3QMVzwZPD1yX711z4f2nIlqM385o3IqxZmMtVwAb2W0mNURnlCYVcuKI5+sipJBgqR3P/6hCVX3A5bqAgnBJSTi4CyQL6118c64aSEw0p+iSQ1k6BiXC8n52NlLOZQBd+PR5VUgelkIH8w6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk/Wy55X; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk/Wy55X"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2346891c2ecso561545ad.1;
        Thu, 29 May 2025 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748519984; x=1749124784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrQZUfq1HtgJZiMeRsahooZJWcunYC2oMDiMYLc/kdg=;
        b=mk/Wy55XKyQXhrRjhz48jWgmxV8rmDFtUaqXshp3JNpz9dRVXI66aWMMPNBJIqh373
         rVLCGUD59//fKnKBS+CWGcSJxb/7QqhHD6m6SKF1ZzbpZrTW09DXWQlSjG5wxHfWCkWa
         H/7CCdWJ5NFKqVRD2dYrtWJMDXCrL35ms8wGF6VoPJQ/3eSbvL0Ws2P/4ADiGebSU1gm
         iX9Yk/1bUb3llL7rxjJJ8m56aNdHMb9sEU4Eq855pjRfYzu+PXuQjuh2SD0s3SaUNMRo
         TGc/8cn/47yzYaa46yanyDPr035IoOIEWOlxeeQTAWCueGS0WKyuKQE9uP7ipLMnsS9o
         7fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748519984; x=1749124784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrQZUfq1HtgJZiMeRsahooZJWcunYC2oMDiMYLc/kdg=;
        b=XuZk7938+KQhhmeS+Wkfsy/Q7hNTm2XYtyoDtTTWPzZIuWb5N1OnnDSojlOSToX19I
         RZbGe63812Z8Qtp8cN5Vp8NEwTvSsay6DKPwZwmmQlfHQT8HVXIcxbn/l9n3lAj6bfJE
         2NkhocMpd9i/ce0y6e/yETSnJFtF0uOCuDLaSeU9WUfs2yMmvp0Iud8s7pmgXvY1Bpa+
         KnT1d8OA1sjWBJdYcZqwO8ZK2RV1QgRgICC8kyMMYxf6Ri3sp2WA60O4I85Js9PJ7jaz
         xyzxh8kMmL2EcCFGXGpYSAdMA2NNNnbI9mjVH9AVJiCq0WuyPsgtwrbLevzTIrtOvxJj
         WmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk791HyM0yPRLxADwJSiYC6dq0OGVCQco0a/XLWrTvmUSqoDNPtUtvng653MtXrLX4/pfkwtsJfdOZ+5eiPrY=@vger.kernel.org, AJvYcCVMUYobe2ceDXZdpTBNdzFGAh/LfVyZbBAw8nnlKmTLZKUIpgSqCJed0bIUMimvx/9/721la7XwfEZITVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKTzE7qzc9TDreDCbaKfqlqrQmvNjTGFa3gg4F4abnLlbuMit
	GG8CAD6s/oxLmBQZ3d3Ro9TF1UAURdKKf7sReT2g3AvuwWQAhgK7DrliJQH70u0vbrh+sXoIjeg
	zTsN7NEKUNi+RO3/+NPe36DtmuOXTWGM=
X-Gm-Gg: ASbGnctI15SMDK3XySWCCBE+58f4q4LA0AVj06Q3M3JQkHJ++X9GeTqgo+HwBJ6cxdK
	2prKoFZHm+0XNKbfUhU6hKBBXZs5J9rSDNMf22sbSK8h81+koCI5SVrm+ArxvXSX/OE/NWuFYPz
	y40IjY9C9cnSlNQbzNOyj5cJ2CWD7XMmcXESlhbAJ74Yg=
X-Google-Smtp-Source: AGHT+IGCpY3RHBMmzkVvjkuYglQ9/3Pqgdr2420gAHJjrlwgGl3gwpO8P5aXEeh9Mbd3otOl/WacGuYMkpx5vz4+x0I=
X-Received: by 2002:a17:902:d4c2:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-234cbb0a8afmr37597715ad.0.1748519983663; Thu, 29 May 2025
 04:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
In-Reply-To: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 13:59:30 +0200
X-Gm-Features: AX0GCFtBrmFqdI_rFZEqd_BjHJtCQBrZ4WC4qznTc4-Yd0Xqk5FpwhCTMDKBf8M
Message-ID: <CANiq72=B=AwWFJorzi7m83Y520uLzk+k5Hcu_dLHEuRvO7BY8Q@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
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

On Wed, Apr 9, 2025 at 4:43=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Avoid casting the input pointer to `*const _`, allowing the output
> pointer to be `*mut` if the input is `*mut`. This allows a number of
> `*const` to `*mut` conversions to be removed at the cost of slightly
> worse ergonomics when the macro is used with a reference rather than a
> pointer; the only example of this was in the macro's own doctest.
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to rust-next -- thanks everyone!

Cheers,
Miguel
