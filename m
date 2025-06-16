Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8620F063;
	Mon, 16 Jun 2025 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106534; cv=none; b=hiTzbqnLpP8KrMIFYN0uvVxHhpFRjk9veNeIcWuORte9K+9Y4PXxUFFo2xQQYj9aet6dpRMsuWO4KLuqRDPC9cDaQ4jkZLE5axVvvN3YuIraVlpavUU1w75AIWK4Oa0opZnwiM2bPbVpRYL3jJ6rlENkxhp1hwDPbu8//0LnVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106534; c=relaxed/simple;
	bh=2MVarrKr3EH+WpTMw6UOQrd0Q+i2vTps24RzpVNiFso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noARMcJIdK2LrbuQV6/dd46lrH3mpzlyRcO6Fq8cUkmqOdJlR0gLw3V1Qa9Zo2WSNNDtVBCBS/Qz2KWMU5k3js27YofyzaxOZyd4c0YsPtt37NSo7U+vi0g75sRyZau8YJdfI8sxOklJpcO4p+aypURSAyqy6C71kjhWdJgjIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxTyj02k; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxTyj02k"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so949683a91.1;
        Mon, 16 Jun 2025 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750106533; x=1750711333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MVarrKr3EH+WpTMw6UOQrd0Q+i2vTps24RzpVNiFso=;
        b=dxTyj02kNJH3XPk63pac3TX9gaOEd0JqoZPRTNXFCnXKMBK2wj9V2l9N66mQE8BWp8
         4t0cu3pff+2/yeayZ0RMHpK8+dBtc24lDe0JN06oS0j74JFS8b5EITTmaD+Dgq5sVFBm
         D5sFUJ9bjP2DhDDv7FkyiURiU6sRSMIxHQ7h5gSAJcHPAVSH82hnfFW6gsOLZ51qdBnc
         Bpaq/bmzRbm+Q96Fhm2JDR6ErUiZrK1w0lk8mLQYQoMnryRMWL4dgpRsP5UUq/DyVzXT
         U6XOFW7zC4YBK1BsemKofIxDo+u4fHjdhzeqe6AtYSAbpGyqw/nHIDH2dbruYVMuUgJf
         QgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750106533; x=1750711333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MVarrKr3EH+WpTMw6UOQrd0Q+i2vTps24RzpVNiFso=;
        b=Gu+34qoVE33hlvoaUiw2oqa8uzL84993p1Z1f6zvbA4W5n8enCRbunvEpFgLy920om
         P7K5s88XD7wJGI+OU3e6H623Jl1fJRYAnPEGQ/DLHySBNXVxrX3pWM4g/cO76mWaf619
         QQUaPaeUU0GksaZMh3pBIVNsOUK3uOe8376FNCvHGRKuhaDYmvkLKCqPbkE/TIkQejhT
         AEWSFT81R1EEKaXFiU9ZKQZdWmTABQFd+eT7UVrHPZXJayntpuvo0dcyLZkpMhTKY+pK
         gLACPxgYG+RMYH35fkHE4gp/7pWjAfvGe478Xb5ldeviHUUDiOLPSon6BJW/N3X0vphA
         CUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJB5VCcC3jg47Ei1dRkfP7qHX4PsZW54GvHzhhVeCCWHEt6VZoSjfXwXz6yl3pxVT/CE/KQTXaLVLdY3s=@vger.kernel.org, AJvYcCXdLLvPRGnbundEtVoZgG9cERcTz0Pa+9w2pf5qN1X4/QyFAj5SHNVZL6M9haF4VVRHDSokjIjxVPP2Ni2hW2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21DPYV2bVloA84d72yDnjPib5SkVLnWxkuZo26cY1kcxNagKx
	tlt8iHbYa9RzSGgeAy0ZSj8fPaYYM+hzV6JJa4FaYAM2xe2SOcp2tTrSV9oTNeF0B9iKC0OIiMr
	HxqF8j1cmIBFTKNxtD4L+9w56X/D5G7M=
X-Gm-Gg: ASbGncsxJj7aFQYiM1xZ73N+bzaoRB2fje0BbPlVmNl3wbfEaXwFOoiT8n6CFwUMp58
	mTJba9jUBKjL2eVsEIoGLszBRDVcfqtRbljXhnCL7he++PrAgUZPeeVmHg9hwA+xRMr3M6P027w
	YzMSfMQcnaptdczFVvzvtdwsqGiIC68wVTgnOGv8yNIng=
X-Google-Smtp-Source: AGHT+IHT8KPEV+iHcXim5KqyrVjf4AwLU8n3C89nP9x1BEVWMWsnUJWaRFLYWGWmGwAFRN3v+/B4S3Ge4P5xHC9Lal0=
X-Received: by 2002:a17:90b:268a:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31425ae4ce3mr472462a91.3.1750106532749; Mon, 16 Jun 2025
 13:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com> <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
In-Reply-To: <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 22:42:00 +0200
X-Gm-Features: AX0GCFtGeeEyfe06ypkz5KLQqKug3P3IchXOC3KBr6Wiay8_aCbTMa2-_9ua4iY
Message-ID: <CANiq72=s6Ugqrf5Ot6fJOMyCug2XyvKpjFCzya_Mr5iBkpitLA@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Christian <christiansantoslima21@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:08=E2=80=AFPM Christian
<christiansantoslima21@gmail.com> wrote:
>
> I see, sorry.

No need to apologize! It is all fine :)

> I noticed that core is used in other places, is it worth using as
> default dependency since other people use it and reduce verbosity of
> the code?

Hmm... I am not sure I understand.

Cheers,
Miguel
