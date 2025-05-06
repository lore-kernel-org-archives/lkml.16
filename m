Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05E28C842;
	Tue,  6 May 2025 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509328; cv=none; b=Z04vZBU4KXN600cwVRLMGHO1rSexte4veFqDRLfKjblExOmeTwKjbvaYU1tf6dOcbzIajWS3MDjHVnlPsD8yn0Z/vMKED2aNHzVhNARsm+XifkbZwnaBFjnLoT7fAezrIh9SwxOCZ7keqP00O7A+Im4Xa6Uf/X06KuCoV0T7l0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509328; c=relaxed/simple;
	bh=gQp6Ny1UV/nufpAO8MF2mNS1/7lehGRjSJTqjPYT+tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IezdGvkledmqaQScEJsgizAg1ta+FYZh5CEiFdR/Pvluok9JISH9e1Tj5L3VqZcwH0gxAjKIwvDZHXGyauXkOGCrM247rGHbioe2pQER9zqpfvn1UVZgT0Bmv8fS0ORVZd+odgcgJ/xvoaE4Thrqz1906ws8bI+d+NkUM3GhGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7+AMYKr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7+AMYKr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso77693665ad.3;
        Mon, 05 May 2025 22:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746509326; x=1747114126; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zY64DOh4SaFpvvACLrzCGnh69WAMNHQAZsNHFyi2xL0=;
        b=F7+AMYKrqWMBs+4b4OdgAvYOesAw9L74coUIL04h70s1QgHMsuysVmWEbd1is1La2H
         zyg8Q2WoMvalll1BfuEpu0DSb2OFJYmJFg+gkw1bZO8Od9zlOYV6PHnINoYG0hrlKI3K
         2/u2DrdSw5SXqBjwL5vzG/AwHA+q7gAp+tM7syP3OaL3nGhJJM+NPMaGKcXaOgE7ONGc
         lmV+YJr4C0wn2chRFp3FeBH4H5zRT1zZa+JtwNn0dda9//OwDWEUVehc5gGDwPQbGkLW
         X+LQ2LnycJ2Pbdn+G9p9PatrAuZ+N8z9f+/33yaxSTSbFGzJYkr/rXavFgEdKf8/BvN1
         GOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746509326; x=1747114126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY64DOh4SaFpvvACLrzCGnh69WAMNHQAZsNHFyi2xL0=;
        b=cyyOBiVmVOIAT0hoNlFyJv9Vh/ZXy5/188lR0oNm8jET2rNJKZ0Nj7ccdDQZKuXHgL
         mJ1ZtrjSlgYDbr6eoj2wwWPHGyd6wMDUBpiZUvb5U7oZlzs102ODxoTkF6s66xMP/ego
         YIes7FNnSJNQ70moRwNx56TQY48HSEPVlOjTvvnP/8HMmDDQ6MzG4LZFUVRtoNQRzWSM
         T5I4j7kEKSoGFcnPeUAn2L7rtTmePEZXqeH95GBXwMtKNZK7HUJGazem3SmOTnnqlLbW
         b6DKLMiTpvDxezpux1A85gBV9Ai2T7Gqb73hIL+3zusxm98BsAtQU87ghERWCXUqBtur
         0pcw==
X-Forwarded-Encrypted: i=1; AJvYcCUx203lI/A6+1pg/mOoi1Rb9cVTa7EgRtweoC6vXDxwsSVl7/UoTHbga29haxMAG3h1/I946j0FNs+Z@vger.kernel.org, AJvYcCXsDdKyKJ8jmNCbWMEVSo0mu4F1j4b/BJ4hDXuQjo6HZ83SZYeZ9dMw+933oa8SpnpP4COQJ37X+i54+e8l@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTW8mt+wyaBUTBrZhEyEo4Au5I/dja7KbReTYWKE7p0keZ6qD
	7guNXA/xo01ApqMepCcysSRTx/CtKmfa2x4yzcs8OODwyDCRKviZ/N7Oj256SSEzlsVmDWw84OY
	F93Og6uZiLEloJuu8WicQnwkJ/UM=
X-Gm-Gg: ASbGncuBhglE/LriwtcfWw0a1flrV7rKILoPsyul9dovD+Q7IyKACCRZTDzF1GMGnTt
	IjsOIclZd7tVaYiTiD5qf50TSm6h7Nr16Z2XE5I9UQ9X/Y9SEN+YSGNhDrcAIyomN+gRKo71eff
	kfwOvQopnN/al86clg0Xmpkmnft61C2/7JL9htHc4T6mcIqPm0UCUXOGRf
X-Google-Smtp-Source: AGHT+IFbJpLRXSHxF3fSLL1KL2sqdc0f46WjNL+UBT+jETt6hQGktbkUm2SINYV0PlaaSfTi2JtBW+w1nNCUsf/TMdc=
X-Received: by 2002:a17:903:3c4f:b0:220:f449:7419 with SMTP id
 d9443c01a7336-22e1e8ea150mr137149705ad.7.1746509326137; Mon, 05 May 2025
 22:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com> <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
In-Reply-To: <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Tue, 6 May 2025 08:28:33 +0300
X-Gm-Features: ATxdqUHCc7cfCqJDo08T9ZVB_47GBrflRMP_AN4R69nBeeX2bEalAJ3t8txgJeY
Message-ID: <CANhJrGPMhRy4TW_JMZ8dkgdctgF3f+bAsoWLkrNvqbcbc412WA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.16 merge window
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi dee Ho!

la 3.5.2025 klo 2.25 Mark Brown (broonie@kernel.org) kirjoitti:
>
> On Fri, May 02, 2025 at 08:47:43AM +0100, Lee Jones wrote:
> > Enjoy!
> >
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> >
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> >
> > are available in the Git repository at:
> >
> >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16
>
> You need to specify a separate url and pushurl for the git remote so git
> generates PRs with a public URL people can use.

I didn't spot this in regulator/for-next. Is the URL sorted? I'd love
to see this merged...

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
