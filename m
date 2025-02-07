Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F301EB1BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942100; cv=none; b=qF+xmZzZXLRDZYg+JFiXypLFd40Lxu38cqUzYJz/I1gingwDTrZ+5fWpleCpFn3lRJVlRhYONfaRsPKVZ+BA3WXdNxDJfzZ+z22NYMk2OczTc5AiaUYExIOifzx34fULo1wOwBpSoXSiqy193N5z2De3gZuZ8PKJDK2cVl3HVSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942100; c=relaxed/simple;
	bh=krlZM7WEVuD1Rck1O8fOMRV2mE41lX6qDmNoAXLHpNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGdTGWb2GIySPbTGBxkAO0rXKdXO+ndF3w8041mlg/1aQ1tbkUtLouys88+MucED1YanrW5zFUlRPGhczJEZgyXXY4ynpLwy/Ckib9+4uiHqhNGCILixy3qh0DfhH7xEwIxdRIGwt2hnjiuXL4r0Jle1GY5cKpj1VYlJD4oZXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a292tHDX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a292tHDX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso2576126a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738942097; x=1739546897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krlZM7WEVuD1Rck1O8fOMRV2mE41lX6qDmNoAXLHpNU=;
        b=a292tHDXqnhsrm6EPVJtp3T2Q8qkC6vNp+RAiAoWuM5Staj8rdEJPo8zRsbFH8B0KQ
         lQASh0uiPV+16Ld2OaHR14tvnM3X26o0GBWgTxFl+r19tlHu/njATRR7RxgTPOLx/bQS
         pyQsbLAWfGwxZQLq3YLaI25Znc+P9GiohiG5rnMc0lrjHiHwItukaWUvU3Ri731KsTFD
         XyGg87jI2nXShDKugMYYGY2SynsZ/RbSWW6D+Q7mGUR8KFJ72aecVoOCP2rvUD5l7sHY
         9N8p6NKtN62IxVXhfi6D5RJiUSIsXVEsID/zUQjKgMxv7oQPLu486zhUtdoGUrDbcI2O
         MhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942097; x=1739546897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krlZM7WEVuD1Rck1O8fOMRV2mE41lX6qDmNoAXLHpNU=;
        b=YWKzrsOp81dU090pyPeUiJBFqg+fzQk5cpkrDHt2K4CwklWJRxHSF7SzW1bqNxqcSU
         vKHmwrzuJPhXxWxSE8Xv3B/VB7tD8lF9M2v/8SvffhOXx3VD+VVvE45doDR/YqLA1/5L
         N/nXWwb+gmvFYUexudCFva9SHnEUbJQLqv3SEYgIWUcu/fky+FUlca2gq1cK1HERNeQG
         tn8/hGWjulAMeViAvU0ix1BtsWcHGhluQOnQGHm65hdz+gNj0lX7aqZIpGJWdQ8ehUmV
         nV5fpv9+8DK/3SnObwHSjlqCZz8sLdU8LO3yQiZSDlvQ8k8Qhewpuqd6zcfuIsKtQ2sm
         UQWg==
X-Forwarded-Encrypted: i=1; AJvYcCWLRuMYb090LXDlIXoaug+ivHjqMx3CH/0RVzkJh8vFLgKzf3j6F1RX8Tsjjz6TJRCp+fLQQm42H/h7IQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeCSpHHAjITTsLtxRRy9p9QQy7ojOTOdo6t0zQL9LrDKQ3oFd
	SvU2SH378G/SgFmwdLW748yQ5t8wM3CSdtxIGyemZNSX1tWddybPHIiJW0GoDIAYRl7/mWQdwn4
	xQLs+yrLluRgg/+GBHDLE24dq5lzYiPqG/Bs/
X-Gm-Gg: ASbGncu8AsJdK88gTDcrjfPJzaPbrqUbjtOxGAIRlbygEmI5Ao+bqTGdS6GfSuRsK2u
	DvH0dyrXy9VWfG7Iecy7cQoPN0lmEFLxOVqhWNrZfeJ4pHtuh3xS/WV1g2kM0WS/lAKH3RmzO
X-Google-Smtp-Source: AGHT+IE//mumNZfAaLH5hUakbKIL5BA5jChE96AZXcEh4kFSeTENEmFPALARuih/LJ5yjpf3By63/X8zTcAzq1yHpAE=
X-Received: by 2002:a05:6402:2087:b0:5dc:7fbe:72ff with SMTP id
 4fb4d7f45d1cf-5de44fe9d7cmr3666294a12.2.1738942096810; Fri, 07 Feb 2025
 07:28:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205163609.3208829-1-aleksander.lobakin@intel.com>
 <20250205163609.3208829-2-aleksander.lobakin@intel.com> <CANn89iJjCOThDqwsK4v2O8LfcwAB55YohNZ8T2sR40uM2ZoX5w@mail.gmail.com>
 <fe1b0def-89d1-4db3-bf98-7d6c61ff5361@intel.com> <CANn89iJr1R4BGK2Qd+OEgsE7kEPi7X8tgyxjHnYoU7VOU_wgfA@mail.gmail.com>
 <3decafb9-34fe-4fb7-9203-259b813f810c@intel.com> <CANn89iJNq2VC55c-DcA6YC-2EHYZoyov7EUXTHKF2fYy8-wW+w@mail.gmail.com>
 <65176426-3ad0-455f-8afd-f53f48bbecb3@intel.com>
In-Reply-To: <65176426-3ad0-455f-8afd-f53f48bbecb3@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 7 Feb 2025 16:28:05 +0100
X-Gm-Features: AWEUYZka9zi2U3F8lUw5I93K5sPS_lYHG0i2Woj0HFXH1KjADuP5qrbUahONMo8
Message-ID: <CANn89iKSw2QOeOzP8dke0X7cHheKdx=T9aQ7q7d8OemMNN8u7g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/8] net: gro: decouple GRO from the NAPI layer
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Kees Cook <kees@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:22=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> Do you read commit messages or reply just to reply?

OK, it seems there is not much to say.
