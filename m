Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C2129A78
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974612; cv=none; b=N+bvvHgtiCLgNM5zWHx9VWtYcUXnLJq9zuq5H7Sk7Unr/kSOG5JcHhOlPRLS+bd3r1aF9xBnNzSOt/wCmJSRLskrINT7t5c8LtMOwf9ZyX10/hKOk4YTDpzIPdX0H+kjYkFUI0MGNTGmzLOHyqa4SH63lPi2njaqWxJ65OkGlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974612; c=relaxed/simple;
	bh=dTyHCFEZgeoYIVKxdCqftwAiXhqmTD/K/9BdX5/gf+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxcU28b5TQmPGTtIR5/O/zroVoGiRtj8jS9naJCP0K3bBnfkkSCvX1VA7sSmw7zhH+sp10I9b9FXFFh5atiMcIiOf1X7WIVqLDaeEyNhLs6tdeiXmf3JYc4KIkhxOX3dJDwHgXZIdIePMvVngfXj7cQKmipLxlFB0B/Bkd3po/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LpSQN+3+; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LpSQN+3+"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f6cc13d103so20418007b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 16:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738974609; x=1739579409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn/1YmpmY/bsvQ1xvE5fHEgYiQrp6LfVJR+53TGXZzI=;
        b=LpSQN+3+vjsDelrdQgp6sC+/nftdETikXUPZX6img083f/IH3js2St26HVNT6M+rLO
         qH1arG/+fX3H2wJV25KQbZhRhxcV5blOnIm0nvitvgsPybt9+QWTlDtpI3SlQPOG9nEY
         WEIeuJrSVcZAT/7MWYFWmCxe/lYtDSQyDAgq5JZG3j2KEaji0MUHk8Yq2K1BfX6pYR9d
         pY81futRo7hFI4LX1ERtENFTXJpIT6RA/WY333aEgBhzXQMLBoc9fbkiZKjYxn1gYOQg
         ZxhirbeVGUHZ9AnnjUs4twS1tpsOUpNtfhLZuzqW/1qzqDjqC2Wk9zdRd0dw/jfYvOMc
         WuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974609; x=1739579409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn/1YmpmY/bsvQ1xvE5fHEgYiQrp6LfVJR+53TGXZzI=;
        b=gTIMUqpFKr7DI3x4eVEMatbHC4F2EZ7rRHmu+6xaOyKUfBTma3b+K7HGAfeKSoesOJ
         GL8j/UGgUwciKztx7Y1G1DSjdW3BTGXOMdVl007we75u0DrQJa9xjwKFW1xdR5oVuajk
         nwCsITv3E1ZoPTzxkUZP7ZiQnjZigWMQTyEWsaBcvPDGBNwUriweIK+gRpP/uz13S26P
         29UwrvRbU8qpQHELINgGmU+wtnFU9Rs2svHpcHrQmuHnFgx53uzqygSmEkZ0WBujVQMR
         +t6tp8v53kgd3gseUsgUpp8zbAZ4gr3EHwBAILaME6NpNjHT7cKYt+DNOAYB817wosql
         A8JA==
X-Forwarded-Encrypted: i=1; AJvYcCWkb2VV/BTblCv+xw5O/mnnrWFTgAHE986HIQVcK1Rywj1+3kAVxMKUnSRuvxmMh3Ww0knQRu+xk+YB7kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+ubJBwXFm02yViCdrc2IhivJi4OUrdMYjmpeWDooNtzvzMwF
	iY867zUu0RFFw9Mm+gXzjgPc8xFJma2Mtmzw+WLvv9GYJ3t87M6OSuZpJz1BuCrZ0kQ8HMjBl3O
	cvxOQJh/tPdZ2alehf1x2mVI8HmV5jfOhVUKGDDcPXZty1w4g6w==
X-Gm-Gg: ASbGncsw3vtUdkd1J7BzzA8VrV5B94yrWzFSQSywZNivZwDUciaVJRt+F4cpffONbKi
	uMGQxoG4+FOR0KmiUTVZHg7yaiNxNy7wdLicmfKS5665tMy92KHf0YgqoIWLfQK1F5IbjI2Y=
X-Google-Smtp-Source: AGHT+IEkAhCJmGHV6WbtwrkLl9rM3ovizpZX9REweo+0HVpQNbEna4sA8dk8N7z7a5SpuxuXJBc1ziKYlR5vHDoR5K8=
X-Received: by 2002:a05:690c:610a:b0:6f9:3dd2:793f with SMTP id
 00721157ae682-6f9b29e3c69mr50537137b3.28.1738974609228; Fri, 07 Feb 2025
 16:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826103728.3378-3-greg@enjellic.com> <8642afa96650e02f50709aa3361b62c4@paul-moore.com>
 <20250205120026.GA15809@wind.enjellic.com> <CAHC9VhRq0PrH=0n6okkvfed=8QQOfv-ERA60NNWvLXetgrB_2w@mail.gmail.com>
 <20250207102024.GA6415@wind.enjellic.com>
In-Reply-To: <20250207102024.GA6415@wind.enjellic.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 7 Feb 2025 19:29:58 -0500
X-Gm-Features: AWEUYZlkch-k-LpRmOXiX93WJv51D_DkIHt3EJDkon-5dtf7UZvv_BsaEyBa3ck
Message-ID: <CAHC9VhSd-5Lm4+DPWG-V5eav5k-Q1evh3oVHxgB7in2o+XMMEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/14] Add TSEM specific documentation.
To: "Dr. Greg" <greg@enjellic.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jmorris@namei.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 5:20=E2=80=AFAM Dr. Greg <greg@enjellic.com> wrote:
> On Thu, Feb 06, 2025 at 10:48:57AM -0500, Paul Moore wrote:
> > On Wed, Feb 5, 2025 at 7:01???AM Dr. Greg <greg@enjellic.com> wrote:
> > > On Tue, Jan 28, 2025 at 05:23:52PM -0500, Paul Moore wrote:
> > >
> > > > I believe the LSM can support both the enforcement of security poli=
cy
> > > > and the observation of security relevant events on a system.  In fa=
ct
> > > > most of the existing LSMs do both, at least to some extent.
> > > >
> > > > However, while logging of security events likely needs to be
> > > > asynchronous for performance reasons, enforcement of security polic=
y
> > > > likely needs to be synchronous to have any reasonable level of
> > > > assurance.  You are welcome to propose LSMs which provide
> > > > observability functionality that is either sync, async, or some
> > > > combination of both (? it would need to make sense to do both ?), b=
ut
> > > > I'm not currently interested in accepting LSMs that provide
> > > > asynchronous enforcement as I don't view that as a "reasonable"
> > > > enforcement mechanism.
> > >
> > > This is an artificial distinction that will prove limiting to the
> > > security that Linux will be able to deliver in the future.
> > >
> > > Based on your response, is it your stated position as Linux security
> > > maintainer, that you consider modern Endpoint Detection and Response
> > > Systems (EDRS) lacking with respect to their ability to implement a
> > > "reasonable" enforcement and assurance mechanism?
>
> > As stated previously: "I'm not currently interested in accepting
> > LSMs that provide asynchronous enforcement as I don't view that as a
> > reasonable enforcement mechanism."
>
> You personally don't, the IT and security compliance industry does, it
> seems to leave Linux security infrastructure in an interesting
> conundrum.

Your concern over the state of the LSM has been previously noted, and
I assure you I've rolled my eyes at each reference since.

> For the record, just to be very clear as to what an LSM is allowed to
> do under your administration, for our benefit and the benefit of
> others ...

I've repeated my position once already, if any current or aspiring LSM
developers are unsure about some aspect of this, they are welcome to
bring their specific concerns to the list and we can discuss them.

> > > If this is the case, your philosophy leaves Linux in a position that
> > > is inconsistent with how the industry is choosing to implement
> > > security.
>
> > In this case perhaps TSEM is not well suited for the upstream Linux
> > kernel and your efforts are better spent downstream, much like the
> > industry you appear to respect.
>
> Fascinating response from someone given the privilege of
> maintainership status of a sub-system in a project whose leadership
> preaches the need to always work with and submit to upstream.
>
> Even more fascinating when that individual publically states that he
> is employed by the largest technology company in the world because of
> that companies desire to promote the health and well being of the
> Linux eco-system and community.

I would suggest that your interpretation of my previous comments are a
bit "off" in my opinion, but who am I to argue with a view that sees
my comments as this fascinating!

Jokes aside, to be clear I didn't tell you not to continue to post
newer revisions of TSEM, I simply suggested that based on the choices
you've made in designing and developing TSEM, it may be better suited
to a downstream solution and not the upstream Linux kernel.  However,
perhaps continuing to post a LSM that has not been accepted upstream
due to inherent design decisions is perfectly in keeping with a LSM
that relishes references to Don Quixote.

> For the record, we don't respect any industry, we respect the need to
> address the challenges associated with how we are currently doing and
> thinking about things.

Noted.

--=20
paul-moore.com
