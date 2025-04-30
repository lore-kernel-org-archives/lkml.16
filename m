Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467F376F1;
	Wed, 30 Apr 2025 03:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983674; cv=none; b=gu84BhnyqgRAFOsofe8vZkYF4YRQwvTfW3XBK1iJ0NhpoBf1K/rshPMNQvxZ6grSJH6QVECeKki30fBsCU6QWhZUSEe5a7zLWu5P31SPTSoMOgEs17t0/tCCTr5d6hhjVz2/269LmzQAnX5oaUySesJqE1WRm/cdbfWCutuJrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983674; c=relaxed/simple;
	bh=NgScIPzBhku5nQZxtM2TBuDyMxhJHfwO1iC1kzCkLy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVJPuLHbIhbnxjwuBf61CH/V0ouyJw1S2v0Vg3PTR3Q0YZhsUOxQicFhEjLRJpdJB9Ud97hTqwBcuqdvD49fmOEPrdvFZdf6LbvhT9DA2TzpANObm65boIHG4IulcQsSDF1cuNJg1Uf4OvrZDgUepFZsqnpUbZt5sUq9x5DeJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epe0Y0br; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epe0Y0br"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so662127a91.2;
        Tue, 29 Apr 2025 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983673; x=1746588473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV2cY16aWRJiwSPLkxQ2TSpTcsRNfaNSc3Nu2/SZ0MM=;
        b=epe0Y0brmrvkCvpPq0ClSBLJH/dMgSqP9F389MQc9t3q5PaWweR2m+BWjfRqvVxwe2
         UmKks0FuG5xDnN5ARvoN69oU1cEtALB8JFK+/3hi6KCFXckXjqpGfukJwyo9RKyDCZSu
         6CDdfY1qKoILTA4UgDoXPnyRe+WQvO/gDD6hnM86gj70+oTyhdjE7Kqfd5+EEaWPRm4Y
         lWLGxm+CVck21tKKMmBu2ntHqoS6NZCH689CthWGoMBJ8mOekQm+qXx1UtdQMlPhq0S0
         9Eg8z3Zs+t2fErwy1X4KE0OTiSxGscEhmMGkf0v/EvuXSeZs4HsniQPfzRD2hndl85QH
         XWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983673; x=1746588473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV2cY16aWRJiwSPLkxQ2TSpTcsRNfaNSc3Nu2/SZ0MM=;
        b=gkkDFljK//ceBIvHVtgsdIFmxoHZ8S+GTy+qsEiuSM5OFVyW8plc2CcHDuBZwmqgAF
         Y/moUJ71t1/QslePpglRr/YsVR3qZxP4+fXrK7jC0131FV5T1PuZYO58PjOsHciDFsef
         6U1z/WGg27dto+L8pmuD7ZKW30Ggb0rdAT2H0RzZRO6K8yu/AcVHXwHHOpZXKK8SMah7
         2I6204D9VIEQt1hccj5i0+d5SwvAZ+sUpg6x5Kq9g2g3jEr8dCrAnWdiKb/32VbOBu7R
         mieSCQi2Y6+LA5KD9k+4iZc/+MKKtTX1wwpXH0Xm/7G3zNj0ZUxX7pStLTougDglpZG4
         AOEg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZQATe7d8+YR+cklnfQkQAOn/Lado78RIIyIrHVzXonKJpZDdH4+0AQgdD+81cVIrhyWrQeBpi6DoseodT9M=@vger.kernel.org, AJvYcCWDHl4gJ6e+Xj9lu1OCZBRkMhHI7Caw8ahHlcJPUggZcaQ9mtV8p0dG/GykWCeT6LODCbeyZBknNZoZ+P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYIsbFftB2srDDhEs7/5UUgRBZRrivva5Kd4BgQPOkM8YtkHoy
	FvOfw/jWIspKuSaxbaAuUIoKdRm9UGeTcJXIUFMlKFvooOS5fKg+NDzo8ybjb8N7nzLY95Gr5NW
	vtvxG5B0imZ9Cb+MJw/kuR9Fl6G8=
X-Gm-Gg: ASbGncvJ5dYFeZEvUpHWvJt3Tfw25RmRlDEew+dmv2wYJ2MbZJl8Is59WOBeOo9SWvR
	DIetRvrRo/u4TZIzrv8AVLrTjTE0Kyc8zVJ+95SidiRFQ9Jly0Ofg0XFpoly+1AaWMiwRs1B7jZ
	7VLVg2oD3fbGjoYlbgfj27dg==
X-Google-Smtp-Source: AGHT+IHqMohp7XlQVNggQwTeZgzVcY+A3BL1fEhGTRttuO2h/HJBMIzwFi1OmACW14GDPT0phx/DrqB8kcci//FOb5E=
X-Received: by 2002:a17:90b:4d08:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-30a332dd42bmr934786a91.1.1745983672809; Tue, 29 Apr 2025
 20:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com> <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
In-Reply-To: <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 05:27:40 +0200
X-Gm-Features: ATxdqUEPFaidiHxi8HtoOumJbr4JdR7mLFh8-x3Qzl-yn3OZZgvn-cqYeTo6CWI
Message-ID: <CANiq72kbHnPR8_y_Q3a8b7H=4wDorbBS5VxWD1NfD3yarEW-Vg@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Since I was playing around with this series, I noticed Clippy
complained about a few things (please see `make ..... CLIPPY=3D1`):

On Wed, Apr 30, 2025 at 1:16=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> +                0444,

This is decimal rather than octal.

> +// # Safety
> +// * seq must point to a live seq_file whose private data is a live poin=
ter to a T which is not
> +//   being mutated.

This should be `///` (also, since I am here, please use Markdown etc.).

There are a couple other classes of lints that Clippy mentions that
should be cleaned up or allowed elsewhere.

Thanks!

Cheers,
Miguel
