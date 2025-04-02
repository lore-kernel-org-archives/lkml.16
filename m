Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB3F23770B;
	Wed,  2 Apr 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593977; cv=none; b=ugXG8FH1vMJkTckIAuQoBGAyjxmGTUO+3vK3B29Tpb7j6DRn4LFbMPfb2AWJNuX6r6ut/1v/IAzweXXLk5a3XlzJlOA6IyQ08IOJVtyT0BAxA70M7fO3R9ce0qL9CPSxuB98HaXE9teIql2Ff9F29FpRbE/PRMc/vo1IJadhOws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593977; c=relaxed/simple;
	bh=gGLBNtaZV8xPDcDWijyzPW6QNFE+hAe07boPW5Z0apQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIacXmKBzrrfQm5FWAyfqfrqBiUl83eBKbzXPKtQVeB2SrwfW9oEfGABUxh63H0oF5eYEoHKzK6V8JeW+DRL7QVzgN61tVYfCGEEyV79E/hjHgr+8FtgkhJBA4xZnEYMOzZZ2dnxuoQE+cjeEwWyvipQX22hF7JIPiNQPSwVlTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwuJrb1M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwuJrb1M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225887c7265so11674015ad.0;
        Wed, 02 Apr 2025 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593975; x=1744198775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGLBNtaZV8xPDcDWijyzPW6QNFE+hAe07boPW5Z0apQ=;
        b=KwuJrb1M404mkbrK+T42T82pXaaWp+HBDnaZw5dymcITJcFyKqA6cUAAILEL89Z47G
         jC5QjcSRA19Kg3EsaaT3mVN4GzTWdXbTC+mHzlcikZJ+RIfy/T9aed50a4+vAjGsFf7c
         H6ybMGTCq5LuTP9v79Wbm8p4ZHFETQgJSv9Xn3SEYmHyjFd/gTm6HGncyzl3c+Mkpkgl
         iUU+3Dvsh/ORhjFeW6mMYJm1z3Sb2ReuRp5yvlKlAicG7X0wBWk0RMewxPUMcQ6HFm6H
         DYO2Ya7c8p7rZQP8vFN/XKqm3jUokvU5ZMccEbzevwADvloghgubvj7lXNfwavhb5iPj
         +IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593975; x=1744198775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGLBNtaZV8xPDcDWijyzPW6QNFE+hAe07boPW5Z0apQ=;
        b=WVu8MvIJqqIkz7yeXRBCNxVNdO9R260Oee6KDyzw+5j2NZN8D1iGOa5KD9YBKE1tFt
         Fr6yOj0ZWkE4y8f3tQOdjscUw9YuHKn0CRKVw5C5vF+EFxJAwXvv4jqJF+2GMBClX7HX
         Z3KaP+Kschy6GbN4pRJfm6Njo0NecDzlnN2Peam5q92W2M2lREGFfxRPDsRbpo5iwS0f
         I7984DfkC9TPWsPhMwpDKWlsY42hL+ZQJYgdM9GxpbXXeQakoVYaOEzrqj8bXfJ6qQRx
         82Ir9hS1kcSDPec85NvcvAt9ZBZGOMVPypOhdFGdoLh8umfSMiBeyWupLp1d5IpVR+/J
         bN4g==
X-Forwarded-Encrypted: i=1; AJvYcCW6EQlJLd4SYZ/JJ3RNs0GwapLmuzvNqG+4eIOUzXXdY0sld+W4e+SR/1qMsBlCyq2CeOjRfb19a4BcvkJOoQc=@vger.kernel.org, AJvYcCXGnhMQ1U/uY6ELTyg5DV1Ytk4Gui5PyfGpAT1KJ3KoMm9SUwIxf+T//5aq/4OuNZIDKR9YeHpkUvBA0hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wuAif9Wm2fJj9x2BmQbNKFlMxhMzR/pYhthSwHmJH8KobFmd
	9A7Aa8fOS8A2eUlzj2/mc3RSKu5l5ijp6jOLkqdiWC2U6Wkh2fAEK6HKlzSLo8f7sXYnSWg4V2j
	aOA/SJz48Vc2duH2NZxUv+XH2RkA=
X-Gm-Gg: ASbGnctttesRaR/dyLKEVENjI7QK9FTxqJY8u94da+sh5LZLDFd7K7AVblUUFG579tg
	Y/wV7ArD2WHUGXhROsJ3RekQLHpGXD/TyQxi03ZGzwZSioSTaazTBiR0Dk8VsH9/Nth4CbWo5xf
	QUohHk+M9VjYav+fiTRn2diD1kZQ==
X-Google-Smtp-Source: AGHT+IGB6aBlM41FSg3WnGAb9nBpClUkKO3CDvVEPaksn8LFIvlexzrpFyaWJkBL2Wyv/uVnyThmjGOAaTYbbqRXzbA=
X-Received: by 2002:a17:903:1b25:b0:225:abd2:5e53 with SMTP id
 d9443c01a7336-2292f9622cdmr96678775ad.6.1743593974881; Wed, 02 Apr 2025
 04:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743572195.git.viresh.kumar@linaro.org> <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
In-Reply-To: <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 13:39:22 +0200
X-Gm-Features: AQ5f1JouVEcCfm4ZrKw1FeYZI-LSTYfd2JyRyUeRDyP94eqYKV3dthy5iwATm-c
Message-ID: <CANiq72nzrjh6S2bh0GQOKtjFqMcDzrBbtSVhaL-i1kja1zW3HA@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Burak Emir <bqe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:38=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> Update the MAINTAINERS file to include the Rust abstractions for bitmap
> API.
>
> Yury has indicated that he does not wish to maintain the Rust code but
> would like to be listed as a reviewer.

Will patches go through the BITMAP API tree, then? i.e. you will
maintain it by sending patches to Yury's tree, right? That is great,
just wanted to confirm after all the discussions if I missed anything.

(By the way, the BITMAP API entry does not seem to have a `T:` field
-- from a quick look at the latest pull, is it
https://github.com/norov/linux?)

Thanks!

Cheers,
Miguel
