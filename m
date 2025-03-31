Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23911E104E;
	Mon, 31 Mar 2025 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417360; cv=none; b=cJVmI+kiulT6gDbLIoyvJ9ZRmsHQQn5BMgsjff6/wEjOSr3cJHX0TZtMTR/z9Tby99yO1716L6rSgGHGNkAGSzFne3iQ5HYRNXVj7KdQbE5xVVnNX/Yv3n1aaJc7YUljjNPaJ9COJetbB8BQuHrFQ8dXCriEmKaM7+sWhA8vePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417360; c=relaxed/simple;
	bh=zEx2JSo8gPZeBZTI9W4vS+vidGbe5gNazL7FMc9cv0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKPYPvAdsAQC7pZk7B47o+vQGlWg1Z8QH0+9H3Ecgk3IUAWwhRlFRNXNax1VA3iPRYYCuqCpefxGvhkEU/cqgqZTLjUAvV9ltar+qIN9M9tSZevP+4u1zNiVeaYthq8KsQmaBNZO0YuUA95mJOvtWgitg6brNyR1ScTdVFx1vXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cchEgHQN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cchEgHQN"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30363975406so940134a91.0;
        Mon, 31 Mar 2025 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743417358; x=1744022158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ikawffa1XmcNQB6fB+w/X6uLSEh0RtsRAvVfBOkcps=;
        b=cchEgHQNQZ++aI5A/K/8dTQVPqryW11Sk6nWCW1XnDpfE14iFag9U7tDE6mgbR14FA
         Hofq47O0t9N8ZNq/ZPpUywOwDBOO1AKSqda0dYskI/zalPu/bHNvHINKpgc9J1vHep6T
         Fo24iPUS4gpPA76TciS1fonAuhb0HWW6EORY35Dsih4N/FWoqOkYfvruvbqZ6FPARNWM
         1YG+snKTPGMFbEjGHHDk+C2TCb7ZB12SA4C2vH50yPC+AbEDiAhNBrWuggRA4MR2NmaW
         uVzCG+NO0j7diwfJ9NKOk7/VSxZVo+s/RYw5aBoEQk6HPIwX4rA2DYKUt6rQKvvI74OU
         d1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417358; x=1744022158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ikawffa1XmcNQB6fB+w/X6uLSEh0RtsRAvVfBOkcps=;
        b=EOPPiTZqrfTgj7c/HCSNrVjNXHd1puNJcBXBKihZWufmCvnJqS27OF9TkYRkA68Xej
         Ur3w1oq0sbeGcSQzUf33fOJGHj60w3ZNFTEyqZV+Qw3Vu8YXcJIMDCaOuD/AIlRNEFvI
         Q0viMFYiHmAmkGule9QD0yQiT8fm9Pk9KWRZrJDADhaer8yorD3Cq49umwD+VGK83V9j
         DULFh9zmzee/xYYaZLkoLcG24Gunjpzo8mrBHKgfrnG6XebHCHOekxRMhYbv75giX8Ou
         NbEOLnN1JmtsUnb8eJ0Z71G0NzdR4AyFisBl29IXaVCv3iMBdPx2ozRkdW0ikhtH09Ap
         YOMg==
X-Forwarded-Encrypted: i=1; AJvYcCWQZqazqQpJFdyuQi/WB1xrcL1nznbGMRaKmkxIg6qA0Zmm1zlhBvNTj2PT+ATLQfnVGhHUsQHChWWfjkLr27c=@vger.kernel.org, AJvYcCXgRyMUA6FBNnjl0V+P+uUjqYoCzYcs4XDaGVnFc5fhtoMHUPKfWoDWhlmabaKbQdeLk738tPi6pMtuit4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxQrYrZoSw0Zlpryo9rkSa35xMjja9pcI7vqqg9oVydPkzizU
	h+JVXndRjmKZaScMO9svM9VU1lPf0Rd/1o1EOVMEEiDqLpzvdXuB2GzuakqAHqAKysBpe/DqG9o
	dbB53smSpw5Ns2x8wSTHlCl3d2jE=
X-Gm-Gg: ASbGnctS1tyEfLWJDjacOlcsr1y8ro6HzJKlRq+Dh6+LN3zKkXpLaR96KgZgqnhPtVW
	2jzWl2L3mzDY5No4eCef18s4Rwev8XmTdB4S5i2UAoK9sg+pxXGKUZLXkfOFXp8pjK0OGd96tkb
	9LM0nGnhxmpfeXcGOid/UujKDKAA==
X-Google-Smtp-Source: AGHT+IFbGuLneGYpnuyEhh8uJOR/MpPwOlhYxV5IF/XJUNKXyWcu8vBabQFZWHhKg5lpN74yT8V4DcbGLN9aOfA8OH0=
X-Received: by 2002:a17:90b:1d88:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-30532153722mr5089126a91.5.1743417358223; Mon, 31 Mar 2025
 03:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
In-Reply-To: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 12:35:46 +0200
X-Gm-Features: AQ5f1JrA_HUQGTb26le5i8LBG7p-dCwE2p3QTHv9TG0yhM3IU280MSaJkHxNHcU
Message-ID: <CANiq72mH+tudajJvYVmdLP+F8krMAUytvbtkox3gKeX3_oympw@mail.gmail.com>
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

On Mon, Mar 31, 2025 at 8:18=E2=80=AFAM Lalaev, Andrei
<andrei.lalaev@anton-paar.com> wrote:
>
> Because of different crate names ("pin-init" and "pin_init") passed to
> "append_crate" and "append_crate_with_generated", the script fails with
> "KeyError: 'pin-init'".
> To overcome the issue, pass the same name to both functions.
>
> Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Applied to `rust-fixes` -- thanks!

    [ Made author match the Signed-off-by one. Added newline. - Miguel ]

If the author is wrong, please let me know, thanks!

Cheers,
Miguel
