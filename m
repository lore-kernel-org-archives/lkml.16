Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE5881E;
	Sun, 18 May 2025 20:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747601358; cv=none; b=Uq1KlhW5tgznPpCq5UJtFzeZzcv6rl/cDdHVozYLDL2pXrZoObImCYXSQa7JtG+6UcY1nBw2VLzl6De915DjMqJ0hg37/5hm3BGhacrKTaoJjaQGAl3Vq7BVHSMqZiHgrSHFE1Tn3VhOjAKRETGJUhwMMyUsRE1tVXqd2IVDeP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747601358; c=relaxed/simple;
	bh=zNzX8lCfUCvsuJrFUGXV9GH4MymfAnF7Mh4l+iA7gm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDjy+HrM0OS2nWploi54b8TK1vO3BDc4Pk0C5FeMiott12xOFTLj8DQdM2wvXIQ/wEL3F6riQU3dCDwThjwFQ8Hmfb+L7SZSxRHF8usd+gCEiPY6xSIqq7qZMElJ7CwDM8sylqaG99x0AFhwO7L7j1Q80iFLkYf+Ahr3T3vFikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alyCFyb0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alyCFyb0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-231bfc4600bso3581575ad.1;
        Sun, 18 May 2025 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747601356; x=1748206156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQJhKSho64ZpkmIqXoO7bMqssrebC0FVIepkyz4MFXk=;
        b=alyCFyb0y5gfDKwW7RzS812MMhYYKeB003L4p42RDp1rZV4pxkvFjLNYtVJyWShmaV
         JLYO42YCr87y2Kh48FZUUyQlvGBFeNsvwoLzjUIRqwFzIKSutFzpu/977EoZ2DVoJi/A
         jtkinCOnyh3rV+IFOLHwS+ieme7zniUsktOuHl2lnUPzV2EfKnFnMn0dmCxkC7M+fHwk
         z7G0m1DDBkv44mD/QzZ8xxJGAwW+ia1uZHoz2yJ/llRZY1/DWuwgtr7laSLb75ZGR2mv
         FcSGyh4KtYqoURqQMapRSzIEPpCaICI1DaC/NigpF4E130oU8ocB2SJnBqPXWw+wtajz
         aVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747601356; x=1748206156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQJhKSho64ZpkmIqXoO7bMqssrebC0FVIepkyz4MFXk=;
        b=nUxoY+nIJ42MP6zW+1z4kPz7zLif6GbkXxBPg9LUXa77bKJBbkI/9gS9r40HwSjizV
         IYcNvtTivwHPv5Nwym6UwP8PKwMs9Pkq4YVdCMpc5QeJ0mWAiWfu9fhwvDQOmYTh/I6I
         fiF6X9G9In6vCklKUfxvqwNG13uAkgSpcBUQ9+8VsYz2OgozYv0DYUTXl5uR/QGC6iWB
         6OaOw5PXSbKFN4keCtitfMC97PNYTqJsxAyjgk+LBJiAzO9cN5o/38wDC6WUxEXZVw1M
         KFf2vteSIzqy1ZiFj1NWDyHhnN1MI2kpoEDcAupm75nAmaJl9UfJdMwCL7M3UTYpd4w5
         1aDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6SnUjh8ijT8j6ET+Mms9kkahPuRtnxP1vzDlD8F+YkyrLHVAQi8Xr2qTT41epw1g9eF2JpLcDmOZGq18=@vger.kernel.org, AJvYcCXZdr/WT3U7x6KLFd0eGjlo5C2x+NaRx0dl71S0wNRfxZc+V1bn+5jlYCEWigbXPDTn/jnw8HhUdWw1gJMAhuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztD68ThvCdo/GtXw2O527g+Tv1u6BGa+gQplfNcU3HK8hWnp1c
	i4HnGoTqyS4Mjw8RUHwZy/VDuHkyCtewnl2U9ch/tZS7VDxoUPHIL8PB2HpOQAdjldebD6XRCbY
	mmdLX/k9/hhXuLiLnePzGfSJcowZROHY=
X-Gm-Gg: ASbGnctBQ5VpkFxa+mnggEaD2QCxBiAchWy2wcHDj2RbRL/SzbL0hLX5+R6iEtmudiB
	ml3hHVjG16GqioasZRCDudRWdw/wFM7ABY2P8ovkh6I+KpiPFknuKgD+Nlr+/QlK+dRTmKUHSY4
	XUAwQeqOe5TZc0ASD+u2nzdfKhKALWIBRTlhSI9yxv/q4=
X-Google-Smtp-Source: AGHT+IGjPZIxEgFWBF9/HDIGYjg353QRtcQBv9HCkrhi5XiliPGjAzPoipZqDLWODa8PvN5UC0m8zC6/sr7MEjxJWS4=
X-Received: by 2002:a17:903:3308:b0:231:e331:b7da with SMTP id
 d9443c01a7336-231e331bc3cmr42070815ad.12.1747601356291; Sun, 18 May 2025
 13:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507105455.72863-1-lossin@kernel.org>
In-Reply-To: <20250507105455.72863-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 May 2025 22:49:01 +0200
X-Gm-Features: AX0GCFtUOBcjRpsVqM5gfxS6MJkOSK7Pl4htfMx48XDsoEjXrvShPOS1vUJJmGI
Message-ID: <CANiq72ms=jRTdqS49MTP9khUKN6Ot4_PfWLqUb4ANWXchQmxvg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust pin-init for v6.16
To: Benno Lossin <lossin@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 12:55=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
>   https://github.com/Rust-for-Linux/linux.git tags/pin-init-v6.16

Congratulations on your first PR!

Merged into `rust-next` -- thank you!

Cheers,
Miguel
