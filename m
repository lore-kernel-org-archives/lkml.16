Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3217BD6;
	Sat,  1 Feb 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407712; cv=none; b=qXm6Oj3e6z71QTsXDv/g4+vORk6P7Yr+WMJFVQZUMP257n/KUE/6vEYz+087OrVgeWIV6rrpSF0IzqwovwCKeYr/vhtZQwArXZ/lZ1M85hmgx3vaBpg8MjPJqaROGunEESiIINwYcoVdO9a1HAwxLYZDdoxmoud+p06r30ZvMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407712; c=relaxed/simple;
	bh=k4VeygnUS+nfavsjUsvt0PYTReb4TcKfgJiP756W5XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guvbSsr4grfwm6CLDMiakOho6wYgvKZaUr7I2iOdELYXGOh7tpYlC6HgTHo/v0uakS08k4C3ldAQ/4RYwKXR8AI7B3ZNAYDEdP8UBa35U4msxEeEceRR5NIDPq1qAZev9luuyc2Yv5NeoxSJlHZs0EOBqT3O/ebinhqh0LS4sHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=OghGsq9q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OghGsq9q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216634dd574so33759505ad.2;
        Sat, 01 Feb 2025 03:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1738407710; x=1739012510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=OghGsq9qBtKbKLo9srk5Xdx5eBNtEzL8+lyNIY7/dAyOVOyyUOsQ3mpDM+j0uq0eEl
         ngShSViOUP96QDaZeQvmJ3lR4TRTRy1EfzxmAeM9Ygq+yYKP5T1By86lOr16iq3ipDit
         zzwA9XrHIlzDB+uPdaKH0FgL36EmJntMUe8D0TrV00Q/aXbctMKk9L3q8TsKSoF4ugko
         nQaSOD76KLa8NWvcIdsvC7ujwtx8LUQcMjvyMR+PESVKPPGRibcWq5zjDc9Hm/WuZ2Rp
         h1RabIH7wODUG1s8lgdAC4MwB80cvx6QIijmytrlW3yc6gxrNj75bdSfiH8LlPQUZ2Ai
         ziSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407710; x=1739012510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=b3pApy5CvpSC/KS1gmnkRRKZxW6mtb+JqHEUXsJQhyU1dpuSFReeDPr5FwYAcTUDe4
         Ht9rhkHUGkzbN8XJ5ED5cRNSyR26t1gwiZYfdWb1F+OwmXBdfUoKmK1U/8tYESz/UhJJ
         7+cQhF3dcRzDBkFjKxnO4G0cG06mAExm3HwDmRPkQp5lCncNYSSk8RiCjNW61Rg/ALNw
         k/TvQqBxkp38J+zfZ7ykgvGAGSceH7YpTkOk7ajfpAlYOHzLUPksPG83u7mVFbc7GoCQ
         lffXN6Hb+TkH8YhqCkNGHfEtQ8eR5wY6ZFvoN8JMN34jCumma+aknSZh2MRhB8sMGFBD
         YYrg==
X-Forwarded-Encrypted: i=1; AJvYcCU9CgR6cg5LNmOTX0UFQxs+0mTMjhqUjhYISTIhR8mMxr2TEkfFkPemuvXAYGnyVgqecrxr8WkP0B0B@vger.kernel.org, AJvYcCX/ApilIK8X9qScDHNLfQl+Mrgp8XXg6RILXONHaTz7/+z7Ha7I6sz82wg11hzF7+3+GuzKWfOE0ebISFck@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCO+JXcaiHLFvL2nbhzH3yxqjEGnNvteNiGWY+qZboAD90gQP
	4Pge5KQxFkVFzN7vfZuzSAZoGHC92l2dPF4GRyIl5ZJasMvtSDAVlnMs6rQKAl22Tr+sdpK4iKY
	jS8+i/DfrchBSLFzPYzth6IogFAE=
X-Gm-Gg: ASbGncsD2Z9xq3q0iz/FfUkJ0LuHrixRHVTVujEEhZr37Gkkf+ZyzLIwbNRJLfMbYaD
	gS1rHmKSJc9KqK+RQ6l43m/ZmPP4+NxzNcvgYuyFzUozYYEEVd0zI+ed2/DSe88S95eZf08usv6
	xKXB+f629iUXE=
X-Google-Smtp-Source: AGHT+IGrcFP3fi7nZj16nCl5OL6FPEPmSqptYgvrx04MREEDcnn7VynJHZBiOuPcwfy53f71XzvVP/oyU5M11jIaiKw=
X-Received: by 2002:a17:902:e84b:b0:215:b087:5d62 with SMTP id
 d9443c01a7336-21dd7deec73mr235159955ad.36.1738407710240; Sat, 01 Feb 2025
 03:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131200319.19996-1-funderscore@postmarketos.org> <20250131200319.19996-3-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-3-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 Feb 2025 12:01:39 +0100
X-Gm-Features: AWEUYZkXEqHyhsd8L6lSp8TYewHZzKYzaHWOXDWjpy_w3xCcDMFYNnIQJ6qrfB4
Message-ID: <CAFBinCA+=aqE_=eMFtwpHYVX+8CrtecvHexpHNe_7nh_dDhKYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Artur Weber <aweber.kernel@gmail.com>, 
	Karl Chan <exxxxkc@getgoogleoff.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for the patch - I have a few small comments below.

On Fri, Jan 31, 2025 at 9:05=E2=80=AFPM Ferass El Hafidi
<funderscore@postmarketos.org> wrote:
[...]
> +       cvbs-connector {
> +               /* No CVBS connector */
> +               status =3D "disabled";
> +       };
You're inheriting  "meson-gxl-s805x.dtsi" but I can't see that this -
or its parents - define a cvbs-connector node anywhere.
Can we just omit it completely

[...]
> +       vcc_5v: regulator-vcc-5v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "VCC_5V";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +
> +
nit-pick: since you're planning to send a v2 anyways, keep it at one
blank line here

[...]
> +&ethmac {
> +       /* No Ethernet connector */
> +       status =3D "disabled";
> +};
Similar to the cvbs-connector: status =3D "disabled" should be the default =
here

> +&internal_phy {
> +       pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> +       pinctrl-names =3D "default";
> +};
why are there Ethernet LED pins if there's no Ethernet connector?

> +&ir {
> +       /* No IR */
> +       status =3D "disabled";
> +};
This is also disabled by default

[...]
> +&pwm_ef {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&pwm_e_pins>;
> +       pinctrl-names =3D "default";
> +       clocks =3D <&clkc CLKID_FCLK_DIV4>;
> +       clock-names =3D "clkin0";
> +};
Please drop clocks and clock-names to make this work with linux-next.
Background: [0] is queued for the next release and it means that the
PWM controller driver will now pick the "best" clock on it's own and
overriding here will likely result in your board not booting.

[...]
> +&usb {
> +       status =3D "okay";
> +       dr_mode =3D "host";
> +};
> +
> +&usb2_phy0 {
> +       phy-supply =3D <&vcc_5v>;
> +};
I'm guilty of this myself and I think you can be better here:
Use vbus-supply =3D <&vcc_5v>; in the &usb node to correctly describe
where the USB VBUS signal is coming from.
(I believe that the PHY is not internally powered by 5V as the SoC
doesn't take any 5V inputs)


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.b=
lumenstingl@googlemail.com/
