Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D597E107;
	Mon, 31 Mar 2025 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423948; cv=none; b=jTN16K2kDp+KL5BdYjbQffTnM7bq1mHsdJBzWM7jAUzqk8IeM/41K7wuW1WHMLXlLNGZZk1aRZJGBql7aKZQi+c7D0361xTcSwP3GlZY6XBkzfYTtljZ5poNaHAtOF7sqEUZg+gGOQVYaE6SesyElKmJEt+rfF4A4mqumszEOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423948; c=relaxed/simple;
	bh=f3f4yDUdtRhSiam6cy1Cin3H9xYlR63AKA6qk8Ithgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1mlqFrWKZNJZUcGfq1SH23XBX5gNEUmuU9IWlFdy2HHMnSNK/cNGpXoSOg5saIvF3PdYkaJfSJsTZeAZ7HZM37j65y2lgp89rf4Ix/LGRLMhAzfQNucyoYDEdwBesYDGGhrmPnf/5RcESyKpak5vff2LukXALRr+uRfnYZ6AIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLjH9Rbn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLjH9Rbn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301a6347494so1070121a91.3;
        Mon, 31 Mar 2025 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743423947; x=1744028747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3f4yDUdtRhSiam6cy1Cin3H9xYlR63AKA6qk8Ithgo=;
        b=eLjH9Rbn21FGp3n1jNlxcMbd0yfP//055fYz3D1jK2yI2Y9kXgj12mA8/oGmPa4XDx
         B5m5nl+9rkfXkiQFqcKlMKAr4B8Y9neT6TBhuMbM6RaunRXUMpYsc4RzHRfqilLB1zLw
         WkdEVv3Le+4Oxdw5KEEjrfUxn3T3qnHZqEXSauHFEA7hu6gg+vFB1ynaZDLY8utaLX9t
         5IhOV6FD8l0tlRguXxCtkiwu4Xp9DkPMLETd9EYUE9GPc/G66Yo9oZlnsnz+Bujf2EaN
         6aw7Js91JeB0d37DYvl9SOnhfevimw3ubl7EuNVKjUy/OF4e7wyPbgUkrN57eKtY5y/K
         13KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423947; x=1744028747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3f4yDUdtRhSiam6cy1Cin3H9xYlR63AKA6qk8Ithgo=;
        b=Aepu09oGy0KqZUwZ4UnDelGvFYK8aFmiX0OoFEYtBF1OnGwWXxp0dlxgD5r2GSS3oL
         VkQ3oOZyxrsJscoeWsEhIXDTl6+ekqPXZZcntmRMQP+OAHdJtBEEKnAu0xZv9naXQeCV
         L+UHvWCITa8L5nb08M/HChP+3sLLPjL2GBvb2OIHilkVb/KAm98Qp4700iVX2IbB8R8U
         Yos+FHGQ/YkTUbGdBt2SrrBbOU9JtLB97u5S2FIvBO1s0CKfwVzjQDvgjIzGEmOHvpmK
         W2fnjDY5d8Bfn2yzfLrq/CQhMFiRnsIzuJh0QMpKSMuhKmFm+2SNEaxZSnny/QHVnUqt
         GcWw==
X-Forwarded-Encrypted: i=1; AJvYcCW8HBlyywERTuvHGnTCxuMTlWq3hDlazPB5RtHZ0fqlYmgL5qc6RwcoaA0NyF/YVkWan/g10wEITiAhBN4EX8o=@vger.kernel.org, AJvYcCXYm+9yVx89WflrjLjI2X2Kb3ZbqcsSbb8vYnb1vgaw6bkKrXRJARtSVtuSDGaxM1kiuStz0BjID2KTHtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhudOzXb7VC/TJLcTDuOlchW3pyMfoKdilacXaD+GOA3b1LvBh
	bh1Dm0FnTj/MPbz5A/BR/Y14X2njOVM1pgXL4SG/y3UNEdljwxhFfFF4uzcbBi92EXD3Z8KdfDz
	dNEYKIHOtc80Nvg15e33VT0NYSvc=
X-Gm-Gg: ASbGncsWu7OFwo5yJaKarBBsZ5tiwbVPQ0gyBz0gZ2AmXbtzboS2xHW2aVzqpZUykO2
	H/ovs8xzW/ezSMgsTCRYN1s3tgW6CX+CSv2oJiwOXPmEYNcFsU+W7BMEoCyHEfnC3IBcBspkWdL
	DRrZsZVGsS91kcE/PDv+Cf7HQVE1oCldHQwqzo
X-Google-Smtp-Source: AGHT+IFXjTzcP1dpJeNlWbgRpNKcabyx09FyU8J+ehdd/BvJs2O+z4KeIrkbzZLmWpt6qZj/Pr3H5SOAQ/ojXym4usg=
X-Received: by 2002:a17:90b:1a8f:b0:2fe:b45b:e7ec with SMTP id
 98e67ed59e1d1-305321652a1mr4107685a91.8.1743423946770; Mon, 31 Mar 2025
 05:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330170535.546869-1-ojeda@kernel.org> <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
In-Reply-To: <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 14:25:34 +0200
X-Gm-Features: AQ5f1Jr1TNpRPr6ywqwdw9w9qPxmrphgiBhjUqlHN8ZciUoRSaWsBfJoqzi-pxo
Message-ID: <CANiq72mjK=DmAnkfpmpw_ym3xLiG+Dub-_wU+yCbF7E5VfpAjg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 2:07=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll learn eventually, in the meantime please do continue to give me
> example merges and I'll use them as training wheels.

Sure. I noticed you added a missing `\n` in a `pr_info!` that I missed
-- thanks!

There was a second small difference in your merge -- Andrei Lalaev
sent a patch for it already, so I am sending a quick PR with it.

Cheers,
Miguel
