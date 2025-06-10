Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C188BFF;
	Tue, 10 Jun 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572172; cv=none; b=p4E5u4jNA9nI5i8OjScbMSFVT0cXu9/cWKYL6yipem9mzEaJDA1ks8xnwY7x26gEJ3UJfC4D2UjTzb5xbglyAnAA/RrOrSgF4JBnb0GgMCw7cL4i5AgZuEq43Nn3LO78zXoMY8W8BHh8n9/msfvrpjyCZuOPAHiQr7p8wBCw1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572172; c=relaxed/simple;
	bh=P4bi/6++3GnYdwBbcPjF0TgNnHJNMI5etRQsFn33PD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkf4os3d2NLlkd7MLGhJi8SSBpAAWDBVZsQh5+u9wzg+vJD2+7c7vyUFMbN/gmgDHTLKU8VzS0UtVIafCe06wj1+14hK8ct1OQlqx640PA2Ap5vIzSlFyIp2rhNgpXDlQ0/WK1pxgfebOZVQ+QpV5D0OBNxPHIQzZj4oU0CpPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwOaRcRU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwOaRcRU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so456235a91.1;
        Tue, 10 Jun 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749572170; x=1750176970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Xkb7/YL3ihwsD4vleh1xBVyud46v+3hXrxyo7MhXbQ=;
        b=DwOaRcRUuIdP9fgrikkZkJAMvn1ZxFhOuEPon7SiR8Wuo48mk0G2TxabX50Euixcqr
         MNhUQLDA1SnjcWiH0d8IYN4Im/Q9CYXJlcxUn9nHyu3Jkv0eaxgSh/HcvvZFiBWgSF+9
         MoRDIpZQO/kJvxvQcwMYcJGu/pxs4U0Jn0B3C8t81YF7jtT7ClOteBn4GnLeHPaZw8kA
         7OcsmmsF9ldB7L+/vbsSajJq8+1zRS9n6INFDpCaGJM+vpClsh1u2SW6jpS0vMpxfsEq
         hMO56s3e1AOUgQAY/BhEq0rCNTOjThIcI5FlSATdVsX/EJArkAFipB2AR55i+pnFXVpl
         vl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572170; x=1750176970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xkb7/YL3ihwsD4vleh1xBVyud46v+3hXrxyo7MhXbQ=;
        b=jIZTpAK3kbuf4P85ZwBAva4z1ZYj2POXBMKcKGZJxbfpFVbBM3Axzy3/5p6auXnJSA
         BWRqKwKyx5Lf8nUTtHe4obJNHzPG3WwI/l9xOU0KBxyRdJ5FQ0SVBcrOJ/Tralp4H4q0
         3mvGCCyEWO/ZH/Ow/eFQADitKEKuEq4txbdAm8kq6aVP1l3nrD3xEcgTh5bDkhgYLpuu
         CoF+ydF774F0y0zFUgxeApAsYce2vM1TByL/h/XsngUar43YbIDdlcbLsYkP+FYGBGwC
         hJ/FEj/sGOOOR2Vkbnf5ljL6BkubQ1FbPnKz4e0mo0iv862yxf0SfRxSE0EWIphFw4IN
         GJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDztfdTyZrjpSj24cd7W7ZoaynSG284vEZXTAltT0SepY9N59guiIgJE/o0KB7YB1wALVBKXRr1MPdV4I=@vger.kernel.org, AJvYcCX6WsGOWSWJr9c1sxjAJcuuopQjE3UpUqdE42TFwiTj6iVKQjiuhsxaFgIzAI7j2VXSmjHaIqSJb95irZYx5q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbY9bEaPQzkibL7K+W6AdguNdGEY7iX+q0myKv+yVicGNNW1Xk
	lO9HHms4SkQwRMf5CIlxbxxvTKWc2EAtv10G8gdNFeKFj+o4E5fkBVtp8jjwLdLg/p7g/qymUNz
	i7GXng9QfZNGTAOMURbo1l6sI9LrDzzh0/9bD34H0CQ==
X-Gm-Gg: ASbGncthsCmhnvevffyUZ/tr3Y5aZTht59VSQPUeTysJ68Kw/EXQSuzTeJtc2MYDM3L
	uQxCHARCOGj7Wsd0p0a2bnkmRck6GaKJE84wiWk50qaEJxbwmun15xQXLUouhbFDs/w/M6Ylf62
	QRB3auDu+THks05/E/aDKP7wbKpVaFmHZ73utgbv1aP+E=
X-Google-Smtp-Source: AGHT+IEIJ7ZGWF6pNpuacHIoghPiSG52L7cl5g2qCWRvOAgys1Ir6IzSmhdsmVw/nR/dZglOF4hP18yyoLPXMobJv1Q=
X-Received: by 2002:a17:90b:2f8b:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-313af1ee830mr80836a91.3.1749572169809; Tue, 10 Jun 2025
 09:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610151750.46314-1-safstrom.oliver@gmail.com>
In-Reply-To: <20250610151750.46314-1-safstrom.oliver@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 18:15:55 +0200
X-Gm-Features: AX0GCFtaRl9K59JLk3EBpI32TV2xYS0eoKf7f0M8My2wxJX2BgNliVGNh30Rz90
Message-ID: <CANiq72mr7PMMeBGbLSSzS+1TtTwJ6Q0V4n8n=YjeWxuX4tyq4A@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Refactor safety lines docs to sections in cpufreq.rs
To: =?UTF-8?B?T2xpdmVyIFPDpGZzdHLDtm0=?= <safstrom.oliver@gmail.com>, 
	viresh.kumar@linaro.org
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:18=E2=80=AFPM Oliver S=C3=A4fstr=C3=B6m
<safstrom.oliver@gmail.com> wrote:
>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1169
>
> Signed-off-by: Oliver S=C3=A4fstr=C3=B6m <safstrom.oliver@gmail.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for the patch Oliver -- Viresh already sent it a bit earlier,
with a few more improvements:

    https://lore.kernel.org/rust-for-linux/4823a58093c6dfa20df62b5c18da6136=
21b9716e.1749554599.git.viresh.kumar@linaro.org/

So I assume he will probably want to go with that one.

But this patch was more of less what I was expecting. Some quick notes
for future patches in case it helps:

  - Commit messages cannot be "empty" in the kernel (not counting
tags). It should explain the "what" and most importantly the "why".

  - It should have been Reported-by in this case, like the issue
mentions, since it is a fix rather than a feature.

  - The tags are usually sorted differently, e.g. please see other
commits in the kernel.

  - I think this patch would make Clippy emit warnings (you can try
with `make ... CLIPPY=3D1`) because the functions are not `unsafe` (they
should be), e.g.

        warning: safe function's docs have unnecessary `# Safety` section

Thanks again!

Cheers,
Miguel
