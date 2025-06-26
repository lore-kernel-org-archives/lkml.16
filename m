Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607351E9B35;
	Thu, 26 Jun 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930907; cv=none; b=PLWt3FytlOMprMasUPvMKj+9B1qMuQ+XkuGRAuHrYPEJSvD1iFJdvNaDtcOTm6pVoTE8dE5/u1urismgboUZcpo0VCii/oq5tSfQO6gPfFn32d0uyTSdm4s36tMWsAvefo6V2sDmPF5/J1ad4WrldEyNM7/OFd3933MTuJmSphM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930907; c=relaxed/simple;
	bh=TtTDaseTfS+Lxjf17Sd/nxI6KIZkDKNIf8nALJlynrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2mzpY6/W28W/WRXaUZnxskmETBWezOky0u3o0P6enJBcfhQwxImFuevhevurzF7yW6waekF8ycsbnzdzQ2etlia/uL+9Bdc1bt4cvu2jXVJsvpM3J5f1j5rxFQ5W6eo/ae/vp1Tw5R9Y5zmovgw2xOldxRxs3X5BMJ7bX2Wgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asOJzzp5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asOJzzp5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-312efc384fcso109707a91.3;
        Thu, 26 Jun 2025 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930906; x=1751535706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtTDaseTfS+Lxjf17Sd/nxI6KIZkDKNIf8nALJlynrA=;
        b=asOJzzp5Dd919iAboMqsGt+V1YQttb2fPrf+xOH6aOJnZMWOtDqEcdzl7JhARCpYQ2
         XleP6nimkHWLpCbUg44ddc9M7JjN/fQeVDtAHYJLYGKxkBu0bt1oSSUlnwaLrchci6hi
         ZhQqc8OPKRPSYxx2LM42la2naG822rYybHuVxllSJ3pxaHru5FYgnSbTAXxrW4qK2tEr
         aTW3Ah9KOUBxhiPDNqnhVKJ1MBHZqq5O9SEz6l87C+ENtzMk1vIHpHOKd3ssZd6K8aq+
         UUyw7pWbiNTx2NsHZgi7s72z3bOT3o5d4ZZJJSrpRfN0KveHleqrrc55uM4Y1de9uDzz
         pFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930906; x=1751535706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtTDaseTfS+Lxjf17Sd/nxI6KIZkDKNIf8nALJlynrA=;
        b=iA7Q/TvHiM1iiMgUeHc28PbrzsCUd2kZgS1FGEgkmtduZFILufFmQM60kQNFzcj3Hn
         PbMAnqjy0Vv7xV9bMFFgMYEfLUFxW2Hde8TxtBBTJs2sj/u326+025fTZSOf/Dm9OUk2
         hfy4S3wu2uKkj15eofSFoY3g8KVt1P+ZS4RG30MrmHQuO2SYp85Pk/E3qZ9/SRAFCjIg
         ZPl9SH946qHGgscS5BFlB8VYbP4YT8tG0idqZVOWHZE06Vy9AGdr9zUq/r2YPCtvQOU5
         O3zxO36xXg6fcq0DZ1FcPBhgFHcbKJ+0TDo/6zHmxM2itJIqUGerVOmls5jnX7YVUNjy
         t+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5vX9cgkH1r3kI833bLugbNQjeNwA1HyHxUX2wcnokn/1K8EOvMHJS13AoCrg/PBWi2Y29svM4g62PI9ExDfk=@vger.kernel.org, AJvYcCXjjipuURgdmkeIMGeL7DDt4eZ4QfC4Fi0bE7cexa75cPoTCBrvGNmuLxhuixGo89bt08Pac37rDYeWCjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbn39yt155BjO6SfbOGbbg+gjDJjtjzcSXnSOINBM9b0STPjK
	9Vkm+VrNIWKAR8r6nidMI9/Q1k2hSjberdysNM2/oVIycdJpWf1DkIyarxNzxr7apf8Dzjn3Alu
	dRZJAn5zJbRUvIi5WHI7ldlMfebxZ7VIaWokx
X-Gm-Gg: ASbGnct7PPgtApACSwI+KBB6czqPt7qJi8bJfc8jVcie87ey12H6fmebszxjBrZvqh1
	d3/sqo3BPWTfqYHubXZJGwuSYjksqkKDD9TuchzB2UxJQmz03Xrg8bJPKRg5qgWegb8m3KBHbIP
	Qc5kjkLgOBGKK27AdHcGbsSQf7T0BC36F52MEOTvkH3ro=
X-Google-Smtp-Source: AGHT+IGELLr5aDYj7j6oxcbFCvviclW/BxibFvr2jyVEWKOI5pRHKMZnYLPZklg+kIRxs8XbKIEWYZdjTgiShKD0e+w=
X-Received: by 2002:a17:90a:d644:b0:310:8d54:3209 with SMTP id
 98e67ed59e1d1-315f2610175mr3494919a91.2.1750930905464; Thu, 26 Jun 2025
 02:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625043630.7677-1-work@onurozkan.dev> <aFux2MUDAGEYY49I@pollux>
 <20250625113604.21a6ec4a@nimda> <aFu10-dGkoyi0I2T@cassiopeiae> <20250626111045.2c90a402@nimda>
In-Reply-To: <20250626111045.2c90a402@nimda>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Jun 2025 11:41:33 +0200
X-Gm-Features: Ac12FXx6PheBSyWU1ettcDGQNU8LyToFvrQwo7EXl3v449WPWgC6L7VjAxNlnwc
Message-ID: <CANiq72nsQzCje3167G_4YSJ_he02Czr4NveLOf13zYj-DO_gsw@mail.gmail.com>
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
To: Onur <work@onurozkan.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 10:11=E2=80=AFAM Onur <work@onurozkan.dev> wrote:
>
> HEAD: e0b49ca268d4a0d2b97d5820420d5a78b67d2537 currently doesn't pass
> clippy. Should I send an additional change for the clippy fix or would
> you prefer to fix it yourself first?

Where is that commit coming from?

Thanks!

Cheers,
Miguel
