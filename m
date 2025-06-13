Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E56433D9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829405; cv=none; b=kCtRe7joqWQ1YSEYwG4F1w9fmz6WSeBAL1w9pQAJQ9QDSTGojzCA5dm7LbIyYEyDRmUpnAogWOydGS7jJX7magxxn3pSYITfI+zeQWrIh52NwmmvCMzRGkCqsz+fYy+vsn2XbP0kQajWLV3HfI9kH0QDbpm5mDzgIDNCQXTgfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829405; c=relaxed/simple;
	bh=ErljPl4av/QaQOhDCXeS4el6raSxykJe0R1j3QAerS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBtIYvHetJ4+W2/EFNIefOZkLiXBuXDTSTZZy1ZD+X5zWCIjUK+Gh6xL2JwK+F64z+ObgONJCB4i/tAmS9UFMnFHzbVW+NPfRBI/QXDKLIGKWZxApU0Jpupy+RAxoH3iYJrvOaNdwOVAxmQnLNd+GRsCX8GHPPadmlJiKuv7K+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UFgBZXtX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UFgBZXtX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so4509547a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749829400; x=1750434200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FcZeGwCm22Kaq6Zayr5a6cqDxVP6CQrhoWJiO/5RmRE=;
        b=UFgBZXtXMdvaezjOhY6Qp821gZ/zQ2NTxY7MbjBDVEGiWR4GnMdNpIMzqyE3ClOrqP
         diMdQSeXbXdgwGjYV3FmP9RwKclaJYEwEZiR2bxkp2CqBVjreuF4G4GOBcnhzBXbQhY5
         A7LeyolMKtROPmybBJXIXeIqxC+5H68RQkJs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829400; x=1750434200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcZeGwCm22Kaq6Zayr5a6cqDxVP6CQrhoWJiO/5RmRE=;
        b=d/fpDmt8Bo6pBLe4ZW3t9kiR6QJMTXdHlsI/BSGrVoN1AgQ8oz7JnSWqFlMp+hGkHC
         iuOr88QcA6IQaDS52ph7vKVymO82HPtmIXtXjVwsvPOAVpKyUTZ7VCbxTzCjsf+YVOtx
         KmblMShuPE8jVQu265UCGzplLWzvTuUAoAqCImo3Nfe4sw9HNnQtKJfpvw+qHQmHHXLI
         JQ2lX5Z1B5yorrlmv3XGnrh0UC6iehVm3CQfecQQXwyIroFc5/kQmgIrO92f+9L7Qvof
         NVegyS5x6ZjlzjH57DtbCa8nGnYcHnoGwDMfvM1OSRbGNjbnJn489AtF1Kgct498ozze
         XHxg==
X-Forwarded-Encrypted: i=1; AJvYcCWUN8gZYZADTA/IWzWE5s/rvjgiq2ut8DyZX4QDp0gmyWSc/+xeWjfl8EEkvHq+5cyJrYY4ntk24MmWJCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOpbDwCPxFWqBfPGCL1edyrTDiaNx1ayL6B34C6s0hI17nHVj4
	DRMugqgrwUvRKyTO/jN34ku7Phu3buPQWDdBEt6TlbxC3n8vJkQXJlA1wPSW1tsSlJkE2pHPBO5
	jukO7PoU=
X-Gm-Gg: ASbGncsy/9fPl4Roq1jDGCEYKR+OLRkU4JJlvJhEVcdEzdvDN1dDPMNhRNtG8uxsDXa
	hpi6HKREg6AqDa26sE1DkpAcQj6T17ihKOaK5smX3tH+MJ4MmDoUTAY5d3qFokM3l2LXFGhbkOw
	yXSnaE1Fz5fVfw4yNTZNMT8OzhmUWz7LWrCwwmL1pl2+c9efAvi53O2sFuwvgcqfKDSQNXoJJp5
	JtOwXgHpNdPpHM/7ZxtB/Fyv1x5G5oiO5iqV3q9cQCyQ+9Rqp3NgB02z6HkAKP40zNhHvz+ROZj
	f2OLfzspu3A2lhaMaB3/U1Yb7BBKf+x+kTykbbcjORi9GFVPTW3WDaT1GKfICWNT8UNR5k1I1NF
	uOWFWrHr7JKkAK/pj9NEVmwwQH8/QJir3hmL2
X-Google-Smtp-Source: AGHT+IEjD+mINh+A4yHlSsmOW/8G4Gyp/zoh4YNJZFzZLPYrO7M3dFhNPk+pvhNO0EqHWXhs52qniQ==
X-Received: by 2002:a17:907:3ccb:b0:ad8:a935:b907 with SMTP id a640c23a62f3a-adec54dc9e7mr297313166b.8.1749829400363;
        Fri, 13 Jun 2025 08:43:20 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c60d7sm147580166b.62.2025.06.13.08.43.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:43:20 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so3795703a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1RgABMaSWxQmSgC85H8Q2omg9xtUoCAK9aZ7JgejmMJfRt4qibZx45QIP+mCRwTZv6ybPgoirSvTl7VY=@vger.kernel.org
X-Received: by 2002:a05:6402:26c7:b0:607:eb04:72f0 with SMTP id
 4fb4d7f45d1cf-608b4910f1emr3292023a12.4.1749829399723; Fri, 13 Jun 2025
 08:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <501216.1749826470@warthog.procyon.org.uk>
In-Reply-To: <501216.1749826470@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 08:43:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYdf08uju5UrDZ9kEgsC9yrtBNOTzSX6zAbOdRfg+JkA@mail.gmail.com>
X-Gm-Features: AX0GCFtHIfBeIIpdLiCaIbjGHR268VNaR19hWtgTk1l0lqwTG5TIoyTmne_dSmw
Message-ID: <CAHk-=wgYdf08uju5UrDZ9kEgsC9yrtBNOTzSX6zAbOdRfg+JkA@mail.gmail.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller <smueller@chronox.de>, 
	Simo Sorce <simo@redhat.com>, Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, Clemens Lang <cllang@redhat.com>, 
	David Bohannon <dbohanno@redhat.com>, Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 07:54, David Howells <dhowells@redhat.com> wrote:
>
> So we need to do something about the impending quantum-related obsolescence [..]

I'd suggest you worry more about the rumors that Kazakhstan is growing
a veritable army of gerbils, and giving them all ABACUSES!

What's your plan for that imminent attack vector? Because they could
be here any day.

Yes, yes, please stop using RSA and relying over-much on big prime
numbers. But let's not throw the "Post Quantum" word around as if it
was reality.

The reality of kernel security remains actual bugs - both in hardware
and in software - not some buzzword.

             Linus
