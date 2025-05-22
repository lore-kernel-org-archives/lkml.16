Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5526A09A;
	Thu, 22 May 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908337; cv=none; b=MAAzS8HOpmHw529IszPKzVRuH5ZgOwtP4HFNNu9UXyFGECFR8Lc6m10hLTthATBVZ/PkFHvkRk8MWtfTB+OBFN2NJCLRXJumJHw57w1nuP+sCoVT8Tf/c9XaLhigEBPsQVJ7Gz5ptfGwZHVjwcSkg8ck24dIb7eO/D+2yw/8hFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908337; c=relaxed/simple;
	bh=Q5rKfS08I9tmyMlVsdBeqRVKnBYaF6She4DjZREHtTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsydPng8Mf1sVVmbRnKS3f9a3i+g3uRwhk+Q03HOJsvx8lrtK2dSvSOVqAdWr4+O7ePA3npv8S8kjiPfySSTHHmJQ7mazfPRNpcXPo8s5LkOh8uzGPn8zuq6fWs5LCpP9g1Uu9nLSu9sZ5AHE+K7JhjvLn3XHqBpunk2A0yvvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg2xpJpW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg2xpJpW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e5438316bso743444a91.1;
        Thu, 22 May 2025 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908335; x=1748513135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYiCXvropVk/UdG9szLyVWmJqN+PwWYW44mWKZJz3w=;
        b=Gg2xpJpWdjjne1c8WJPzXKxWFJhFHntWzpm5zbEPt/OyKED9Wkl2aVLNVT/R8IFgNy
         MNKIC6WrdqL+GCLHsQkz/WlW9GMrTQPqczYcDzoCaHFQaRmsJseLzhFL3g0mT0biHrP0
         CjRMn64LqDS9RA9LFE3hUYllC5LmRcoRRCj8cKvBASu2FfIFekn/whp8Sz4IH/gfsnMc
         VSfRQIqAPcKxOJWBixhS0LmTfoZh2Lc0NDOKWM6IupQ0OiSSr0amokaCwLlFe5ubw9k8
         xRc00vSftEXfpHsXYq0wtvX2R6VSKPsgakWn8lLY8M0o7kcR+lRbY4wvWHM4vJE3aeSa
         igxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908335; x=1748513135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYiCXvropVk/UdG9szLyVWmJqN+PwWYW44mWKZJz3w=;
        b=iergiy3gv3wYqh6sPOyCcfHyZxli7YS9CvAP0/bNc6mtNim3h4f+5KbfqKQRfF/iu/
         ahGRPUOlBS6I8P/w7+dan0u24PvBm6joe4uN0Ou56m/IER3Z7XzMHbjBef8iGDQ5F0Pm
         NkdRyuQmoTRgBH9o8Wpe7a+TgD0vUAcuhjCxP8g8Gr3Vk9+bYvTi1lJI6QdaRt/IUhnV
         N78tox5GKOEe7QGlNSvUfzpcT+Vgr/iJOS+hPRPVcENcykeXHDGUU14wSaTrDLcEux10
         19ClXqiwmpOf6RqgbQGisdxRlbEIH2Oxv6I+Q8O/kHUcBUv794CRGLAl0GGYAyyfPyu1
         tXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhR/TSSPQbkcvtCiHACYy8am5IDm+IcC43frwLnL7NS4CxNn0Q+V5BIdLLruwaOJHGhiIFbqga/qnVdLIaZZc=@vger.kernel.org, AJvYcCXr/kdngLScd+A/efXOfavSTvkdYAN3FyAmgubh01G+Wig6rpW9+Qn40WTE9ffE0k73CO4QKmVR+2KzzUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsoSLkwU7rOocXfja5XX8vCLVMuPc31pEozkwoD49o8eF835r
	ItAk/bKgN/J0Eo9rj0vXi1P3kLW95XPDt9UynyxUsBr9pv3II0VviLF2rJdhsdYZn0p2Mf0nCVx
	iXV3GEURz/JSQKLcTA2nsofD56jcTK8g=
X-Gm-Gg: ASbGncsMKYNPrQr+1AG8VjibfCCOLlOkBUhdqbL4lhAIrgrIXOXNWT5N32AAEmkhino
	r5V8tmAgIJWQc/mAWV1Zfd7nVLcxKs6ByK2TEty6JyGZH6N3cogFpGu8f5bi+yj+bWGcsuCzIpc
	saRVdBJ155uiRwRvkR1SwM8O1l9ZllmQOH
X-Google-Smtp-Source: AGHT+IFDr5rCbfwHsJDqEWFc9eAKzj0qbyDgyUEXbR4okIzS8MsNsg5uv3Mhf6WDlgcslUPjVg7TF0XfI+FkBFNY1uI=
X-Received: by 2002:a17:90b:4a10:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-30e7d5d0691mr14551414a91.6.1747908335085; Thu, 22 May 2025
 03:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311133357.90322-1-richard120310@gmail.com> <DA2LI55W3BY8.14DMW9GGSAEY5@kernel.org>
In-Reply-To: <DA2LI55W3BY8.14DMW9GGSAEY5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 12:05:22 +0200
X-Gm-Features: AX0GCFvKq5iif3WqR8hzEtxiweft8Mm7j9J3lEiG80DsyMI5IhoRTKas8HKxJbE
Message-ID: <CANiq72n71k-KJ7krcOXL+fU0x+hU0vzrJTDNb-qT4rjR_JQ=OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
To: Benno Lossin <lossin@kernel.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:52=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> This is a nice example, so
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> It uses `unwrap` a lot, which might confuse newcomers that that is ok in
> normal code. I'm wondering if we can do something about that though...

Yeah, Danilo et al. mentioned this yesterday in the call.

I think it is not a big deal here since they are inside the
`assert*!`s (which one should not use anyway in normal code) -- the
other lines use `?`, which is good.

But as we discussed, I created a good first issue to tackle this for
both examples (since this one followed the cursor one):

    https://github.com/Rust-for-Linux/linux/issues/1164

I added your tag, by the way.

Cheers,
Miguel
