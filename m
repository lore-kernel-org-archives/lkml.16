Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3B1F416D;
	Thu,  6 Feb 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857336; cv=none; b=kRFRhawvNWs3JTrwUtq9Te1kpPK9aJm9JWFv5pH1q8TQqB02f9ssDcm/MJrKyHdT3/dnMqvlOmKwtOuZdK82F1+iMpBiQgvCKrgYR//DM7SQJ0FZznrRF1oRTEB8JnSlKOZcY2kdxC5No+Xg71AU2mgWsgVNTwFFoHHKi9lgAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857336; c=relaxed/simple;
	bh=tD52tgT0ku1ofDDa7H4xHdYUEEdhBWYV8NOkuxPkEew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VH8BixmKU1QFvQ9xbmCSPlL/FJFWtosl7IxhQcdyJX1GhiNKsrcQN5je42/hixGpfCsqvU5ZGtMiCI89yLjr+y/RmmyxiRhqEAXSy9igbE7r/YFF22g8sZcuyXPxQqHhEoQTx6NWDWG7kTlN47F4IzJMMYmVCnsf4fzlNAA2ePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMWyVKeQ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMWyVKeQ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso244282a91.2;
        Thu, 06 Feb 2025 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738857333; x=1739462133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD52tgT0ku1ofDDa7H4xHdYUEEdhBWYV8NOkuxPkEew=;
        b=YMWyVKeQ+eJq4k4pnxJe8Czy1/TXw8TZU5zXaoWwjgv2KvM+jEHozZqMuCp8K1cbzp
         JYPNTBw9QbOwvfs/PPOgVNUdGYRvHcdbSTSAbhX4Y2/wg4zCbC+4lIjMCb6AWrHRCjYP
         44Dqv/y2I7vo95ZZKGwOF4B+69U9hyGm5gXnowwU7kpnuEMILRIR6IF3U6Ckzjj0gg2u
         NMGAKrhTBZeLtsyac0CmOWIGBxiVtsAst/UHTGnzICatm9exXPnqOYrhzcq0Zug89l4e
         8hXNuGUBASGrQQf0nmZU/LH0k7AD77s0ccS+C/WM6vI8EOUKhvKGv+flfa2noKbqXLa8
         uT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857333; x=1739462133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tD52tgT0ku1ofDDa7H4xHdYUEEdhBWYV8NOkuxPkEew=;
        b=NXjcavauHpn0JDFi0B1fPT7gej/QKCYggA6NogL1/wQBfBRGjizAtFZTT3CHepTWrL
         9vm2u6dbNR3g4HugGYq/raVappvMvLCcTEAYHQxU2WFT9efyXM4HCA9oPWsKQCka0gKs
         koQtopsJ9tZbxiyWfsoMyLbYIz1wo2HsaURC0xW422nYxhtB/HTYEJwM0F1F6dr8S6cF
         GbwjrNtw/s4e4bP1y2Pb4GndBIjSzwxCDv5M3wVLTWTqM5kWdcmeHZMCF3ER4Xbp4a6r
         4RJrLYcEvny31hKd6IwWZMwTeED3moglnyBr0NxVLXWCdaxznibhFTmnTdIJAvM3LXNz
         SX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDUS9LRSk+uaBOaDEdW6qceGUL9tok6XC1u24FkXKh1pYPxJtpK/FD20LevTW3nO8KMFV3bebljOWphbw=@vger.kernel.org, AJvYcCXDfPcKut7EN3znF5P/4LFf4vmD7Y8LVvNx8FcNTAIKO+PzINWajbwYHLKF2T1/5b1kEqtE0ciqu8GTcjTWbjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdgZ6r1EyGLzcXqdP/Ye6QG5bDmBwBKnnVdB9MYoodL+u2Y3d
	l7RAzvousCRi/okqTft98fMVkR2DjSo6HbXaOnsauQEebzTKpHs72tJX6CK4+PQ+qOL8Udp9VQi
	d6dWMYzSb3VRTYS3eZhkVAqT6lZY=
X-Gm-Gg: ASbGncsyBUTb0kODhhBK6EiKIYi/kGcH5zKA2WkVwGV6PvJzBT87F13k9+38KwOO3KH
	OgseDVQ8aMneq2BoR1GvWbKdQFoyGM/juo2O0ZLziLeVSRk8y89zr5IfsssX6Ll5xh1/8TEyj
X-Google-Smtp-Source: AGHT+IEFA6bwsKfDtexNPcAT1Ijz76kY846Udajcpk3w58/MZZAQKzUIom5u6GuoKlIyvw24uIrDWLQCOmlW0KuvGmM=
X-Received: by 2002:a17:90b:1c12:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f9e083493dmr4903827a91.6.1738857333464; Thu, 06 Feb 2025
 07:55:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129215003.1736127-1-jforbes@fedoraproject.org> <202502060744.6F701A4CBE@keescook>
In-Reply-To: <202502060744.6F701A4CBE@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 16:55:21 +0100
X-Gm-Features: AWEUYZlz2JYC3NHGsOQJMV9SfXiXt-ES4SPKFNqmwUtWcJbz7DyUOVLVFqJMjho
Message-ID: <CANiq72meqUFt136PQt=h6b5p+wJ5KvdYM2ci_QNKbHaR2wY71A@mail.gmail.com>
Subject: Re: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
To: Kees Cook <kees@kernel.org>
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 4:45=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Thanks for this! I keep forgetting to keep flags in sync. I wonder if
> there is a way to automate some kind of warning for this (even when
> CONFIG_RUST=3Dn)?

You mean at editing time?

> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks! I will add it.

> Miguel, I see you took this already -- is it planned to land for -rc2?

Possibly, depends on how it goes; otherwise -rc3 -- why?

Cheers,
Miguel
