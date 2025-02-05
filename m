Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40F219E8C;
	Wed,  5 Feb 2025 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796463; cv=none; b=UL3nyD+DtOxl8bcq0X6bHBtxVeHpVJRkJfrja4ve5f20WxO6eVaBjLZfL5WrS2bqlgBkbBlHiz3EYMp8xC4GyVsFxtQEOn2xBBjAzR295fGAhhksL1ZdmLf+lTSSGfmTxSk/9TvyzDh0A0nD0byR07abB6hXzT+v9PFCZIy+EUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796463; c=relaxed/simple;
	bh=5AmQkvdcVgaUNzDqIoMUy4YbGYmAEvl5/BDdzrq0Z0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/ZgjkF38F0vozVodtrqA6gcFkbJzL8HXfT1NObTmv9lEhVQJRWxVmTByjw5oKkr4FfM29C5t1tCp+RlSaoDn+dBQAGZKcU9L4U3gbnJXl/X/AU06KQnhqk4adHHpAQACqt9nwZ3bGRYVDTWD9hRknuYh/Ka9Srhq8uIppGd9oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlKdGWvH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlKdGWvH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f08216157so912345ad.0;
        Wed, 05 Feb 2025 15:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738796461; x=1739401261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AmQkvdcVgaUNzDqIoMUy4YbGYmAEvl5/BDdzrq0Z0A=;
        b=TlKdGWvHISlUKfi3lC9VPirPwcJHn9FmbxMRbCrwM65EijBkSgnsgkpUvnLuLl1ii1
         G+SBnzrYfLjLMb5M6MOl0owqX4bnlKd1nk9SYbEcgZ++e3eS7c4I81m///UV4j5uLXmD
         XeVZkewzwAWIHYCDN75WP7u7RAzZO/XP4CuxRuR1LIIrHLbJ58WhZTDalILk/uz514ch
         R3dnvVFU0ZQWSCH66GsC3MZ6xE675g75SEdo+nCIQz2IUxjkl9vzTHZ5kBT9xHWRTiKP
         o+WPGLv1kE22EdIo6xi3qCHwQPpOvf1TBJCZ3f7LGkfJhrFyLUj/XpJ9v1pjRo/JpJUM
         vFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796461; x=1739401261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AmQkvdcVgaUNzDqIoMUy4YbGYmAEvl5/BDdzrq0Z0A=;
        b=SYwLoNVOpv7EGlDcw1sdU868suTMPeIH5hIC85Qqr5Jyc+WdaFaZTc8j+17/PyqZC7
         Msp4Wq//e429cKV9T8f23iuVvlZ3cWsrj+op1ljo33mLvksvUNi9cxm4eVZTCUKzvR6x
         OCpHbRhtF6iRo45gnI5RtT7+zuyAn2U0Hqdi0Lr7t4mMXMxL69H+c2FDigRiRAirjew7
         HMbj+ODAhKJUNaaE0K6803WGAj/1FOrzzaOrNtjqaNJPt0eI7ZLZMIQYWvlJlINjiNtA
         m05olRy1bReckqTshpveYJJTw6iIZGOFIx62Hx6KCnOOV7LeGPCqsXm8/nM49PSVPsSM
         06Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWWu2TEwZe1PZAh98B2qaYm9WE3X0UZp89LURMSxLHrgmmghpxZYBzNMcsh/vvV4FZAEmVwSNQmgccBZg0=@vger.kernel.org, AJvYcCXyBzfhbDM+3tJEeMQUGdAFNHVBTzv05IymuDWpSiKPz6i3z4C0M2Luf+44aOE0a7va2J+liMbjyq6hAQ1sTEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGlLMjm8kWXQlf3MLN77ZWJd7hioHOI0+8XN0QHUAKaXgH1W6C
	y/C9E5RDfiI1AsqnHg3148s9rmKbWfrwXBZPypK5CQRh/yWGzIQaE2QR4HGO+xMMt4P18xaLKZc
	DHwfzaTZftGaJfs/YlnTk2uhMNaU=
X-Gm-Gg: ASbGncsw8XjIPEifeeAXM7Ak7/MWHNZHw8qJIyFsPkJ9vjIryEeawRwbdwbvqBDlaJy
	TuZPOu0oOUX8eWVilp2XaCFurTQQSG5eAHvXpeN5LVkGjYWKQhqc64ND7/lsmKanwkNCd2cho
X-Google-Smtp-Source: AGHT+IFbJ9u+BUnXXDDVsL3sLTz9i+gYktjyxL/ovxQqp5NV1Yde2HL4n5l7ISkU8TYwwbRp6MD16hoNJ1iNbtSUjg4=
X-Received: by 2002:a17:902:c941:b0:215:740b:d3ec with SMTP id
 d9443c01a7336-21f17f31f13mr27782565ad.14.1738796460858; Wed, 05 Feb 2025
 15:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
 <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com> <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
In-Reply-To: <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:00:48 +0100
X-Gm-Features: AWEUYZl6KE6WErIuU5YSg1MUVySWbGaSCJZtu7xLUNazqKP-W92l7DkKIDCjAs8
Message-ID: <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:08=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> In case you were waiting for an answer on that, it's because I was
> trying to be as loose as possible, since `__odr_asan` isn't going to
> end up on random symbols we *intended* to export from the kernel.
> We could technically restrict it to `__odr_asan_gen_` to be more
> precise and it should still work.

Sounds good, thanks!

Should we add a Fixes tag to any particular commit?

Cheers,
Miguel
