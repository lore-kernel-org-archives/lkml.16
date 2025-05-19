Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73028641D;
	Mon, 19 May 2025 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673734; cv=none; b=iH89DuSxZxOk45vV+y0X1rWZBYVAcJ1KEGhd7baXndUOsChtbfhM9iNk5OwCNanvjGZ/VxT8/58ZPZRgMLjgc1VT6rt8GlD10ZiOzsry80qp8lnbN9xmExKkEU9Cvte087VOE8QluBCR8hk2EWPKMfEC0Em2iTIfQ4GlqGDSa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673734; c=relaxed/simple;
	bh=8ORuRMMLefx0DeWyYb6pQQam8I7xo6HeEGehiZrxYXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rksO2cwG2TEYKSRILr1Li5GuTZouzBcrOrbjSwPdlAOroXmZ+racRCr9LG9JwhWKivy6M805L0uyC7LTHkuw0blruN8CZU+fsdpdQTqyMdlEL6lAX18+FXGV3tmnWvzp0W9WacOdqmVmO7ugN2KmmwCBdtN03ngRQ7eQroAUxX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1iFAjE0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1iFAjE0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e19c71070so7740195ad.3;
        Mon, 19 May 2025 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673732; x=1748278532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ORuRMMLefx0DeWyYb6pQQam8I7xo6HeEGehiZrxYXM=;
        b=k1iFAjE0nnTvAKFArCOGDYMNvvzAcyzp9dCWH5iNv5KXYqJVoEd34ZFgvGBoyZjFKJ
         0IMZDcoxWaAumkDfGk3oUQvVbrhOQs29t/wosxaAPUIkDIpyUBMY2Ft1MExeCfyJpyHu
         NZH5rbJLFxjTHNmHoELAdRr5NpvPanbSlLJI9Q+Gx3s47egNt5C3lEWZdGb6zJ1rhVMt
         famM0OBtCEh7Atp4H2h5qnObijg2ge8b7tA6GnhVU0JKHE5maLZUa/6/uKDFRnmSeC/B
         9MfJfi3ZuprwhQXQquW40imPAENrWI3A/VLngHeOMEVRJ/dYagNKc9CO2Bj6YYz2XtXc
         2mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673732; x=1748278532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ORuRMMLefx0DeWyYb6pQQam8I7xo6HeEGehiZrxYXM=;
        b=Y+WerlBbz54fthq5h5utgsLGIt91T8OSSp6OKA0dWU+a0LsdPzc0kNfH9rjtvZ8Gv5
         xHHh0QjXb7jPpmaakfItnI7fU4IsMEtQc2xPAjNF7oW/VRDzTG5h89s+6qAquH8+tXuB
         7XfP+Ocw6nDwkkmCvP37WsJm3NrNwLHQl1/tq9dFdwoZkghBTSll1zKxtAF/c5gGZ4fR
         NPaGMOPMcxg5xjdDUmr3m9Scn/YJxEeZH5+5Jrjykr2E2UIdQ+794+03xx7dehpvqSQe
         5eEv9b2Jgscc++9FOVzDoU7OCrEoqHLLbc+EouRIvkLFGmakD+H4Zarvi4DyqaAN7nS1
         HD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpACzgAEarPhzBiZ2fkftnRchP0de+20tgZ6mCXrsG1DBvgINBi4uIOXqh+aSj4mOahQy6Ei+3K/F3tkId6g8=@vger.kernel.org, AJvYcCWy6AIVwJaD3QNJU91tP4FZmSMXVNatuMOofKym4FnZz5UJ/7yBoopKUMQmc94HOEyMAzVmEfLFz96SIb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywofndAS7/cij96RZVulcBHWUcgRCMKCtXVqYkagQnIfRTBGSI
	9CpLnpMVcDHcjxzEqs8vP2mxZnSli8Zd4F47GZxlZ3gd4Z6epojDTJf8YMMZn6yWl22mIBu40OT
	rkeJOlCHVla9rs6VBekZS7bozSDlUCQo=
X-Gm-Gg: ASbGncthTyGH3ZULedzU9rC1bwjQZp/kVjkCOK+cnpYQPEfkg9OqmmTMcLPDTOt15I8
	Zot73iERZzuGz85rGe38v2CnE3bZYYNO13jw8wT/Tgr4VHgAGmeVtRyB8SZecV0kIU57f+G8Z7k
	UQMNHbf3qVaVHVlI0lZKRDd2UkaERpJvs29PXvy3yRhcM=
X-Google-Smtp-Source: AGHT+IFX3pNLpnRaHB2w225TjROGfDXVvH5u2mPQis+BuuObKtjqtPVe6FonkskrHTtAFgWNaZktqbBf/GqgXRKO4wc=
X-Received: by 2002:a17:903:2cc:b0:22e:361e:7572 with SMTP id
 d9443c01a7336-231d43bb4f5mr63378455ad.7.1747673732170; Mon, 19 May 2025
 09:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519143952.11412-1-lossin@kernel.org>
In-Reply-To: <20250519143952.11412-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 18:55:19 +0200
X-Gm-Features: AX0GCFvcgSq3t28o9_qSuXyJGtw9V7MDk5iIslQLVstFhz7dxARRPFb2v-gaoQQ
Message-ID: <CANiq72kWV_GGUAnCfZ3-WO+_CqhboDbC4_Q0tE4+UV8kg=uZBw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Benno Lossin's email address
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:39=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> +Benno Lossin <lossin@kernel.org> <benno.lossin@protons.me>

I think there is a typo here on `proton.me` -- Git will not match it.

I can fix it on my side.

Cheers,
Miguel
