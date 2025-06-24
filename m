Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1EF28CF75
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767687; cv=none; b=iiac/nglKsRKdoYMIJNO/0S981XDRIpELrxZgJysUI1gAMENA45oBNZ91D6w/053nauHbzypUmy8brVkb1x5T+1W8cLwrBHl7bgd5qVpL39t1+kriQCLr8BBdGJxb3Q3dQ3+W5QLTPE+507t2M7BuLbPHCIr0PijxgAk3ONJ7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767687; c=relaxed/simple;
	bh=lgI8rPf/30CT9dejJ5LxKgvQMKLxnvAGZzdJaKmX/H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTPPwB67tHuTmhznpSacvj1lFX2uvoqgcId9itEhoYjMZBbeJfDqhN77zlwsgI6t1RvbxJxdb6Y/ekPewIf4NgbMwRj2QFBVl8YhjUAT6RYKMYnIj/vo9ca59XKf4jubaMz9nykqVXL8+EXbbLdgRG8RmagjWJaLPYoOx7r9JAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=S/2cixln; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="S/2cixln"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7086dcab64bso45615537b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750767684; x=1751372484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdt6FPscbYSKb9tt2vK8+IJrClb5NOhYOEtuhJW4Z+s=;
        b=S/2cixlnlQXgeWINsH+Bw4SrJW4OCfwy2dziE/ponJ8l4POwvuG2ymAL3GZ+IYcL7W
         kzZuE1JBV+RizQWLOXsRPQvlLLnnLAkDaMy/0iQLdYK4OqO2OW2EWBKS19YF+XgHwoh0
         jaTKn7ti1sagrE0O/mjU7AxSMFXANgVWxTJrH52o07Rr137HvR3xmM+4PA8t7ACKY3D9
         kPloMYn/WWhgXKTozwAh4Rkyfxh4ivr95lr6C80OBkuLWCWw0vsG0AxRSPvNDi4FhwDV
         wBRHicNBf8WxLPZ05Noq3bn6KMB7cgza1PtCmBDm++9GH0UuYOa+Cj4gztXzzdBbjUNp
         8RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767684; x=1751372484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdt6FPscbYSKb9tt2vK8+IJrClb5NOhYOEtuhJW4Z+s=;
        b=bkQzoPGpMejW5HcNqCWu7i/GEXMGrlX7rsGpi2UldZUCRmg2eA6uxH+nZAS3wRezM7
         hPZCW37F83QAbiQ7jwnSUuvCYHCL1igq8MEo3HCrL24ecZnDIuD6NxSK1CIFn6V9cOot
         HEVCbk5pgYBY+K3WZ925lLREqQ5vryycFHR/RRC/gz4peLkH5GPj1E1QHkHB+5tCEF2c
         s8G+xvqRfE+MrgJ1Q1T4LxqlsaErMxhmohfD5J2upLlgEUb9DoZokqBNAG7ofxs27r/r
         9idWANgiuRxhAwNwTigzj7LiKby3hNDz9iMTGpfW24S/W4WJGlYZHXbnbKWU0//L2Bob
         /Wlg==
X-Forwarded-Encrypted: i=1; AJvYcCUOSKn9+edp8KGR/6lOWIMWw5ca5DIiR5Gu3npNb6PWjIhCOgKuRtnyfVkTe7L9zI606M07+MIAQw8+zSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrmHH2cH9DS3vqRNbGarFp+IhpawyBkBkdDK5x5tB4h/9L12l
	82+y+ndzMBd7iIjiCufyD0BCPsO7TMcFpp6LKOWM45TCfh6pdrl1C0PCVZ91SWrbBt0NrNV+ccz
	Gd2nv/Gr4NIYwpEI7tN7RxvA5ynqAk3ReZyFAgGX/bQ==
X-Gm-Gg: ASbGncs0V+KeIUvmNwvnsqcUU962C07I3i01D5iOv1O1i2GYmv+9RoH94bv6B5DQowo
	5DyeM8GSlbiHqHBN+OMXm0Xsi79dDVqJCySuIYOp0TIASFhezBrPDTGv9rQ+NM5ARGu3/ZZP5Lg
	gy7DDthgtW6n1Mx55s97oYQJXdWU9GOscUZjsgZSwYcUL5l2H6
X-Google-Smtp-Source: AGHT+IGJixjtqEgMzZmY1PuXA7TtT2lF0deavjre5HoqZIOUmxc9xSAXksOeVZSq/6UOOdGkP5nDZV2XSdYMjHT43+k=
X-Received: by 2002:a05:690c:931c:10b0:70d:fd2a:1457 with SMTP id
 00721157ae682-712c638321emr172100147b3.1.1750767683727; Tue, 24 Jun 2025
 05:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn> <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 24 Jun 2025 20:21:11 +0800
X-Gm-Features: AX0GCFvU1ePVl3bPsH_HTEhAPE0vAqbMLg9fVZOyMh7JoiSSyJXSXSqwp3WTd6M
Message-ID: <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
> nodes under dma-bus to reflect this fact.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 246 ++++++++++++++++++-----------=
------
>  1 file changed, 128 insertions(+), 118 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 99c76997b367f733c9dda2c30dd85817294ef9b7..0d41694699851e672a833601b=
62c2b2ad3daae79 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -357,114 +357,6 @@ syscon_apbc: system-controller@d4015000 {
>                         #reset-cells =3D <1>;
>                 };
>
> -               uart0: serial@d4017000 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017000 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART0>,
> -                                <&syscon_apbc CLK_UART0_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <42>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart2: serial@d4017100 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017100 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART2>,
> -                                <&syscon_apbc CLK_UART2_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <44>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart3: serial@d4017200 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017200 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART3>,
> -                                <&syscon_apbc CLK_UART3_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <45>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart4: serial@d4017300 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017300 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART4>,
> -                                <&syscon_apbc CLK_UART4_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <46>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart5: serial@d4017400 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017400 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART5>,
> -                                <&syscon_apbc CLK_UART5_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <47>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart6: serial@d4017500 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017500 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART6>,
> -                                <&syscon_apbc CLK_UART6_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <48>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart7: serial@d4017600 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017600 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART7>,
> -                                <&syscon_apbc CLK_UART7_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <49>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart8: serial@d4017700 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017700 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART8>,
> -                                <&syscon_apbc CLK_UART8_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <50>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart9: serial@d4017800 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017800 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART9>,
> -                                <&syscon_apbc CLK_UART9_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <51>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
>                 gpio: gpio@d4019000 {
>                         compatible =3D "spacemit,k1-gpio";
>                         reg =3D <0x0 0xd4019000 0x0 0x100>;
> @@ -562,16 +454,6 @@ clint: timer@e4000000 {
>                                               <&cpu7_intc 3>, <&cpu7_intc=
 7>;
>                 };
>
> -               sec_uart1: serial@f0612000 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xf0612000 0x0 0x100>;
> -                       interrupts =3D <43>;
> -                       clock-frequency =3D <14857000>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "reserved"; /* for TEE usage */
> -               };
> -

Are you sure sec_uart1 should be placed under the dma_bus? Please double
check. If sec_uart1 and other peripherals supported by the secure DMA
(base address: 0xF0600000) share the same address mapping as dma_bus, and
if they can be accessed by the linux kernel in some cases (as saying
'reserved'), then that makes sense. If not, better not move them.

--
Guodong
