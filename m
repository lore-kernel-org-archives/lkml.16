Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F32198E91
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748209823; cv=none; b=Zh5WCVYoif8npf2mi66lokCq3m7D7s3He0vmC45nJmmFEfHW7Xkb5mXXVAb+oszJvIZcbpcb2T2fPeHFYfHQZ+DCOEG68LSHpHd+Ux8oqi+3zAd+HZW/1G/tAESqoCurXCw5agdQQtHEBPf70ov91ONMk5qUZjpljoE+ltLrm08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748209823; c=relaxed/simple;
	bh=lBLIc964pJWx6CMbX1JLx4vGsWfmzZLz7dHvQSi5uHc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fiDKBzFWv1rG7WmIwycX62cQa8QSuC3WGBv61Hz3e7WYuPfoKj3BQO6KYXfEbbsPT27FpcCl7vJ9u437i881ORyZzQuIiSfDka8ZeLHdeu8K8tYVD50tE9IkfPAMFitUbg4hRgrXSRMGjMyZGyfc1NSyE8aZV9P3cM6r1PDNXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JWfuSvjl; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JWfuSvjl"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4774d68c670so27273631cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 14:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748209819; x=1748814619; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm1jMlXCLFReGUe3UakIYYmM8+KuW90b5lgWvldoqqM=;
        b=JWfuSvjlNnVFpq49TPTNmAqe+BIy2Y7yB5zdVdv0HrGRObfHr+skI5QaR445CTXmZ3
         cr1qRKYwoU9GzfBBg7J49M4hh+TTP9CHsDFGCos5QNulC3scUTmxIcoLfet5aajCkSci
         cVgpEMQDaBk+3zewdAf/r25diRjhvecIa1/xxKpvDaKpzkVv1QnjM5/cG7mC7BJ6dnzV
         tc32HsfzryVfzlhNg+ACTLczlrS5jLecQvFwDqFiexwqodHZz04X02FSICNWUvKrpFNE
         ksfF6CVl9F8Y3gvSf18z01Gf0R5JjzfgZhrgDqByW3FCZpH1fZGIXzX7TBdi+t/S0FNe
         P4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748209819; x=1748814619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pm1jMlXCLFReGUe3UakIYYmM8+KuW90b5lgWvldoqqM=;
        b=ZA8peL1TVPs5fETWMJbNUY9QjG7Y70qdl5cge21hUjOJEBmy+f6l45GnuLV9jb8hkJ
         MmAf70LzpY65vxfHkbcC5LXg0w0IIBom+6Ip/HVBvJH+OslgzsMU4MfQCDTXQa/nZ1+8
         QVeNTd1DJYxVvm6LnyRP9T/VnErQ8viwMtoAjIzz91uoEW4ibJJS+y/2G+zjr6nM14HQ
         1N/bLit5GEbHegTCw0oprcDlglXdkuMxJxwfw5bFjfgB7Pof8+rA66oK/BCoYcity1G/
         XaFMrgLrLB3Y2ylB6HsWQFYfTjEjdqxRDcqzflBij4xU6924jI0aWufzLygsiaHoaJr5
         /FUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzzyHnI/GVVQ/Ebn+S5aD9x7MpHxqn0Bm4EuSOUJehpnsIODWdG8pW3B9ubCkpZOriYTWrYMfpohd9nCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1FRglT2O9lmMCtj0g1Wcnt7SnOjF/ZbMF7MahhEYROaeyZJC
	wOMRdtzdN7LJLpTjMJ5EvpV3/9H4pRhjA1HkBt235E7ZroOh+umXRsYIMsHG4Ea3oII=
X-Gm-Gg: ASbGncugvLGCKCPI1zar5uWl2UTN1nNM4cmi723NmETHwxJGOwPmAQEmp9tAJI/NLY4
	BOKxGORqzq5d6oRhigf88PWGqV3oZWWacVmDVL2s5p3u5Dz+t78p2VTFHvASyjWuOYAx6u4ze+E
	PdGj9POl2dJwHK2GKIlhx8ma5e/oZO3EtJayDu/APBAHmCU6s04Av1aBr7Wtm/NuXEOLQudAF6L
	6Xvu37CintKHDEA1fZnA8CC1BAAO/Q0XWLQBgSPU5FqHU/pEJaw9tRWH5S8y48JfppBMafltKu9
	5BA0A1A9DHtHolJXel1T7VHWG06abpmEWmoMGWxT/ZtzUqT/wT2jdra1
X-Google-Smtp-Source: AGHT+IEVXwnSdTnPicIT3RqwyFuAzwpnXOpDvgI1IfPNgR4J4NsTJDMjpLuTDjjhVBcT9a1O+PZ5Wg==
X-Received: by 2002:a05:622a:5148:b0:476:8e3e:2da3 with SMTP id d75a77b69052e-49f46e43961mr130428731cf.30.1748209819399;
        Sun, 25 May 2025 14:50:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b8fa2cebsm133817721cf.34.2025.05.25.14.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 14:50:18 -0700 (PDT)
Message-ID: <86a27f47a72a2c2f9a7d15250150743c5c43c0a9.camel@ndufresne.ca>
Subject: Re: [PATCH 3/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner	 <heiko@sntech.de>,
 Junhao Xie <bigfoot@classfun.cn>,  =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=	
 <rafal@milecki.pl>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Kever Yang
 <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, Joe Hattori
	 <joe@pf.is.s.u-tokyo.ac.jp>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 25 May 2025 17:50:15 -0400
In-Reply-To: <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
	 <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yassine,

Le vendredi 23 mai 2025 =C3=A0 15:41 +0200, Yassine Ouaissa a =C3=A9crit=C2=
=A0:
> Add my self as maintainer of the allegrodvt Gen drivers
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e59011a36e6b..9285bb2f43d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -802,6 +802,7 @@ F:	drivers/platform/x86/dell/alienware-wmi*
> =C2=A0
> =C2=A0ALLEGRO DVT VIDEO IP CORE DRIVER
> =C2=A0M:	Michael Tretter <m.tretter@pengutronix.de>
> +M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> =C2=A0R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained

Be aware that I do not endorse Krzysztof style of communication, and this
does not reflect Linux Media values. We strongly encourage both new comers =
and
contributions coming from the hardware companies. Please, don't get discour=
age,
simply focus on the facts and the way forward. DT maintainers don't usually=
 deal
with pre-silicon drivers, so we'll have to see what this means for
bindings. But having drivers contributed before the hardware is a clear win
for the Linux kernel, so we should all encourage this and find a way.

In general, don't assume any of the above is known and document it. Its qui=
te possible
your reviewers so far have been thinking this driver is for existing hardwa=
re already
running in a known SoC. They cannot guess, you have to make things really c=
lear and
transparent.

Meanwhile, a better approach to maintenance, and the one I expected initial=
ly, is to
place yourself under Michael in the hierarchy, and remove yourself from the=
 bindings
path. Bindings should really come from the SoC vendor in practice, so perha=
ps we should
not provide a generic one. Hopefully we can get proper feedback from DT mai=
ntainers on
that aspect.

I'd like to see a focus move onto the driver code, which is at this stage m=
uch more
important. In parallel, spend time to re-read the guidelines for submission=
s and
check some automation tools. 'b4' is really my goto, and will help you avoi=
d some
of the common mistakes.

regards,
Nicolas


=20
