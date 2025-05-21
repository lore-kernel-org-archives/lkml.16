Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507A199EAF;
	Wed, 21 May 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816753; cv=none; b=MTl2dEXk7Rberi2NthdKsbYiSdXRp4vm9kCkwl/PcVTOlR/pAn89q2BcvNSVX5h2T2/t0wdRo9W7axjadc+nP+9U2hO0kHu3lBfqoSsd7j8qVWHGbgjHXw3DJjr5sCe3pzE3DEwJgTXkylQKdjmARAYBlUO4+eNgAA1CEE6ndzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816753; c=relaxed/simple;
	bh=FUrKqQaTvI6r5hQHbpTxChtGLOegaWNNbmuUHJFyaMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cC+DevGb50HB8Q8qXmHSxJDh/p84NbOR2WnzVJLkshq1IyD7st9xhGFp2im7QiBGAMQFWoar0vgDHQotw82A08fUdizBWmvBvkRvRepJfK/T6qLbbyn04GBLoa+fVGpjgCQbgKw1uyAMdaP2rYmMVC3wUUsy9WC7JlrrLAcGZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=kxMPduyP; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kxMPduyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747816737; x=1748421537; i=wahrenst@gmx.net;
	bh=e7LoYeDO/ObKLZl6uB8t4vDkqFXhJDp0HlZyuxxm8Fc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kxMPduyPDG6Ea3y3Te1MfKjih0YRbjUxN8C1ThNRTKISz48h4hMH92Lt8I1wY5nV
	 JZYWHsodS4TRvBhiH82LFYbBGtEZvV+BtCr1E1f2oCIa4PdCzey2aLXYqLthzrJNs
	 8lQ35slkXxrZkgKFHQzgRtsJKAFbBYRp9ujnBTcJPUFebUdHZ7nJyEUxqPcYetvbE
	 N14jzGlfS4JNqZSfQmaQ8B0B0ZFia8rxnechmGgo5NHGUYg7lNp2xQcAYU0gIWfJK
	 UY1Awr7bsBxskOdJRgsLDEA36yHuHnddyfLOh0kXpc66ypKXLIHX2RnxhxPQ4X2fE
	 3RCnUtU8+ad6LUkVvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbivM-1unzBv0SPG-00aa3l; Wed, 21
 May 2025 10:38:57 +0200
Message-ID: <0ff05575-05d1-424a-9402-2c99588050e1@gmx.net>
Date: Wed, 21 May 2025 10:38:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-cprman to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521004625.1791913-1-robh@kernel.org>
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
In-Reply-To: <20250521004625.1791913-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HV7vPxnigm85HIIM4O8M5yNt9tVs3qs9fGdsQ14rKF2MIX5ZyDD
 v562z843V3p1qdGOvVEl3Rk8oGiVuw4gD7Yz5lOyCQjQZw2nlD2edIiKZO7zJ+l2lSdpM8q
 wFUdwqvxIoeplJDzYN5g3POe0vveqd1UvtZ8G2V6kBshH7s+x041XD7ir5XfDzj4TP0fi74
 NhYOfAkGEQpyGvw+Qo/xQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tKP0MRUh3ZI=;CA486nCN0hgd6m2cfUL/Osgsszw
 jlTljaMWIZuN8Eczv7E29FP+GGNwVO1WfFOd5zI4Ohq8RahpYRhihHBWu3q3hyIx6QHVW/OgU
 djm8e/3RcUljQBurdIr2MARBQ8evernWJFBB1hiNYZYZC0D5abbhWI1YjptN8fZgIu9d4zok9
 DwIubkU+taDoGWXOitzc0lJTVoPq5TKznDQ+1gFtpmHazUCCnXXU2U5pO2oir6bpBbhRLUfc7
 FqB7Vf0SRfZbfi4kt31MA8dYunt0/QPTt0sfU9xHO8487N+jJZQCGn3XxpLQkwN9cB44Uf1xr
 d5EtLhCxDfP839ykIp7LzkEGuXFmStAxYu8xvgPOoVMRCnI1QhjZ7ip+KJvlOb/PGcNAK1P5B
 OmRFh68eVZkLf6cYNNGmcj5iJpAF3L1ZK1NjhItTyzjPTLmoYqD0ohuQC/lf8LNKmsNWDMJCe
 uGZczj/Xl2q7Op0hUQ/3T5mrWK/Gy8cFD+J/SDAny+f3lCLhNLikGV7mbcksP9u1Ih0N6THfg
 2RvVay8f9xHnhz5qT/eu7egon2jtIvkZTZNCBCx+naq7fdFVd3MdzkNdAwgD/WdSAuV0LZhEo
 OjQ98Ucb9p3DjhqhSnvu8zt98NotnQKUzLbJxCaxmJIyaV97YW6xINLpL2X7/42VS1RdocYro
 p+brHAUOx4X1WpTE0arn6KHBCDoLiQZvnB7l65ZRadv97nm55YeBoemOA0uqmAMxjZHQ1gfj/
 jQefQPFkfLsNzcvQBIYWejUNkzeDDeY+SWA0zALqlOkSy0xO+ZH0JyNpCf491GhHaXA0Gq9Du
 Ef7Cv2rbz6zgWfNAecS8yMEgDQ1BgrR4CY6yizJRrayl/LQeIerrxSV0iX3QwvQDblvH/ee0F
 HwMPTIVOZneuy2teGIYcNkzgTlKHVVMmGNP1ShdO9S92TGaJAtKEwh5Bhr/HPST1Tqb6KKBpE
 k8r6yI1tAE9F2kws49acSzfsnPlqpHbQ+az/wLjwe8Ei3h46kpsQ3sIGjJo0BR9wa7G444cnD
 X+5cJE/92kVwxO1xm4P0sG5lmhsCWVvqBFnDUsOcA5NHEkF615eNIGijmMqy/I54syd/IjvUa
 xX6YbimDH4CT7BHbC2b3ZCk27wySI/fAqfbe5n4ddXv+oFVvgcDu6bFglhQJt1PphXvfOk7C0
 I+xp8qnFPcqkQHKvihZT+deNmEzoXMKD8/CHcATLtozIrzmgzRCcTa1BZnLeDmrv5vQCucpVZ
 eVHkMuXyeEZm2ke8X+xij2drM3kUsNgQWzY32cOflQddoEW9bz2gAXaEvn8nLB3WIQbJaOtQi
 FVc0iciNWkXCwjOj3gfanr48TqO0091B5ZX+3nZwYRKppdAALuI/GvkkqOlRaHodWKrLJ0Jps
 vM9N8WE6HSl31JNs/mxsQ10Cjm6tRSS9VbXbjednlsrOdCTfipg31FcCVGMfqX/NnjfhlT/Go
 x5H0PJovAOK3oakxvzqKRIEfsd2DDbfy0fKI5NIzEN+HSuyXsPiQBSJcnmpw8eAIi7r/zQyhc
 lzcLXNn43hXHmQGQsPU1l/EYKDLMhfLo7pUMMfaiTUm7rWKnVKAqCBLAXRUt2Rw+uSuSEpFAa
 dwmuxDocm2zfcbdcj8EoUiceTrHhotnp8RBisHPw7iyRWf2dXEGLFNxBW3mOOf2gZgYScgg9V
 Iql61TRIu1TOkuFid6nPVWhl2/PMi8WFnb+wYEf3PqDI8MPViyfVu4Cy3aCFmbNBHXA3Tyov3
 iWcBpfTMUeHa3tP1zS8aKd87yFGbhxYFGOq4SS3GjwleGScI1xQpfYS5wwj718meJpG5nPdRy
 qsx/xOi38B1oB2AVfM/7fPMrP7Dhj3cAdeLU299om/wdpaQ+Si6QYtTCwgISNTfqa6aJ2Co1o
 YQh2hGFI5Hu2GXeLd8/9t5Flnu4Kj46g58/xm/41GMCX8UoSqg1Nvj3MuWujThMOMro7YHUs+
 93Td+NbnV8Ctr35yOLAxJQq2cOq87Bcb7OvTgKAplq9O3PBvjA8LIKtZgM4V0mfAS5eteV3Bs
 Y0iqV0oA8+7zW5RK9JdMLHN5cvAa8SAWTrkOCljmli59qdw3qNl0Mzd0sx8EZ2cjY45BMGI4z
 PdXRBitoU1FpJge8uv0iNXc+R9+NPqO5etm1Q7w9mr7fi35ErboBMfJW00vQZGtDeHwEqG46d
 oy/oPI4FftW10Kt4jd/farLj53TyKJGZwOqArA9JeESelGsPJOwspuk/kTWm62nDEWLIHa6fP
 oLGV/DnMnejU61hba7064sJFVDycgkwXRr8zL3aygzZVD9tcBdLnVRntr/opM4gk3R9QCwrer
 WGdL8P47yF6MhfNO1qPjvRfQ95Qfoy6TySPXLksBKdyrg2fLckMJTBlJ3u6o4IRfsu0MKfgRa
 BXm+Q8dUW8iUsBy6oDB1RfyA1zvJlIm+Q3gPYr/RJ09EFMXVdyBtGc9uP5HWq6O2JcRc9aeWr
 WpyY8UtimWqVqpydNpAY/hcz5IFKBVmaA/DK7OBJD07UMx9OBEXODuR1nSD5MDHWXz5/9LE/Q
 4qg/f9DRA9ZPGfpqjLiZSUcalfKsbfnnZzjV64tEjkDSOvN1umvAh9qFQu97oQgDBiThBhdpw
 IweUm75KZC+u62lTdnOsbrfARfZxYxm0B5FYc/Ez2KOeTO1R3AQKwgI/uywMum8sg63RHwe3N
 KDqb7fbXzZkCR8HbeVn+nPy7dUTqlRL2ifuBPpV8zLMaPFZqOTWmXMNGFtsEbyK5tfI8bASUG
 jqfPVIi6GdrG7JgIK34E/E8G5LvZnjAUSXH5PhCxpSkO1mMDfWFyqpq4tQF23bvg9z9Q4P87E
 Db1Id57CY4bFA+yEiyFGg1ETpQLqDhB1qB5Cg/5Draq5vJZIIZB01Bwg6KOVY6q/9kushrUZD
 GdY3Y3j+1AG8N8PwuRVs3kNeTgRVUtGXOus7qZYwhdtUx5SPAAn24OXWw4QqiwgKXBu5QUeDT
 O34jj91eCnaDuJ8nHjOVZaSry8pYascQXri5fXRxPf5F78HgeffkfhTqJHgJsrevNuNOLMov4
 8YmnzjlDdIP7K2Afgnlr3ApXxtlI13r1kv7fSLEfSlPvxMn2w/+Kvq1dqAsdZl15TqaRts7lG
 L1u75iiBiMkPMGeR39NqabnYx+tgwQCqw+hf8ktqa6GOqejR8yAiZCBw==

Hi Rob,

Am 21.05.25 um 02:46 schrieb Rob Herring (Arm):
> Convert the Broadcom BCM2835 CPRMAN clock binding to DT schema format.
> It's a straight forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/clock/brcm,bcm2835-cprman.txt    | 60 -------------------
>   .../bindings/clock/brcm,bcm2835-cprman.yaml   | 58 ++++++++++++++++++
>   2 files changed, 58 insertions(+), 60 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
>   create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
> deleted file mode 100644
> index 9e0b03a6519b..000000000000
> --- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Broadcom BCM2835 CPRMAN clocks
> -
> -This binding uses the common clock binding:
> -    Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -The CPRMAN clock controller generates clocks in the audio power domain
> -of the BCM2835.  There is a level of PLLs deriving from an external
> -oscillator, a level of PLL dividers that produce channels off of the
> -few PLLs, and a level of mostly-generic clock generators sourcing from
> -the PLL channels.  Most other hardware components source from the
> -clock generators, but a few (like the ARM or HDMI) will source from
> -the PLL dividers directly.
> -
> -Required properties:
> -- compatible:	should be one of the following,
> -	"brcm,bcm2711-cprman"
> -	"brcm,bcm2835-cprman"
> -- #clock-cells:	Should be <1>. The permitted clock-specifier values can be
> -		  found in include/dt-bindings/clock/bcm2835.h
> -- reg:		Specifies base physical address and size of the registers
> -- clocks:	phandles to the parent clocks used as input to the module, in
> -		  the following order:
> -
> -		  - External oscillator
> -		  - DSI0 byte clock
> -		  - DSI0 DDR2 clock
> -		  - DSI0 DDR clock
> -		  - DSI1 byte clock
> -		  - DSI1 DDR2 clock
> -		  - DSI1 DDR clock
> -
> -		  Only external oscillator is required.  The DSI clocks may
> -		  not be present, in which case their children will be
> -		  unusable.
> -
> -Example:
> -
> -	clk_osc: clock@3 {
> -		compatible = "fixed-clock";
> -		reg = <3>;
> -		#clock-cells = <0>;
> -		clock-output-names = "osc";
> -		clock-frequency = <19200000>;
> -	};
> -
> -	clocks: cprman@7e101000 {
> -		compatible = "brcm,bcm2835-cprman";
> -		#clock-cells = <1>;
> -		reg = <0x7e101000 0x2000>;
> -		clocks = <&clk_osc>;
> -	};
> -
> -	i2c0: i2c@7e205000 {
> -		compatible = "brcm,bcm2835-i2c";
> -		reg = <0x7e205000 0x1000>;
> -		interrupts = <2 21>;
> -		clocks = <&clocks BCM2835_CLOCK_VPU>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
> new file mode 100644
> index 000000000000..8586033794ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/brcm,bcm2835-cprman.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2835 CPRMAN clocks
> +
> +maintainers:
> +  - Stefan Wahren <wahrenst@gmx.net>
Since I don't have access to the clock documentation, please add

- Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

except of this

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
