Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AE2AE8D;
	Mon, 31 Mar 2025 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418232; cv=none; b=FjE1VVjwJniDfXrjQj5hFlVaSBmk2OnYYE5VEbkUMNfH5AJsewvCiSkY+3+QZ/kjKK3OfNxAWZf1ZcW/yx2IGjaNnwknDoHjcknkYp4G7FjmMja6UIlfvGNDLeIfMseqYSBNkGGv+mMioK099wity8grs2iSoqVO/hS0lRiGi8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418232; c=relaxed/simple;
	bh=V13TXEYs+gdOh8D8H18+K30LtT1Ev1X188Pm5UtMY7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVYrgQSQIi336EUiTCV63Dr/u/MF/PBDjcbpVZ0xcXpkr6SmnEzlSdv4QmBCyM5FBAMnbBbnIM1PCkL0vOi8blNUik3Ij+gUYyAmmMLXs0JFy75YeODoq3FWkzOsQNj4UIYJBb0JFRk0JNAOUClDeCYBKWkV+aVZya7+uKDKSbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCP72K5Q; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCP72K5Q"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so1051128a91.3;
        Mon, 31 Mar 2025 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418230; x=1744023030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V13TXEYs+gdOh8D8H18+K30LtT1Ev1X188Pm5UtMY7w=;
        b=fCP72K5QmyIqQy0ScefZBHieUkPRHPlUdJbVYJ0B5IiX4oLAUpFFqf11565GGZj8oS
         dSOuAcvSB42eocNnJFgAthJMdpuVxQkgAjYa/R4DRZFYkFi49s7Ee7y5vsPShxcTbURZ
         wisAjqmLm53Ypcy/p3F4o5cs2V5A+2KQAjcY8kZo/Rgvdy5KoLKesMnDaKNW70CbixX1
         +l6q+jtcN9xEIyHL1sWSKJE3/scPyvMnpmLokmfjXgJHkiiyBhCwenKGdqHhaf2azQUP
         REy7lsZpDZBoO3vG+r6MuMPjrnb8CoOz2Sw88i1fBvJXuXw2pIGZ8Z3F+GD+q5tKp9bh
         CD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418230; x=1744023030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V13TXEYs+gdOh8D8H18+K30LtT1Ev1X188Pm5UtMY7w=;
        b=jVWWh98XLiSp/MowUW4u3bcxR0mPMuEVkrERA5A/bpSgZnKQKmMUCvr4A601l9uWzW
         XYiUzjXyhhzFUuMNf7CYWb5ZW4w4WykGdwQzOF9n8t/3Kwy/lMWrRwig4WaKXaNX4UgU
         nn3SxVvWABpLHrHD7WA07XDtvPKuje/xBQfe9V2hKmNef0U/NWvsYYCZNpVcSCQ/zxue
         X75+fHIp9neFksV6Bs3nIbFl/+LRupMNLW5adAV22V7T8OHtLbYr/CH904LbpXcUedwL
         fCP1yZh4Y1F0LDyJ0csR8DiTbUs1Ew+XtWtaiMezs2U7kDJP/xGz0JUht+fLcObERpBD
         qbFA==
X-Forwarded-Encrypted: i=1; AJvYcCVynvTdWbJYSFu23d/jWKw+vwnjDoarnZ3WQCSzA3NYsaQtSbpAL8r7o/VdSQyJbYkYFxzPrRHf/qUb6l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWeFhZDrvt3KPocOH2AEI+5hHqwphlDCDtBmjzLAK7/7yrkVj
	j1i/Eyv2Ldb5e5+lsmg7sK46Yy0l1MNWSPpcXPDLAjNsJOs6XMqXzph+OeewrN6sgabi024eInA
	oAnjMkkvjUYLmDW16fgsysmobLFo=
X-Gm-Gg: ASbGnctKhuiNnSGtqmHIcXDz9FjnjXwbHc1Q6PUZpCNKiIy5hylfosy4bwcUGAvvI8X
	wKhwcinRy4nRQN7Rh1LEIHabwV8EP3BZ9XRVl6XjOJpIaJChGpp1hForwfMnPUzv6alUP6zA2CY
	EA1FrWk/E6nL4pR3QHC/3VDZ6pUA==
X-Google-Smtp-Source: AGHT+IFDJtszf4FnDrl4vN3NfxhT2qEwM9wUZcfqw03gjZvpoeVX27wmtKbKhB0mEIZ9SWY7bLCsTsuMDJdT6r6Egfo=
X-Received: by 2002:a17:90b:3ec8:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-30532154891mr5493742a91.5.1743418229962; Mon, 31 Mar 2025
 03:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com> <20250330234039.29814-2-christiansantoslima21@gmail.com>
In-Reply-To: <20250330234039.29814-2-christiansantoslima21@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 12:50:17 +0200
X-Gm-Features: AQ5f1JqnSqdUDZMP-ExtdHophf4ZA_hk5rs9g_dBawK4iwbGj0u2jTRempJEa8E
Message-ID: <CANiq72=GWwhMEfwBgUFpEUFoT2Wga2=uhH6Nw7fotQYjz2G=EA@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: Add methods for FromBytes trait
To: "Christian S. Lima" <christiansantoslima21@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, ~lkcamp/patches@lists.sr.ht, richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 1:40=E2=80=AFAM Christian S. Lima
<christiansantoslima21@gmail.com> wrote:
>
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.
>
> The conversion between slices `[T]` is separated from others, because I
> couldn't implement it in the same way as the other conversions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>

Hmm... We got two emails, both with the essentially the same content,
1 second apart, the second one without the v6 in the title.

The one I am replying to is what seems to be the duplicate one.

Cheers,
Miguel
