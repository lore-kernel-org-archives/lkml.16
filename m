Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191E2E2EFC;
	Mon, 30 Jun 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304581; cv=none; b=KV4zcYXv12kyDgm9jVOe9ZYMbA0hapmYGhOmj8LkGEi6OdYaVxW/6iXL4z9+nSZdHmEwx+8lrSt29L4vfUCMuFH82IA1dmySH5dPoOQ86OsWt/Uw1ffCp7r6wPrBJn14smihq2EtYYRRgLvN2JbD3iqGPbkral0SjIpJBe3F1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304581; c=relaxed/simple;
	bh=CUYIdjmgv9njUUHSesywfXCZRgrZmBoh9yxN+weH9h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/RyOHyFb6LOqwpf4seqJmfUfR8ajAVeEt2NYut1F0oH8WKdQaOWnHtyeTm2h72guneTund7j1VMGjrnBOm1fjMDydxscHU3zh+0oQs0lmJdaYgheo1QZMjxcZW995n2nPK4sXbSQCokZipmwht9SY0NFAsQnm4DYhmDQfFXrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y483vTnz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y483vTnz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235248ba788so4160855ad.0;
        Mon, 30 Jun 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751304579; x=1751909379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUYIdjmgv9njUUHSesywfXCZRgrZmBoh9yxN+weH9h4=;
        b=Y483vTnzTdj9jL76I8gxnUEW2ebBucFjeuw3nDfz/6sDOwSlVbTjYxWvU8i1Jm+nal
         H/oGuMKcShDneGuCoSJsXm0UQl0GKicgXR7jtbp87NGwNXVtQKA2g/TF2wga5cRq9Edi
         kkx0eGdvDwkK47w3Aft9wu3LlkOPXK45iTL3LzIn/nBZo+0yO5BR6psg40p161P+FW+F
         A0HVaYknq8JMnM0HnTU5GAxXADkdvKIbY/n+8J6KpWiEXjk+OIOEWKHmFHp8FSdicgNu
         L/03KYFuFp87CgNFF+tp/zKW8PHcJ8954aCshNyQv8sNZkxqRd2TnLOSbp+sepuu5+c+
         CbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304579; x=1751909379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUYIdjmgv9njUUHSesywfXCZRgrZmBoh9yxN+weH9h4=;
        b=m78Y1Lz2v/vn6sWA8ZkovYPbwVrSy5ydPmo6XpKPQfoHDBw/UXzleZf8rVvQ9eYzww
         CCv2kb/89CbBAc1ApY46ek1fJK/QQZ+dTOO9jSG+mDvp+8vtxLwzjuVxRaewrHa/GYe1
         WY74S9J0AY7qTm0nIyWISsdJJUHRADOzbOyVY73KF0TX3vhgXV1wFWBF2k/B1fF7DKMW
         GJ9WTZF8fq1nVYM5Dt4ULK6syMIcTLUjX5bByAHoKxWN6JUL4dvvMG1e4mBc8D4Cj1iR
         AI0EGogXguKLNKAF/L2qiP4nKxewZmCAhJZ1AUKiVyGGmzOxxeWcJHC1Fwd92HMmDA8k
         cqHg==
X-Forwarded-Encrypted: i=1; AJvYcCUDTKOID6m0QY4r4ey8IB+ajM5b5m2X/1mPkraRDGdLmo7sLfYWn1bDzg6iZsPLZBhADzlIRf1aLarO4sShoVI=@vger.kernel.org, AJvYcCUavvKGx/2UqXZFwGj3WT219HYuRZv5bD94H+HMYEycz53mc/+z81ttphHr2rOvHV9p+m1lK3zxDLh5OP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIV/vXxJNK52KCsjFAy7sBH8Hrf4zuRZ3TKts+8OlMo8DhhLyJ
	Fx9tjPY00v6jvVNq9gLlDt04Zp20pXBS9VRu3toiicAjy49O4+ESJ4yocsneL3tSFJDqTj4MKsb
	Q2rr6+tb5iX8PknhdOjtXLxToE4anhIg=
X-Gm-Gg: ASbGncuM676gcr7AUq33ow0fRrO5tx4l4tXvzhoA2mT++NZ9F4d7cMsIYyQEId78B16
	7rTRRw+C1XIAEtZzI4T6chE8XR92KAb5cFPv2u1aNIZ1B5CYnjs2DhI+S+2k1/nVaeKVByfCqsM
	tXv1mlle8sni3gJkqJQ0nZQ/TCJn1p9yHvtPLExonL09latfeftjNM7Q==
X-Google-Smtp-Source: AGHT+IGlkyCbo6YfmrmszAWcBbTqpCcv1RsznazCnMzfIyfKQkN92UVyVeB8q+z39JjyvyKMtBZVUyeG1clRThxO3Bw=
X-Received: by 2002:a17:902:c412:b0:235:f250:84be with SMTP id
 d9443c01a7336-23ae93fe435mr60182125ad.9.1751304579036; Mon, 30 Jun 2025
 10:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com> <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com> <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
 <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
In-Reply-To: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Jun 2025 19:29:26 +0200
X-Gm-Features: Ac12FXxGto_ukqtLcE7Azeq2vHM4J-jtxUirDXVzVuk5d6cwm2TGh_Ol6EnHOWI
Message-ID: <CANiq72mnQWU13qYi1jrhyhwp7iRPPijQ-pXJcyZhwS9WcbXo5w@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Rob Herring <robh@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Stone <daniels@collabora.com>, Alice Ryhl <alice.ryhl@google.com>, 
	Beata Michalska <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> No. Drivers rely on empty stubs for all the providers they need. It
> would be pretty unmaintainable to depend on all of them. You want
> enabling drivers for compile testing as easy as possible.

That is fine -- I was referring to the current patch, which at the
moment requires it to build.

Cheers,
Miguel
