Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D01EBA0C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940245; cv=none; b=ofA7Rj8FuS0mTLW/SgvtGSxAJJ4OQzMH0Ls04GOjYxhy1bEclfPP5z93VlfcblD9BvtDbtIEUd/Da2Mcxj6lEWPsav9RZVJ+tt5qO9Mwof3kS/gryz6c9YwhZT8f0/7Rdno7uh9sWUPwQKHYwgOEogID8O/jgmkOOOHRUM1zNn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940245; c=relaxed/simple;
	bh=nRdyDoXu64jIJ8Y7YBIH/yF7ZXDgNxt/Zb8gayh7VQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdGtKcSfTABWLrGKRmeCKPzCLvUpsNZxYx22CBVvXkQ0uKIFOUNLJoBSBxQ6iZozv2b2AlfRmrPxGbYLkSLr1rvObATd4NOo25c0p4KP9xO1KdLPsGFWVRjSfeNyHWzhGl/O+e8f2JLCZcTC9Np2UypArDquA0T5mf5ZuHY7fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FvzIxiaI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FvzIxiaI"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54b651310so1197750485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940243; x=1748545043; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=FvzIxiaI9+B+nYi/JEz8JKN3fC5FPbsv3sHr+u29QfciFf12LcRBbiLbY9Qugo59fS
         ujAdJ0a0pb1/ZPWjkjAUTDydB7iqwZcwlVQcH2R38mgg6J5Xnxhz90u7SMHyaFRFVXH3
         eVBzg8CQtk+I5t/oG8qKniZ1KVA9p1eHlPxY246ErT1j6tSwPXgrP0Q7xykEvntVxhxC
         rURhwlml72gnT8MV5Vs+pP27E0xV6G0fGLPSo/7v+LE4vGoCNCwnOysJa34UrcGDQWf3
         75ZTHyCPJI/FSKge2B5+pfkrRp/jqJ7zcKrsbRwr5IL7w+o4ztG2f8Tdjbt5MX8PF2jU
         TjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940243; x=1748545043;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=XQ7/NavAScNmOSuNCvew/kRHbeg+7OhJCp5rJu4JHRtWeKrA2S5A8VWU1rofVuHwvx
         F2ZtcHzbeeR4n7GwyhLoJf8bXdG3O0iOi4k1FxNG0n6ulT/OZB7rE0RSxGD7PcS30w0w
         KjJpwnkCrGuzEiMs6zEwEID1Ix/yuSAfN/4tfOo57Cu+5ThtPg7dlvD1RSUyc/2QHYa6
         JRkG8JNafD2QSlXg6m8Q2GmTn6MfYZNspHHGIDMvOQxyKm+BrKSVHYTTCaLuqKQ6aJQS
         inIKY6/ToN5SQuXa2Srxrlz2qF9CiJDvGjNSwVfhor35jBvYJcMg8TBRaL2CwCZADwhw
         mPSw==
X-Forwarded-Encrypted: i=1; AJvYcCU/de5FbfdbQOAh/fD3hRvnv+uob+yDlBcc+I1O0FxhI5dZIGefGWtChh48mOmKhzymHQt+h0/O3IEzYls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpUJJ4Qb/+ssv/em6WvyxjOuDwoNLjihnRe4GQsI+BIFkaQIY
	LJlm0boJ4XC/Iv3qyLS9MfzaWWhjM24Mv7fxq3gMlkh2kq8reb8wEuz/ZJAFlWkvmt4=
X-Gm-Gg: ASbGncvQHGQ0G2fYCbpIaT3LIk5jnZ+X/E9l+fBsNyUJgHXl0GVaTrYfKHVaam9+W1T
	UZW19sF4eH99P/qFc1XEzhRWWKG8zh13mbhPsZMSKHxyFyhY3tmRWeP/Wor6w/Crta9YGBgFpYF
	GwyENPocFpFmLz2Lof64F7RrjHeOhg9syjn3lmC23z1bvErk0uqhZ80pKEYj3y6M8ezbTuVzY53
	Um3BFuseDymsUVAAWhx78AqLcOVJ6stit8qwGF50BDaS1bXwujouTE5yH3vp7nNURcsi2OCSMHr
	lVq5uyi9f0zXloK10vjFZ1WetdALZXHsvxysKhjOSFBDqbAagVLIoh/U
X-Google-Smtp-Source: AGHT+IGODjylhCbxxluSCJxWwfw2LSUZOhOlLONS1CCWl3mGWECFOnr+7cX5kbAgDceujcx1nVam2g==
X-Received: by 2002:a05:620a:400c:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cd47f4bbafmr3554668185a.27.1747940243241;
        Thu, 22 May 2025 11:57:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ecf98sm1060304285a.61.2025.05.22.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:57:22 -0700 (PDT)
Message-ID: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
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
Date: Thu, 22 May 2025 14:57:22 -0400
In-Reply-To: <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
	 <174448105342.1415739.9619142538994119426.robh@kernel.org>
	 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Frank,

Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> >=20
> > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > Convert fsl-vdoa.txt to yaml format.
> > >=20
> > > Additional changes:
> > > - Add irq.h and imx6qdl-clock.h in example.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 | =
21 ----------
> > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fsl,=
imx6q-vdoa.yaml
> > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fsl-=
vdoa.txt
> > >=20
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> All:
> 	Anyone pick this patch?

Thanks for the highlight, this is stuff from before my time and I had not a=
ssociated it
with CODA initially. I've picked it now.

regards,
Nicolas

>=20
> Frank
> >=20
