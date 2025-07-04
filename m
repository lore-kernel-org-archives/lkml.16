Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4152BEFF0;
	Fri,  4 Jul 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620228; cv=none; b=YcPxbPdSUYLlza+8ZvR8fqD9qpcTOb0LGb1nNGdGEvKNs310G3amxx4qX4+ecY/lO1SuSFXVF5cGjHblIu8wL/PIZbXUQhc05I6yc4uH/kEkPBLGQYX9YIw4CVLS+Q6p1+FigNRkdyCR1FsDSIwh/GLwHJRGPzR5oSR61bmJbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620228; c=relaxed/simple;
	bh=LS55SnAvYsxVzeFBB6DMdq8qX0Bw9GOxFpUEDYhEl28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7+GvgOcWGQ5kDdc39q/Z+VL6tc7Vkng2oCLcV5pJDx6vVSp8Uu3Jibkz8eNie3oB+z5WLn7coIwnmS6oesgRX9neiWyw+iNcnmA+0zZStve/4+AzXZUH2NRNwFxsmTtBk2C9xOWIGAXaY7BWHl/u4NZeEgTWARz5JLlYO/V1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TTLPozt3; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TTLPozt3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0013341C06;
	Fri,  4 Jul 2025 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751620224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSEJYUsoa+vkXDvdMIMqEjCNC9HqOGRY+ObCm1SntTI=;
	b=TTLPozt3aTpWICefNME9ZYHQZEDiVeUpqHFdPo2ttK384ZJH2SPDL5JLidVYBaZ88zsEhW
	YE+aZ0vkNVHBVKhlUri2cRuTq+GeCLZ1fuo4QVP7trqhN6bsjX6AmYvIZH0bbLtsRe4XMK
	zfqyuR9XdCunB1KXX8lqTi+o5AraWy9H4sTWoWfi1+imqH1a4lkt9+Zz+GKiiOBnPlDRRw
	oYD7ZGVhPPshZocGAUXaqUcWAy9fWAwROqUYMexlY7JXtCQWErjNLL//6jazAsif/6+4Sp
	OprWoiMhB3+oLQGs01KKR9V/txErWX6w6+JGP3JI0eA3M4+O4n20f+bGsRBslQ==
Date: Fri, 4 Jul 2025 11:10:20 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
Message-ID: <20250704111020.7cde176b@bootlin.com>
In-Reply-To: <ed6beb97-12f1-4d71-b4dc-b34d4d611b81@beagleboard.org>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-2-herve.codina@bootlin.com>
	<0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
	<20250528185740.4bf91bef@bootlin.com>
	<49e1e1fc-412d-4334-8337-16e352a34788@kernel.org>
	<20250618113232.6d237208@bootlin.com>
	<ed6beb97-12f1-4d71-b4dc-b34d4d611b81@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkr
 dhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Krzysztof, David, Rob,

Any opinion?

Best regards,
Hervé

On Wed, 18 Jun 2025 15:24:07 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 6/18/25 15:02, Herve Codina wrote:
...

> >  
> >>>>> +patternProperties:
> >>>>> +  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":  
> >>>> This messes up with coding style which I would prefer keep intact.
> >>>> Basically these properties will be using label style.  
> >>> Yes, those properties remap phandles.
> >>>
> >>> Their names are the name of the label used from the overlay and their
> >>> values are the phandle mapped.
> >>>
> >>> You already have this kind properties using label style in __symbols__,
> >>> __fixups__, __local_fixups__ nodes.  
> >> I have them in DTB, but I don't have these in DTS. The exported-symbols
> >> would be in the DTS and that is what coding style is about.
> >>  
> > I think export-symbols has to be in DTS.
> > Maybe it could be described in an other way in order to avoid the coding style
> > issue you reported.
> >
> > Hardware:
> >    i2c0 from SoC --------- connector 1, I2C A signals
> >    i2c1 from SoC --------- connector 1, I2C B signals
> >
> >    connector1 {
> >        export-symbols {
> > 	  i2c_a = <&i2c0>;
> > 	  i2c_b = <&i2c1>;
> >        };
> >    };
> >
> > In order to avoid the coding style issue, this could be replace
> > with:
> >   connector1 {
> >        export-symbols {
> > 	  symbol-names = "i2c_a", "i2c_b";
> > 	  symbols = <&i2c0>, <&i2c1>;
> >        };
> >    };
> >
> > Krzysztof, Rob, do you think this could be accepted ?
> >
> > Ayush, David, do you thing this could be easily implemented in fdtoverlay ?
> >
> > Best regards,
> > Hervé
> >  
> 
> Well, it is possible.
> 
> However, on connectors like pb2 header, there will be 50-100 export 
> symbols. So it will start becoming difficult to maintain.
> 
> Additionally, the further away we move from __symbols__ style, the more 
> difficult the implementation will become since we can currently very 
> easily piggy-back on __symbols__ resolution implementation.
> 
> 
> Best Regards,
> 
> Ayush Singh
> 

