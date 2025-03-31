Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64422144DD;
	Mon, 31 Mar 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437774; cv=none; b=k0caFe2SNd9kF8ERCwjX1tvdUKnLxka08uoPj6ZFMb5FtwUWW2U4fhbnhw08TdCYMjEtxqZmcQiijwMAlX0WQYdIQ+tkj2CkLHzRR1Jps2MQ90VR8RqXcWonfpyUxAlQVJyZmYwPhVsuakrA+HmUKXVC8kGpxyyMtNHbfog8sKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437774; c=relaxed/simple;
	bh=ohaNaBhj+Y57HbUllos35LAObiQZlEUZfWdHRxTq3iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3IMemq3oaZudMLAtLQD2bfxqjt8pD+GqZDtdaLAOvnlXRlYkOrFbcxlM50UjrO82INRhNjwLqSmvAVM3LLH3FBGkrmMq4UDQpNty/hp82gzSmhNedSLuTI5qblfe1oZDIn3fePmNSd65P8J9C5/O2Hohx2SBJYrpMOuUeWzh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hcX5UORe; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hcX5UORe"
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 738911F93B;
	Mon, 31 Mar 2025 18:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743437770;
	bh=YWSNkb+F757hQ68vbYeh999udDtklB+ehj/2llLix5U=; h=From:To:Subject;
	b=hcX5UORefGPHNI1rks2hDaA1EZ/1f5EApHDGecoAVntw2erbATnNQ2AIv87SdDxk+
	 t/G+DGeuQ8RecklguimTilkHHbq6Qg7tDIieZoFTEMp75ivU3GQ7MqjAtTOxvK4RYs
	 4cZ5/Fi/ZaETHhHkyrt1rZLw19Sk3Zz/KlkKCP7ypmQtWqh2ilAYOVzPY5krcivhC+
	 1/iKNK9YKL6TjE8ALztSTAwYK9eky+xATdTCYlyNH5JodgKfvvKI8crKmMOj7UzwYe
	 n1ZvgdgEYSqVGbrEZ94ldWjmsTdus8xLBcYZbuchi8OnAPOw1wb93JgUwk4fmUGSjt
	 IFNY2WMzW+Fow==
Date: Mon, 31 Mar 2025 18:16:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <20250331161606.GA148019@francesco-nb>
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
 <8064282a-17aa-4b97-b5d9-1b4a8b0dc40b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8064282a-17aa-4b97-b5d9-1b4a8b0dc40b@roeck-us.net>

Hello Guenter,


On Mon, Mar 31, 2025 at 09:01:08AM -0700, Guenter Roeck wrote:
> On 3/31/25 08:52, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add properties to describe the fan and the PWM controller output.
> > 
> > Link: https://www.ti.com/lit/gpn/amc6821
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v3:
> >   - explicitly describe the fan, use standard PWM and FAN bindings
> >   - pwm.yaml cannot be referenced, because of the $nodename pattern that is
> >     enforced there
> > v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
> >   - no changes
> > v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
> > ---
> >   .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
> >   1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > index 5d33f1a23d03..94aca9c378e6 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> > @@ -28,6 +28,13 @@ properties:
> >     i2c-mux:
> >       type: object
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -50,9 +57,14 @@ examples:
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > -        fan@18 {
> > +        fan_controller: fan@18 {
> >               compatible = "ti,amc6821";
> >               reg = <0x18>;
> > +            #pwm-cells = <3>;
> > +
> > +            fan {
> > +                pwms = <&fan_controller 0 40000 0>;
> 
> There is no explanation for the parameters. I guess that the first is the index and the
> second is the frequency. The index is not used and can be dropped (there is just a single
> channel), and the frequency only makes sense if it can actually be configured.

The PWM period can be configured, the HW supports it, so I think is a
good idea to properly describe the HW now that I am modifying the
binding and not have the situation in which we need it in 1 month.

The instance is just one, it's correct, but there is an assumption
pretty much everywhere that these 3 #cells are
 - PWM instance
 - PWM period in ns
 - PWM flags

I decided to keep the first cell there, with the PWM instance, for this
reason, even as you correctly wrote it would not be required here.

With that said, looking at existing binding, the description is almost
never present.

I would proceed this way for v4:
 - keep the first cell as PWM instance
 - add the description

Francesco

