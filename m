Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A0B2AD13;
	Sun, 15 Jun 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749993401; cv=none; b=A+9hQdITG0CYxzkYclemUO6+SeigNEZwuq780WW2mClYW1KAyBScNq1NArNrWJOFPH3fYsJg9Sqep9WzGKMRTOFayBZIEWRI6AGNska08ertmZ5H8848CaQPTYQacPbd+MgO63pmOnrmXNDcX+D228Tn83Tm2DVVwk9St/OIKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749993401; c=relaxed/simple;
	bh=p3jNLqGafxeNHm7HDBT0KkmwayPPL/WU6WBNrmX7NGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsWq56I44wwp8r8AWqkcV3xlV2fuEec52FhZlzZz7KFqQWcVhxudWmo8n99KOqfPExMvY1cDUbn0af6rHnc+KCFal4KRGL1SjN0zMn5wz7wcssjq248/b5luRtLWvqoBzIkASARbScKS1O65yZk7/eK37TDZM2x4D+IEqRy9SGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+KC+f1k; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+KC+f1k"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313336f8438so735453a91.0;
        Sun, 15 Jun 2025 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749993400; x=1750598200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3jNLqGafxeNHm7HDBT0KkmwayPPL/WU6WBNrmX7NGw=;
        b=G+KC+f1kJuYN/T83WDrXdhMCi+lvcIbBWQ1z5F8L6Hy6+2fYZ/ghRza+8DJPVGBNPD
         HCONgHMbqfKUDvGSkryFJzAZ8WLpUtxRILGnsxRrSAM8z8lK74MeJUQTONhw2d/KSUXD
         3aAORiklOS9SYp78fTbqcNDjFObEKBBDHjlFaBiQOmRArsX3GZMPfW44pHV04pEkeSB5
         V2baOa/qZhp2NvcvWbUfOgqmpAHGoZQOt+XbWxDe/dSICx2sJPG1+IbgEGM00/u7CtIQ
         HmdolmRr9F4umksjajRlzSkzoPgs005YLV7NH7m1spUDEHDhzjhRX6f7rvm9j/Oi7n4x
         y4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749993400; x=1750598200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3jNLqGafxeNHm7HDBT0KkmwayPPL/WU6WBNrmX7NGw=;
        b=W4g+cY9QdZTbHhM3foDIxyMd/TiOZe+OdemviCjw+AqTSJc4WH7cY6Wox9pndhjKgc
         7boeT+LPzjhbRQ4jEX1V4fteJYvtmP0J/lHYgjZz5xAnN/lRh3zyTuaCgX6wQDhiYnM1
         XWU0g7RBnUiWr1lcYUrG/43rFjdAAVkq08ltTgPTyrstGiBcKGyCPay0IbVL6RLqTDuk
         oUsu9/JcxyzS56D6QHnkLgGQ/jows2hyzKjxztvVjXbPp34g6e+Kl3qpEJ5K2dTUyE9q
         Fp0/ZCVK94KspRNKX+THi+ynDEWDJ0cFzLT2X5+81Mq87vPt6DsnHHG/63eqINLgYs5Q
         KwQw==
X-Forwarded-Encrypted: i=1; AJvYcCUm5ItZUbUyNX0hB5rpqbHNarGBi7sQL4G0HfN0cq3AN7C4vipxIPQUXC/uGjtA2yAYB+lMi6pB1RSPzSSWBxs=@vger.kernel.org, AJvYcCWnFP5NgkaCqJhuHIP85uUpV3TcjpWFu3H4zXNxDIKI21E86O58kMy9dUja+iLk7BHhwJ6UlWM9qboaFY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySdyOXqf5AVrMNs38nNAIAtFiOedQnbQUWqtd8iKfZlEX7jSPv
	KZQRtSB7VSAp5DeSTvse1RUe15MhXuCemIL8HNrX/4tMD1PDp4oK4HNES810hXHoUG23l6DILBc
	jXKt04u9YIEnJdAvrMklnTbA0dyjIZII=
X-Gm-Gg: ASbGncsPEER8NjzOIQ88pvgz140pOxa99ri2x66z+N09mm2pa6Q9aKzNkQ6wZwYpOPV
	gPZuCiuLlk/SgrGmugp3Z6zOr71uOwQ/RYcJMzWXca0u5bKg4UJ7ie/uODu/9MdMFVPxW40w6GS
	IGr6SZTWR8SgARlwuC8TvYxiJg/KheFdaNRGsEF4hvo+s=
X-Google-Smtp-Source: AGHT+IHfD9wE0UcVitfBbdlSWWq5PGvfTwODj/fa9i+L7DxVYZHSecA4IdmZ6heAm+uX02/86x9Z0jPqDM9CRUPlx+8=
X-Received: by 2002:a17:90b:1fcd:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-313f1d533d2mr3412187a91.3.1749993399638; Sun, 15 Jun 2025
 06:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com> <DAMHZIN35QQ9.3N5WSB58J4WG9@kernel.org>
 <DAN417QCDAVJ.1TNY82G9ZVDYF@nvidia.com>
In-Reply-To: <DAN417QCDAVJ.1TNY82G9ZVDYF@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:16:27 +0200
X-Gm-Features: AX0GCFucjYLuX-CGGVxsuSwjzl6THc4TRLQSOCxegLMPIAX5LjZMxYe5qVksyro
Message-ID: <CANiq72mEpM1vyuFEue12aDHdheXCZ2oWiuzXkN6-D-KkHHhuBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: alloc: implement `Borrow` and `BorrowMut`
 for `Vec`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 2:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> That's fine by me, I was just a bit nervous to start a doccomment
> directly with the examples, but in this context it appears to make
> sense.

Yeah, that may be my fault by emphasizing a lot the "title is used as
short description by `rustdoc`" thing :)

Here that does not apply, and I agree that (at least the title here)
is not really conveying anything.

Cheers,
Miguel
