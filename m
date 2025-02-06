Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65322D4EB
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856613; cv=none; b=JegDMTvQFTTM+8gHP7AY3ebVBqEZ+DWXQ3tszKKU6W173KluE/QFKX7ObGCzy02Q3+ycKaKqh6lfcFVpy49V/Q20dbowMcI00/JoHF+Z7wcDN+T5ABniHeD6YNCarDNKiRxFQkPqbNbW3EyBypSPPEBvYsTclilc8gdLbUaB0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856613; c=relaxed/simple;
	bh=7hdQjWzEotDVIDZcI30XgkThfzAt1j3JK+eP0FGi1Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwAPOcPNf0nDK99PCLwqafHQIWb1YJzfMpjszq2ij0YLOzEIscCMRzb+ier78SFpILDlO9c1Nyft1sKlKms9TAo6JA2xrg/EVPpgIaC3BF/68LJ9wyns5XJ6MXrOrMdpsJXtqM/pb4MTpF0Afvl6gmbH1b8ijkX4Yh120d0LFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ay5wzBy5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ay5wzBy5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso7272235e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738856609; x=1739461409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBdMhdMtIUzIw4rMictCNzI6nR2pfFg19HEOqhQG/Qg=;
        b=Ay5wzBy5EfYhylEQXRQr5Q6bg1PQ9tNbVKwhMwH+Wnfilm6CQB47wo17VibWasQS4s
         mmxl1bxwymRMmqcQuj26Tj0FyCbSfc5F7q6RFzyFtYQYoCZ/jjDk94VhCex59VrCv09u
         vs9N5alxm0s+1d+Mm2NPbsZBvcBs4SVfTgxm12bAgXGhK8H9UAouNA2guvFhiIQt8J+E
         smEJAPKRS6ZsVBOoznsn7cX29j0dAysfU/BLxTXsWu9IsqPL0Lp+mmSqff7bdVk1lN/8
         tAcTSTqhGlIyZbkNbl809QKhJ5fO+RhK/WHTpNWb4Cm6dfzuOm4UZkV6HkWCoT3RJZ+4
         5iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738856609; x=1739461409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBdMhdMtIUzIw4rMictCNzI6nR2pfFg19HEOqhQG/Qg=;
        b=CrVVOGv9nvH7UMZHeIwPFIAfO9IDycCxvVUxY6nGnrEuxNvneH/yQtmfOszEnmHA+y
         wpGeERyS1ZheoRL4wgOfHpSLRaFH3EetlRaNfUb7p0KSlVmXiLzVutg1j3CnlaivXOsW
         pZl98XoXjZooaWfmT80IAk/wil849h3iqtYS4tUmzXRTztxU79ThOKxxPSeXvRNG7Etx
         gFWtuei6riJyDObuRwcwK4HNURlqkQIg2M1FeJE56r+Wj/jSoPfAflHKHGbDk831OJe6
         S+ECiUtSOVACn70x7oUnznmLQXKKgEOon1qXJmegRzjYX1iisLmJKO78eQQ3XjoAXnsb
         V99Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhNFFxLfO2aT45c59A3F6Ci4iQES2ZNcEPsnMAtdvjXcO2JC4ze8BTnnujz3/3r0BuBO0UgP37HmUk05A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJka63nDVxfzhYfm18xQ0KdGuEh+z0DUm2DJMoD35XrYHRANe
	QBivJ5rl5FvaxEisv8EMUdhST7eHdtagx4ORy927TP6h9ip226KHTmUdXumvsN8qprLLWkG60jD
	vPMPvyh5+utetIDvxqWlbxViyHC39E4nkzVxY
X-Gm-Gg: ASbGnctQ7gJk5tJwdJXF5Cdq5AXEGsmJGARFnAIKIukP3UEeZeY60vQUT3L6GiLQPmH
	ncskI0Jie2GAPny6/Ah8wmgbaSumGcx7OSzLjGWe2M+WVwQJPkmEg5dTo2vrjqnjKiYZrJlUd0X
	ymNV9eBMlzkeGrIUjC8/rS82vUN74=
X-Google-Smtp-Source: AGHT+IGVKvg7QdK0ZYKMFxbiI4Gc5AjnmbWA3Q/7JAZIvDr0g+zAH54rcHrrLRM1tKGEIK0vCNsE9h7xYg8y3lczKdM=
X-Received: by 2002:a05:600c:3c9b:b0:436:a3a3:a70c with SMTP id
 5b1f17b1804b1-4390d56f21amr55885475e9.28.1738856609308; Thu, 06 Feb 2025
 07:43:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-3-daniel.almeida@collabora.com> <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
In-Reply-To: <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 6 Feb 2025 16:43:17 +0100
X-Gm-Features: AWEUYZl9AZYPANFjvhtBuOiK8XImDgpndW-XF_eT0_KkcgiqXMAivkukX7j73tQ
Message-ID: <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Guangbo Cui <2407018371@qq.com>
Cc: daniel.almeida@collabora.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.mco, boqun.feng@gmail.com, 
	boris.brezillon@collabora.com, dakr@kernel.org, gary@garyguo.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rafael@kernel.org, robh@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 3:56=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wrot=
e:
>
> > +/// A generic memory-mapped IO region.
> > +///
> > +/// Accesses to the underlying region is checked either at compile tim=
e, if the
> > +/// region's size is known at that point, or at runtime otherwise.
> > +///
> > +/// # Invariants
> > +///
> > +/// `IoMem` always holds an `IoRaw` inststance that holds a valid poin=
ter to the
> > +/// start of the I/O memory mapped region.
> > +pub struct IoMem<const SIZE: usize =3D 0> {
> > +    io: IoRaw<SIZE>,
> > +}
>
> Compile-time checks are only possible when CONFIG_RUST_BUILD_ASSERT_ALLOW=
=3Dy.
> Otherwise, using compile-time check APIs of Io will cause a modpost error
> because the rust_build_error symbol is not exported. Details at the issue=
[1].
>
> Maybe Io should expose compile-time check APIs only when CONFIG_RUST_BUIL=
D_ASSERT_ALLOW=3Dy?
> The expectation is that a build error should occur when calling `Io::read=
X` and
> `Io::writeX` due to a boundary check failure, rather than because the
> `rust_build_error` symbol is not exported.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1141 [1]

This compilation failure is correct. You're trying to use writeb even
though the size is not known at compile time. You should use
try_writeb instead.

Alice
