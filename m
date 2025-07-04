Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81A2AD25;
	Fri,  4 Jul 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751667367; cv=none; b=B3seBEjCL4+jSx03h5Ur3nDrTIx7UDm8nvOinMl7LRuLd02An/braldBlUbFT8Y2HyzyuKDPcVpu21WAE2sX213kBplYe55Y3FUF1rN34EjDAr8Us8bBe547aZa3fYWTgEkcHLT4mQAbNtfEgXnLAlapQMjQpPvqPQoG0EaEccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751667367; c=relaxed/simple;
	bh=1qPLH2DUCtpS7ngyfeRXFfT4BV6higPIeS0SuWPwrIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obNiET3Ot7pzjJqnBDd415HIHVXjj6/J926kLNV+3XeTHh2jLw0GRk2kEoXtR0VhXiIzUOvZW3B7RF89rYhA6VkIFJBF/9G41SPm27Vi+WqKJ25UZ2snXsqe1WUWTgm4fCxy6NyLj9sVL5iSwDEb2WNXBOdo2M3XBRjiPpVcr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2cnkQhQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2cnkQhQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34dde96cbfso63803a12.2;
        Fri, 04 Jul 2025 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751667365; x=1752272165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qPLH2DUCtpS7ngyfeRXFfT4BV6higPIeS0SuWPwrIs=;
        b=C2cnkQhQrF2B4IGqgxHs+pkrlegR0GmEDVtv5OzXeiv/X/+ntaecZ/q5AbT7n+ocm4
         YjnlxDkFu+EWMzi97zHFm1pVURnG6H1y2hNiDDl4yEmCT1XD6lYI1SUlblaejduUtYkr
         s5WNPpztlSVwm+idRD0V+ketjz7+hdSn1uGdQr6LxD54y1TWN3GKgdgpWmiKM0+yR/F2
         ZXwXgV288lGUP/jVPDhcNy7YnwzWY9CWnFmsodJCBVDePnenpKWVYY1g29v6ZBSqD+Wn
         cv5F7jZ2xYEXzWnC3uS8fCCaSJYD3Bv3oEDgro89BG5Jdkyt45ji3MWjqYgob+naCnl9
         VhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751667365; x=1752272165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qPLH2DUCtpS7ngyfeRXFfT4BV6higPIeS0SuWPwrIs=;
        b=GXaOADtXtKT+59m324l1jdap+PlCc2GYEd+VzhixBHVp60HNlq1zpISgUbRng6SkDc
         5pPE+1zLfc9CGeiuMQlktS20RhvGeTfNtdAGV+rIiy9wRHl15bmLwXaiF0nUuF8vCpt+
         M5TtpVy/LorZ910zKsTfyhAJYpEW3oWJPKDEZoGIDvWs3xFWyJtO9VBrrHvfCkg0vEXk
         uzOJ5LczgLG/y0blOlbvb/JZ7SfzHClhsHHZUr4uxH24mRdzrp1dr7MjG605WwW24hrB
         urTD7Va8s5oJLELQ5OLbwR7W5xXK+bKnL5cHdun/4qfy25f5oTHIbGbi1+1DEszf8ehv
         WG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0zh0+/E37iZbk9HxuWzSrSQlCTZuR4h675VaF0KyfhZ2Pkpnf762KCzXaCaW2NFHQ3fWy+O3TLJAS0scgI0c=@vger.kernel.org, AJvYcCXTR8WI8F7BKuC3i0OsSdE8ausesG+3+4OuEoUI0zgG86OqXnxwMPuKEHoxifsYTyKtxtYcdfIvkcIQimM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNokDkXAbd3kOLJyUvgQU2UwHwGuRhjxJA2M7iCEQFqZN5qcDK
	EJsPcH40VvgBTx61imtuATFsJyDxZ49IlxOXPum8AvYLSOnmo2OB3LJyl51w4gK2hfVUhvW//PE
	UNl3B4I7cyn+zjgO27m8QsYrALDKt0dQ=
X-Gm-Gg: ASbGncucB7lCisd1KeXJKt9Ys5jWHnzTZP2bpKXXmshX5mIQ+lYV07a0UpcqRIvW4fr
	t7ZC/5fMydF1/4cINz/INJsPqKfOQXsFZGtkFGrFVIg7cqVmeLYOkqQN/DY1KZmnYRwn1eBUYVK
	ZXKoh2+xNcvtDrKRsyuFtRLLPveIpRPMF8msNEypK944dG
X-Google-Smtp-Source: AGHT+IGmQH4dNb8TFmji3Oa7QAVqdfXqa1PncIaNrishd7qZsoqjrndooJiEnVDz8dB5O53zOlOlnb49LuuEEbVUUiQ=
X-Received: by 2002:a17:90b:17d0:b0:312:e9d:3fff with SMTP id
 98e67ed59e1d1-31aacb4118emr2011549a91.1.1751667365131; Fri, 04 Jul 2025
 15:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704054539.7715-1-work@onurozkan.dev> <aGeEcOEYXiLju-Lj@google.com>
 <20250704181419.0a6a4d97@nimda.home>
In-Reply-To: <20250704181419.0a6a4d97@nimda.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Jul 2025 00:15:50 +0200
X-Gm-Features: Ac12FXwbkOCrJSpH8WT1tsVCnsqS0WBQLMbDsWpwwUfk0ggJcHa4tKtAPJTEIKY
Message-ID: <CANiq72mj1AEH6S+kZ12D2+ib3jVPJHo01L6D1qhHz_9_FzwA_A@mail.gmail.com>
Subject: Re: [PATCH] rust: rbtree: simplify finding `current` in `remove_current`
To: Onur <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	mattgilbride@google.com, wedsonaf@gmail.com, daniel@sedlak.dev, 
	tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 5:14=E2=80=AFPM Onur <work@onurozkan.dev> wrote:
>
> Looks nice. Do you want me to send v2 right away, or wait couple of days
> to give sometime to other reviewers?

Unless there is a particular reason (e.g. it needs to land quickly),
in general it is best to wait at least a few days.

Cheers,
Miguel
