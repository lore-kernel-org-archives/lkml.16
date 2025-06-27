Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D02E719E;
	Fri, 27 Jun 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035434; cv=none; b=VTvS8ZJlzaK4g8Gc9b4q+Aw9kZC9g4rb21Zz4CE+5ppBsnyde1tOsLA6Sl5TzuFtl5+DTBnlk6uxWHcK0ueQTOUoSeNO15NT6WKfZVzKPD1dIjdRzDDfc2+HwiC5V4STVqkGIkZqCC3DBY2Rm2yBL1OY5vBiR1KWZ8RhfL/iPmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035434; c=relaxed/simple;
	bh=dkWLuqXQ9jGaoHsIbfsCizoj73GQ2Yh5mCUU51TAp9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlVBkDHDP7Toh4aWPZcBtGisZGYPKulbAJY2cAD94CpEnJmVYwTbi8YLWT2+o4afQY+/9yT3GhgEpx/pFn6iCD5+A0p3Q3M45jD+gTT3KVCUQ35KAuvbnrEyQjCUMrl+xx/mEQ4mfwtos1YH+1jQ8i6JY1vfs6DLYj7BLOVq4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aovxg7Km; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aovxg7Km"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fcd6fe970so393203a12.3;
        Fri, 27 Jun 2025 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035433; x=1751640233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkWLuqXQ9jGaoHsIbfsCizoj73GQ2Yh5mCUU51TAp9s=;
        b=aovxg7Kmy8lXjIPE/pbjwEhurdYXYVV7xAHDbHYclI683B2m82cVUjFlDgY46jMVOz
         P++bxQ+DvhutlQ74AiF1fPqIkJRAyiYSjah6TJfz9rDuQjLbzktT35SAPK6PoWfkvg4w
         ULxZFeJ5+dncioetwHSH+z/+d5Y8o/+UtDOh/HcZEwW4USji88gu4evF74ZkAUaOPj1A
         5w3yIa0ws/d+KDLhLo02GbnrIhsY8ouuS2Ho8bK3M6vlIVT2haRxOzNa6zcaZ/EDbD3E
         fPYVETitT2PF4Xp1Gzt5N4gyd5akIUWTPp5kt9NJAfbRMGzLNc7DNg6JY7DY0V98orCN
         SGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035433; x=1751640233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkWLuqXQ9jGaoHsIbfsCizoj73GQ2Yh5mCUU51TAp9s=;
        b=jerWY2BCQkWbOHRAcvTtlH8Ns3eJ1mvQrA/IQjzVHnJcSvJu+Yh0iNJZp4rV+hVsa3
         LMWPJ+rOeb/Abkq4tScCR5tNEja6lJKbovPSQxtOkhMG6E7eFrq5smSxFV62SCiC+ikX
         UkPN2lLdNI6xJYueESt5HzES+PEnEWeGnnDF59rQ3D76z4pH+Yd2KBfBxAzgo3vSA4gw
         pR/sqdljUcUGM5sZOPnn+lo91rYwz9u6akEAgBHGK4H7wYlN4R/tuZsD+IQnvHuY+MKl
         SiOZ2MCDkf+J3kfPhyn3v18cvlZ/skWFYNWYD3z7WyqDDwGFs+IHmMJ9BvA0Qqvan2gv
         6owA==
X-Forwarded-Encrypted: i=1; AJvYcCVWU9p5LtvYidUg3daPKl+YYNTg6SVKM5m1GUdybZ46JwApJSOA4sCm7juYnn/xE1Z/gbD4EXXS6iY4uMCMs3w=@vger.kernel.org, AJvYcCXqzIlrQ9wNEQKeIbXsYUpwZ71lv/c9FGvf3VL4IOK0iZ/K4wdWGQellW1Do6KLaNF5cyxFf1DLPm+6Ii0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzigkzw8T6un8E9R+fHj5lgUwDCvPspOnsEYK74javoV1bVZ2YZ
	zPnp+oMulzHZzuefL2AmHFIyM5Km+mWCgTxAmKLpjLZR9xmfqf/JK7T3LiCHfsqu0EU0qSXWkol
	MxdCpxImrPnk57/iulU2/TXDuxXgkwxo=
X-Gm-Gg: ASbGncti4JK3u7uvJF8JdZU9jsYnga+jC68Jlm9fRfhwfDZ5aTHjNagHlYa/iH7k8Dq
	2BNBlu1fESvQ/JQfwaqa5BjpXLvPq2y2AWzCrmtxNmdKHzzVDGMjB806wHr/0AbBZLX2N7/rxoE
	SGPndLl+ldDZNx0CA76SwYh4RzkVCvXePHJOhPSFxE
X-Google-Smtp-Source: AGHT+IFz1EgMhntK/7DFq0LsGQKefHHNlYd8AB9Rq7L53oQAqkN0v13GflODIariPpgSgVJU5HqpOWnWP60lNhIwdbs=
X-Received: by 2002:a17:90b:3b47:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-318c92b8310mr1958790a91.5.1751035432797; Fri, 27 Jun 2025
 07:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
 <20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com>
In-Reply-To: <20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 16:43:40 +0200
X-Gm-Features: Ac12FXxlTsrHpfm9CdykVLXc0039TZWm4t7pHw1l2-Pbcktixmbh_29RFGYmrm8
Message-ID: <CANiq72=+-6UCyy4N-4vQ-r77Jj9Y2ZF+W7Ljaxd7jBbE8DYoCw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:28=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> This patch is also required for my `UnsafePinned`series. I'm not sure
> how this should be handeld (in case both series make it in this cycle).

Danilo may need it this cycle for
https://lore.kernel.org/lkml/20250626200054.243480-1-dakr@kernel.org/,
so if it goes through another tree, please feel free to take:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
