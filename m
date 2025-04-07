Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830122101BD;
	Mon,  7 Apr 2025 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047321; cv=none; b=VnCQS3ZX8++UhdOwjV1z1l/UcoouuNhQR2f1UDOTLV/nYrj4EqzluCkK3RcDqN+w1gkmPDIyFpv0xLvuKrFEzGm+JMeJ4foZD/9yzkNS+DU3xdtALz5WYJZX6TtcVZs/qXtPZA2N24EarxJWrl/YWUFBFVSm3plNQqkuPsmi1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047321; c=relaxed/simple;
	bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0KGDFBml5mMW4ggjIL8xhMTlRklbnBYCHJ2INok3puyWsptMAIIrenbhawdrsS9P7dcuKBcXRVfSspABlXapFhiH4deNBjELk6wEihHfiMBIxGXrvZMK7b0jLd9VBnvAtLhOIKv+TOm5Asy4rbXck/bjZ/RtwmCbf0Jdpy6Sac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTXnmBIB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTXnmBIB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de10eso8831425ad.1;
        Mon, 07 Apr 2025 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744047320; x=1744652120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=;
        b=eTXnmBIBjnUbS6nfuWeL0mkb5/cEa7lKQ2EG1MwBdcwwEaqfqJlN6Ix/RbOb++cu9O
         WpIS1K1dAtHIpngwElQb4kh36kMFFFibOZH+U/uhy/O/kQPeEKLFgDuk7K73gEAnyzqC
         KWOFNuJutBcrkawnUUgX9zSkeWSFXwTxJIuF4bSJe30w5RxA3xvRPdqihNApjhVOwIwk
         py+QEzrx8DH6CCEvXZMspGfS1YdEB5yE04pTai7mwCvVQbwqoYLqzXsSdS1YRinmp2kJ
         Cqis187Z/7/dWSSd0V/j8iJgzgONGm9AMwxngB860RC0XNdxc1YMf1zeJKiGoApRcmof
         L8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744047320; x=1744652120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxtvOqHC+32lbWhXdQ+bVh6Khx7LdIvjYtV/DX+xWVU=;
        b=sGHNYAWEAcCvncmIt5OV4kbXQgh2dsheTrBbObcO3+/4VbHwm19+8O3d+7+39fK37e
         G0rgzxI87KGOtxlPGm9O3i+yQkiRSXFtS1j6urzqOHvyTnd4idfEz4rX8MQTRqAaoqPq
         5wyvAD/6V4kFuydDlZ350PBSe2LQuCnzcR8DbZ3JY8uwkTs1oNnOwhc9wq+qXxKl9eY6
         PTHT/wUKl0ddzansEu1bCVCmbzPMit4kE1+h4TdYHeZ0e5/aqoaMt5UraJWeMqo+1SMD
         y+xSmgEzeI+i5rh48cZ4eNpj7Gin2KV0ArMAV1A0oddQ03TadR9P3e7tIdTMkbEvs7G5
         P5xw==
X-Forwarded-Encrypted: i=1; AJvYcCUTcrwsH/KecYsfZWcn12dPCzXkBrZfIKHKKXaQdax7b6Ay6IuKEjk7YWdjkUwq7ViAlF7HWAAisEed8QbRDGI=@vger.kernel.org, AJvYcCUwEjJ1p/AxBJi0ExqTWPnxdq46AYpE8FNp9Ta7Q6d7xchonNe7uNIywHfGRRPQKBF0VZTmIxzgp+1pYo/N@vger.kernel.org, AJvYcCVTJwRcm/YgiWbM6MlFqSNTPu82qBwQfBYXZf/ezWrFi/sq63NvLG+kSzG7QaByXTOYjZ1ra02lUbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPDZA4eSWsMLZdfaV3eLzY9HbPdIHW0j9tJjyKQ/hFes4+B5i
	KnECHHnE6d4dP+OmpvbEHGNADlzkitM2pvObNvTaAMLkg5Dh2QdXWgK4xZGgR+6SHX+tnHq6qaY
	51bScydibagqC8ULOtZX0DwbDx/I=
X-Gm-Gg: ASbGncs/W0QLLid2t7/tIumeIzuDIseYrWFBNs7Dx+sqSbgyyy4MICFkEhuGtt91/nz
	zR9xlCalbiwyT53MLN1Evf+dktOuWseFpcI3oBx70Nn/LcFwP8WQJuKZOvl7KCEMDiN9MO95xpo
	xFt25yP6TJGvPYeyOR71qJz71OkA==
X-Google-Smtp-Source: AGHT+IGrOYdd22BOkNcMFAJN6gBEaM6XViMqZTPa3LiMF4ZXBrTaB6b4smjpdk/WhbGIXTWECsJFDdeZQZg/KU0ria8=
X-Received: by 2002:a17:902:f609:b0:215:a96d:ec36 with SMTP id
 d9443c01a7336-22a8a0584ebmr72206115ad.5.1744047319861; Mon, 07 Apr 2025
 10:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
In-Reply-To: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Apr 2025 19:35:06 +0200
X-Gm-Features: ATxdqUFraFwWuS1l8wKAeEcupvutnzUZ8-1cg_oEdUgNAzrys-VAJ9qg6SJWJNQ
Message-ID: <CANiq72kokgc+ZxVN=UKUNbov4t3NkccTWSk8mDesbniJVFdr3w@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>
Cc: Manish Shakya <msh.shakya@gmail.com>, chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:04=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> Maybe we should also hide it behind CONFIG_EXPERT?

Maybe -- it is already inside the "Kernel hacking" menu, but it could help.

> Yeah, the upstream support would be the best. Did we ever need to enable
> this option?

Not that I am aware of / recall. So far all the ones that we got a
report for were actually expected cases.

Cheers,
Miguel
