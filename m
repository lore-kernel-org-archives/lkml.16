Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C151230BEF;
	Wed,  4 Jun 2025 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019985; cv=none; b=W5haRD059qxDodbfBhZRlwGiFAm0RWxJ7bjmli2y+xhmmcqdTCljJC6E+KE0FsktlSqF53kmO5n2FXNnjimC+PG7YpU5xZV84R9syE4vsVhHsKAzytJKOTSiFH3hn91odfNSp72mT8qI4a6YZ2jE5Q/TQ5bQ4m//AX9u8hszwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019985; c=relaxed/simple;
	bh=CeOM7f/t+4m2dtT81Cgj/W88cnWvJcPVL+WYVAmpU7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axfhxYX2VKFsNyPFRbltYPRVZNAVExUZVvmarVLJAd5t4R/rb/SviiHAt+/qlk0Sr69APjAfy3vIUMMR5/EQqRq+Zf/+zVfcY8OpIOGQoYHJPFTtW/kQa947gA7qfT8DfMi+hKwt/tDgfXsQfW4gr1P1zqTYQnrMvx98zJ7tYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avvXla1f; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avvXla1f"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6face1d58dcso76008176d6.2;
        Tue, 03 Jun 2025 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749019983; x=1749624783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyVjPzyLcJPTQJH1h6UfkUu9+f/KgbX90KrYVoyGLHY=;
        b=avvXla1fBmfPcYijqPcqbn7z8CyYJ4XGPlzoCzF8u3aVo9bTD+w6iHQg3T55da11pZ
         FGPU+LSRnLOmf2yaEDGJgFuuDPjT9pHQI2loOW8lqfPO9wo+uUW0XGaJXM6UskbQs3qt
         IR0tf0yMJW7yTCJ1XXkmnbeUhMBrkMQs2MzdxsbHj3TYQt613uuHg5EIhGh/w3riIWSW
         16dTmKLi+hLnl/EeZx4/HEOJGYw1nTe8LD/1yyfSRUExhjx4RbTAQ4zK0Urewth1k3FX
         Ir5ixcKF8KsrxWTtLTlXu482m3wBljlGeekOLWe/UsENyx7mtHnuuNbADBl57d954fa7
         TUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019983; x=1749624783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyVjPzyLcJPTQJH1h6UfkUu9+f/KgbX90KrYVoyGLHY=;
        b=aGBiPIami5hMOIXBtzc76rIQCiQ/j/YHLuMinI5IaF5oVPHkytkFihQXML2Gm+y5tH
         rT3Ez5NEPe4/BdtH0PsYrmVrXX3WZKtPknpPsooNvVdNR7M6H1hwXzHCKCuv7/6fZz7j
         EtykGIEmy1FcDCikqRCjnQThY1MIQ7EYn2CaGAsJU9JuKxrkw8aS0uJnGWUqAYtLBt9p
         0EJYNHh1kzs4W7lsPdZAaWBitaT4iTyz478jIbDF+VVxFC0+8eGXnQGAzPogTsdY8EKP
         6eGIBsvCujXmkiRfNCxXQTbVvsEhlMi9hn8WSuIA/x3P2uNbczGG50AqHFTmIHkJv1Xo
         nwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFbDi46dCNO2/VbyPMOni+scg0vSSv9ZR67T/qwzzXH8VqDIuomZ5eEoZ9+qWWqx4yDfu0VIVXXgtBnXoT@vger.kernel.org, AJvYcCWjASwsPIgy3o4ZDHldreP69F79qLnKc0Pl3zCeeh3CIyb9K7t1LrRhFWz7ExbxEgslUbXtpHTXdamg@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsBAWYDiMTOmIrqkMsOxWTjGCPzObXY6xctcs3RxSLM0sDB/a
	cc2RGzq4ZYBqK6s4d9buu3Yiu41h5slkJ72ZX09Cwj22+2md5Z8k0O40x5s0iW3qZUOM0CTbHBl
	Ws1TBifJ+fQtngUX1XG0qaFhcE2g51WGBaDoKeKnnnKHB
X-Gm-Gg: ASbGncvpLWDYuiEdBKETGB8ZkqxkfFXgqdsJpXra5s72iFBqVcVh2N5+P8Kefv61s93
	vDDCU9Bw6WIyemqRnlr0J2IAAhEFbgZkBkTDs6Dc3Yxzs8wwvnkRZH1xB4aaiUVtoZ35sETM8OP
	HVWBpKnTbiZRMGJtkPwhScCjd5Isx+W0E=
X-Google-Smtp-Source: AGHT+IF7dEVyEdH+C/HunhhJcZxvr/1H6/oLSYayWQ8oFVL13uluh9+PHp86HTOwmJ9nRQzKHedGjPMItad1gxDjveE=
X-Received: by 2002:a05:622a:4d94:b0:4a5:8b39:626b with SMTP id
 d75a77b69052e-4a5a57bbda3mr28729721cf.27.1749019982787; Tue, 03 Jun 2025
 23:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com> <5590100.Sb9uPGUboI@workhorse>
In-Reply-To: <5590100.Sb9uPGUboI@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 10:52:51 +0400
X-Gm-Features: AX0GCFvSCwxOtW_Sjp_6g6sDf5cAGfQNHG5Np4jna6_VvTZF7K2r6CnfR_dIWK0
Message-ID: <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 9:51=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:14 Central European Summer Time Alexey Char=
kov wrote:
> > Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
> > Sige5 board.
> >
> > Both ports use just one xHCI controller, with the USB 2.0 signals fed
> > off the same USB OTG PHY through an onboard hub. VBUS of both ports is
> > controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
> > toggled by GPIO4 RK_PA6).
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
>
> This is already done here:
>
> https://lore.kernel.org/linux-rockchip/20250507-rk3576-sige5-usb-v3-4-89b=
f5a614ccf@collabora.com/

Oh cool! Sorry I missed that one. Your series is much more
comprehensive, so this patch of mine can be dropped. Thanks for your
work!

Would you mind chiming in on the other patches here, given your
knowledge of the hardware?

By the way, you guys don't seem to carry those patches of yours in the
Collabora tree [1]? Nor the TSADC updates as far as I can tell.

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/=
blob/rockchip-release/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts?=
ref_type=3Dheads

Best regards,
Alexey
