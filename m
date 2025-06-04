Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45D28C030;
	Wed,  4 Jun 2025 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032021; cv=none; b=ri6DIZkZGIXPH50MpmoPC/KN9NeBv9YZqUliHiQddyGR7rUIq0xxQaQ6ehhahbjBLK1usnpAGyDTH9pW/J908sodD/kUwKfCYLiA/pxa0Qo/juSTQalZh0L9T0+OMz4jysQluviICJavY0UtFkHaKPE6dM6W7eqwGhy12ZNIHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032021; c=relaxed/simple;
	bh=lMABpan9iE9b5FiftfCZKRFqnb71Y82a2DsbpqpyudU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBvbpZgab3mnc1H32+tcuSuB9ihFzaVUyU99JKUDlJkAfmSjAFw4pvW8ntXdecYQ5ZOJ/yHtbpb0v49P6LS/H3aGNrj8WNSB6xRLXI+M+3gUZtBgoEh/PfNg1KBksEiwQD/mZF9D8DI6zdmpT9g0boxBGOCrpyj84dry/aEzWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXwFfY6B; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXwFfY6B"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-312a806f002so465153a91.3;
        Wed, 04 Jun 2025 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749032019; x=1749636819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMABpan9iE9b5FiftfCZKRFqnb71Y82a2DsbpqpyudU=;
        b=iXwFfY6BPN1C0v4YHx4cZNM9dxMgUI2516TUs7SUsEfSISpKeb9LgrL9I5jYoIneMM
         TnHMaTRusqb0BR6bvtqZWnIqMuqQBX7+1EYJ1ffLdJp2zjGdosDqikPa2C0bRRcJXSUg
         zULAaFZvUeHLXVMi77zDAwNDLsPVveuJuIJTcGA4yXWp3z+Cz90sgGxFHpI5kJB3ul/h
         7qFOPBu6laNyUXE1btEnCe/VMtUZg+ZxhWteJSgCX0HxJStSOCaww5cCliSylKY5CACT
         EejO1M3Yh0F9NFff75SpSSnJLilZOrpr/1uOsBaoUOmuf17iSUtdfB67ZG4MzXDsWW4S
         zZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032019; x=1749636819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMABpan9iE9b5FiftfCZKRFqnb71Y82a2DsbpqpyudU=;
        b=dtLkQufKE0+i7T5CSffdtCKKfX6UNOR8BFvS28FiF11kp0jZOoow67ZXncsfzTYHzA
         n/ENeedlDFPsrBWXuiTp7jZB2ilGedWJt+atAOr/tmXlKg9sNqmE8MYYdDVoODEQtmWg
         4z2VTZsdvOwgUpUJ4P1mepjMcMON1Vb4ZwcpcU1lY3G3No53nQ5KesNheROf7HBcNL0H
         0HqtmSdsFLL1AHn5JHuenjQ3ps685e82ytxYgB+exRbaC9LOB5HocJRqDb8apiLr5nSe
         lpE8lktYD5wNrfIW4dVKvFr2IsnCvSUyxeeF1JgB5vLKp8bCehkgJmBq6+Os3Y65FyUV
         x0+g==
X-Forwarded-Encrypted: i=1; AJvYcCXVwZoNQK/Q97uijViO9HWSwe4WDWZDP1yrEQw/wF+rjFZindoBkSXsXB3s1PxB7Wx1KWBvAhvK4b4v6ws=@vger.kernel.org, AJvYcCXv49qcdo5vQxDfuJQElZrQJa6w/pE8kerPyStoCv9Dqu0AkiQZ++3HmCkrYPBNc1dWqDB59VlqD9S5OHjPDEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPOfXS493ijyn81c6U1i8exz7J/Y4CF0jR8WhTrIYCj/r8I3Z
	X0YrGD4GRkMGjD1VfiuplEFf9o6f1bD2ntb5TyqjQ2QTuzFZ1NZJQuykueiUGnDXHU0jxR0vxwg
	9WmDXhVFKXlkqaVm47bqMxE6T3YiuUnA=
X-Gm-Gg: ASbGncvsVeFglyzbiRim5o6Imbtwsk/xZaS6ofd33KAWQKpjSjl/JKNG4Ixm9YS875i
	+WnBxQ/OsKIok96I4BIETQwoJO83I9xGPSBoUeVnZkdAVq3vFNvP0vNFLg5ako0iUMCM/3FBVCq
	ydGlAtEjgDSLDfJVo+u/Dfv3wIxYxnbyxoQZMCf3P4AcE=
X-Google-Smtp-Source: AGHT+IFcTXBF+gTGjJ32WA7AwDMf5FOdkFiFympx6S8u4ynrijxsyC/aBymU2IsbEIbDK9n3nW8sDRHu3GPTwfVni/g=
X-Received: by 2002:a17:90b:2ec5:b0:311:9c9a:58db with SMTP id
 98e67ed59e1d1-3130ccaf030mr1374802a91.1.1749032019354; Wed, 04 Jun 2025
 03:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org> <CANiq72=893T0ZHawsym358N5iexbj+5UEL_RqMA_w_dEbJ+Ujw@mail.gmail.com>
 <de844563-651a-4a6e-bf61-7a7b41d1cb43@gmail.com>
In-Reply-To: <de844563-651a-4a6e-bf61-7a7b41d1cb43@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:13:27 +0200
X-Gm-Features: AX0GCFvf3tldhMcAt47pMJDVKok6Hzu38Q8OPRGaR3AE0QqUvMjIGgC2Mn7Wukk
Message-ID: <CANiq72mWN+o-wF0GNi34PttNqaNWoYuiY9H+KJs5Q_Gi=hesyg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:54=E2=80=AFAM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> I think that we can add it to `build_assert.rs`, since this would
> be a build time construct.

Hmm... it definitely makes sense, but I am not sure we want to mix
them -- the `build_assert!` is fairly special / different from the
others, since it is not really at compile-time like the others (which
is why it is a last-resort option), and it would be nice to have its
implementation self-contained in a different mod/file too.

Perhaps `compile_asserts.rs` or similar if we want to split them into
compiletime/buildtime/runtime?

> Should I do this in a separate series?

Yeah, no worries, it can be done later.

Thanks!

Cheers,
Miguel
