Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DF25D21A;
	Mon,  5 May 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461038; cv=none; b=JeY3Mpb2CPAs7ncpLHFPuxLhFHIqvL0BX6xQCKNoXovEnEegvOgnL1uGtLP2AoJQAhsQwoIjJeG6rnFaYG2Cih5WGizYNHjKuVKFpL4639rWGgoYog6SPWDERWFiWKNc/nQUFm34JYy8iFHfGEm2+5dOoDOpWArUd1lrC65q0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461038; c=relaxed/simple;
	bh=qBz3bawuzlenHpbqjj3H7ok1Chrb+oB/l7xvhAJvRVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWlkdZ/jnEmpU9g93uJq/SH0k9umeFWVfv3NldvnUEWqs910qYi3VBhh6QF2OkGZUKDRwyUMXhDebkuVlJuAMmIYdwfISJBwV7IK+kckSOOFFzG15MNvKsDh00x/1h5063ywjQdhazc/0AvGLwsu/PWovW7kE1Fq2+zxqJLK5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=phy9QWlW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="phy9QWlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746461010; x=1747065810; i=wahrenst@gmx.net;
	bh=nspZRGz/i/6mnAvkbCpGKriDSYA1aqeM4ht5VL78W/g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=phy9QWlWuwq/tx6bwA0i1GMAYUNO2WZzQi7h0qAwSjfivZydcP0AVncAN0Io1cyB
	 ix6MqmBZVF0oyBMw+B9qgmbakbEE5ileo8UiZDtnesw7D1mZsKPkWDEf4aZXluIkb
	 GAnSeM/uoI/ebSn/u6C1HeUDoFNCcPbmK/x3MVMsNzamTD8SfzX5lk+N/tw7ROAxI
	 AMjvNGdc9fhBuJcOGFF+iRCjoEjgWHTtsoEx9U8Wx2cOU5O5l0Pib+/1grT4dA02V
	 R9Bnga2lCc597s1YKARgkekkm/wX62omX0/uEQZ5imMqtP7MRjLhF3sIp3arvlGBp
	 z5M+jVGcalh0xjdFpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.101] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1uQUrf2bWH-00YXr7; Mon, 05
 May 2025 18:03:30 +0200
Message-ID: <ee082ba2-d452-43a1-bb94-3c04c407ea31@gmx.net>
Date: Mon, 5 May 2025 18:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 brcm,bcm2835-armctrl-ic to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20250505144618.1287539-1-robh@kernel.org>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250505144618.1287539-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2E1LYcmiqquUyR1NW/BV5KhqR1ABN0uS4PVerjkQBC3ed0wVt+z
 W/C6vKZ47Z0rMYv116JM4B31zpfPoXJCHmezTReTWrw9ZLpdqYgMLjFGvPYcS6QjWvfabHv
 7b+jYQStS69QR8BzFUBuiCRLKX7tsCJgXzXzyR48ho5fP2Xk6rhUmYZc4+QtKTYt//DlBNu
 bYEZB58UPFbzxLfws0Lhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nHgtIr0AuXk=;HlbIA1vMwXYDA+1g1WVupQ1f+hP
 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
 MwAJTeEE5sz10=

Hi Rob,

Am 05.05.25 um 16:46 schrieb Rob Herring (Arm):
> Convert the Broadcom BCM2835 ARMCTRL interrupt controller binding to
> schema format. It's a straight-forward conversion of the typical
> interrupt controller.
i send a similiar patch on May 2nd:
https://lore.kernel.org/linux-devicetree/20250502105213.39864-1-wahrenst@g=
mx.net/

I would prefer your version, but ...
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../brcm,bcm2835-armctrl-ic.txt               | 131 --------------
>   .../brcm,bcm2835-armctrl-ic.yaml              | 161 ++++++++++++++++++
>   2 files changed, 161 insertions(+), 131 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/brcm,bcm2835-armctrl-ic.txt
>   create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/brcm,bcm2835-armctrl-ic.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm=
,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-cont=
roller/brcm,bcm2835-armctrl-ic.txt
> deleted file mode 100644
> index bdd173056f72..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm283=
5-armctrl-ic.txt
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
> -
> -The BCM2835 contains a custom top-level interrupt controller, which sup=
ports
> -72 interrupt sources using a 2-level register scheme. The interrupt
> -controller, or the HW block containing it, is referred to occasionally
> -as "armctrl" in the SoC documentation, hence naming of this binding.
> -
> -The BCM2836 contains the same interrupt controller with the same
> -interrupts, but the per-CPU interrupt controller is the root, and an
> -interrupt there indicates that the ARMCTRL has an interrupt to handle.
> -
> -Required properties:
> -
> -- compatible : should be "brcm,bcm2835-armctrl-ic" or
> -                 "brcm,bcm2836-armctrl-ic"
> -- reg : Specifies base physical address and size of the registers.
> -- interrupt-controller : Identifies the node as an interrupt controller
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt source. The value shall be 2.
> -
> -  The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basi=
c
> -  pending" register, or 1/2 respectively for interrupts in the "IRQ pen=
ding
> -  1/2" register.
> -
> -  The 2nd cell contains the interrupt number within the bank. Valid val=
ues
> -  are 0..7 for bank 0, and 0..31 for bank 1.
> -
> -Additional required properties for brcm,bcm2836-armctrl-ic:
> -- interrupts : Specifies the interrupt on the parent for this interrupt
> -  controller to handle.
> -
> -The interrupt sources are as follows:
> -
> -Bank 0:
> -0: ARM_TIMER
> -1: ARM_MAILBOX
> -2: ARM_DOORBELL_0
> -3: ARM_DOORBELL_1
> -4: VPU0_HALTED
> -5: VPU1_HALTED
> -6: ILLEGAL_TYPE0
> -7: ILLEGAL_TYPE1
> -
> -Bank 1:
> -0: TIMER0
> -1: TIMER1
> -2: TIMER2
> -3: TIMER3
> -4: CODEC0
> -5: CODEC1
> -6: CODEC2
> -7: VC_JPEG
> -8: ISP
> -9: VC_USB
> -10: VC_3D
> -11: TRANSPOSER
> -12: MULTICORESYNC0
> -13: MULTICORESYNC1
> -14: MULTICORESYNC2
> -15: MULTICORESYNC3
> -16: DMA0
> -17: DMA1
> -18: VC_DMA2
> -19: VC_DMA3
> -20: DMA4
> -21: DMA5
> -22: DMA6
> -23: DMA7
> -24: DMA8
> -25: DMA9
> -26: DMA10
> -27: DMA11-14 - shared interrupt for DMA 11 to 14
> -28: DMAALL - triggers on all dma interrupts (including channel 15)
> -29: AUX
> -30: ARM
> -31: VPUDMA
> -
> -Bank 2:
> -0: HOSTPORT
> -1: VIDEOSCALER
> -2: CCP2TX
> -3: SDC
> -4: DSI0
> -5: AVE
> -6: CAM0
> -7: CAM1
> -8: HDMI0
> -9: HDMI1
> -10: PIXELVALVE1
> -11: I2CSPISLV
> -12: DSI1
> -13: PWA0
> -14: PWA1
> -15: CPR
> -16: SMI
> -17: GPIO0
> -18: GPIO1
> -19: GPIO2
> -20: GPIO3
> -21: VC_I2C
> -22: VC_SPI
> -23: VC_I2SPCM
> -24: VC_SDIO
> -25: VC_UART
> -26: SLIMBUS
> -27: VEC
> -28: CPG
> -29: RNG
> -30: VC_ARASANSDIO
> -31: AVSPMON
> -
> -Example:
> -
> -/* BCM2835, first level */
> -intc: interrupt-controller {
> -	compatible =3D "brcm,bcm2835-armctrl-ic";
> -	reg =3D <0x7e00b200 0x200>;
> -	interrupt-controller;
> -	#interrupt-cells =3D <2>;
> -};
> -
> -/* BCM2836, second level */
> -intc: interrupt-controller {
> -	compatible =3D "brcm,bcm2836-armctrl-ic";
> -	reg =3D <0x7e00b200 0x200>;
> -	interrupt-controller;
> -	#interrupt-cells =3D <2>;
> -
> -	interrupt-parent =3D <&local_intc>;
> -	interrupts =3D <8>;
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm=
,bcm2835-armctrl-ic.yaml b/Documentation/devicetree/bindings/interrupt-con=
troller/brcm,bcm2835-armctrl-ic.yaml
> new file mode 100644
> index 000000000000..4edc4c3ff6bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm283=
5-armctrl-ic.yaml
> @@ -0,0 +1,161 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2835-ar=
mctrl-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BCM2835 ARMCTRL Interrupt Controller
> +
> +maintainers:
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
I would suggest to add

- Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +
> +description: >
> +  The BCM2835 contains a custom top-level interrupt controller, which s=
upports
> +  72 interrupt sources using a 2-level register scheme. The interrupt
> +  controller, or the HW block containing it, is referred to occasionall=
y as
> +  "armctrl" in the SoC documentation, hence naming of this binding.
> +
> +  The BCM2836 contains the same interrupt controller with the same inte=
rrupts,
> +  but the per-CPU interrupt controller is the root, and an interrupt th=
ere
> +  indicates that the ARMCTRL has an interrupt to handle.
> +
> +  The interrupt sources are as follows:
> +
> +  Bank 0:
> +    0: ARM_TIMER
> +    1: ARM_MAILBOX
> +    2: ARM_DOORBELL_0
> +    3: ARM_DOORBELL_1
> +    4: VPU0_HALTED
> +    5: VPU1_HALTED
> +    6: ILLEGAL_TYPE0
> +    7: ILLEGAL_TYPE1
> +
> +  Bank 1:
> +    0: TIMER0
> +    1: TIMER1
> +    2: TIMER2
> +    3: TIMER3
> +    4: CODEC0
> +    5: CODEC1
> +    6: CODEC2
> +    7: VC_JPEG
> +    8: ISP
> +    9: VC_USB
> +    10: VC_3D
> +    11: TRANSPOSER
> +    12: MULTICORESYNC0
> +    13: MULTICORESYNC1
> +    14: MULTICORESYNC2
> +    15: MULTICORESYNC3
> +    16: DMA0
> +    17: DMA1
> +    18: VC_DMA2
> +    19: VC_DMA3
> +    20: DMA4
> +    21: DMA5
> +    22: DMA6
> +    23: DMA7
> +    24: DMA8
> +    25: DMA9
> +    26: DMA10
> +    27: DMA11-14 - shared interrupt for DMA 11 to 14
> +    28: DMAALL - triggers on all dma interrupts (including channel 15)
> +    29: AUX
> +    30: ARM
> +    31: VPUDMA
> +
> +  Bank 2:
> +    0: HOSTPORT
> +    1: VIDEOSCALER
> +    2: CCP2TX
> +    3: SDC
> +    4: DSI0
> +    5: AVE
> +    6: CAM0
> +    7: CAM1
> +    8: HDMI0
> +    9: HDMI1
> +    10: PIXELVALVE1
> +    11: I2CSPISLV
> +    12: DSI1
> +    13: PWA0
> +    14: PWA1
> +    15: CPR
> +    16: SMI
> +    17: GPIO0
> +    18: GPIO1
> +    19: GPIO2
> +    20: GPIO3
> +    21: VC_I2C
> +    22: VC_SPI
> +    23: VC_I2SPCM
> +    24: VC_SDIO
> +    25: VC_UART
> +    26: SLIMBUS
> +    27: VEC
> +    28: CPG
> +    29: RNG
> +    30: VC_ARASANSDIO
> +    31: AVSPMON
> +
Don't we need something like

allOf:
 =C2=A0 - $ref: /schemas/interrupt-controller.yaml#

?
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2835-armctrl-ic
> +      - brcm,bcm2836-armctrl-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description: >
> +      The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ =
basic
> +      pending" register, or 1/2 respectively for interrupts in the "IRQ=
 pending
> +      1/2" register.
> +
> +      The 2nd cell contains the interrupt number within the bank. Valid=
 values
> +      are 0..7 for bank 0, and 0..31 for bank 1.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2836-armctrl-ic
> +    then:
> +      required:
> +        - interrupts
> +    else:
> +      properties:
> +        interrupts: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@7e00b200 {
> +        compatible =3D "brcm,bcm2835-armctrl-ic";
> +        reg =3D <0x7e00b200 0x200>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +    };
> +  - |
> +    interrupt-controller@7e00b200 {
> +        compatible =3D "brcm,bcm2836-armctrl-ic";
> +        reg =3D <0x7e00b200 0x200>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        interrupts =3D <8>;
> +    };

