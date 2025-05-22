Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952028852A;
	Thu, 22 May 2025 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908098; cv=none; b=fTBWr1otFegBnrH23aCLWTfZ4RLcksE8BI7JL8Ft6aeImZjRxSR/3V05JPIToVupacwN3KC616DBlTy8aOVuP/DKMQGxtrkY6V3GDJ5THUllGYSUnL0s/+CjUDOVY7cBB1gMna4TRD8bm5Qjx9BnNueT56t2JG9h0CZt/9mmPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908098; c=relaxed/simple;
	bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlcgWkLnDNHam/IY8krprbk0mHV9+nZim+SvjSJuZNucwQc+ptYhg0LErl2YcNCKGvn+vkUIHc0UIO8FeH6abEaNtOfVwe6MvhoQaz1roMijMLPX/EySYrl7YOrl2ZKj5jjrwNotIg8Vkbf+42IMj2sTgRMyBI6ZQmNdShrRHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUXhkj2b; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUXhkj2b"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3087a70557bso1711043a91.2;
        Thu, 22 May 2025 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908097; x=1748512897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
        b=MUXhkj2bFK+iQbOi1tPLePizonl8I7tFboAVCpFJGV6eMA+X8dqtxsQkZ80bIKDipg
         ZYtwleLPJQN9rG8cIA6G3UcdLvSQfCpIV/Y7Ovn1+KcWweBNdD+U6grGTVHYDKVBBNZw
         S+Bv8zwuZDC4wU9h0N56jfrJ42eAirozfYPHOD5413cAycNa1FCfqHvZj231lgrZaV83
         1zX/B31cNQcdbrnkTXDo9lYydPoFpn4ybqfhAP7/aNGWXo5VQAx3TTYFAbkqutggIWnI
         7uak5k5FV/UiC8ldf5xFG2ndoRknILTO9Ofp+Ho8am1rAAACdjVsvho007+WGkox1J/w
         CjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908097; x=1748512897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
        b=TnHV5rjf5zK9msydk4+WzUBrYzRt35VOxrQ+MlP+YtTRGvfjJ83fNTwJjHvTg4aobf
         nc7hO5gQd4ym3hHPiync4B0ebNDgmkD3VXZe8M1pGrV+SY/NJu+5EYrcG2fKYsnehKX7
         V5pRluP5YGXjJbqO/SyDNCeCXZgppijPfLCT/7WtJfdf53xejqEpRwemLyTO5AhEfMwr
         Zxom7y7J0SMUZHUahvufSeZTm7e8oLQY3sqCz1l3dkV1ACOHYTk/w2LMUwNzbl324hFR
         Ejhsqod2E04rEq/6xgymlqpLxA+IaDvQGfqouraj9OMz7pl/f6XLfhPXXc4Y/vwBGASw
         wWJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2rgb8BrDenY1yHdUYyL7IhFxnQ7FwfATCfryefE+PGf7Rke05pSnTVmP4XxMmwG8rkhPop9Bgom035Pw=@vger.kernel.org, AJvYcCWoHFhCiii+pcqshdA5AiOXKTuYc9GIwmcfBt2v2Haf4TIDm9nk5S2w5ka8KKg9tFVUYW5fT9c4bBsf2Cz8vXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8uzhIqHnzuWytQ+UVPXFA3AZQsoVzrUUhs/BRdSgAkMe1IDJ
	C8KHSa51YFn8Up8AAMSdxzAG3+uO72U6JHEUQ16QhTwgwVfb3tzayysJDxZgk746EIOTYvWtazY
	C5Uw9iQLbfnXIS1GV9vbCX1KdOQ9W2jk=
X-Gm-Gg: ASbGncshLrp+2c7mEe0uuBJ2N10LdM2YicBYWhLrG0HlW5onqK3jvIIlr5G/yjx+F/B
	PNEeSg4zsaAK2i+wYVglm9VvFZD6YZlrvW+BotrM6O0XC+Qm3siEzycDr+c8kSNk92uouqGZHoV
	SdMJn5f7/kTSEASmPkC4Bfknn5zZZ6BMFq
X-Google-Smtp-Source: AGHT+IFzExsehcETTSxOWLbLeb1X0fQx5IwBe3zVmXIDadcj6RUERIrXPgnO4cDoJ1s3Y+MC91pZVZj3DeWJfX3pE7Q=
X-Received: by 2002:a17:902:f648:b0:231:d162:eeb7 with SMTP id
 d9443c01a7336-231d45265d5mr128885535ad.11.1747908096729; Thu, 22 May 2025
 03:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310073853.427954-1-richard120310@gmail.com> <DA2LIVGXSOVX.25YPFFEHM5CQB@kernel.org>
In-Reply-To: <DA2LIVGXSOVX.25YPFFEHM5CQB@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 12:01:23 +0200
X-Gm-Features: AX0GCFvmAeJmVX-ceDMr7saR9zM4pb6ECkILyTIpFPOf4gLHVJ_zLWfdsNsyDS4
Message-ID: <CANiq72mFn593RCYGpLeJ2Sk1YSxnJ871Nu28KQLU207zTfMw6g@mail.gmail.com>
Subject: Re: [PATCH] rust: list: Use "List::is_empty()" to perform checking
 when possible
To: Benno Lossin <lossin@kernel.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:53=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Added :)

Cheers,
Miguel
