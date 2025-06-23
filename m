Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2559145B3E;
	Mon, 23 Jun 2025 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694820; cv=none; b=MPQrAAqHFPtKEgVjEPJ3+P0LjiF+plp4jy39bfK4o3WXDPOYWOaCHcARl9pNtZh3oYUuL0VJDUr9/eW1fyJhhTLz4zbohXsAFg8dTpGaUNHqvYVcvLgzjnx0yd8FXE1JRrE87ciq8FKqXG0jPhX7teUXfAg5Xn0KprWTr6HWtII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694820; c=relaxed/simple;
	bh=0geRFgwyhl/h2PdBdo1H4e4Lzu++xXp44QjAHfPHcpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bi7YRnZdzz6uo2Fc6tEdoQiFS7VvnjLWZzLyenCl8Js3Q0dnk3RmpR5VscO6M46cJoIISQYiUDsJ4rTs4lORlm9YSOQg5z2HelIdi86dOpTzweRirNYbrTJNB1C2JBtoOdCPhx5tHqBMgz/CQ2hYY0eTeJKkYdhkRfaTAg02+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzeBqVnT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzeBqVnT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26ed340399so201668a12.2;
        Mon, 23 Jun 2025 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750694818; x=1751299618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0geRFgwyhl/h2PdBdo1H4e4Lzu++xXp44QjAHfPHcpE=;
        b=SzeBqVnTv885d8G7JB8q84G1cfvsqQHdAiZ6pcPUAk2KdFyoOXQfVi1uUyCNrLO2Ok
         7Qf6VUtZp6LGsXfTFU+OhP7tO3AyVxJ2kYUCr749HH3LeEMxBvIkgARQ3bbWrN7Z6HKF
         mF0WrTNAIyD9nt23X1QOOjYak81l8sVaJgHyXggKbMrlIjFH81WgZd7lvnkF6121Pjes
         H0+DvlI3IFZmrK1ATDX153Snd17RiRDWXgiU8CW3iX5eyjDcgb1GwqdtMklN9tjVK1fX
         4XL4YULyknnHg54JN6CkXhj3RxSzRfSOunezsqsGZVuxseEobRwfEHuenDpUyDEtsTK3
         e/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694818; x=1751299618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0geRFgwyhl/h2PdBdo1H4e4Lzu++xXp44QjAHfPHcpE=;
        b=JYwF3YxBhurfhHCXHI8a82EqNC0LGEuVXtE7UtfEIHDs96TS82nN7egLi2/AQ4wflB
         3xYIYM2YZgyAD60P5Y9FGzR4VC7eI4FvcqGykxKBVK4SbzD9kIlh+eTh1A2PrrU1m1fI
         g8wnQIDfmLJy4wA59TAey0VfrkUGHpNhhDbCw0zOfDQaDf50Mna9Vzj4xEjoIS2MgbEA
         pjIc3j3em5tsdCwA4lGDxMUiYGjqdd6jDSkE90kIL4Q4HWpW60i2FaUz2yGB4TJD8WJj
         HbKpoC4uF0beidNWD4QjfXIwaLEEwJJcLHWvgFht+ofecZ05/Is32HrBLxCvsvpBHNSx
         2PHA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4BsnCRpatQph5+WxsyqqRWLGwaM1ID7ZM2r2lmkFrbDxVjjhpzH/ytzs7qACOqHMBtjlFVVt6LJzA4GkVsI=@vger.kernel.org, AJvYcCXlNhsM5tDDI8T7yUEhZaR7CgacecWssUMh4iMf9C5NXmkh1fzJzhZp0e76erMljWS5Dfe7qstTy+v+4F0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoe3ZPRyRsc1qy/qhRVv8Z+VJS5OkFGX+RxtQpM1a73ENBRtAP
	rnJACOvTxfrX/Ytf3U5vCPgSQEbP5eot5FhusPmIy71YRT/0dxJbPPYru+TjMjfItWwl79/Q/Y8
	pjuL+CqMTehhzXYZvO6yvduiCIOoW/t8=
X-Gm-Gg: ASbGncus/ymGBAfNcmx68tBOC9unaROdxcI5/+SwqDaiNurZlpJ0cEH0IuIHU2BLBvr
	GD2nhJXGIonDzDYAd5NBJcuw+Ql8iY/qSoUPK7tdwLTVQvuZoiu6IA07sN+azrM9hlOkIGSyLK0
	nw3LKnI0ZQ9V8kS2PkmYZifpNqYE3Hzf1sjWXEk6eZ4GYRbjaB1skK1A==
X-Google-Smtp-Source: AGHT+IFR44j/1R0shLJ61EnHnectkEfaJDYb54OjRunDNzkmTMtDm7NOHONuQN3UupNHtxtD9voN35iKKcokHj+Ly+Q=
X-Received: by 2002:a17:903:186:b0:234:ef42:5d52 with SMTP id
 d9443c01a7336-237d995b838mr77988655ad.6.1750694817904; Mon, 23 Jun 2025
 09:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com> <20250619-nova-frts-v6-5-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-5-ecf41ef99252@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 18:06:46 +0200
X-Gm-Features: Ac12FXzdlCfbzJ08ThqRc5NtvH3ui4qmOJA_sGg1WT42WuqZ4jQEejRTIJpoPoE
Message-ID: <CANiq72ny5vSdLDLpr8D2rVb6dEboq55T6JQ1KJkmEORsj-3kfQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/24] rust: sizes: add constants up to SZ_2G
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 3:24=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> nova-core will need to use SZ_1M, so make the remaining constants
> available.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
