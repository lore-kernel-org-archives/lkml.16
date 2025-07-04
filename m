Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024CF143C69;
	Fri,  4 Jul 2025 06:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608908; cv=none; b=tTakXujJPkrbL7i+qDp4BcLa5VQZb33q9LV5v+QkjQKte0+M9Y+/Bcr+mMqGfCeZjAP1h0cPflpharCsVKyJ6Lw2xHsOrNCoVuMvq7S2MwAr6YpdCUpWQKfKFoSDi0KNLBWu3K831cFqMEuIyE2IJ7HKZd/4pVtdkZziKecr4Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608908; c=relaxed/simple;
	bh=iN+eRlhHdorWDunPr1SoD4iJ2i8XICBGACpYA1baHPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5xatF5BL83Pr8ywoY40zeR5dMOjYDTBV/aj+8b9dEvyr3stLmCMdixly33bD/NOCgWGI/URp51Vyc/SAZjyIFhsReYKS6vzGtZhEmVlYgKpFDG8zOznPM2g2u2xti9PL4fnHxVrMhYXKTXTvmco5lJ6qmJwsbB9DUVmWOLJcNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpsz11t1751608835t91668ce4
X-QQ-Originating-IP: zM90GZFMZI7yfyc+xZqfOjC303VrdAtqXt8If3sh2j4=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 14:00:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11170763768269666623
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 14:00:33 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <2926FE7607C477C6+aGduAY1NTfY9T4lL@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <9c75041d-a06a-49ef-92d1-011faeb39496@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9c75041d-a06a-49ef-92d1-011faeb39496@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N/TacslKx3at46/ymwbEJDEjCvBmvjISKJs/jUsmYAZ7uTJHZFMWZfhS
	vsONLfYbxQFcD5RCjZiMqDAqDLspUBRYnKLghYD81LQi5w4xd1YepWGusSUI9Th8ngC8FUd
	KzjMums0HZ/I5M8kldnq0MAGoJlxkml7XvzNL1YOwLDJOV7laZKDpQ94YdoiUlr6jUJlDsG
	kimTUFolBW9Zx38i+d+bYX4tbXJXmg7sbG0gOIC5frNHUYUolf1YuVSKjQMotYDswzAxcxn
	1aWMFbxAXfoFjAXqyqRBQTbvS8Su1qr0RrWqm01bL/oSP/gBxxBzH9kQ/SsyNbNnD4YrLhF
	ciLRqF/jWTux3qUohMxzRxlPZu1v9FDjAkoWeC4/kz4+7rpxaLhV12S1vJi483UG3LBYF3c
	NsJcjIwrjH0VCZ1h6zFth9ZBGv4Y7Xp0dviqJoXnlRqI+mEKX3rpFvHfd8lNMfUI6yykWUU
	X7zd08ZHVDf88fOBBng1n7Q6ghrN0OuSc6NN7pKNE7BnGIGrumYTrsOtqiEcQOWL73mdIO/
	AN890Jf4P51W81bL7OswB2IK0eSCch6g8RH58dGzi4QWia8x46/5DOe6fDxlGVkyqeuMZ58
	s7jJEUVhhrXvwhMzeFGy71N9bGDas5mEWloaSBNwBVynL8RvpDorYD+V2XSjieIMO9vi9v4
	KHc15HYpKGosyEf/mjRC1O6LuKpCTxIpaLadCXi3AfQ1r7KclJo1xyfoqgQOwhk1jjEB3kP
	a/izbCVvq8/z8tyx0I/D10JCOvpqOooxEqSeh+K3vEVQvTXY9ab1xZxmC8Ox7nlZoTvygdu
	OSPjeCYtDKiQVStwiN0GlEuozkLIMttcBVCZWaNXI3Y3dGusoHUGOj/6iRmSRT29YnTxpbI
	7w9mfHSodeS1D71knnDSIuuPLex5u+NUPjRmSJalksGuukcXlPZ/JuLchrwImxYHrFrf4HF
	xQjNxrmSzksxkargX8Vks9BQDb0t8RXAb/jj61Cb7Uu6Lco6EtNNYlYEMhOysPuR3B3OQrh
	Gzl3X8GQdvLZqDOy+RpRKUi5TRhwQI3pjwQpvwPs/NHI5kGYzobFh7Qy8lxOBCJsxpuC+z8
	DkANkhPjUYI5L9Vv0YNfClpxMCxhMSqfKae/evvwArd
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 08:36:42AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 05:56, Nick wrote:
> > From: Nick Li <nick.li@foursemi.com>
> > 
> > This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> > which can support both I2S and I2C interface.
> > 
> > Signed-off-by: Nick Li <nick.li@foursemi.com>
> 
> Your patches are not correctly ordered. Vendor prefix is supposed to be
> before is being used. Bindings are before their users.

OK, I will update the orders of patches in next version.

> 
> > ---
> >  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > new file mode 100644
> > index 000000000..3a1aba9b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> 
> Choose one compatible as filename.

OK, I will update the file name to foursemi,fs2105s.yaml

> 
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/foursemi,fs210x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: FourSemi FS2104/5S Digital Audio Amplifier
> > +
> > +maintainers:
> > +  - Nick <nick.li@foursemi.com>
> > +
> > +description: |
> > +    The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
> > +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +    The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
> > +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - foursemi,fs2104
> > +      - foursemi,fs2105s
> 
> Your driver suggests these are compatible, so express that with fallback.

OK, I will update these code to:
  oneOf:
    - items:
        ...
    - enum:
        ...

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it in next version.

> 
> > +      I2C address of the amplifier. Refer to datasheet for possible values:
> > +      0x68/0x69/0x6A/0x6B
> > +
> > +  clocks:
> > +    items:
> > +      - description: The clock of I2S BCLK
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bclk
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  pvdd-supply:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it in next version.

> 
> 
> > +      Regulator for power supply(PVDD in datasheet).
> > +
> > +  dvdd-supply:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it.

> 
> > +      Regulator for digital supply(DVDD in datasheet).
> > +
> > +  sdz-gpios:
> 
> Use standard properties - see gpio-consumer-common

OK, I will update this property to reset-gpios, and update the driver.

> 
> > +    maxItems: 1
> > +    description: |
> > +      SDZ(Shut Down) pin is active low, it will power down the chip,
> > +      and then reset the chip to shut down state.
> > +
> > +  fs,fwm-name:
> 
> No, use standard properties (see writing bindings)

OK, I will update this property to firmware-name, and update the driver.

> 
> > +    description: |
> > +      The name of firmware that should be loaded for this
> > +      instance. The firmware is gernerated by FourSemi's tuning tool.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +
> > +  fs,dai-name:
> 
> No, it's already in dai-common

OK, delete it in next version, and update the driver.

> 
> > +    description: |
> > +      The name of FS210x DAI, it can be set different name when
> > +      there are multiple FS210x devices in the system.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - sdz-gpios
> > +  - fs,fwm-name
> > +  - '#sound-dai-cells'
> > +
> 
> Missing ref to dai common

OK, reference will be added:
allOf:
  - $ref: dai-common.yaml#

> 
> > +additionalProperties: false
> 
> And this should be unevaluatedProperties instead

OK, I will update it to:
unevaluatedProperties: false

Thanks for your patient response very mush.

Best regards,
Nick

> 
> 
> Best regards,
> Krzysztof
> 
