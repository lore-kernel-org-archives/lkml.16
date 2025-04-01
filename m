Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E1C215178;
	Tue,  1 Apr 2025 23:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743548904; cv=none; b=fmPyvTZXzs8rrZlnZOwRkxpzSJG0va6X7I551GOu/87j0OG29SxQWlyWmd+n1aJK/lrRGtfLW2+DS/DSF7Pz72OkVZHI2ydIRgOl6wb8zjrHX5h2+YGN+p/lcBJNFCwh/78kL2cq8dCrDXJMHCpzMq2Zr07d4Y7xk0qaPF03f54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743548904; c=relaxed/simple;
	bh=K7gVs9G1yl1ZQ48ZWHwRC7lW+9mYi+4pcNf/trZ31Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3IDMjSAyHRlfhEQvNSSX6ibOs7ixHCtzJ0CCDxegLlWksLRy5k8Je8MlPg8DpoAC0y+sopodf11uhcMhvBIyRaySLhzuIuT8Qd18N6Klyijt6zq4trHkhD65HeDaDL+qth56BIm8AGMEoKLNGhGb+q5OIw9p18xyL2QsCOCJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTKc5/qK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTKc5/qK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB78C4CEE4;
	Tue,  1 Apr 2025 23:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743548903;
	bh=K7gVs9G1yl1ZQ48ZWHwRC7lW+9mYi+4pcNf/trZ31Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTKc5/qK4CKBIz2EvhGfP1gRdoZqJvWZwqPhpDY1+tiIhwP1SErfny34FMaZrgrLT
	 eaZBS6xlgykLN6AuYxrSjk0UR5HpeHe+HaeVLH532aYPIK3L/NOowvZ6PPZXBfz+7u
	 MwJUJPrghB6GZOkdU0a8diyTBMV8nWNR9EZPTc5N9id3fuR1kcPZakF5HcExXSOuvK
	 RSK7gON3QPVgBmLDwttXgKpPKGxyHHjuDb5RCSblASIen9yIwXKg9EZ5AttBfs+CWr
	 bumFJxJanFeG8XdA31YLIfP/5ZDxWkqRxp4uM+C3ehakuQHZa8bgmXPCa0q0fkBrFT
	 cuColpTfpW1Bw==
Date: Tue, 1 Apr 2025 18:08:22 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <20250401230822.GA43191-robh@kernel.org>
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

Because shockingly a fan controller and a fan are 2 different pieces of 
h/w. It took *years* for this advancement to come to fruition.

Rob
