Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D89215178
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872682; cv=none; b=eYv2appWA5WVIX6C7QeUH28ySzOY57+mggFWSZq2+pyftK3/QnobtwknWbFD8oDATNPWMzmqNmpONhX/qZ0Gwr9wxay7KNLJYkG/zpODlDyaHvg9UBw+uKnn6gjfnF+V9+e3JSpNaVg8qLe8USoNFLBXl3u8/ITjpnou/CVAl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872682; c=relaxed/simple;
	bh=i/t021y5rnafhiKzThWKY9qu+LyN04jZTBkU1mkLjqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUOvu1ELM4kWOGety7c2lkmHlhrD/SqCsLrAAgfvnhz48RSorKI4lUQ7FeKN+mBzrtGnPKwyw5CL8bigCCwXAwD2Si4z56jn0z6khuukTG9hn8w0+ntwWe6+27VQFa6v9emTBvXvKcf3tagprKCfNNzqqrFERqOvmbYzL8h7+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=OZHeMBDH; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="OZHeMBDH"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e717c3dab43so393683276.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872679; x=1745477479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0dQX2mPar2RyrgErhNkBZUjjc8nTe6WFVqdkQhDyfk=;
        b=OZHeMBDHbTckrURrzDb/aI8B1Ch0T5znLe4Q8mHpISuAo3kYuN/csylyq6wOE23NhW
         5lc311337eX/yqbUuG1WmFRFCZ+9bFUMmCePYvhEmPKJTc97TFtPGUEhR0eK3Sod9Ra+
         03got1XLBX9kmiM2HS6kg+W4emkcwGKfYXgd5V+gxG8+9jyEcQBvoTGq3bL2bYD3ja38
         2HXKke7FOFg6yjV6k019dm1BPP402DIdw+sYUeyQ2PVlpbz9SOM2AS9XRUHRKJmPJze4
         IDIEDEIVghJHCeVdkoXBmlHUVG5G6hnaPZfIPiFU4azX81FJ3TwEzQ3lG3gDBXb3Sy3d
         aXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872679; x=1745477479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0dQX2mPar2RyrgErhNkBZUjjc8nTe6WFVqdkQhDyfk=;
        b=tU4oygAMbxpbSm524OIPOOPC15VY0Oh2qpNMOx2MlK80IQOaYLC6M2h/qn595eChEA
         +P+pUG7JudCv513w03FpejG27r47ZEp/joCZNtpxE2wmCD4dzhH2UtCLvfWrixNLpphd
         0hWl72t0qLgJbYalrOZGm61Eo4zxu3+CQjWy26XVFnqZ4Oycik/3BwbYhxYRiDTWp1Lc
         NizcoBzeCZhoK2nBQzwLd5uIoKj/IAuD8zZwpU3jOBOqJ9JlYcM4+AfxegyHn8+nqsc6
         bD/wMd3o5pYR2rR/MAq71Nqr02iLotuCEyGodIyxY6mJgF033wCBzOJ3piB9L0JKHDW6
         RKoA==
X-Forwarded-Encrypted: i=1; AJvYcCVd/ilHuPsYiQbW3EtbN/sgBPMwWP1LbvU8aLWWj/gO08U8yjYdMQmj1tpRFaj22Rx8R7+/AoKwe7iMYKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhNTCQrpV+mTZbpXd4sgsFDvTvBH0YGIXRdRwF5d4aalV4iqi
	BKDhlvtWl1pkQVCZXs+qKy24+ueLQbzxavCpbR9WciuyrlkUcOLFvIVJFkf2xyJy8ra6otTF5sV
	ASI17XAL/Q/fpPc/7sc9nA2RT/ZAc6RY7rDWXqg==
X-Gm-Gg: ASbGncvM88tklsmE2chXjCAQLmxhiqaVPHzbkOEMGALsaC2FqtqGZmw28JisBBZN5VL
	84e75650eFDRwncqw4ij+W3s368906yt22Qxp5KzAiaIGoMXk6mpWvML6GH20UFbbxIIO/dgJ8X
	3IdWNEDOSyC+gOsZw23VZ8vSzSG1NDMRrj
X-Google-Smtp-Source: AGHT+IF+aP2t8dB20YzvJrlhjH9T3tfezTcwCslLtc9JqLcly3TwpgJoR/i+BwaPOl1rir/bf/4qgdz5/H8nmPoyPdc=
X-Received: by 2002:a05:6902:2b0b:b0:e60:9f50:5d0 with SMTP id
 3f1490d57ef6-e72759a758bmr6352438276.29.1744872679616; Wed, 16 Apr 2025
 23:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-2-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-2-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:51:06 -0500
X-Gm-Features: ATxdqUHRk0yMnnGqWhQx2nF9Qnhveopzva01QwJpmDY5q-CY8v1AeF6E-hbxr-I
Message-ID: <CALNs47sG5m3VJS5FfQaxXku5o_LbtFcVResL4=inP7ndARnnbg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] scripts: generate_rust_analyzer.py: use double quotes
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Replace inconsistent use of single quotes with double quotes.
>
> This change was made by a code formatting tool.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
