Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DC19E97A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025315; cv=none; b=VxJnq0XcYkyVKgxlw68CPdv0zlB+sE3HDiPgnI2WiEU2Rt0TLvHPxDdCvpxdjjRFR2kEM/23D0Xa/uwYjlIeTengSTK3W9Zz6rMQAev9kE2Inx8TXDNdwgM3WXNUX/C41nkmw2ejiGI4gjPXwF/tknZviNZaaEDB/jpCEOSXmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025315; c=relaxed/simple;
	bh=tWJynBQ8CHhj7jV7Vp3Z6abczzsvOKNiIwGDPUWojtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZduhyPq+Rt7uugW0sZw+p97nazTMPade/GVDtXBEc69FkzLGtSq6BJiGZ7m7G+nmDuHQE9I9nuMng6ukEBTI8A3+kFgMQ23CyFPua0yh0jpc963D+x4E64VVs2/f63QVkB10iCrB+oNtCae2pFHDSIND5HZsJX3Z0DL7yI/eJYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7EIj/Dl; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7EIj/Dl"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so736231cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746025312; x=1746630112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=myx4IoSQ+Cnx4z3pEYIVoj6YP0b0jEzjgN/nOMvSwGk=;
        b=D7EIj/DlOEPQaU/9I+rCEGWIk+d2pIgtAfIXKfmTaO2Aorj4+gvwRm1ISmwk3nDSXY
         8Shi7KZhhRy46+j7zFlucxm5s2ye6JjCznvSfkuX/O4jrcPipKd2EUIpQwEr+dCD91zR
         GkW4KT+s9jiTUzgV6dhc4vxnGkBicGYh8lmoe9MZZ64wgjpg0EBncH1eZ/RNSjzIff0Y
         eMiWSW8LE492bjJKlRKP9tVfjpCc/L3evK6Kr8jDD8MLJD06iNuf85v8gcu2FVTHNVX6
         iBFEBasgacnW6dTdRkJAFxfmlK+tumTf7zOpG+J34X15WVimTq1m1/TCsERP5Dq6MQ+f
         MjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025312; x=1746630112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myx4IoSQ+Cnx4z3pEYIVoj6YP0b0jEzjgN/nOMvSwGk=;
        b=N0GEXLl2jd1VJz6d6OBzpEkd9kCeClgQCSFeEvtskLX4ZD7yyzsNmk9dO8VZoLdJ4n
         JseRoPwtRXAN29Tv0tLtUBbusrMPTET5gT+m4Ba9/puiVyEDQrZ5t465IJCrXk52sulF
         hVGHefk0MuiemNXJ9jb0t66sJE3j/cHKf3Hn+MF5+7PGbXNE80JjBwdS7Ut7OwCuWXBF
         au/Wlga5K21fuGNvuCsaGbTzIdZLc60S3XEq6w52GXTEAnbkP8LiQkGfXh2sADSJHwpM
         i6TLmDxR9VDYGXyfOLOcZEyJD32BsF16YeFTgim41wHlu0+mXRtISwMsiH8Ag6ziWvc4
         PB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy0fe627o8kp4pcVEsV9GeEq0VWmZA6FN+EPwLmVqJ3vunRL/pmf5eZDwY/MyqbGqJQ0gPmyIkJSaW3LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8G89lT1NCf7pom4UVlD+z4SEtzyHIXEUIJcjlWOprDAf56/K
	u1B4bgYzXug9TQDFXC434fRf6TokQHv1H9bMBpTJ7ebBkAy+aDSEhyrpc+5+tw4HwMjQrYfMpaB
	nJmULvWJJpZ3U/43sbo9LlnwoC5pUhPstzF94
X-Gm-Gg: ASbGncs/YcH8ssX45xWAmKSu7U8SjhIrR1UB4+GjOo13qRVZb58UHgVmOR+uCt6wYIe
	903FVO7sHRyNGORgtBLmU/mmMD74X2radQKT6mG0M1scuzx9ySqBpxDSm1eKR89+j4TUNRwwnfq
	aVINak6o7orc5mDyo+t/5U8AfCY7Z0YodBIboxbx14FZ8a07+tWSj7dzVfEXPwuA==
X-Google-Smtp-Source: AGHT+IFthSFe2kjB8n8MbNeu3ujdvAxwQ4Q05Cnykk/OUNTSbEuM67eRgVTK84hV+al4y7uf41EtE9jWSztCH/k9b7M=
X-Received: by 2002:ac8:5d50:0:b0:477:8577:1532 with SMTP id
 d75a77b69052e-489bb190421mr5243841cf.28.1746025312125; Wed, 30 Apr 2025
 08:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com> <2025043024-disk-rockfish-1c1b@gregkh>
In-Reply-To: <2025043024-disk-rockfish-1c1b@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:01:38 -0700
X-Gm-Features: ATxdqUEcjJCwuqAAoSuedh7z9GUsaAp9xUu-gbAYzuwpWuXBj3NTnZhFgxMq7FY
Message-ID: <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And yes, I know why you want to tie debugfs layout to a structure
> layout, it makes one type of debugfs use really easy to write in rust,
> but that's not the common user for what we have today.  Let's address
> the common use first please, save the "builder" pattern stuff for after
> we nail all of that down.
>
> thanks,
>
> greg k-h

I'll remove that API in the next version of the patch series to get
the basics down first, but to give some motivation to what I was
trying to support which *is* done in C today, see qcom-socinfo [1] -
it uses a backing `socinfo_params` struct which is expected to outlive
its whole directory structure.

[1]: https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b46565f4616186/drivers/soc/qcom/socinfo.c#L133-L156
