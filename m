Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C571288C03
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940765; cv=none; b=HWVMfEmFlMx2EdO26u354Z6DZ/y+tkUcA3KQ6VzaJC7sKb5sg9rb3Gxea/Wm2lgXIs/Y//uFXi3JqRwG1yabL1fp9dKHiZ5ecq3eJF2OJG6iTQWTTg4pyP3xFmlyAHIcRM7B4NQNN76w/OzC4z/7voQb2ezl2FFdJqXnfuaz8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940765; c=relaxed/simple;
	bh=fFa+XHgjPqFLyF5EjVk/o8grCR8OeDIEJejOPFDEFq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYIe0TMz1tWXJNcu3Wv9hFpYa3Gz0RQBQgjBs+oAmjXBAs9z6vEyiVQLipgEObdrnVwUA5oWArhx3NT3vVUd0rxCm/7aCe73MD7V6VaZtSIAr8xmd02Y72DgJK1i1K2qaOOZUAOqOfg1QLRCU5x3mHbe3+Np1Jz0NDtTPaCTB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2lEjZDcL; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2lEjZDcL"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f8cb6b3340so87008186d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940762; x=1748545562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=2lEjZDcLkiLKhRiFUnSvh3+Dl98+uNd/w2q6wNNLa7iO9w6TeTe9ogaM3jt9voEjVB
         JDZxApy/mj/nQEJ+BH7v6ELSD1XMi1rGcLgqP9KlF0O0tCwZ7/f39N+QwBHLoIc4FczP
         AyGEx71RoL5u4f0oQoDPM8CffylA/d8Df6KyssmNtQAXty1THMX1N73UXWJu8Nt2uA6W
         0sTOmO/BEeDZXz8VXp3r3sFDetqsU3cuO8RbFQuRWAwoCkOHaeg7hI/+UJJHUmgD9c6P
         cEnGWcmVuoF0RGLOuO1+vKMxLRMkcg2bpQ87c9rFC3yV/COEe4idjoZhly7jZB0s4xuf
         otqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940762; x=1748545562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=NLdC1S5ZZJwgLOqbXOhQDimumtjq38ARrIlTX7EfvYwAqw6ejq2us2FYrw4tMSfwfb
         a+0S/xKwjRpVxG2m9Ik2qmcxi6jZk3MTECEJbhG6WSSoVauoOiwO53MxXhJjoYwKOxNX
         QftV0KWEg9/hd7kXI158R+hEZSJ+6Y2AnhjmHHKabwWsbwkOFYmaGIBqZ1ADtit7qzf+
         C1838YGllh3WVuPojmznaaZnLwvGnaHp+VFlHjakAV132iMPx+sH/+Rh4N/wl6597PGt
         JYgbv8K2hUCf02rREQavPLCgMwNUFg1/xEjbzGojqFtNKzE9/zKISHpwFfYnzIsVjIQO
         WFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQQJY6e3Cy1aqYaPuv8uJdb4nLXQ+mdSwkRV2fmsUmgBjGRKGtqNbA+/Uf6MDaXL8fsvJPFIwpaBb/1k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyspqQ5ELfAS8MZ9ShXX99pqd/0bPmGz774aWRLGnTR7K9FbF4B
	4U4+AOsdbIltWRBXjpik5BDF2rgBN0wmmo7vgdYpHB78rCK9zIx1aHj7KaCmyUIKxKA=
X-Gm-Gg: ASbGncsYBuh7mz+4UW+ElyfcD9YqhAsjN6LkuGr464o0N+51uN4Lvfn+V3r3+sH1kR2
	eKkVprRb2T0WKS1zqI/5ZG3xsxLIIb+jm6DpaW9YUzGoJw8pKUcpfBD0nKkW0aKJcpM0Cf4UFxs
	cprm/EJW4ZTIm4gXj5SzVKRMTccwc0pXezTVJ7w/brBTlBiBG9i0o19eoBibCUeQRnNRmF/gOAj
	8ZfdIVjN4JkSnliEX4Ihr/BIX4rGvJvCrTNwgj/2wOh4i2mQFsuVuYDbVZ73VlvZM16Jm2reYNT
	674LQUfu7IA9x91lWOmM+rDGx59nbSUyBXOvY6JfwQCSWXC0RGHnQPuX
X-Google-Smtp-Source: AGHT+IFMHoWCgYSKrp77j14dN4ezA6lfoJ+4Q+N0FgBs+1y4jyW6o9IHP3m48s9bZ43HqbDB/3wpZw==
X-Received: by 2002:a05:6214:402:b0:6f2:c7b0:3b16 with SMTP id 6a1803df08f44-6f8b2c32addmr375505626d6.6.1747940762274;
        Thu, 22 May 2025 12:06:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096dda9sm102909986d6.71.2025.05.22.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:06:01 -0700 (PDT)
Message-ID: <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 15:06:01 -0400
In-Reply-To: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
		 <174448105342.1415739.9619142538994119426.robh@kernel.org>
		 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
	 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi again,

Le jeudi 22 mai 2025 =C3=A0 14:57 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Hi Frank,
>=20
> Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > >=20
> > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > Convert fsl-vdoa.txt to yaml format.
> > > >=20
> > > > Additional changes:
> > > > - Add irq.h and imx6qdl-clock.h in example.
> > > >=20
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 =
| 21 ----------
> > > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fs=
l,imx6q-vdoa.yaml
> > > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fs=
l-vdoa.txt
> > > >=20
> > >=20
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > All:
> > 	Anyone pick this patch?
>=20
> Thanks for the highlight, this is stuff from before my time and I had not=
 associated it
> with CODA initially. I've picked it now.

Actually, before I do so, any of the following warnings should be addressed=
 ? I effectively don't
see a clear entry for that bindings, but could have miss-read and there is =
a second warning,
which based on having Rb is likely false positive ?

---
[[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-fo=
rma.patch checkpatch.err.txt]]
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#21:=20
new file mode 100644

WARNING: DT binding docs and includes should be a separate patch. See: Docu=
mentation/devicetree/bindings/submitting-
patches.rst

total: 0 errors, 2 warnings, 0 checks, 42 lines checked
---

Nicolas

>=20
> regards,
> Nicolas
>=20
> >=20
> > Frank
> > >=20
