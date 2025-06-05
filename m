Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082727CB34
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152081; cv=none; b=ajjtAt8Gik3foClCz3xEnMisr/xDhzYDqsH3Kyk8pWi/+YXD8RApu/oVAWJ/TghesQzO05t6JqS1qIpZYAP3WXjPxT/OxGDJEw+A6xCCteXfvHZbsRCcnQSEovpKjnjg42iRRE/WKTSrGH+nrHv69BRQxjSBrxJA1MJ7ESZPEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152081; c=relaxed/simple;
	bh=MLMRVT5KhSZX/zK3crana9aUgNm8mG8NxDX+aeJa4Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILVyHNawHWamieG2VJiVyI1Rnhd/U22OnCgpywD/y9CRhT0gpBrYA5HqGf9/IhB+6ceXGa99g6hswcTRCEy6xZdq47BDxbCju2QjVDkEcuiFQaTJHQ5dgQq71Nd3yUAtANgKJduQ2RwRfFbmTEbgtlxhvwBPvvXcIBvn7SLxzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MqC43+xs; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MqC43+xs"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad89f9bb725so252663066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749152077; x=1749756877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98kyb7DemcX1FyfLysJO1OG3WiC0g9CHbRupke5oLhw=;
        b=MqC43+xsf12tgStGS1mcZQxngmsvU2pTwWTAlwhNQ5Zv4PPhx1mU3ZGMHf+pWO1DvK
         N2mco9Sx+PNvdHEMPxFoqFtrbTWzA0NBj5q/E5wdo7Wh9DJrjUV+pAiRS2R6wJ0IOHNa
         +LEMpKz2uMtO9iuyc5mfbNDnqrrS15tXvXKrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152077; x=1749756877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98kyb7DemcX1FyfLysJO1OG3WiC0g9CHbRupke5oLhw=;
        b=Wb6CLOEzJFWNucXkD3uOVpjohNECxQKpjxn/VI6cxgiTPsimR9dDS5ZfKKFvP4cYnf
         9+rIU1/2bfrMJUdyyZZiDuwZSdp4gUEAE4gzU41Vyc9nDrP9kQqsJ2e3SxSJ8Tc1n0TI
         2VI//CiR03CLIs0G4dF9HVecG0+vpc8L++K3AaalCUUta06IZQF10Qu3sO3+xw0aHh8L
         A2vRLfQsnq8Ha9ZAM3QeVrrVD0REr7ai3abKQx5HUdpOMrNQ7LdKa1H/twyrkBiBf9eg
         Q8kYsA+T7vidivonDbYQQVcEYRn2fWNCNMnK/pbmfPKTGyY8hi7lEee2t80fk5UvW6D1
         4XNg==
X-Forwarded-Encrypted: i=1; AJvYcCWx2ERCkoUai8FGT5ByqMkmv2LNYm0b+zXjXImCSdnDCp1+qP+KZ6ndTuEKwfVT5VZk9TF6fSF5jaukPYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyukMIavK8qHwvYk9mbpMBHKyXe5G47FaF9dB3a7kX8DmahZ+y
	OxPny1vfBI7oPS0wfMpfCwPZNm0bUnNVeMZo14H+Q19P8PQvVmjrR7cS6OSpv0hlY9l0Cmii2QW
	jlwm3AAM=
X-Gm-Gg: ASbGncsVB0720RGZTdUHNTOnxSCfGqO3ufBu8iBghtaWvAnPPgl3//AAYJKNPTKSbAQ
	ZL2QiFbGyMY1L6QqsEnewxdLmc4LeDEjHzkU5Q2hdq9s8GhbFNwf5bPA+Xhdha6lvpqncXm+pfc
	yxC2JJwMXa1NUujBICDwcOquDYZqkSr78AR9mNDi9RJ/HquZI/1/l/qCG6C8H4iCnJNHzkVxoWQ
	gZZXHfEGMtJ/zKjcR50Xehr/+KDMFFSXq6dVvDGH7DUqj3QMs1Wo3vQkOHz5tIVVucCszVExz+r
	dABw5YbvVgqhmjqMJgucEkdViRnT4IpFVutNuvjkhZkVJ8ebX5nNYYp2FesQICO6ZM7QEScz5y7
	iIZ4sl4McZRI+dDFHWazD6E2izZ2KkBSN7Nrf
X-Google-Smtp-Source: AGHT+IFNlYcNX/oilnE3YlPgqwS3Dbk9zl0bzGvjQwq6u5rqVGZBlfCIZZN62DnTOeBNW2PdTm4JGQ==
X-Received: by 2002:a17:907:7ba3:b0:adb:2577:c0c5 with SMTP id a640c23a62f3a-ade1a9c8044mr44808466b.38.1749152076876;
        Thu, 05 Jun 2025 12:34:36 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6ac6bsm1291680266b.169.2025.06.05.12.34.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 12:34:36 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so2528223a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKkL/FKov+cPxmIpFfWPa1gNQHR9vqBfWkyr8GF3OrJs763xN6jo9JMAEKUbTEtTnytnQM8WcfsZ7A3PM=@vger.kernel.org
X-Received: by 2002:a05:6402:84d:b0:604:e85d:8bb4 with SMTP id
 4fb4d7f45d1cf-6077479a971mr360023a12.21.1749152075805; Thu, 05 Jun 2025
 12:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJfpegvB3At5Mm54eDuNVspuNtkhoJwPH+HcOCWm7j-CSQ1jbw@mail.gmail.com>
In-Reply-To: <CAJfpegvB3At5Mm54eDuNVspuNtkhoJwPH+HcOCWm7j-CSQ1jbw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Jun 2025 12:34:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgH174aR4HnpmV7yVYVjS7VmSRC31md5di7_Cr_v0Afqg@mail.gmail.com>
X-Gm-Features: AX0GCFv9fwwJjQ-pdhMQFWakNA4mBQD7Vr_hXeTl3gorGhZitX74FYtkZ7ktqiE
Message-ID: <CAHk-=wgH174aR4HnpmV7yVYVjS7VmSRC31md5di7_Cr_v0Afqg@mail.gmail.com>
Subject: Re: [GIT PULL] overlayfs update for 6.16
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: overlayfs <linux-unionfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 07:51, Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> - The above fix contains a cast to non-const, which is not actually
> needed.  So add the necessary helpers postfixed with _c that allow the
> cast to be removed (touches vfs files but only in trivial ways)

Grr.

I despise those "trivial ways".

In particular, I despise how this renames the backing_file_user_path()
helper to something actively *worse*.

The "_c()" makes no sense as a name. Yes, I realize that the "c"
stands for "const", but it still makes absolutely zero sense, since
everybody wants the const version.

The only user of the non-const version is the *ointernal*
implementation that is never exported to other modules, and that could
have the special name.

Although I suspect it doesn't even need it, it could just use the
backing_file(f) macro directly and that should just be moved to
internal.h, and then the 'const'ness would come from the argument as
required.

In fact, most of the _internal_ vfs users don't even want the
non-const version, ie as far as I can tell the user in
file_get_write_access() would be perfectly happy with the const
version too.

So you made the *normal* case have an odd name, and then kept the old
sane name for the case nobody else really wants to see.

If anything, the internal non-const version is the one that should be
renamed (and *not* using some crazy "_nc()" postfix nasty crud). Not
the one that gets exported and that everybody wants.

So I could fix up that last commit to not hate it, but honestly, I
don't want that broken state in the kernel in the first place.

Please do that thing properly. Not this hacky and bass-ackwards way.

             Linus
