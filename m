Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737C1A7046;
	Mon, 31 Mar 2025 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417356; cv=none; b=f5rcqFJXAspCMhw659s+gzAVlplSQWHeVGUYhKqaDTuXMXQyR3q0FAbzvP9UKhyd1LTir6/tNkIIhwot4AJrUUxB71L+ReTACTpKKI+Du02swbXTvH+cybZpUWIsdx7LTjTcvhMfPo6OvQrbmbD+R3Ane/qJuOn2zvkRzNsHr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417356; c=relaxed/simple;
	bh=NU+71WJtLzFaEcBjje2ZTV+z5sUUfs9UxDbC/QxHm+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCf/P2bkM7L5jtx52WYsKbUIf29SuhPtoL4lSH8rH/tgke7VQyMfvzfUwQcU14D2xoHRudk2Q3TdE9IMmqLTQBL2PtnYxwEyjlwbkNyl5RpCYBhLkNHVFi3pyLfdGcsbw85vBJCJb6y1OFC9m/9ORmY1510BwZEQgxKmToOFPL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUtQxUSt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUtQxUSt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301a6347494so1048591a91.3;
        Mon, 31 Mar 2025 03:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743417354; x=1744022154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU+71WJtLzFaEcBjje2ZTV+z5sUUfs9UxDbC/QxHm+E=;
        b=VUtQxUStJcPdmJzcWaxYpzqwl7BysltzN6mi+oMhE58a+PgWeHUY8t+XR5OqIg//nT
         iIH2dx71dwzuRdBUcwPbHvaOTdw+FmivU6VJFObV8El7v1nLjFIx+XIVw56xd54E5VCH
         96/vqA6tgSZ5QryRYJLexC9xYEJpna9uPFHW9S8VZ2O9wDZ9+rjORI/6+DFjM1HCVBFy
         d7L0VJICOX+tC/gSQswG1erSzIDfnKeT+3H6ChRA+ICfbvYrz6ciX/01jD0TAhFQKXix
         mSPXv1/GN+w4Q5tFwjNCQc78+0ZNBAPb3XjahPF2c2JpuP63wGmnTPR7cVQOgvY6jWcY
         xOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417354; x=1744022154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU+71WJtLzFaEcBjje2ZTV+z5sUUfs9UxDbC/QxHm+E=;
        b=Du2GiKYMn40q5o4M8MBrB3+IL9dlTxGoDBz/nOwfdUmcSLMbkFDpJB/+MrnAS7VG8+
         SaBl2zT/fAoyrd9viBPoXYnmv3LpZ9b7ilSuTPKoOrn/MbnBKvTcG0EQ2bv98VQGy3lN
         792+DUNElRn95+gXRFF0EwU3ctjRZ1bi9onM2NURX4b0fC+YiiCgD7U3cIzFKHjk9DCb
         nqPVGgu7Y0oRtlTImThgwUN/RoBiyLxELxP16HVIjI/r1Wx/oOSS5PT3gSrAMqLEMFiW
         p0Ap3jJp9X2tsTVinZcPDaCb2imRqfNVnGWwbpevTzB97VNckO6rxjQxPB7MByUGHx4A
         Y8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIvt88r7eAFkt6xSa5GftdqnM8qZU8kr51uHceGzsu4vY24lJiDTq1wpDw/6rcJ4Gs9UwWmSGblQyFu8=@vger.kernel.org, AJvYcCXvqDniYr7vhw3gdlNVnsCBxyIHBiTzqsJ1yS9mqshFo3ErCbmPOc0QgFE2Pt8Cfmt8tdlxpCZHt6UsifARZ0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YymnFFfxsxdyqzdFlVlEbwj+DJb+Kja/rDLUtUbwaXSOjLROjCh
	2Yl9ZG6MUcZknB4zL1zt8aL1IDOB4nrLysqOS9l5AtbhVBU3/cHkUMrKWwsxov4MLySARr08z/Z
	i67wyWb5RHgKeDVtqVjdwJhcs1dI=
X-Gm-Gg: ASbGncu1zaCHJ/FJo61G187HsM7ZNxiIuN3NlI3/1G2iqyYsOBkc9R+nSiOGF4gg9BV
	mtxLddY0U3kw91lpvI0EZVeaG5pCmpM/zvFFDwaaCayjf7457/55tR8Ct7EgcaMwWgDXMjSdfEy
	JxzWqys5JgyeUz2Wy5im5XcAAzmw==
X-Google-Smtp-Source: AGHT+IHM2nA8w4WRldVqL7SIV2FfbPdPzmUPjwm0Yq3ELAsHB7aT7+bVLPaopVZZDabnGP2lUH9HyuJBoSjfuWqD7OU=
X-Received: by 2002:a17:90b:1a8f:b0:2fe:b45b:e7ec with SMTP id
 98e67ed59e1d1-305321652a1mr3973198a91.8.1743417354110; Mon, 31 Mar 2025
 03:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
 <CANiq72mWjtP3L0_W7VsOD7uAW8LMmV=E8oHSbrT2dePyzthxxg@mail.gmail.com>
In-Reply-To: <CANiq72mWjtP3L0_W7VsOD7uAW8LMmV=E8oHSbrT2dePyzthxxg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 12:35:41 +0200
X-Gm-Features: AQ5f1JqpdENJeaSQD_U_c_kYUirWym6QBKPQfr6lvdCcJw_8GYvxhd81MejsXdY
Message-ID: <CANiq72nMPSL9_WxO4_mGwt59HHGmcaTueMYzCpY6Jz5aFVmqEg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: fix pin-init name in
 kernel deps
To: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:06=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I will add a Fixes tag, send another merge typo I noticed, and send
> them as a quick PR after they are in -next.

Never mind, the other one is OK -- so I am just sending this one to Linus.

Cheers,
Miguel
