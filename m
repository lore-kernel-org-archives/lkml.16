Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CFA1E5739;
	Tue,  1 Apr 2025 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493442; cv=none; b=J+rZ8NcvuiyWVE+m0r9kLHKwEm3Suq2aK36+9PX0etBrngTP2E2wQ0CDWKOa+jqLm4QMlBUjlvnqngZXT1lWTcWEv+16yvqn6LUEBGMGLyZhXloRL0xMmZB74KbLhWvQcHrt8mq8y4oeNA07CELyZJvVbbSarivvsBzZbjtfiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493442; c=relaxed/simple;
	bh=jrrSR5QABlOAIHYPV2aONk7nc2NyAfkmio5dzxkx5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3zagJcqt6w5F6XDq54P/4iwp7Hq/h56MmoslV70WoMG6O86w+7QgtAkLgQ0g5Ri55Q45JrorZ+9bpYm8yIvRohSfL6BpQN9aCIY+2mrya08W/3Zr/BHNf7N+ScflFvgX2rn4Bnvt275T01CMbJprqkC7iyhyGc4E+B9Jeg+XF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Z+Vvyoa7; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Z+Vvyoa7"
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 6937B1F928;
	Tue,  1 Apr 2025 09:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743493429;
	bh=B210qA1B7drq3Zuu1x9tMoSRxTlQoBLd87oPguMQrIM=; h=From:To:Subject;
	b=Z+Vvyoa7iO3cdIeJl6LPHROE4F7xT/2lM7v+cuYSC6GBxxN13h1tQvVzGNDgC2/X7
	 C7e4lUYumWuSEtPlUPIoaeFO/TjsDHv8NauT+bYNDtajKQMjLIhqQGtz4G8oi3MiBg
	 k/yiRVg+BAal0YCiT+tcckpCg4NuhZwbii8I4vEFCXjj2z/CuKM3jBuXapT4S61fgL
	 vJEy42Ptnj4Ouq8kx+fu0Dl7RDkpWBA3ainoumuVrus75L0O79LT/mym4mUjyh2e00
	 ggOb5Bga5okNjnj5Sq60sE1ZwMfc19Eep9ylCiSRf1dAIohzYK8exRkWRoQc0sVdwr
	 DoIN4PJsw974g==
Date: Tue, 1 Apr 2025 09:43:45 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <20250401074345.GA8188@francesco-nb>
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
 <20250401-boisterous-teal-bison-533b01@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-boisterous-teal-bison-533b01@krzk-bin>

On Tue, Apr 01, 2025 at 08:13:14AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Mar 31, 2025 at 05:52:28PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add properties to describe the fan and the PWM controller output.
> > 
> > Link: https://www.ti.com/lit/gpn/amc6821
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v3:
> >  - explicitly describe the fan, use standard PWM and FAN bindings
> >  - pwm.yaml cannot be referenced, because of the $nodename pattern that is
> >    enforced there
> > v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
> >  - no changes
> > v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
> > ---
> >  .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > index 5d33f1a23d03..94aca9c378e6 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > @@ -28,6 +28,13 @@ properties:
> >    i2c-mux:
> >      type: object
> >  
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> 
> Why do you need the child, instead of referencing fan-common in the top
> level?

Two small reasons.

First is that the amc6821 is a fan controller, and the fan is just
connected to it. So having the fan as a child seemed the right way to
describe it, and this is done like that in other hwmon binding.

.. but now that you asked I tried to move the fan-common to the top
level and it's not working.

I added

  allOf:
    - $ref: fan-common.yaml#

at top level, removed the fan child, and moved the pwms up one level in
the example

    i2c {
        #address-cells = <1>;
        #size-cells = <0>;

        fan_controller: fan@18 {
            compatible = "ti,amc6821";
            reg = <0x18>;
            #pwm-cells = <2>;
            pwms = <&fan_controller 40000 0>;
        };
    };

and the binding checker is not fine with it

$ make dt_binding_check DT_SCHEMA_FILES=ti,amc6821.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/hwmon/ti,amc6821.example.dts
  DTC [C] Documentation/devicetree/bindings/hwmon/ti,amc6821.example.dtb
/home/francesco/Toradex/sources/linux/Documentation/devicetree/bindings/hwmon/ti,amc6821.example.dtb: fan@18: 'pwms' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml#


Any suggestion?

Francesco

