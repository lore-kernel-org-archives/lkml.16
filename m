Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650ECEEDE;
	Tue, 20 May 2025 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751280; cv=none; b=P+vdow/DyprbSyA5J6OqiaolWaRJv5lIuIsYvymHAgDCP7zwygutlct4BWaEShMw7sZIvdEwMRjOGWV/alpKaKe/sLmFYA1iNw1HLcXLnKQcTJjBy8khCIF8YhtL+iDhowXLieD7NDxwFmU8RTslva1fmhAe3oGadU3AIUbUbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751280; c=relaxed/simple;
	bh=7LxaVFuG8WblK35z2oF3zonVuUJXA5JGVsCc6mmfqDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJjN51Gxl0lN3kqE8hf9lSZY9zIUN6SfyOL4SMm7zoyhvCpkGcmefCMRt7Mc+JXn/BRpTbRcIb7ea1rZulbh1LRJDosFWh7cxazYhE9LhpX+So/hGHVzSXRZceYXGactbkDgjm5LJ5QNGE0FFG/OqHtngc4TaCpNTT119+5pkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8tpo9NO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8tpo9NO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad572ba1347so289548366b.1;
        Tue, 20 May 2025 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747751277; x=1748356077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye8PCZ1i4EUKeCPrSp+vS4Bbl8vtgczZniWkr1Nh0GE=;
        b=j8tpo9NOn6B58TAE3bepbMaBMQzuPp0InE6bTIiGnfpNX4lEb1eBvdSCddQdhV8kFh
         ZaVVNZQpwU8pE0M8Y0hly/NPGFes94Y0GHZrGpPPK9dtdexFsA9envtvImVBNBBHp2nI
         z57NAZKwrmVSjt3MGf1M2ZS/zIYoitSFxF5Fur3uftfnJO+im7VYLFvPtYeMl9B9hNiP
         tNDPgwM+1OLh44yNSLc9T1wCzC0xY9JvuT4SeBTjK4InzSPGKhRC15PffwT06xeqLb7S
         2GZGFrbc9CvT7h2urI1AAEhBvEcKXHbnXxz1HFPC+4vsHQC5gwglx1T+JQttUM+i9OJn
         GeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751277; x=1748356077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye8PCZ1i4EUKeCPrSp+vS4Bbl8vtgczZniWkr1Nh0GE=;
        b=tck6ue9nHvG9vgRp3RV0PTZk5M5+08QEHgH5hlzosS/l6yNFpnCvl5Lp3vJ66ozMo5
         4VHcNyp+AKkHvLBuibcbv9EJPBJxH6dfExrKb2iCBpQtSWY137rWgcVWe+2MVNjFr+1f
         dWxryiXmdprTHwtYWn6u6gvugsFsVKzL1YnWNc/izzBSANvtvl5T9OfKqufJPS7l6wry
         iGacju1Z/3s48vRbqjh3E0LRdf6JbSHaSijO42hy2HG9a3YcaifU7lUG2XNcD3eqHsgJ
         bqkp6yj2cmSJ+64US/J0DYZ3NdKIBD+rvidclGnopmagaA5MddMKxgXNZBd7FkX6P9nO
         PVxg==
X-Forwarded-Encrypted: i=1; AJvYcCVHrWN5clfB9cHz+dIg0O6NZEfP5venwFKmL9vVF8cLKKJQXxanrTIy5PAzrYb6nVESC1WEaDMpY3jQ@vger.kernel.org, AJvYcCXp5bvbztRV80bX9WLWL5nvNTfKFNIf4/X6gz2Jjt3lQPpqP7EMiF7eCcAic4JU5sDl31Onwccne1N98GL9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ePYJ5pZBkZf3rhvGQy/VSSfmbMRwbCcn9z+wvoIvy10tTuYO
	ZSWw62e3bnFF7TT0xajgwHxqzgWFR9Gg+sGIT3F48RRbN0UQ/hnoebX8NlNx8bSxTdi+dCFkLj+
	4UyDlK8UtmspRq86RqBhrfQ6e2L6UEBI=
X-Gm-Gg: ASbGncv+a7C1tBqfNJNLef6gdi9nrqBC+ctCuW0jTiA4+u8xTNHUofmDrtWzjhFoaPQ
	2cKcHpo7iv506DkC+uGr5GewhtBwsFmm3pLRJaoPoaMyyvMY+kjLjKYg7tbjfWpRk4144u9b88f
	r1K3V+0rbGFgCqmMedeSiYaWvO+5e6jI1KITSyHMTV+g==
X-Google-Smtp-Source: AGHT+IFZgpPsbCjQ4M57nv2zRvt3oeZ+tcbZ/YAX5E0FusXZLDlDws/m7F2i/u/CIk/aP2/Q7JUqtolBCf+hMq9BjJc=
X-Received: by 2002:a17:907:d9f:b0:ad5:8414:497 with SMTP id
 a640c23a62f3a-ad58414049cmr464555166b.16.1747751276504; Tue, 20 May 2025
 07:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520091842.7504-1-linux.amoon@gmail.com> <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
In-Reply-To: <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 20 May 2025 19:57:37 +0530
X-Gm-Features: AX0GCFuk9qchRZpZBJtUb0YknJh95nQU5vmvBDf2Ydkc7hsmi9ejA79lugkbvVI
Message-ID: <CANAwSgQrg06aZayOSFh1h1=bxqyvRje1aU-+NBNSoKrPeTAaDg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset properties
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Wayne Schroeder <raz@chewies.net>
Content-Type: text/plain; charset="UTF-8"

Hi Neil,

On Tue, 20 May 2025 at 18:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 20/05/2025 11:18, Anand Moon wrote:
> > Add missing reset-gpios property to the USB 2.0 hub node to
> > ensure proper reset handling. Also update the vdd-supply for
> > both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> > for consistent power management.
> >
> > Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > index 3bca8023638d..ad959f8bc1ac 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
> >                       compatible = "usb5e3,610";
> >                       reg = <1>;
> >                       peer-hub = <&hub_3_0>;
> > -                     vdd-supply = <&usb_pwr_en>;
> > +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > +                     vdd-supply = <&hub_5v>;
> >               };
> >
> >               /* 3.0 hub on port 4 */
> > @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
> >                       reg = <2>;
> >                       peer-hub = <&hub_2_0>;
> >                       reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > -                     vdd-supply = <&vcc_5v>;
> > +                     vdd-supply = <&hub_5v>;
>
> In this case, also remove the &usb2_phy1 phy-supply since now it's managed by the hub reset control.
>
Ok I will update in the next version.
> Neil
>
Thank
-Anand
