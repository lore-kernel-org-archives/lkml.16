Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655C1FC7FF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573740; cv=none; b=qGoXcUKcFSuJKfIRIXytENQLqEnQ5OKZO2Y6mpFwRAtWG0grLGVyNG/Epy02H8xuTMVJupF8hK+ogjhOZgs/zF4ngyNckrFB1AxqjcSZh5kcbWMb7a75NWimu1Py9dGl+1XyLUe4GwZIgcAe/aOvs0Q6bbEzdh5nWBo1sFvcE5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573740; c=relaxed/simple;
	bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qli9b3YxCMx+Kf/D8YseMT0W8STxPjTZyPzCcSsFhV09NYlh+RdD++Dz+aix+iHFsuiz5eYrc3BpE/Ba9TqKBhBSf+bJUyjzIZo2l1UMfUQKniLn6LQuhbV518verOipVqp1wo+pyy1V4c8FTTZYU7ygCkBx70Q6asng7jJSvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WUCBXKpe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WUCBXKpe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f796586so47275135e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573736; x=1739178536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=WUCBXKpeUNWxXUCxg3n0WI1/2flHwuSyX39zQciObGvJLISB2qayln0HHz3TCbmZ7l
         cxh66KQgGGVSj/6OHgqU0vgSMVQ+IniX9huVNORev9sqbtJesRenr4t2kP9x/zdbaS4y
         X1RnMGS5TMz1fZJ+UBFGdjP6aO0g6k4/5Zx1OO76WzAAjV9bpusMVR4xJGYjE5TVQlGg
         8KIMh2EIo4i4f6+jj9Po5JKJvCjYmvlJB93yj3luPDyH/usWS95WdPEqlgNNuiCnqjAE
         5sOfEsC/BtXHFLrPdY4lHVFfEMDdBMfefZHidU4/F8U+ylH9Y17/9XM2dD/Ai1hB9k61
         Wdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573736; x=1739178536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=Ao8b7LQ+UBhqiIkCBNJOsz1CX+XNHJEaHH3e9fBSh2PpynmqLPM4jFVztK7nxef+w7
         AF//lMH09d9D7+VMujwNxhVghjaeBBmUBC1KTXghCiKKgkOnBpg4ZWNSvLUM6zqif5ti
         4xqG2l1m8p1XRQvoWZTxLAnKMm8szkYX99XQq1A/rk6DyLaDDcv+Xj35UxmC0Pqtiuff
         PBPvrVk23H0SkXlCCty+gJrjLLwzmE4zLx0vWQuFgT6HiM242nBLr6N9sL0fp+KDHUND
         joUMmhQPk35tXBJ1NADO3sVxW9hgrbDpPz9SHQp5Nupz3D6VaPg0koCBcQ+fmyjynRLi
         bu1A==
X-Forwarded-Encrypted: i=1; AJvYcCU2i3c1xWsixkdcTWAojJ82dNKkZN/EBYluWFGRmhDh7x8uLJ/GSOEw0ZyIKoBWUnWYQ5t2xRv0G5B4nI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXk58cjJae2PwbTxw1GW0dV6+2R3v5yGdK5SwlOkfx0vLtBVkb
	olE04DYY3uX0mg0NRAfNuRh4j47pNGFXFVNuYkIel362/ZclVemYIN/S8e92R08fHWIbPdaSJr5
	YLMvg2Veepp1cmP60gxQ819vtP5+Ipp+85s/j
X-Gm-Gg: ASbGncu5UmFa0VOgaG6GsmjIfZ+Z9o0MO4MhaiIJKF5IF6VH//+Ci4m5RXGb/2irrwr
	xJSHkNgl4faK5oCQUoowpbi4QhmPN9hKuWFYAid1FvLZGbBBWYutzgjrUjWLHjHPd2NBgzr8vTc
	MHxZCAY8agd7hMgs0lzLgpD2Dm
X-Google-Smtp-Source: AGHT+IFbq1pWVjjFTT5eK9hOL6FRx5b2gIclK01nWaF+0UuNV0XQVQD1CBTLjwH7htojNlMdbttCQobb6NaNzGYfeNk=
X-Received: by 2002:a5d:588f:0:b0:386:375a:8322 with SMTP id
 ffacd0b85a97d-38c519506eamr20704188f8f.13.1738573736075; Mon, 03 Feb 2025
 01:08:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:08:44 +0100
X-Gm-Features: AWEUYZlZbKxfLpJhhJPVmBfowDaLOLNb2zkL0fALAziRhJs2A8Tey8gfRdFIvFA
Message-ID: <CAH5fLgjtwcd6heHST2DCrmKWRp4w6KAEOHEoSm7t02J58LSQSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] rust: page: Make Page::as_ptr() pub(crate)
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> There's no good reason for drivers to need access to the raw `struct
> page` pointer, since that should be handled by Rust abstractions. Make
> this method pub(crate) so it is only visible to the kernel crate.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

The Rust Binder driver has a C component, so it needs various as_ptr()
methods to be public.

Alice
