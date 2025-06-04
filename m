Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FE918E1F;
	Wed,  4 Jun 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056516; cv=none; b=JMos5op84fF4hOc99ghhoo9Rz3lgtoVPKWrbtiDXjdkSHtgIMv8nWDwPhwffrqx3sW8qeghqWixsH92NakeKzLdQdkSUr2Vukr6p8/MPz+wEcv4nQJtGusuQI9ltC1PkS/rKqY/LhT9DMjxUBX6O9GiK7jUyhUPW2s9Q5VUaciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056516; c=relaxed/simple;
	bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdqbYK291Sdq96MJ3G1G+LYzKW5e0Nm40WsBYXAYxrtfGF0+unJsDMxOJSrNjOp7HBs8OQE7e+3dLbrSlDvrpAmqwU1FWNZQJmmheK+TsFuEMMw4XAvSezN+Zn7TEQCP/N+LuTf/fwITHXZ9jtEhflbIvw624YYsGqnBfL2vH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkH5g+Tm; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkH5g+Tm"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e64b430daso938967b3.3;
        Wed, 04 Jun 2025 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749056514; x=1749661314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=WkH5g+TmihttARgEvOcqoAV7p00+lSH9JCX8I7Idj4Lns99bnqEacWw2TK/AgnkQp/
         buCdsZv6Zwhld9nO82Rw+Zlx4TAoNVqFRwW8asKp3OqHtPyzipDsrpGtcup75qGSy05u
         Io3/RKA8QrbY+rumqRGu8bfGjvaeqTDoCQY2APnizZ60C3gvq5gjVWgWQTM+hg++/byE
         +iX4tOLav5keW1hzPRQGh/NJSk00PGWvNEE2JvY56NmvP7RaxKICEmG3peio1VEvly+9
         BRtuT8X5qNSRpB7mJdiT5MjiM9zyCh6cziDf9l6/vKn4Xe4ufC+MRdIk+7eJX35X2IIJ
         qtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056514; x=1749661314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=pgs4e9dhoY7Q57g2mAeuCxalZdWntgdaoFG8MLsa36SXGXafxQRD7O6bV4AL8SkO/w
         KlysvRAE7kVlQQu7Pn9jrtPh5Dv/qDQMws1A9S+rNnqzi7/LKow00VFtotlD6xxCeeLT
         U0tUEsdaOGh99LAzCvjvMeGoypu6wggMbQ9sfgVA0xWAFHhHrXfheRMwGIKoPwDmqt1/
         E2IANVZsxKPg/2Jrg1S1/OIkh66LMcfXr1zfYrZx4zt9dqPGMT71WeOl5YhE8UfSu8gK
         05+gAjC5Blgz+sSoh3HjAkR7UVVKSGFTnnbIE1Lq1vXbMUFgEWRYbubfTg7CUVm2+oDg
         c9EA==
X-Forwarded-Encrypted: i=1; AJvYcCVD/Hlm4Q6wp90Rb6TGgxTMlVnBoN6l4RHwkjlg5xnzMM/+nLwHvfmsdUDdENhnEzC0Ciw/kpYGB1rkfsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZi44w4S5DmX3xHLCT+JAQ82/hMJ4y2/nfrypMF8u7VJa6qHHN
	WM7JKYT57JSz1bsAQMZNT9zePJMqd4o8LKsdiCOv5BcF5BsrysX7ylMtpCDDO2BbhbJajy8BZ3y
	BzZbFF4IXyE6Cce9urDkjssFz9ScCML8=
X-Gm-Gg: ASbGncsZ+mr+nCM6+pfe8um/UuD6GCxFcX3k7/wMAxhjDzVjvDJXzFwTsr9kquXYxtx
	NdvmvFU6k5m+E2du7oaFCoFRi5CDRi91XQ+5WcV9GOQmI5IMcNB6/y01vCQL1STf1ZQY8JZAFua
	G+8ST8Ym2Vi2doFg9DBZbuP+SOTJvgigc=
X-Google-Smtp-Source: AGHT+IFIhKizpoGLqwiOSIUP8iiRAfmZbXmSeT9TIyueWI/d67XSMiKCYVWQ4BB4rdEMzKzneBplYge2hVU91ufFUJQ=
X-Received: by 2002:a05:690c:9a91:b0:70e:16a3:ce75 with SMTP id
 00721157ae682-710d96a0d66mr49320637b3.0.1749056514120; Wed, 04 Jun 2025
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
In-Reply-To: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:01:38 +0200
X-Gm-Features: AX0GCFsB5wB9ZHZCQ-2HQEOl8VOk15KDbCSQ2np75Eb_OgkyR8kGihI0TyVk6mw
Message-ID: <CAK+owojFg+A-_akaEO5wn=ghQpHBEvtc25bFp9qJX-vHh6SuHA@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

Good catch on both points, you're absolutely right.

I'll update the subject line to include "PATCH" and fix the incorrect refer=
ence
to the Murata chip (should have been ADIN1300BCPZ, of course).

Thanks again for the careful review!

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 18:44 Fabio Estevam
<festevam@gmail.com> ha scritto:
>
> Hi Stefano,
>
> Nitpik: The subject line of your path should be:
>
> Subject: [PATCH v2] arm64: dts: ....
>
> and not only
>
> Subject: [v2] rm64: dts: ....
>
> On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> >
> > Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> > Murata CYW43353 to the MaxLinear MXL86110, as documented in the
>
> Murata CYW43353 is a Wifi chip, not an Ethernet PHY.
>
> I think you meant:
>
> "from the ADIN1300BCPZ to the MaxLinear MXL86110"
