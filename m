Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA81F416D;
	Thu,  6 Feb 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857509; cv=none; b=K/46VTQ1pP5kxFiU0EDZlGxUuaCTRzqMgaABVaB3H/VL3I5e5CCMhTREr0AgHxauQZiriXnNHZO0Bc0G5YiH8qKAzFQ/cxQ+KOdR1sBTXqA+CvEfpu+mDHspcxkWxsDQmPwTwoOvFQgM3nuoP1IGK6owydpjKyjLh6gIBFvm8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857509; c=relaxed/simple;
	bh=utimKaL0xswsjHKEZiKG01r7/F6Z5XszcyL94FWnoJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBWavDLPqYj/ccwDNJO2ydfWOC/2wSq6ioJuJQXChEly8+3NR6qTXLlgLKFPFJyR8UlJsswMr8UPcnQlsnZEU8Hu2iyxfkBzvdyvWukvFGHQ35DVeIsKGtP/uE4mi5bTHoniYpDCCFZqUmcNtv07o93czKGZJCgVyVLvmfajAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/l2i9eI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/l2i9eI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fa122f62b5so136467a91.3;
        Thu, 06 Feb 2025 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738857507; x=1739462307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utimKaL0xswsjHKEZiKG01r7/F6Z5XszcyL94FWnoJY=;
        b=V/l2i9eIVqA7Bvh4B210uxjvXtjTDpLvWUK6reH2S0eA4G3sgdkKYXKiOUpjsIcn+U
         Vya1tejBzauw+hcse9aR7Ju0Zp/DBR99AZTcSLU0qu4nb4y8H1HLhM2L8f0wzJQVQMBa
         rLd+G6dLMkTz/P8rNSubKk4YoG65xWIbhsxWeZ2xDgo5XWfsdtZ7cgMbmpcihGcm58ny
         Pnlpo++OoLTXv6gu0TBZQgtLUt1NcQfKo9+Rp9cmvvSQLjpvgX8EnLv3efMCcF816Z4e
         2I/rXKA2zl65AKtQKoWNDCXPzsO/N3qNzN1k4lskU5J4Qo3fJm5P75tyYxVLvr9cKwy8
         u/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857507; x=1739462307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utimKaL0xswsjHKEZiKG01r7/F6Z5XszcyL94FWnoJY=;
        b=PFVs23nAdjcxEUJHqDnl15C8pqDfP41rHFCDRp3LYQHP6sewzDZnI0u145gS2YBaY+
         H31WOjNpudvHMiT1WoZbiUE7Zry64nTwKmTnZbKR7byW4IsNECeKtrIDX0oJ1Mg7bMaE
         jge8DBPgvAJc35Ju2d6hHLBRpephdw3QgaT8VFucMZ48DOnEbp1l1F+cPcnGDw6fAf/W
         +97wMRoTgGIrtgptBy6KKOrvRZFJiJKiM3Ma9CWUqKxF+etApctEJz+UfU/vLse+SPJx
         kFXiPJ9RB3dHGohkGpIL3adBPPsiWffgdVllm6Xg44BAX6rwLbhP8oRhzC4t5+EheSQo
         WqbA==
X-Forwarded-Encrypted: i=1; AJvYcCVjb1oZJfRG45WeMBz42tElM0bWU4LzMAx5YTnvS3aSN98pfbM1XjYw3G5NGUk++XtRuhxtotphvKa2CjuG5ik=@vger.kernel.org, AJvYcCVuIFRoHHbVtoEoTves25JmKMANb5n0fdSSrGyjMbagIJSxGkQ9Y2IiwOVw7L1De5cFmcoscR9TBk/y3is=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59CrQ+TCRqaivVm2i7znh87aYrXBuo7a8kjzfGignGWGKxDDw
	RfGfmLQE9+BNiZA5W3kwWEh61t32zo5eWjwvetLxm5o1LcFy+Oo3mG5MzhX2ckMaCCy2sJOewt3
	wa7mRBZKmPV5uHgl9SwZp4nzZGUs=
X-Gm-Gg: ASbGncuQPpJ5e4ajKHVd9jdvRT3o8a8Nnno4pa47ydILZHiEQHVg4RYXp32JYU0S0Ly
	V1WAcHdaY2OXF9xKAaXK8qGqYEIJ5RMAVL/GA8Ch4OJulKjRHEpmJNsDUefsB0Br24muIIVzR
X-Google-Smtp-Source: AGHT+IF4DemBKC3nt1kLZM1BllT0cNk57dmZWT+9Pa/LR5akJanmfIJdKipMbENvG12PKacH7IYOe9qu8lqAWbJsZ+E=
X-Received: by 2002:a17:90b:4a8b:b0:2ea:956b:deab with SMTP id
 98e67ed59e1d1-2f9e0825dbdmr4804593a91.4.1738857507459; Thu, 06 Feb 2025
 07:58:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com> <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
In-Reply-To: <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 16:58:15 +0100
X-Gm-Features: AWEUYZlA2JrkB-GsqGakONJMRlDbCmbMscrUw6V652IwLqS7AnDST9Ah0TT9RKg
Message-ID: <CANiq72mXF8SHRq3XJKpSEZWTCK8x8n8o9rCjPouc-SO7KvZKeQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Alice Ryhl <aliceryhl@google.com>
Cc: Guangbo Cui <2407018371@qq.com>, daniel.almeida@collabora.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.mco, 
	boqun.feng@gmail.com, boris.brezillon@collabora.com, dakr@kernel.org, 
	gary@garyguo.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, rafael@kernel.org, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 4:43=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This compilation failure is correct. You're trying to use writeb even
> though the size is not known at compile time. You should use
> try_writeb instead.

Agreed, in the issue I replied that `ioremap_resource()` returns a
runtime-checked `IoMem`. Perhaps the `rust_build_error` part is being
confusing here.

Cheers,
Miguel
