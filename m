Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8C1E9B3F;
	Sat, 12 Apr 2025 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744466767; cv=none; b=hALWIbR9UXrQr5PUwZQ20mcclfTVkSHMh+BevCfaHUpU8xqwiLwXifXbg2uCmC2jz1xPUNc4CJvVGO3FFlfN2v+JfIBgXMcDvXYNhrqQ1ZjYvfKyYxmHo6c32gy7Q6DiffNpbS93lqEVAB24WFOumjwrxNGf2lXX8DreJEl1i1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744466767; c=relaxed/simple;
	bh=iso+YAkOGlKytMrg3KMcGHi5k9xUSQ30nuMmqsQtEfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7n/FMuFYc+PxvC8eWvZpgZ2umjerpq9CDcMt+T6KdZP2ktN4u9TdENgkp+A5caUio6ZGK+b/9cVeNbCXXzacqDH5hiw8JwTzqJIlwOR3huYrEC85BuTXyXXXEk7M8U8Z1MhAXZfkpr5sIGcQy9HMkDp8ADn51Vc76iT0zR/jVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8AT30mG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8AT30mG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so853405a91.1;
        Sat, 12 Apr 2025 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744466765; x=1745071565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iso+YAkOGlKytMrg3KMcGHi5k9xUSQ30nuMmqsQtEfk=;
        b=U8AT30mG7k/erp7USvH/Zk/ofOzo7TN43Ax+glHeUqgcrc5EFE5/yNdrnmkA5CsK0I
         twodMOPBCEpJ2BIRZ4qxdRptKV04xsmdGHBfyOddZ61329HoM8K1GYzaNKllCq4gP6D5
         Jfjd7oCjTDvfUfc5jKhCs0kbej3MGC5hXBi7t10Rn+lQ3CBxiEjCp1MEwJXJmKWCbOYn
         bCEPM12n3eADUtl1flMVlaFy2lN2IXT9oU7kAjErzV4ddQKYjZ32lCHhKXHvwQs/l1zS
         bA90a2FWw4BSONCYnXnSUz4i+ODArCjHmSpy/bdcc7MDaNiqx7b7LLVjIyu/7OzbPVZj
         bYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744466765; x=1745071565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iso+YAkOGlKytMrg3KMcGHi5k9xUSQ30nuMmqsQtEfk=;
        b=YCjYAf/eg2JFKN2OIm2H08lMevAzLScWqRkET5MRB5wk2HurUTj7v/cMLD24rwxVvL
         8spSEFl86WpS8B/8TF5k+O4qu/n1Un+ZmtmM4GArC97pCBmcdZ+IwiRbuytzGHVdIwu1
         FxbvwRy1aHvns4DTS/Gz4JCYwYcoF+T8K1TiROwFfI8tUGtk5j0LBb3y3EIQNl7LEbZ+
         3bKKOI4cM+sq/4zcihze2dEKy0XJSX4Ed6jeAnYpvXH5jTPs2rBDG7PpzLwE5G7vrnxw
         hI6NQHzeYtvBNnAnBUYszQkhCu5JJRv5PQfz3ovOoCRbvoDHOwp7D3neXTAbJoc/QRZv
         8x4A==
X-Forwarded-Encrypted: i=1; AJvYcCUGilorGglr5VoErWMEMjnGq9gT6i/SLp+/HJUlI68d8rVxUkDFlzI/K/iRIWQPv97HAPW9A0ctkuChmdc=@vger.kernel.org, AJvYcCV38Z6J78FzWrOv9MKDCEWf51XddLu6+Kjj3O7JCpDyK66E2iuN79A2DvNpZeeIVM70XeHxfcUo3jMM0U0Qu70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MkzmqcF3aXZv2J3DLMn2nNlJa9rzx1Ea4WeykFzr/qklpijW
	dKj9urzxXqzEtcsOvuiFGZmO+GoQvrQZgDwhOavbiWZmGfI0ONg451Tm3dky5YCapuHjujAX0Nk
	zWoI+eD+IwOmDewchzgxlh0z7DUs=
X-Gm-Gg: ASbGncsF/6ac1zGKFPc0uDPUaGV//OTaK9UfsPxt6DLW/T/12gF/9MbFJZT5RxjI4mT
	HTmUw9ck7uM8GO0tRDXF3fHBFUkdjAehdj9RI9cHAHeZfn8lCmlLIm4221i6rEWTyjSeOKrDQhF
	IeQJRCVIByQhj3vJrUPOvtvQ==
X-Google-Smtp-Source: AGHT+IGji1JnW6Vj6/J2OEtyskYTHUILBfii1vHMs7pxJJsxA5e1glyvCVcbPLT8mkkf/LPXYafshNuGNjBve863N4g=
X-Received: by 2002:a17:90b:17c4:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-30823558034mr3753259a91.0.1744466765115; Sat, 12 Apr 2025
 07:06:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com> <a7195308-e019-4587-8bc3-ad34de192708@gmail.com>
In-Reply-To: <a7195308-e019-4587-8bc3-ad34de192708@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Apr 2025 16:05:52 +0200
X-Gm-Features: ATxdqUHGKQK2KhVXpli41vv7AsfqX04pdYslO1oWSINRBtFFojALLif73lYi1QE
Message-ID: <CANiq72kqVzhbrj5uYT1taXtNWvJzFksSOXiX1RUzzmOFjMSJiA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 3:55=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Do you want me to send a v3 with that fixed or are you going to do that
> when applying.

No, no worries, but thanks :)

Cheers,
Miguel
