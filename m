Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5D1DE4C8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042731; cv=none; b=cFL1KSwKVCS97m9/9vWpwoFaB9NPpdIdVBTXskeqzIrzhEzbFQ9J93tUrn8yrspdlMEgbwkiaaQ4g3UuHj5pmCcOsEQ6L86JF3jAwNt2CU1fna1iEYD2kyD1/W0Uc2Ph4ZduvsJlCeoGFUnnGO5IJu6Xl9/2uVJVu3WDVIYMe9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042731; c=relaxed/simple;
	bh=UlaJZxSieBbasfgzz7gGd3ssb1FnKZpa7pEFR1lSHB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZfH0S8UsmRvuXoev1Nixcaf5yKXk01+4nkYVizO8Fzv4k1tf0pnQXnpKJ6LMhjfWUqNWski3rXrUrB0DTuSSEfiD02jysisDaPVVO7i5hEagG94hY3eB2bYBd7a2p+rHVWWDBggFHyaTOOM/K8ZeZUNOCQLcXU4/1+GDZy9T00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkZNiVdg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkZNiVdg"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ff37565154so41707197b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042728; x=1744647528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX/CsfcApiydwjMPAUinCGMDhAd2IhhoMg3Tp/JQvVw=;
        b=GkZNiVdgoYrCt4GLU6a3BxGNy+0nOhwhc93/g7IXLv8qM1QFN4qQrQQV3ifhdyKS8x
         rhJcW4WHrF8x70BvUqJt3tusIYRLq0VxUGdiqzs5mX+KmQ36vJCnNOR/ACHAcb43IHxF
         tMYmMWoO4e1x5G/G/zC5C5Ae/YKGpVqG35AZGMZNyjWxgs9eRlyAHDM1LrWwPxhZ2GIY
         QjiX+K1T0CnbATnM3FP/4aYCz+BKHESYs+FL2XbjYGzrtPHl9H2e7x5SHDqzFNN/2LIr
         +ktrOK+lRIcNMlhTkrtOh29EdpiHHBjni56aJBvdC1n1XJ/a41t3n5j7EN0ixexzPoyC
         vb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042728; x=1744647528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JX/CsfcApiydwjMPAUinCGMDhAd2IhhoMg3Tp/JQvVw=;
        b=hgWFBXekTs1+0pwhxaz1Re9e/V00Q57c1sII0qx1QSyqDqzHQxBRB89gwlT4oq1UMs
         D7UtnTWUYtdzDS/Rg3voYQNY0WYUN5SEIEd240BJBgUtdbAJmcG9AGA/OeXch4qB0c4N
         REypp702llJXqhHk5yS/BvSDmRvJsmujYjQ0P4SB9A+5dxkolZB5X9woZVYShqDAsE33
         x9dQEt+B7+cE/17eFK+QxCVKVONpQF4DLj/G4sNGw9yzKwXc/WEbpcxTTIKG58wMQBYH
         PhJrXyExiKnPL7M9/DbKk2XwARZT8mSq4UOSctcrrhpp+CVXKOD5xKNtFvzQB71NHrqp
         vpqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSDteEelY9PwgZnXQX3BQAmZtkZ++u2ILnvRs3+UW6GUZ5QR2xed/PaM3Ygat/f9Ujnvju6SNx5br5eGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnGxBaIEe5dUSs/WStHsxyCfcFc/HZvmqoQkeIPEWOtTuzolM
	79SL+MO+Ffr83M2el2MT4MKNDsVldSrUTf89jn6/JD9xnQmqxMTHuzrCjpeNQKu0MlLgZdfaopI
	qUef1WbEK7LfaUfN3KCNYogicxWeEY9vmpCNeKA==
X-Gm-Gg: ASbGncsd8jiHfk9+qR5MZecF51mn4XuaNoUCZt2N+VexgU8LinUd0iiGGDVZrZ6YCAR
	NKV7u8JhRGA3kJ6HMupytixBFZ35eQzMMoA/qBnfWkaHodi5VN1CWgyC9yzfMJR+b+FxTUkEzgH
	E26UzR8UyDrgNs8J4I6t6Zqs26BkQ=
X-Google-Smtp-Source: AGHT+IHKMX4Ob6QTTm80PFpdHe5OW6JJqpgeMbRrvzhWKoI17ZKitrO/G0aPEV6gKHvE71Av+QnfoRhbc/Xsg7bIvR4=
X-Received: by 2002:a05:690c:640b:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-703f42fc252mr178401657b3.32.1744042728667; Mon, 07 Apr 2025
 09:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <20250407-aloof-fox-of-relaxation-62963a@sudeepholla> <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:18:12 +0200
X-Gm-Features: ATxdqUF_J2qNh9UdMVJ6Dqqt88GUYfovrcMe53xm4tXJ8-94vrSIdDD4MBgiib8
Message-ID: <CAPDyKFpX7aqcme9c=TZ3JT_DssRatvXPFWSNN-3k5K8pUZvgeg@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	zhouyanjie@wanyeetech.com, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Apr 2025 at 14:49, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 7, 2025 at 7:30=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
> >
> > On Fri, Apr 04, 2025 at 12:36:33PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrot=
e:
> > > >
> > > > The "power-domains" and "power-domains-names" properties are missin=
g any
> > > > constraints. Add the constraints and drop the generic descriptions.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -313,19 +313,15 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    power-domains:
> > > > -    description:
> > > > -      List of phandles and PM domain specifiers, as defined by bin=
dings of the
> > > > -      PM domain provider (see also ../power_domain.txt).
> > > > +    maxItems: 1
> > >
> > > There are more than one in some cases. The most is probably three, I =
think.
> > >
> >
> > +1, there are users using "perf" and "psci" together now.
>
> Where? That's just wrong.

For SCMI for example, but other QC platforms use it too.

"psci" is for CPU power management - we discussed the bad name "psci"
before, but as it's already widely deployed maybe leave it as is? A
better name would be "power", or something along those lines.
"perf" is for CPU performance scaling.

Kind regards
Uffe
