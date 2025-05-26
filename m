Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740D19B5B1;
	Mon, 26 May 2025 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243359; cv=none; b=joszJjDL6obyaP64jRDKydI473WSXNpyZ3zTDbeRzZQj0VHD32Db1tU08cCxeDbRH96UfAmLNhW0TjO9t6Hwyon1ZWMuqVNRhwLfm6AacphfZy64tREKF6Xc2j6t3d1UdxhJjtD8Hp+ih91Do3LTsdgSvB2yIDazSufXg+aHHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243359; c=relaxed/simple;
	bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3bnrLiZPVLyJ3IH8c0/9z24CESyliECXzLyxYpU6oAsoLVS7ddVjnnDn/JrOmg7VtD+JZf39hfSDvT3aJGZJkD+WvCRJRlTNFsbSlKK5/ZWc8dLZBFXZ+tgGIU6o0jpCrKkq9LdYmmwKVf1Gg2ErHfpl8bH2tCa3uJwj8t1Toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzASV0XA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzASV0XA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311374f95b8so895667a91.0;
        Mon, 26 May 2025 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748243357; x=1748848157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=mzASV0XAotsTWDwE273LGrRbjTLmX8OU0fhlfkZx4valtRTphNgb5pSzm9FdNHMe7P
         28fPo3NPtMVc+IhvhLOykv4tK+t9AMHetZgvbXNLzod7CPdEQ7jCS9fwsf3ISbDi79N0
         DNz6aRzBy2LmyHF5WanP3wU1mX9WVWw0f8RRdHIfeu580DgCQGnEqRBxYpnUf4wIAm2h
         B3amBttpvy1s2GQf4zb6hoz4/usI42KSFbOywbQaL7GPDBpoA5Hx+AvDw4Jnkndx2//2
         xa6S64O5v0uDPuF199tTxYk/bIR+KOK3fbjQK/686h0FomGE+VKrmx+m3CoPfVEacF5f
         EzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748243357; x=1748848157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=DUqD8Qw5GJQ8U6u1SY9Y9N0waDl8mDyJOG3qqRd3C1GtXQrw0egN48v9liVNBu6BsV
         iWL5FAstDiAPhTdSAf5gJugSo40XV/Wqe9Hu6z9NM8MDzxCBkk7RZAf7kpYf54qvqUGB
         x+RAMqdr2J3UCglGkQ9XCgZLL36NsQ5YxEqDOF4Do4SKdomM0rS2N0ClgKhNSzssO7Ze
         loCyty/bAVQgFz037QC5ebYMEaz2J+iNU6Y7F3F5Cr8X0NxHWV2MmNoHasftMKsAcB+r
         xQdi5r5k+P3oOyntlX3//Iyo48VzF3HOj4LdgRolg1wKR7KVDcIdCyAU3RVvPMniUoEu
         NVCw==
X-Forwarded-Encrypted: i=1; AJvYcCU9OWKkNGbqw+UqRZKKJEHeJhyMKMBOZFIMG5QCfB/deTpGdJUlXjoleTzjX2G+JYcyXOAvLfWXklhh@vger.kernel.org, AJvYcCV13+Gch9H8uSKVbZiN9x+U8OLPANMhxWFfRkTbqvw1cmd+gb6r6SFUnOM3N2uC2wJbOODcnGl7eMPZYyoq@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLG974T87ZuWVEjTVdnhvdI/O/jWEoEOyap4ZBM9oVTNwTjSx
	PLyjfuyx9eEztmATyc5pVhg2mLnZuGlNDQ1mo5JJnXbaPF8CGc1R28+GNR1Zl94KGywEvjYptM2
	1mJFcopb69j7zJehBeE1lgs8ttZ6MVTA=
X-Gm-Gg: ASbGncuRdtgnmfHaI+jI010rWLCZ4g2X2FcmlfI5enVuBsJ3f6pF/rFXdT7fxX1jqIk
	IyXasAcNCHEuBu7jW7ED+tr+OMU+t4+kRX3OrN0BSKfHBU9lg9XdLZZRvow7kZFuzIC/HJupN9U
	qCXrwcgBUKZoe34keMdxGSMuPAHZcftw==
X-Google-Smtp-Source: AGHT+IGDBhEGxaTSbxJX/MclhB7uE2CthxbT/tmia39DeSZa/GGYPMt39TPrTSYqE/n/l5Ew/IWxpQUxNJkM2ryQllI=
X-Received: by 2002:a17:90a:ec8b:b0:30c:52c5:3dc5 with SMTP id
 98e67ed59e1d1-3111108e58fmr10342094a91.26.1748243357211; Mon, 26 May 2025
 00:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 10:11:00 +0300
X-Gm-Features: AX0GCFvGtjeGuTsvrA5ltKe4oercB6wbJNzfoRXxRx6ArLhn3Fe7vBf3doOq90o
Message-ID: <CAEnQRZD+P0PhZe2snV33mvT2=2E_zHEPfkxBASVRtESDziw3-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 9:18=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> Add DT compatible string for NXP i.MX93 11x11 FRDM board.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
