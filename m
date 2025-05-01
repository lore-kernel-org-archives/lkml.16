Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71599230BCE;
	Thu,  1 May 2025 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746093616; cv=none; b=bQVpckMtERufLW1tkyHMD+3DnQl4L1cTwZP/eljcN0KT1CA87X/Yoa2YfTlErIRe3eP1dhpOl+wW82BAClUuWyVs0P4lyrNKtNCakcuOfQWh76GGa1EIYAWGn5+/KcxEAO8KroaGfxn8qN9+ji0EL8CVNbp2tH62jhpcB8UXewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746093616; c=relaxed/simple;
	bh=x8A3Xa3GZhXW1kGng7XFw6amp3uXvQQW68fHLZwdesg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAsPEAqFdil++Fu1cnY5Wh4OPyEZXGo8gPR4WRDN8o9opSgKR9AMy3gQy8bUrIUKDckGoMMEwYEUk8kayQE3IqRjCD2L5+pIhN8+2r8fIVxWlSlrVS05ty05ISRvb6rxq42jCKiOzVj0w/lG+/A3bJxFgHw8x1vKDJQxSjXvpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuHkop/e; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuHkop/e"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b16c64b8cbcso73826a12.3;
        Thu, 01 May 2025 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746093615; x=1746698415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LflrE1z3Nx5qut3BQzwhT/Wifc4Uv8UtlWVp6kfzhz8=;
        b=SuHkop/eDvd1AbBCui/JLhNWJB+vmiPDDVI3SLdGOSDsLkQJUR6sy1LExOFY56v580
         R+14QOkPClZVVVwtsdgRww86BnOzN09NuPXpI11EZNzMWR7mqRXCOih6amfygudMrUXJ
         aw3r2bn8izCyviIk6ED5KlHM3MyveCRbsLWFhL9yHz9ZKb/MTxMTjkqbIC7rz2zUK97S
         7Qlbq9KERVJnnVAX0jkeevFI2Mhezr+X61ModvQtG2eiACfLRvjJoIuZcc4Nz6LLnuFN
         sOctgS+QCbkeZUSOtNQOB7NhW+QmcTkid4fSZIELoGuJ5kYx5a1Um3aQ7bsCvtNpwk56
         oYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746093615; x=1746698415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LflrE1z3Nx5qut3BQzwhT/Wifc4Uv8UtlWVp6kfzhz8=;
        b=MBWuW7vjamAEroqAX9qfM75eNJIz0YdnxxfRPY7e4itsuMyZSQl58EwNZg5yMv2vSD
         L7PYf/yiHYm6SdhG5Pg0fgtpfyEFvov+PEIwS8zWudhF9vlXyGAcs3+cDSeUPbwAhxQH
         zhqPl8UQrRVJbMQtTiWCgzvffBkr4xY82dJ9NAqp94lGYN5h/fMyVgwkReJ0XGHaCg3C
         VofCSm3Rbb3BvgWNzPEJHFVPrkQ8h0Da4nbpiyF43VLnMLbPhYp+FG1ZD/Gf6m8/yTPW
         vMbQQ+8ILl3FxqGiRVy8FDYN80UA4crukJVdBLaXu28CS4GDVCvL+KBFwZ8hTQA1u6rB
         rQqw==
X-Forwarded-Encrypted: i=1; AJvYcCURA4gLmPCunkZn3BPruWA+aPmPG69EUEFLwzHIyYKUFcAt4hLraQK8s7ZNRABp4ChGZ4OaUe4qOlnd01Q4rDg=@vger.kernel.org, AJvYcCXi6dXMh9ub6bLvBPcdsYFCQtFBsNRBv1Y/1s532hnxrWS759XWDTh7ubocAA5sr38Hklpg9fK37u2rnhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXNVk4ZpZLnPXgJBgAAopOy/BzLvg138s9jKB9pPjufD+8+GL
	6PP5v4cOmd40fe2CgBhMt3Oj7amowpvUn1uVeoBG6aeGme3EYZHmSv9dh6FSLddpmq3Eikzd4R9
	ebqJGj6l+LsYNi6dFd4bj/9bp4JA=
X-Gm-Gg: ASbGnctYqRuQaB+iiWrPF+1siecO/VXwoETQHzDFN6qRD+kqzKPIZTrl330ivZdP+iY
	iaO4cCSakbakSFdajqJLtu3PFvfGjAk6c93MnaVuy+SgDpwgHDLcZ9DrQRWNZPsTWcKZdccZYK/
	96prvePLkRpzMZ+51iEWZotQ==
X-Google-Smtp-Source: AGHT+IFRlDu3LysFpu3Ngch+GhXt7d98j5+F6gWXGKHfZ6bmQ1eyA6AXohGQLihk/NCZ9VtBC1BVAIcF6yPPO1w7uEk=
X-Received: by 2002:a17:90b:1c07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-30a3b959b2cmr2192523a91.0.1746093614642; Thu, 01 May 2025
 03:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com> <20250430-debugfs-rust-v2-3-2e8d3985812b@google.com>
In-Reply-To: <20250430-debugfs-rust-v2-3-2e8d3985812b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 12:00:02 +0200
X-Gm-Features: ATxdqUF4OvkqoKg2s7P4ifcI-TBJEf66kNt8dHyH2-nRR91BMsPmQMZ6wrVn9OQ
Message-ID: <CANiq72=JtM--NS4CbnVs_7bZcnMLpft9OshsveE_DdDxPoQJhg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: debugfs: Support format hooks
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:32=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> +
> +    // INVARIANT: F is inhabited
> +    #[repr(transparent)]

This and a few other bits didn't change?

i.e. https://lore.kernel.org/rust-for-linux/CANiq72=3DvM9Zr-q=3DBWvE258=3D9=
BV1Q4S_9sYo+gfCnaUUj_E09ow@mail.gmail.com/

Cheers,
Miguel
