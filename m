Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92D2BEFED;
	Mon, 16 Jun 2025 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108807; cv=none; b=o7ReBNeKu2SrS2aY1nD7RrdvjDXXvkjQCUkctgRP74HWP6+dWZeHl3YId4jNVwZGxNFspmqS1L6d6GS17C8lKNIqDr4cN+0/rpd/smlDd/En0Ku4zCeE4ksqsaZoa+o7crMKZ7jDcf+mRUeSxl7WGLvWKPe0WbO6+L6l3QcfKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108807; c=relaxed/simple;
	bh=4UIaouMsCRqr8dBEcgHI5BI5QkXJ765RuxIaZtUU9a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVpSWXAhZm48wFx5JBUsZRgNWIw4kwYzXYvjhXdwwRsu10F9CqJgfo4J4ruox6h0PCrWo2Ve2T5RvGgpj4WSHDZEBliCar8FHbc26BNCpyynjqkvBmkzphbPzCWJDlRENINuYYcDB6ilxb/vvhc9z+fYa+AC/GHHRp/9M52PglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvDC1qAx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvDC1qAx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234949fd425so5837005ad.2;
        Mon, 16 Jun 2025 14:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750108805; x=1750713605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zr64jz9gDGuJ0hnnLVqhsR2DJK3BafHW6k53/hKx8GA=;
        b=cvDC1qAxaM3g0Bb2r/VDw1MJyU+aPNwDZfCZGtpc8RzuWp21/r/Khe47vfxojwRBQI
         jt0aqAZgGgNF28Pvdxl6r8MShuBQNAmhidVOrcOLib9+tcVB0/0p6Bt/8yRY4b0mGpJu
         euPgn0w1GJLrhqi8vbGNVjiPDugj9PAfbE7XSRIrFiMUMN5g2h/stSApDtt3Viea9rf9
         ktD/COrADtVbeg26zyC4u3pQsRZgCBohK7qtjoyQISFdtaofEXON9WckkrHXgjjT+CYk
         NoYAs3Q7V5iRd6B187a//X59oadpIJVxbTrSa+x1VqenCU7F8THdD5v4CJ0y8MQAdENt
         y8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108805; x=1750713605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr64jz9gDGuJ0hnnLVqhsR2DJK3BafHW6k53/hKx8GA=;
        b=t5ZOfP3r3s5W5pL/Z6KSs7pMnoo8xWBGvCTIV9Wj3qfeDRz/LlS7nQ8NPnD647u7CN
         fgH5klHp1JMOpOAChNzZ8WWTKb/q8JFO3LdMn0btbhc/NAkeF1AqZrteZFr75I59ZliZ
         pp7FueEvT0dfXx0nsEiZq7YLjoZdNLVFN+35gEEmTgkETXlgp2hRgLol/C3P8qBaNAcs
         6EkBe/mhYM9uLpDZVsXbOYmye/oTx+la7WVqFGCk4R3YhgJVU8+8T+iYKxLEMeh7ixL3
         gJKN5I13eYKBokNu+XqRRN35cH1uc6UoCK8W1L8BQNxrKGAFuD7Hg+tFYIJcgOJQr42N
         n8wA==
X-Forwarded-Encrypted: i=1; AJvYcCX+yoryuWtklDOd5xYwzGMlLT8wZhsAgHS5tTUE8HWZOSUugT3f8NnuVJ+FM0BAGAQ6mzXuFZbmPP5c2HPoFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHwJFBTCqWnJ7F1BJE+QFmu6Z9oDiPMndaDR+t+vhR6Y3FOMI
	uokuMYcgy+s5qx6etq7fAbjXgBYePlqGf1ASSHKZPKZ3KZ9MRD2M1VPxZVcDMlGVl32plTGGZVn
	Q0C9wUTAeHUPLcyN+u21Mgo5aXxiR0J0=
X-Gm-Gg: ASbGncvAp6z9DWhE7D3XxIwFWZf/l9Fdge5ttQYDPm8owVl3D2ePVG/+UKPgAwic7n+
	tFE3CLfEZDa8G1veCLaDkrcDZaIeFrHzgs0mEUQH9cmF8HHhhuLlWiTninsVBAoiFWrlSJMzXNk
	+8caq0iAWeBwtzfieIpeMqoG0Ja6o4tlT4I+D6buZpoZo=
X-Google-Smtp-Source: AGHT+IGDZw7b7D7QUpBKsXb/3kKD9Jd4NzRUwttJlo1ZeWVSbIPTimu/WlzlYGu3nb9Vzh1RPGp5Isjwv8IQ0/e6aSU=
X-Received: by 2002:a17:902:ea06:b0:234:ed31:fc9f with SMTP id
 d9443c01a7336-2366b13c9f7mr66317935ad.11.1750108805275; Mon, 16 Jun 2025
 14:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
In-Reply-To: <20250616153604.49418-2-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 23:19:52 +0200
X-Gm-Features: AX0GCFt6NXahJr2ZuSc0fByzY5H5l8XaJxcLGDzA3jWHnSy2oybsowxt6fNWv8Q
Message-ID: <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:36=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> introduce a file_from_location() function, which return a warning string

returns

>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized=
))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_=
dyn))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
> +#![cfg_attr(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL, feature(file_with_n=
ul))]

I would change the config name to `CONFIG_RUSTC_HAS_FILE_WITH_NUL`
since that is the actual name, i.e. without "location".

By the way, please add a comment on top, like the others, i.e. something li=
ke:

    //
    // `feature(file_with_nul)` is expected to become stable. Before Rust
    // 1.89.0, it did not exist, so enable it conditionally.

Alice: the tracking issue uses the wrong name, i.e. with the
`location_*` prefix.

> +/// If `file_with_nul()` is not available, returns a string that warns a=
bout it.

Could we give a couple examples, i.e. of each case? (No need to assert anyt=
hing)

> +        use crate::c_str;

Do we need the `use`?

Thanks!

Cheers,
Miguel
