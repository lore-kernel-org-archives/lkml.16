Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E70194137;
	Wed, 18 Jun 2025 01:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750211983; cv=none; b=Q4NYdQUF+Jy1Ds1Rd4mnU984Agqt5RW8oYSJR8Jg9EIUZcLys8U/DSBeMT0Eb1z+NDgfZ34gcY19aLKvCT22ps9Gr8Zy1qVwXkpR0PvXyn0jyZI45EiSeMbj27L3neqmzgZKqj42T9lRXSAYiD+c/TuqgYiIgex5znhXpw2CWL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750211983; c=relaxed/simple;
	bh=n8wg52qiD0jXK1ARGyQq6d+TXH96Oegl3mLLUtVgSq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvSNAWx20AFeyuMjKig9TFwPFn9jPVWqSVy8Fg7be5U/A9JaGa1Y6Hq7rfTeuKG40nW+ub6mSiGrxKqfk68HQg9WbdF9no6lYWZpgc4muct1y+dm1zxkfIIJj1vLr7w/A0cqnzdTE1nSexTeuB+DyU7iTBfrMWmreZ5jfRhzxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8Afh47E; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8Afh47E"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2196871f8f.0;
        Tue, 17 Jun 2025 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750211980; x=1750816780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFKCnbNn1bDqe5v5bLkKEdiwzvFlVEFsyLsrg5iRjl8=;
        b=h8Afh47EmaUMLLsZ6UCKx1dsul5iVPeiBVJ3Eoe/ALuAxx6TIX7rlj8OtrvRkxbrrz
         nSkFac3sM1dQ+/jxM+QMXvAORnBsgdgsjTgKqJRetWFo+ynAOE3C4u9G9VOZXHUd7MtS
         APwdt71AsXha9bA9SU5QPKg4fmgBgYTxqFgmLpPzjQ3J8yFbtywjiIosteq3mqQzQ1gQ
         UZ044fV3B73+7re+WOhvE9qhrZnSRt7EgHUfVqp2Xaw0RPDLXwVJCuNyasGGiLZS+40Z
         Hsbk3pcCZ1r5k4fgNxrkDCayidQueY3q3wYxA8WI3CBt+BBgQpezwR1IlByBibHlV4zw
         3QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750211980; x=1750816780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFKCnbNn1bDqe5v5bLkKEdiwzvFlVEFsyLsrg5iRjl8=;
        b=SFPxi0tnrrzol6KMyImEHce+8uuFnOsS7OUySexT3DNsfNClONW13xioYEtk8YP9X+
         EkTqP41p+tr2vzBCgU/3speWjtdUrd7CfJUdkwVP43TpceMME0FPd9a/61uNoR4KmQVX
         MRKwzL6Tk32LZKZluwCT3D5YcmKqCeUrZw64O2s2vSWPPMt7uV9F/ywz2Lu2pjTRj5P/
         SusduFJlFVna6PjzRZfCmCs+MRi/N01lkfrS30MisDLUqhpa2D4GcO6XWXNGJyeEor3U
         oHKfdLNM0jlnv01SNzL9IlwY7XnB/4fcIaQGl59JOtFG9JKg9Pkx91l3JklmhUy2Cd9b
         Kr3A==
X-Forwarded-Encrypted: i=1; AJvYcCX22YOtwJ0OJhods79amPwrAtNu0W0ckTd2bUySVUqcBkRuCT85r/Jx1ux2PdDUaEsS5LOSzc61N5vC8K9G@vger.kernel.org, AJvYcCXI/IqSF73v7YYsw87yOzZDD5WogQl+fZY7FqEq/ZTthmDA3wy0MHMV8AkoMC0aTn7oT+wQvgjGl0B9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+kAEWPw970jiHLFUC/2ePKDHJYc3ooo7gmAzO/wCyU6Io6nj
	JVQZC8Ov7qmGNse3NC69hM5UPImmShC9IIkc45QRVafgicGqR69fUwlVNALU0AZJTqttnwf2S9y
	sHpD61zoKGKDND/TO2fnvHxEzROJk8us=
X-Gm-Gg: ASbGncv+Vba+i48Ofn3dEFyq98uDgvLnkwXPW49mvR+n3dr87pcifh8lhqMBHQ3IVWz
	LUmMM5i5br+8nC/BkYObyMXLK1x2UDnkyDubj914I5TZctmm5qoNMQ3s3clScsFCtD5o0Nv7Tff
	lyLRpSuKQaSI4AmyuI2zk0jt2Wce+Zlb5lzCuLfTWcRZ1Uyd6wlHJGEvVta22f5qxt6d/dlZvtT
	UVF8bGEyeox4A==
X-Google-Smtp-Source: AGHT+IGQmwkOIeqTr61hnlAr1/zAkoeC5stDMeIncKSo1hy+Fff4A3fDO6knRQJTt3WedDhfX2o3EVfgIMf54gN6ThQ=
X-Received: by 2002:a5d:584d:0:b0:3a3:64fb:304d with SMTP id
 ffacd0b85a97d-3a5723990f6mr11469933f8f.12.1750211979834; Tue, 17 Jun 2025
 18:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com> <20250617-rk3588s-cm5-io-dts-upstream-v5-3-8d96854a5bbd@gmail.com>
In-Reply-To: <20250617-rk3588s-cm5-io-dts-upstream-v5-3-8d96854a5bbd@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 17 Jun 2025 20:59:28 -0500
X-Gm-Features: Ac12FXy5cpVvK5gEID9BrCvh3p-E9_Lv5BBK6utf9O5u4cKC1jiShpMGr7IRbB4
Message-ID: <CALWfF7+G6MRvuSm8a-a0KcPduXz=sYsJT0bB300rAqmtt2w-cg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add support for CM5 IO carrier
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 5:12=E2=80=AFPM Joseph Kogut <joseph.kogut@gmail.co=
m> wrote:
> +
> +&gmac1 {
> +       clock_in_out =3D "output";
> +       phy-handle =3D <&rgmii_phy1>;
> +       phy-mode =3D "rgmii-id";
> +       phy-supply =3D <&vcc_3v3_s0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&gmac1_miim
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus
> +                    &gmac1_clkinout>;
> +       status =3D "okay";
> +};
> +
Sorry, I meant only the status property should go to the board DTS.
The rest of the gmac1 definition makes sense to put in the SoM dtsi,
since the PHY is on the SoM (as defined in  the mdio1 node). So all
the pins between the MAC and PHY will be the same.

Jimmy

>
