Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249761B4232;
	Sun, 13 Apr 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744559052; cv=none; b=UTlFHBPuOAqQDfmvqDDULFYUgvZn+K9CRo9O5tKosY3sPUEEas/mYVhiIeCStJxoVmOw8yCr8DlyFeUHc4HHwhwVEheZ9Qone5k5QRRwmacwrZc/bhCu7h4TL6DwH4LM6YRMiXg4FfTQjAaK4yU8yuMLy6wxVgb0YQ7Q8L7PzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744559052; c=relaxed/simple;
	bh=dKGcm9+VOTlNT0szeJkGwNqWqdg07bPvzWyv98pkRg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBA6YS/HOn/KBkvREAaJJiH5ZEXMzKYHcldOBrLcx/FCqak9mc2l/fpwCJFoP7LIyFarfxa8PcC/fUi1wmHWDReXobMzehi+ge622CXgk2vxLc/iuxtPmuiNvx9yK3XeWOU9yDkczPwpnW8oPTKncicTW5TqJXUULnu7kS/Uz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtpMgEbM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtpMgEbM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301a6347494so680959a91.3;
        Sun, 13 Apr 2025 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744559050; x=1745163850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKGcm9+VOTlNT0szeJkGwNqWqdg07bPvzWyv98pkRg8=;
        b=TtpMgEbMJAjWnWInXWGETefEDaJv0jj930BQp0wEWN298vuix6Ui9Fzr6VnKdA249M
         VbKjp+my5du2Qkaf+nB4yeH+3JIPOywx9GyqkzGQT7dxvwTOijEo+4cXXH77VNjZxG/n
         dIAa96mLrGI0Ymwg68cgE5bwMNXCav3h+lL2wPoxA6e7kdR4EnnVTEkqFvYjW3mOZ/G+
         zYXVFBm899jSBawUBnxTvAk8fXeP1FCPjr70bQyFP2SFJ+X2Aao7WjXlpTLkcjO3VOHh
         4FLhMsnQxVbI6El/cLJkAJRAhh6NtWfUDXdG5y5V4gyDCWNk3eA5KU50Cx+WUoAvCpOk
         EZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744559050; x=1745163850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKGcm9+VOTlNT0szeJkGwNqWqdg07bPvzWyv98pkRg8=;
        b=PWv4NCz8vctsXXgFeIeXAdatjBDUCmD/gFReVyk34bfeovO9hPz1R9umKyMjakYR9o
         +Ut05auu2SHdFwY/4lCzjPLfamZBzgz3LIaYk0EZ2NUCin/lYI0Yx5gqYLwDdbv/9IrE
         7uYyYZv0an4mS5PR781Lb5oAT421c3xoObABGLMn7qvdNhtkqSj9SoTxU5mSjC7buN9t
         6h3JYieEfEL0Xl+ku/nTasIMGuVTuJtVAmYFfhPW17XHTEA8MNNBDPFBo0i2F8MATBIN
         57/uVOdYlp4PAbbip3HdEAl9XytZv35bb7TZecGfYgqOnGajhduHNhefz1xMthhS8tmE
         SMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq07rQCaf/HmNNp7A8RvurCGaeYxkfvJKGval9a8ehsAeJbQZJBSolvICCX5JuleWDbt387e3JMDe2Xt5Qu7w=@vger.kernel.org, AJvYcCWvfn25T14+uvkDadSTPpKWdJ+eP8PbEv9szC2mEfjJRwRAuTigL/0Ku2960bPrpmbls+HRzn/phoWTLtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2trye/XtcGnxcD2lXkZY6AJQPsYJmXCWUq+xpS3HS5i/Mqpj
	cVfeBclOaFXelSPi7UY0nI0HAS9beu/xPAC0JQnXuAplzjlcflHkeASpLIFUPozMW+/jsQxMlBR
	YivWv86JuYgH471gQBLCao0FMPJw=
X-Gm-Gg: ASbGncthcc5jXxC54fyCtx2E5JjalCVTxoxCTwCgrfmwbtEM+OLC1tH6A3oAELfwX5m
	XaDIG6hnFUMjNu+mGpB/4tYDxy1mlw/1ht+P7SobGtp2AO19jEbMuEk0oK2OrJFk5S863ELcOpU
	EIPEODpvRWANHZ4hFMJUC4GQ==
X-Google-Smtp-Source: AGHT+IFisTIVZQ7RKon9gvA2HuBL7trcYspVwgVbvqE9nCsrg0Fzdnga7r4sSa1SJ1j19Q7TF9lbFbI+GLtHOTyvUG0=
X-Received: by 2002:a17:90b:1e51:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30823775b41mr5139487a91.3.1744559050084; Sun, 13 Apr 2025
 08:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux> <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
 <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com> <8de46681-18b9-4ab2-a8c4-df6315c2125e@gmail.com>
In-Reply-To: <8de46681-18b9-4ab2-a8c4-df6315c2125e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Apr 2025 17:43:58 +0200
X-Gm-Features: ATxdqUER78uV26S-aBGFI4R4a_d51gxVEDkWXrxWw6cidI-ZOTWd8VK_PQPd_Rg
Message-ID: <CANiq72nP5dUREBfBE-gM_nF65qDH6y3PkeW9UtaodLPrVs1hXg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 5:32=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Sorry for the confusion, Thunderbird showed this as a response to the
> original patch mail, so I thought you were referring to that.

No worries! Lore shows it as replying to the right message, so I
assume it is Thunderbird-related, yeah.

Thanks!

Cheers,
Miguel
