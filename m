Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297C4204E
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 20:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746391479; cv=none; b=lY5RZ9Pw0nOLZofskiGk/KgUa7usrv1SOlAaG7s4RoHfIO/vhkOZofFSnu2eMchHtJFlnTFpNSyXPM3xojra4XGa01g6qFDVmfGGsbVCkwDGdl+YNJVNyBcw25EQhWKMuDjgfYMg3Qny14lGES+GdKhZf3DyT039hLTYeMdYdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746391479; c=relaxed/simple;
	bh=oNUNV+pWWWp6wgJDdjKWgpn/VSqM4F7HLq7zI8pPS3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0N9/D7TmxK2FTT3bOoalftFqRaIdzw6ZZUXAnvQ/+T4E/92YB5OWJUoKm91EbEQPyG8Bodd+6fX/KLC39jUAonUr/k8K07Vi6zA2wwJbJ+DXoGb2iy7tT1bDDqeiJuX2XftYhh4LGX7qoQNitO/eHKo7yH2G1sqH50q9appusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6rWYvAI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6rWYvAI"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b1fd59851baso9317a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746391477; x=1746996277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSKILzdTDxiKU27/grsD5TdquYD5c8qJmLIMuF/qQ64=;
        b=G6rWYvAInpzy1kUnO5tHsn+Rrm50vX8aWVnMy7BCfVkNuUboS/ZJk/y7f+OCSQuV/V
         FHgcMh/8TU96Lcnlf8D2Lb2x6ygqY43/Qs4Yd/k7+QS+m6Fypfl3tQ3CHAUEGKdvQFpu
         FIAsX7XjjyYE7PQvkWOihGkdPiF6Aq9qb+V90jMzobR1IJYUTSeQ0dJ4X9Qn+WD50XCi
         DAtEBqYPlx+DyfkgpJPVEmze/3e00KA/mqjOKWXjIn7e24Flk1CgtjJcW4Ib5QUGO/5S
         MBalahBbIciD2LFHCi0czAqhXfOi+0ZQ8KK9ei2NOHc/PiHeg821twzfLF+KSc2TSnY0
         q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746391477; x=1746996277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSKILzdTDxiKU27/grsD5TdquYD5c8qJmLIMuF/qQ64=;
        b=UFAgaCjNQfTsYDu1qQOpL8SbmmsWHSCJg3MyO24ibs3YaS/skSMubdnMtFQZ4z0QFh
         p4ZbFkn5shwWQDp8va1CZEXYhN3q9r0gwTcgdThyrss5RslZobFAG+tBR0CP5Qo87Ec3
         OeIIdnCJCcjRyBk2wY0RY610xgJdkIY8IBcDZYxc4rA3nehwUgMdHTJ4WNdqfowHd+Eb
         YMCqosAI8aaZPO+t6DjT9xzdEGwsbxIOsmP4F+D5e+P/4hWJrjktdMtRSKKIvqf8GWPK
         6Z2zPfDPR5wu73eMSZIyydK5oKdgLrMwJD0hBoYJ4tuq77C5oaFeB289dfSmcaB5keAx
         iabw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2xNTrRoEf9NNsbx5tda7wdN57vnuahC9bZVsLkwnzXWjFENwBk3JHCw+45uouqX7QZNW2wObLB4KPW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg9aQCvmDT9kgBHW09m+vE9g0Acac/Yj4FWxaWJ6bE/a1NHz5F
	0jReLKbUYGOZM7s+Eek68Fxpxwerf9vHiTSsSPc4Qeln2daRF2QNNmUyXzsr4VEnyLm50B0jimY
	wOSNLhAfYTWT6nnO6Tv9wBfomzhY=
X-Gm-Gg: ASbGncsFrUUrIz4wGzqnbHSjviZ/o4TG+rTRLupxx5R0xL1fuWcPIaacam7je+n9saM
	N2p2ewis1t0CKPmAKMfaTz27K+ef5PYRkJLEWx67jCJfUmKY7hgGo3CWKoQ+oSbXzPLar2u4hm6
	nk0+d8ecWMBSs567CjAY13aQ==
X-Google-Smtp-Source: AGHT+IHAhiNooIpPGcrRCqHDRtoIYORliPqN5en1djw9W4Wxrx4e8Uupmstc4prF4UFr8f78JAENWtuStoxKGacbUgg=
X-Received: by 2002:a17:90a:d00e:b0:2ff:64c3:3bd9 with SMTP id
 98e67ed59e1d1-30a61a32e84mr5386869a91.23.1746391477095; Sun, 04 May 2025
 13:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-8ulp_hdmi-v1-1-a2f231e31987@atmark-techno.com>
 <v57uy3gddzcoeg3refyv7h6j3ypx23mobctybt27xzdyqy6bgb@atzdlqlytz3c>
 <Z861gsaGY6bGSisf@atmark-techno.com> <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
In-Reply-To: <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 4 May 2025 15:44:26 -0500
X-Gm-Features: ATxdqUGAD9cqDbJ7UUJGb5IVH1hS8Q6sH_Ahy5Rc8JNt7SM8YhAKAPxXHAGV_Zc
Message-ID: <CAHCN7x+q-K067u6o=+E9ybREi_jopwhMTyMN=JKfCS4r6K=HWA@mail.gmail.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Makoto Sato <makoto.sato@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:12=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Dominique,
>
> On Mon, Mar 10, 2025 at 06:48:50PM +0900, Dominique Martinet wrote:
> > [...] and I'm sure there are other improvements that could be made at
> > the edges.
>
> One thing that irritated me is the function names. `phy_clk_round_rate`
> sounds too generic. `fsl_samsung_hdmi_phy_clk_round_rate` is long, but
> I'd say would be a better match.
Uwe,

I just sent a patch to rename round_rate and set rate functions to be
more explicit.  I also tried to refactor the driver as you requested
by simplifying the code, but I didn't have time to integrate my
fractional-divder code yet.

I will be traveling for most of May, so I won't be able to revisit
this again until after May 24.  Hopefully the patches I submitted meet
your satisfaction, and I hope they address some of the concerns from
Dominique.  I also CC'd Frieder, since he's been active with this
driver as well.

adam
>
> Best regards
> Uwe
