Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32227CB35;
	Fri, 30 May 2025 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633984; cv=none; b=RPyI6PObBOJ+8/pEnoRqFc7DTxrXVXpG/swNheMFJ9NlSk/dvCNbGHsMGawcfHnU3IkFiEEujv7sf/lnXmsi+k+pwcs/4Cq6s/J18Q2mjdw9WQE6D4NdLtsEy/rirxEMnGmNxlKoNU/ApwD7amLOrPXlawLeBNJIk1Vnehy37I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633984; c=relaxed/simple;
	bh=H1WGz5RhUovF5mXwPz9RoiIvca8vAzBYad6Ei6JH8IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSFL7naNJPo7GqAnGTHYt4UV+ZnJPQhaxh60+yHYr31EaYAxpFcozE/wtPBwv1xGIHZFdHN08o8rmIdawXJAPdlfiaD/tXAjxxqDp1/PpKzh7BZKYAUlJfgH9/LLRwz3SPbaMpYxwKAIdeWCgkovgdSLMfT2Pc2Rm/EAJ2cDD4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe5EGs9r; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe5EGs9r"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3120dd42103so223106a91.0;
        Fri, 30 May 2025 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748633982; x=1749238782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1WGz5RhUovF5mXwPz9RoiIvca8vAzBYad6Ei6JH8IE=;
        b=Xe5EGs9rtbDzxZPNfLWwrd4FcyB2o47dOLZY2aR6KKy/i+iFEj99STM4FYOJ9coMfz
         w6FGnyxtE6J6++8dt8UsJV25mkUIAre3lV2fYs7vFatb7g5eMnXvNA5M91REiQ0f2bDM
         atBdi1H4xiQSGaQopUDX34UEoGcWI/64p/fdFs+FXN6xlVWKviq/tOegUrbjbPalxjBw
         QOf8UPkrVz7HtrZgSUid+YQnhYb+2bf8ajpf9Zl3FPDY/dvI0gsOS/Fe8uqc8XdLlPrL
         krQRgpu30maH7FhQ0F3sgZK2MRWDpN7TlZQsz9Bl3qnW7Q84n6EqSeGNZpHMdMqb2Tfj
         AILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748633982; x=1749238782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1WGz5RhUovF5mXwPz9RoiIvca8vAzBYad6Ei6JH8IE=;
        b=ZyGAwNie7J+PHHgFmVIJOTu8jwQ1LkE9ffB38B4pc23yDKnSJYDGFcaI+w54v5kpfn
         ys+JOdhtHzP7DgX/hGL/EdYJ3gE04g7VLGThaAO5Ma9VQ9vNn5bJ8HH+pE+Jk/KMKkDc
         7BIOl09TQLCwQsYHfIB0jHZfz9wVqbD5S+DDXvAXUbTbrSFTzi0+cEqjrblQI7DEc/bO
         KGGe7Xq5FmoiFYu0Rbmyu01dDVVg9SFdTnzjEcVoYXYFVMaIPPiokeK95RAFTQuX6vnR
         IzuBiaED0XstJ2JUJ+/Rw5mLpX/4viZcBkNlzs0Uzg3QQCaDmwLVp+IypW+2R2Oq6Tvh
         G1ew==
X-Forwarded-Encrypted: i=1; AJvYcCVMShyFnhOtsNhs4fJ2ugNyn3v+0wW0t3ocNpzi7fjl+mTGrX8uoSHda6E4U1yvTlnYz48WKikEciUvClo=@vger.kernel.org, AJvYcCW7zyaRPq0IQ6GwGvXgpI2lodzBPAEp48rXL8An8I1Tq6y/xkS4HF+s0+r46IeU6dmd/XSlQFlCFNC34GH5L08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOTJV6AH8OTA4lsOJnOu/ej0ZgnrjTVNKdcgKnotXQTgLKzNX
	gbyDU+3et9/hzk2VkUdeTcWV3IWx+ZsUy6syDLKk+RfTa3SO36yz3Tshp5QNnCNq0HOxHEHKmYH
	gnGeZfseGvwqk4w3qCSZwMVxTYmd0ous=
X-Gm-Gg: ASbGnctjNBjN0Bv1QG7BLv4wvqiKsYz6S/BUumZzgde6o8ERG8vDIDHwJPaUrHWDrDI
	oYbtXwg5XOElivhoK+UPQn0oHiBJsusDHBV0h1i8nJIAOWi2/hUKGoMpsXvJjD1XnJQ3H2V6tTI
	6mT8W1ezApfiqIhXv8GTy49+3c3eO7tCnW
X-Google-Smtp-Source: AGHT+IHfwY4o1XHOGibWqDb1qC6c71mdohlNkmM000lr89PyvRCfULfyT0JRbFlqJU0VHdITLqczkSqu+BkXjgjVi98=
X-Received: by 2002:a17:90b:384e:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-3124db30c05mr2033614a91.5.1748633982212; Fri, 30 May 2025
 12:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530123129.31505-2-saivishnu725@gmail.com> <DA9QL5A8747E.17QE50WBD6JOT@kernel.org>
In-Reply-To: <DA9QL5A8747E.17QE50WBD6JOT@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 May 2025 21:39:30 +0200
X-Gm-Features: AX0GCFut53lQ8caCny6yGPDJ5RsJq7lLttlmUwUDsqRGyy5sWuVLz_Q9tHpgOG0
Message-ID: <CANiq72npoVzz01syorhUcED=tcs9FJf8bFHthFrUQ-bE-AXJ8Q@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: Clean up formatting in io.rs
To: Benno Lossin <lossin@kernel.org>
Cc: saivishnu725@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, gregkh@linuxfoundation.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 9:19=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> I would just remove the second part of the sentence. This is a struct
> and its only field is an `IoRaw`, which does have those two fields, but
> they are private, so nobody reading the docs will benefit from knowing
> this.

If we had something else talking about those things in the docs, it
could be useful to refer to them by an identifier, but I agree there
is nothing. Well, the invariants mention them, but those are a bit of
a special case.

An alternative to keep the sentence is to say "at a base ..." (i.e.
not "the") and "spanning a number of bytes" or similar.

We should also probably add "region" there, after "memory", or
similar, especially if we remove the second part.

Cheers,
Miguel
