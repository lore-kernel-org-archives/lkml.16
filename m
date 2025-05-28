Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDB1367;
	Wed, 28 May 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417618; cv=none; b=mVVPsrxlgTFPiCWY7kFy0e/WrAWYgK85yAHfK4KASb86SYM8W+ADz7fYLk18nFufNRCxkXBhZHtbUTLUxiZr9vo5PfLhUpPlTpSA+TdQXyzls37LqLsIxNM/Zd0TRs24xqQYwKr5dy230RcgHyLqnChlwGS2Mi138ysAhcNatek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417618; c=relaxed/simple;
	bh=2OeE558hdBFTVCXYdRaDO5wJSZ13Rc6atVD3qWcnum8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzfYgC6hEA+NOJt6gTw1sYFuFbsjgLfoWyqi1eiXasfVU4TmRKsUeTwBbytrYHxqe0KwN9QxThR0F0Byrp2LJuHp6D6Pe+4dxdaBNOeTKClzPbd46+LWGiFGCOZbh2V9/zqAbsywTC392yR3JOsBqthJ+L0YPpOPP7acHimjUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jz5oF0GS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jz5oF0GS"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac34257295dso827822666b.2;
        Wed, 28 May 2025 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748417615; x=1749022415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=jz5oF0GSnkEGitbrYG5rOh6c6Z9LlUo84EjkiymaIOhFfNqqmeFR2fEA0ddDLoGmbo
         oins03TnnG9UOsY+Kbde349NFH0Pgiu/FWiFurw7FeJGMQXF3ajWA/yZAnlHML3Zw5OH
         d3F2U42sAa2iGOn5XMyi/NFIFMoyvBaB8AbCv0mbJ+/yrg1IEWQPNmm7v9PPUUc6Gw9s
         z2LfRJ2QJbvnrPXdIbIdfcnh1Xs6zqXpjtSC6rU0Fr8TQn1LB/LRC5IDyB+39/A7cjyv
         uK1jVvMfFtIN2nu+EMbjfha6pb6XlpbmUlnh/WelPYtrziBcLWBiK49qugSxfetE7i88
         FlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417615; x=1749022415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=DQX4KxnmDdbzQrUF836juEintOyBLRPMbH0scx1pmzWdtsY2kxBUzLt388y9JM2JEY
         krJChZ6kXAQOm7Y2Z11VYPfPtiw4SyOuVThMFf/ELYj5CeIAmetH8n2DdIYQJaGwygfg
         8N+IEBk38tXsG7DY+l8wkn3eq2syNKGeKWykdVGDuxqKI4BXQIlqw1LyG1nWNJ6wlKUC
         qPogernn5ZRc9XoLUPwUF2gBvaaV9TrrqTHATl5ov8Pd/6e1GlktfoEbgo8f5/IVwAOO
         rw9l9tXK88HEsj6h9mtp/uGkEB+C7VhAtigZJ66DWPuVw+5czW6raD3ReGghK7rFKTlb
         xZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKiaKN2WJK35DxfT4L2h1fDt6Ox9jK6KXCLanqNvGSgp3zkZjkw62y3BUwFM6awV8GZMQMLMxpe5VuBQuX@vger.kernel.org, AJvYcCV/e5opL/RbyB2pMOPJv4lknejr5LlvKyt4HfrV0kBRFXjgilkQKMcluW6/0USIB7Yblos+vZJsqIgJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMqzmQmH0pE3s52hYvF/S1+t0S069A22j4QH0CSjioLXpVPJx
	ap6lg/8uloc8QUXWAmun07fTW/6tz4tbo8VixKOmVo7z6lcED4Wz5TfHiste/wIieGffOyP6HAK
	YPj+ekzDTzDhRcxkqt1U+6PgyXcn8eNk=
X-Gm-Gg: ASbGncvOCR5hChwhag/AZlQ+l0Sa4htqyMw+oEYlToHV6Fz66JjuS9n5yPW6tUmn/l/
	emcRr2YxD0I3+LR8Hy2RPNbHHMhqZoM4r77TRz/sxjGjme8GjeLbGZsNJymxapUDjke/KXNYdrW
	1t1reyxOtmxNQ2etVeFG8u+dzWwnJV3uM=
X-Google-Smtp-Source: AGHT+IF1fHMff8y//YavCY6qV37Mp44tGyDZLCVJ94/lgd4evp/huakNGNFGIncJfZaxREzO0BTmn3RMxhTEPInRqyk=
X-Received: by 2002:a17:907:7252:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ad85b120626mr1097477166b.9.1748417614813; Wed, 28 May 2025
 00:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522172535.302064-1-linux.amoon@gmail.com> <174802762618.2701053.17389702773465611504.robh@kernel.org>
In-Reply-To: <174802762618.2701053.17389702773465611504.robh@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 May 2025 13:03:17 +0530
X-Gm-Features: AX0GCFuQMy8n1ZwrrUkMQP3W0riMpGcHItsAis2ldicF1OXrte5AN2N1gNz0rP4
Message-ID: <CANAwSgQFbhG-VPwSsEZcMZq3VE8n14trr4uXp8MoMW3ML+vHDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and
 reset properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Wayne Schroeder <raz@chewies.net>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Sat, 24 May 2025 at 00:46, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 22 May 2025 22:55:31 +0530, Anand Moon wrote:
> > Add missing reset-gpios property to the USB 2.0 hub node to
> > ensure proper reset handling. Also update the vdd-supply for
> > both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> > for consistent power management.
> >
> > Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset o=
n odroid n2")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: dropped remove of usb2_phy1.
> > v2: remove usb2_phy1 phy-supply since now it's managed by
> > the hub reset control.
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 5cdb2c77c4c3d36bdee83d9231649941157f82=
04
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/amlogic=
/' for 20250522172535.302064-1-linux.amoon@gmail.com:
>
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: usb@ffe09000 (=
amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexe=
s: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
>         from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-=
g12a-usb-ctrl.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: usb@ffe09000 (amlog=
ic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^=
pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
>         from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-=
g12a-usb-ctrl.yaml#
>
Ok I am able to reproduce this, it seem the issue is with second patch

Currently, I am in the process of debugging the onboard_usb_dev.c driver.
It appears that the driver is not correctly parsing the perr-hub node and
is exiting prematurely. I=E2=80=99ve been able to partially identify the ro=
ot cause,
but I haven=E2=80=99t yet found a proper solution.

alarm@odroid-n2plus:~$ lsmod | grep onboard
onboard_usb_dev        20480  0
alarm@odroid-n2plus:~$

Thanks
-Anand
