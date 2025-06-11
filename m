Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002527E7F0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668382; cv=none; b=WFxLNiRlbXkw/EqiUnNHe647Z3Geo/twJobfIiCHtqDx1HWv0qJcFXTsHuhrzLFlIt3YBIYlMN/Z4lh01w70/HUg/4s1NloiASnUx/8cH91fcdjKAmYiW2w4+rGrE9UCYc78qSIuL/8bMsiKYzokJOCjxTjWXyHD2SpfQAtWlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668382; c=relaxed/simple;
	bh=novuMTuhYNzqynSwAmnzr3dM+uqQhwQCtXMewPa/Wkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4DkB7BCPB6EHvU4Zl6ecMVQO50FJtsMkBz5gsxH8P8TiWa/lkyqfNPOq7s523e/re4WR5JAYpju4RQFRh0mo7PGLiYxuhdD6wzYyCE4u12QHruGAZh00EZpAs9WB/a0S8v2mp+FjEKNwxjnJ/DB2SE1YcKCWtaRzO8rVRvNrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CGUwc5Lc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CGUwc5Lc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade76b8356cso27200166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749668378; x=1750273178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4nKI6dictu7VKkBmue+gE/ANqM7N/0dOk6jpGABvHA=;
        b=CGUwc5LcY/RKYUQmw1G93Y6GCRtWiXcYG7pedu+cPr622ChpXEu1BMslwTpWid2zPC
         74d1mPILRllHcn9IiEzRHs2eSI3KKNIO8PuLrpQNXeIEtUTGQzBF82oTDwfR59Qskcoe
         jsf3AP1ejl4BxquhUL1OIR3QgRCjcDq9BSDSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668378; x=1750273178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4nKI6dictu7VKkBmue+gE/ANqM7N/0dOk6jpGABvHA=;
        b=MUN9NpD4bChHspqKnQOFnFjgTOesBFXIFy14IseVAY8LNNYwOBXYYmfmi8K+vsEUKN
         tjLK2o+yQqsasjeLCPWq0ftQ/yxFRIEg2N3MQ9TZv6CWhJdPIBj3eczM66b3Qh2lf86O
         JHxvAu5wYpHMgA7EwOTdOot9/XqNrcBBzoRb/709vkKXGgtowrpfpkPYC9sWx4rFLxzT
         kC5hNVn5m/0+fvyrD+bYfHbEEnkkEn+0chDqURFWO+Iw73YNasYk4/vI4HodUk5YBkJh
         AW//fVxQjp20fbnlP+TGi5iWi13buszAmNaEHBb8NPCON4MqtFq2q0tqXWaqwJ0ZCHAZ
         +DCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ0+LPB0BQtN9srJLPANE8neFWViOVwPYBCilaiBAwekDMWktfO67xVGctUlSVHll1WMG+6S3FI79CDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4t/gbGw0V0aVhBzWc0npdnoET3Qs7gnuVzXwJ7raYho1X0Rm
	KvcFwpVNrJZtrGDZL1VoWGgTmdOPsfFHSiuSbpXGm8PzTX0dIpjseXm+pEa//WvAx8M+7mZSwVz
	gkx+rSms=
X-Gm-Gg: ASbGnctTFG/SzemN2T9FFgrRn+dwUxSxZFR60NppeoYsvjNa8pggcjqZeaoVCI7AmBm
	VyhbVf5Mt1Bl9YfaJZOXJPv/VCGd96SSIsAWOEG03FrIIQrX9lKOCv4taUNFMBKgZ5CwOdPVmBx
	FZZiBI4s9fvqj5Wn0myLj5mMRrPYZtMlOTyuIXSV/7O9ND68rN66iRcTrgzzvLujsUYwH9PQgMS
	p5Yt+bEr7TOCGgqMgejeQSpmqm9gnddt83Pz48rjptEZ0LfJTTnQH18Vxn4r81jRD940YrfAe8M
	fZNKmyuiOWZk8kh4nWosOKYKiUT+ZVZcFkYdU1Ly54ieXulbJDml4rWGgv4E7NehEUY0z4fjOBe
	rJj7vEDooemoYrtE9BCTdSnUoVO/Xbci5IdyjiF17s/N+EHU=
X-Google-Smtp-Source: AGHT+IH8M+gIomrc5Md8AwX8/AfxRrDpyKGPtydIgWACcGxROVQCwP5iGyUTLgVmiMQIevNel5vcJA==
X-Received: by 2002:a17:907:9455:b0:ad8:9988:44d2 with SMTP id a640c23a62f3a-adea2e87096mr79355366b.20.1749668378541;
        Wed, 11 Jun 2025 11:59:38 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75429bsm923605766b.31.2025.06.11.11.59.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:59:37 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso421467a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxnl+U7s2cmufjoePV9yrQl2s7BPlzgGMrJB4kETn4VjCYXTc6cSjAdJ9JS9A8yye5n6mrPchl2UDhq9I=@vger.kernel.org
X-Received: by 2002:a05:6402:2344:b0:607:77ec:fa8c with SMTP id
 4fb4d7f45d1cf-6086382094emr984600a12.1.1749668376614; Wed, 11 Jun 2025
 11:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
 <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com> <382106.1749667515@warthog.procyon.org.uk>
In-Reply-To: <382106.1749667515@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 11:59:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
X-Gm-Features: AX0GCFtsLno8Yfd-XNr8pAuQD_5-TGkXF-CBKKMqVdzdI6GXK5Wl1KZHm9JyRfA
Message-ID: <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: David Howells <dhowells@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 11:45, David Howells <dhowells@redhat.com> wrote:
>
> Do you want a signed tag and git pull for it?

Particularly during the merge window that makes sense just to make it
trigger my usual "git pull" pattern, but now that I'm more aware of it
I can just take the patch directly.

Anyway - done just to get this behind us. But for next time, just do
it as a signed tag pull request, _particularly_ during the merge
window when most other emails get much lower priority.

             Linus
