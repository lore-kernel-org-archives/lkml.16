Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BDD3CF58;
	Wed, 21 May 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827795; cv=none; b=KjzKQja/p9+EF81fz8VvM+pX7qUbQYIGbrRnfmKJ9RMM6pRSgJsVwMdNxsMdcbF/ySSgYwvzbu22wgP5CTpA3fcvM7s5VTT02Sh11yRGFSbqb7WQ+J7XgtVW3iLcawPYU3Fms6kNJRT3fzBwDRPrFN/ysM+VjheOF0WJZYLxlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827795; c=relaxed/simple;
	bh=W/bPkfvADUgk8O4OLcSsZG1491vPUJrgmc7+gkEeuwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8E4Ok3a3JP+wskpbL+8bU/8myM+d/J67mX+1cHnG0pwgfElAFFDU5be7B/eB8FW1OEl1QuqAxXuyYpEBNXkXrEvYP/fZkpvP4KuJWqSArMYcIdiYN3eZZAsrQWDr6BKmlslBzLSTzwCsz94mJlCVjg68kNplxXdjU4Sfo6zj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROcCu93n; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROcCu93n"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso2495033a12.0;
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827792; x=1748432592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qvXnpzfFDmYTCvRMWCiccKER6AnXrDuq79CLzj26e9w=;
        b=ROcCu93neFJ0bMiXAxikXh5BIo/27UhI+4yNXQzU5ZwDAJ6lh2dFWXJbkDy0lNjFpE
         t1htk47bWYewIRZ64/aRA0m8R4m0U2B441mgNkUmtMapftFcVBJaFt4FXNHHdzsNxHsM
         Q+iZOyhaBe2kNHoC/62bRBK5Le0DR+9xFPgs4JDBIwVRMuX9wFIfHdKj81e5fDs2vK8a
         JrbQ7UfyPDXW1a3GYpqt/pBqH2tx1Xxpzwd4Wp5vPRRuOgm+1RiCPgkd9ZrTQnngUeGJ
         8flRztqL+sdJi99LRvQtMYQ04W1UxUtdWBPpP+LlFtqTIw+0e+WanY7uJZV+afQICIlA
         pxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827792; x=1748432592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvXnpzfFDmYTCvRMWCiccKER6AnXrDuq79CLzj26e9w=;
        b=VKD65vdqcoTQFjVpebnEXjYMcKK0QWcISziLRcEygZCAtWmIIj7W3icyQeFuQcv/BK
         Zt5Aa7k3QCeGVrUtGEZnAR2fgsKvsWmGZhYvcXY98H2c+jb6Rsg1xbeNYZYFSfFKNR8j
         auYDll6MTieFQRorzQrWxLhooqUD6S8GzjZTV6Unjg1IgbKfB5ah3dREh5ZWLJM/Dv5c
         sfz7Deus0Y/5EenZeEQJMcfZD7N3CgVfL4iZRhS3ZUPnK9gh0NbjaaLh0HPViTIznPx9
         mZOwuC9bdqaqRO2sK6b6wZz3qY2YTJZMt1VCgebVoKd9Vb6HsNevWdBMKm+D+PDfv5xB
         v0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpmTi0g0W2Qoew9ilYUqo4MPyMJ8IJvkNYp8SmCLOXnZf+8rgIMA3dLeMIhou7pLLh/yX+rLq9wTDq@vger.kernel.org, AJvYcCWJt9p5dx6tSf3Q8whfRDQV66KXhlcGVkb5TNGAOJ6NaKlyCLRY2imErhXbZJZm4AwlI0opoRWlWu/K8doe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3RC4RAKGTP+G/RFR/QsFjTDziO9ExYlFhQof1lD35ba612f5
	S/jYMt3QU18fcwENURm7L8sbHgZp6w9wW/2MP0FVOuOTaIYiCqWBjuDzD0KrJTL9iM+VjiBKV0t
	eBn5ZMbDg9q0M4SAKSqqBEF5GCv0YUy8=
X-Gm-Gg: ASbGncugwvih0rFoG8AxcmtLPPxqOXagZZ0yfyYk8XML8QRf5KPpC7WOBhBU+d8lKht
	7ONbi9rbIb0d6lTR6PFEGIyiXaHnU2uGAU8YkldsWIPznz1YOZReOuHI8MMlJkHZF7vV3A5O3mJ
	Lp8ZO0lVGMdzTrMuNy0jsZT2k0IGgliVg=
X-Google-Smtp-Source: AGHT+IFDzNtI/CaK3q6Z0HD2sju7OyWLGycbvanWFVrufRUMz+SMpJuYify2HixyuAXGL6NwA/JUeCrr/7SUp+Trlwg=
X-Received: by 2002:a17:907:9344:b0:ad5:23e3:48b6 with SMTP id
 a640c23a62f3a-ad52d5ba623mr1989900566b.45.1747827791526; Wed, 21 May 2025
 04:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521074535.16488-1-linux.amoon@gmail.com>
In-Reply-To: <20250521074535.16488-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 21 May 2025 17:12:54 +0530
X-Gm-Features: AX0GCFuRNEz_g2JELBFe7G_6vR4egqHEh4dmZX-9WFiiMW0PYC4vW84aMd81Mo8
Message-ID: <CANAwSgTk3R6SMqsNcT7c2AVzQRAdk8Z2Rs0bK3VCsgivR6nLmA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Update USB hub power and reset properties
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Wayne Schroeder <raz@chewies.net>
Content-Type: text/plain; charset="UTF-8"

Hi Neil,

On Wed, 21 May 2025 at 13:15, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management. Remove usb2_phy1 phy-supply
> since now it's managed by the hub reset control.
>
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: remove usb2_phy1 phy-supply since now it's managed by
> the hub reset control.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..d46b6aaef8fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
>                         compatible = "usb5e3,610";
>                         reg = <1>;
>                         peer-hub = <&hub_3_0>;
> -                       vdd-supply = <&usb_pwr_en>;
> +                       reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +                       vdd-supply = <&hub_5v>;
>                 };
>
>                 /* 3.0 hub on port 4 */
> @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
>                         reg = <2>;
>                         peer-hub = <&hub_2_0>;
>                         reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> -                       vdd-supply = <&vcc_5v>;
> +                       vdd-supply = <&hub_5v>;
>                 };
>         };
>
> @@ -311,8 +312,3 @@ &toacodec {
>  &usb {
>         vbus-supply = <&usb_pwr_en>;
>  };
> -
> -&usb2_phy1 {
> -       /* Enable the hub which is connected to this port */
> -       phy-supply = <&hub_5v>;
> -};

This is breaking the bring-up of dwc2 in u-boot
so could you consider V1 of the patch?

Thanks
-Anand
>
> base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
> --
> 2.49.0
>
