Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150828C5DA;
	Wed,  4 Jun 2025 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046549; cv=none; b=dVib3jwNCDZSZhBwtca3AJh8fAlc3V/SGK1KjXcJVxPlmJ5/ofs071y3mn8zBt+FWEEb3H699Zs+dCgnQhfMjDgFS44H2cXLYDK56NehYcLPDGPUisuOhT9nbIULTIpCFw7lKMglhgdqZq6tueEHwCKQF8C7CDVSukyLVIVaSj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046549; c=relaxed/simple;
	bh=gBw2sPZbSZ94Xl91tVnXofKOr8d/lM01jlW3dxpKauE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ip2u/qKM89fubEGL7PWd4mW2CAhLIrgPgwNzEspsXqvfGeL0gypRMzgTt0EMt5s0/tx8mtR9uWyCmK6J/cqAEs5/EBUCGUiW0Lsa5fN516csb768g2TJY4fwxYJ8+8ctKvclbRWNZDhM4kn0mLHFKSJdhycA+ZjQkFRUSmBuDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDYUP2JD; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDYUP2JD"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4772f48f516so10402191cf.1;
        Wed, 04 Jun 2025 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749046547; x=1749651347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Jg5NzVH9x0e/UrqCaECe5kEEmmSbvsrq491+SQEdD8=;
        b=nDYUP2JDDxQLWEhjxNC0UtB2OBeqZQLOhOOnqzZ1ryXgRyGQKKHOczV8HiXpadtvff
         jSmDjLQU1J91aslZB7dWFM4ng1vjmpUQo5Oitgiya4PJpkrJDwyFeb1uizJW4oAdP5dh
         4p3LXe7gsx6gs0Owm8+8YVvALUQeKQhabDQ/A/w9AD7dSd2I9KUXuJ2QMjreJ5PZaCT/
         SlqRVcDT4brhJOmD/AS9D7IOzkydE8QoVO/kXdZFYxgs/vVvjDND47ftZhN4TAwKXHtY
         ldrn1VWCa1ZlrgxYMr/A14QW1q3Sr/jC8JkF94dvlQ5pXfCDM+ATb0nH1kcJ49St8nM9
         vwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046547; x=1749651347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jg5NzVH9x0e/UrqCaECe5kEEmmSbvsrq491+SQEdD8=;
        b=rBea2wuJs5DktykSTHoC4yiujXMGOBpRK62M7srlZdbWL6cMV1qI3KPQfEK5IR761Y
         86URWrlOGdn9oLKMxN3GInPJLUKiC4mGqJ0VKiQpjKzGiClyIMZU2ugL5VjvZCJk4rFc
         Lzup3vzxrl+sWP/NmcUCCJDkAC7zUsQu9hT31oX98MZGoJ075+tsSqfcB5K8+0ZTyQxa
         IcdGGB0izLxvfYGTzoVJDoWQh0ys6Fo+GubAC3ElrXoUKPRmTvp97FFUccAs8iB9u74D
         ysLh4b31zCDXhA2NKHRwSJ4Z66PzInclqqoxcUZeRvVijcHVrqFzlCN75UOLo8brDHPG
         panQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOQwrND8mOoufOrpW0hOnlyOAffovfOKYWCP8Hf2se/oENpAojSaAGSBliBEulMageKDdq4zwA+loT@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmydVH18++KPNHbkXLI0Ixr/PHY01BIKEwh3oVCFV75kYBVL5
	9E2ugZY5a3HRjh8IN2om67BQMTrh9Eh7LRO7wa/sQZb6R7/l94E1Q2Rr/bQIVMdC6u8eMreU4S7
	dtp/J1HNVLqOxTgNEaR5XIGD7i/FVFkQ=
X-Gm-Gg: ASbGncvR5CCZqpgyerQ23o+J/x8aJvI0hoKH5SopI9qzf06SvXCw5PDgfrzoVg4ZSeo
	4MdWjMLqjmyxIjcHFabtn6Rq0NknzjRd9cPy2VPN5y/ynCFFZT4nWJUEclpJI3JHMzJzQ6ZgTTy
	zg8E6MH5AA9EvYkI60YhdCpCxD8kVjCso=
X-Google-Smtp-Source: AGHT+IFyPdm7h42GRcVyPmAA4X8jANkDh7Synd5egnSqzeiSSM5/zmGzBDUZs3mzMIf1pwlRH506uMCvsx+yJMdRwm0=
X-Received: by 2002:a05:622a:4d0a:b0:494:7191:9f80 with SMTP id
 d75a77b69052e-4a5a56f2403mr53082581cf.16.1749046546628; Wed, 04 Jun 2025
 07:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com> <174904540020.3869609.29886103068021354.robh@kernel.org>
In-Reply-To: <174904540020.3869609.29886103068021354.robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 18:15:35 +0400
X-Gm-Features: AX0GCFuFHM52cAYw2Dx-JD6z3McuUg4g7ERZuiqkBqoiRvc1ZSxeJSlSnxPNrig
Message-ID: <CABjd4Yzfy3A95EVXGh6espREMTpUOD=GoR3orxScmWJW85R3dg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals on
 ArmSoM Sige5
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Tue, 03 Jun 2025 21:01:12 +0400, Alexey Charkov wrote:
> > Add support for the two USB type A ports, link up the CPU regulators fo=
r
> > DVFS, enable WiFi and Bluetooth.
> >
> > The bluetooth part might warrant some discussion and thoughts from the
> > list, given that it's connected over UART and thus not discoverable. At
> > the same time, there are two revisions of the board which have differen=
t
> > Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based o=
n
> > v1.2. I'm not sure if there is any way to determine board version from
> > software. Mine is v1.2, so the respective patch deals with the Broadcom
> > case only, but maybe it's better to move it into a .dtso and thus kick
> > the can down the road (i.e. make the user deal with board identificatio=
n
> > and loading of the right overlay)? Thoughts welcome.
> >
> > Best regards,
> > Alexey
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Alexey Charkov (4):
> >       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
> >       arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
> >       arm64: dts: rockchip: enable wifi on ArmSoM Sige5
> >       arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
> >
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
> >  2 files changed, 151 insertions(+)
> > ---
> > base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
> > change-id: 20250602-sige5-updates-a162b501a1b1
> >
> > Best regards,
> > --
> > Alexey Charkov <alchark@gmail.com>
> >
> >
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
>  Base: using specified base-commit 546b1c9e93c2bb8cf5ed24e0be1c86bb089b32=
53
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: mmc@2a320000 (rockchip,rk=
3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too lon=
g
>         'rockchip,rk2928-dw-mshc' was expected
>         'rockchip,rk3288-dw-mshc' was expected
>         'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc',=
 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-=
mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk33=
28-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchi=
p,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'r=
ockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-msh=
c']
>         from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-ms=
hc.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockc=
hip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fi=
xed:
>         ['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too lon=
g

Should be just rockchip,rk3576-dw-mshc.

Thanks bot, and sorry for the noise - missed this one.

Best regards,
Alexey
