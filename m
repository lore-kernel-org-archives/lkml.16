Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B01AB6C8;
	Mon, 14 Apr 2025 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660471; cv=none; b=VDOMHQ1kCK4BZaneUUZbYl9LYiL1MwqurIK2ukEcx7aizbD/78H8DIYyQ9kwrSrmKhCVGKBL3UCYA8SouRqbs90nfhIUx5VWs2T11SrezqCACmasJf5yiaMDo//hfPRoMLJ9tKi8gC6Wf3omcLNgh6LMcAwboAU2LcOWiZgc1fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660471; c=relaxed/simple;
	bh=CxrzOdauKcJzylYycFdb5aTQJMO7dQSkIMQUDaHu5WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEJk6bQvfCi8yzQni90q5FnqPD3ZjIPeDvT5Cl2h1hWCs5YqoPd0TdEVnpnNy343DTHuYgw7My2YmqKRvJljgjWMdiZ735A0SpISQXbSMAqs6K1M6kUrKCLL2LaJZAfisWinwB2eCJQDEGhWoxwF8dyBFugCT0A4u/S/ZrA76tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmLgokjX; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmLgokjX"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d587c61a1so316622241.1;
        Mon, 14 Apr 2025 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744660469; x=1745265269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vf8bLHJirhvO7YYgxMlohhejQ87qoxU1Rt/xBOc/3Rk=;
        b=NmLgokjXo6ZrfeFoIvA/g0DEFuCTdabi0poOpHmeQWngeycPMMPsk5xxFRkom1O/QB
         gC19jdiLttXyrzZ4rCormlLnfvAkpi/z79NiMx1zdwvgA+Elci7aUImwuPCBW41+RIUP
         nMgv8VHfFN/DyHT+1D8Ldph0KVIhKB+JyCiTTQkuWMCWRamN9mLPUbbSYkYAQFM0RF4g
         rHyKH32fQmLOHcGRy2UgmaM1IQN5qM443WM4SQ8/0CoMey6+rkDgd1X72BTFpMx5uGPQ
         AnQFCaMslxlLT4itwR8fTjKlutjRcXVNjZc8vC7Qti+WIimJLNASeCzk1dDbPuAsl1eY
         3JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744660469; x=1745265269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vf8bLHJirhvO7YYgxMlohhejQ87qoxU1Rt/xBOc/3Rk=;
        b=V4SePl4VA4HY1m/RC0jFwbR3+EMyXxs41vz2tx8X3P2h/9yuF1PiZqsFCElEXKAjWZ
         4mMa4XahdRvG68C+Uhec3A8wGrWxSWhRHJIZS5bhsIzSfYsJrvLQBqbBWCetj/iAKxTm
         3SsA5jxUqn45P6EvErPyLoMAsRjK7JRRueiFnrDgjp0oQxqP6C7k6uVlL4qHAHGpAMC1
         mP97zYqsK4sKIpCmX4BJrmJb+VmB4xwTm6ThUrj8WsmO+9NZAtX14oum7M9L+EQ9UaHo
         M1Chkso+rM7QG4RsRrFdIC0tZ5HYCBOIPqackOm6LmyBA38SdbINsZELpmx6NYtnTx/S
         CDhw==
X-Forwarded-Encrypted: i=1; AJvYcCV/OwKW2UbWcJP9VAwwk065TMp+J4Tkd8skEpFc3kmGcmaq4O8gAjkcohOjGZje4t5EcQ2ByizYbUBhuZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0PdNmDBpSZPRnKtWJLg7BeG/cpVH0Y59QXNK2oLrUrcdnIJh
	zIQDnn3phVrJJL8AsNudgcQy1YILcZ/dtynEQIsxrmWOKuBe6pfNYJdbRPtPuQwPSwqFYJpSWvY
	fOE4IaFnYz0vJm7vF93SQEse96DU=
X-Gm-Gg: ASbGncsQ2cEIG+gpS31QqDiJXy+eQL+xYXGZn1IBdIF7/aGYmf9SNTBDV3KRKgci5KA
	ZMzuDgLMHcW7MjsVMJ/RFHFBmJloRvMNw67z7twqUVa/sD5dkir7KGp7aEb1lzYThcXyyJOXyx3
	7U+ZFJiyUnrWj20lx1SYMsefw=
X-Google-Smtp-Source: AGHT+IG+rcBkfFGyIORnfx+Z25W8pCuFSYmg1heCo89UDl+qU5fME0z1Plbldd/tzQBclX7mUx7buEYI4lVMes8GR1M=
X-Received: by 2002:a05:6102:330c:b0:4b9:ba6d:86c1 with SMTP id
 ada2fe7eead31-4cb421a1c09mr259410137.1.1744660468576; Mon, 14 Apr 2025
 12:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com> <CAGSQo00LhscUpQCpL9UwkzK5c1rD1QxutZTOenuZP1d-B==KBQ@mail.gmail.com>
In-Reply-To: <CAGSQo00LhscUpQCpL9UwkzK5c1rD1QxutZTOenuZP1d-B==KBQ@mail.gmail.com>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 14 Apr 2025 16:54:16 -0300
X-Gm-Features: ATxdqUETynL24PLb2kftlHO6o8K6jgkaoQiCI4jIj-l-gwO_VifHmhtA35larpU
Message-ID: <CABm2a9eEaKWEtzVkc=ErRCXA3MCMG9S+9+ZU0111S7gcfimf+Q@mail.gmail.com>
Subject: Re: [PATCH v6] rust: transmute: Add methods for FromBytes trait
To: Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, ~lkcamp/patches@lists.sr.ht, richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Consider factoring this out into a helper function, e.g.
> ```
> fn from_bytes_sized<T: FromBytes + Sized>(bytes: &[u8]) -> Option<&T> {
> ```
> which you can then call in here. If you were not trying to handle
> `?Sized`, we could even put it in the trait default implementation.

What do you think about
```
fn from_bytes(bytes: &[u8]) -> Option<&Self>
where:
     Self: Sized
```
for the default implementation?

> > +                if bytes.len() == core::mem::size_of::<$t>() {
> > +                    let slice_ptr = bytes.as_ptr().cast::<$t>();
>
> There's no alignment check, and so the resulting constructed reference
> may be misaligned, which is UB. Same below.

I see, I didn't think about it. Good catch and thanks for the tip!
