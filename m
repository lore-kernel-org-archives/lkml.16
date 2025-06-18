Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC825486E;
	Wed, 18 Jun 2025 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239161; cv=none; b=I6HzIVyu9H46g1D1PVAytLAY02EQHD7PI4gOpGUu3QE/3BEx9yTco75CI/oOBkk5zdaZFzj1SaaBNhG9lbEQpM/cOeK8SdGc7J2mHDI0JoTp9hJpmbiJY/Pt9MtgSBdbBNPnK/d8p7ak4zf/ClBNyEuam9xAjiX6r1bzCVauYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239161; c=relaxed/simple;
	bh=JdojFS5/z7GIDAsap+z4JgrlAQemx2IMwtmPu+k/DxI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o/VHKMX3HJnP2zKFv5X8jXkCg0/VqsDkvVt1Z4d7ebjy+JC44JjdSvYgnm0eQ6upvVmfiyxHUOb32f3FQtNYe9n2ffYo+LmNEeLkHtMcojAslf4DS/u5Hc9oqNGZ3qfz0snCsg7r2lsspT2/4YtxxspcZmY/etpNZaaGqTVFF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k8PmZYfo; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k8PmZYfo"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83B542047A;
	Wed, 18 Jun 2025 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750239157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhlZhFy2yqBw+bfXv9cjrck9pl38ef3/+s+sDwfdRYE=;
	b=k8PmZYfoOPSqpGRhk+lnKhojrkayOMFwAjCVwFcnLbNRms/bvFBQoK7RjBHqCcQa1A69ce
	/F9Np2VNFQSEhcPUiqGo4u74S9+pbclLkWD9NaUfFYXLivrPwOxOe3buVEPvAXBjUEAzNN
	rjIwQw80hzD5oZ9Pa+/2MifPtKcLq0mnURVpH0JmYBEpIWt1nKC0kfYhakBf1l2Z9qygM7
	2UWORpAhAvswoXC7duuB8Jwv3G+UaKuCzMN+doNpOtPOOD0I2olFcGU2RNdFTdHhnmtNwp
	t724tXJkwGs3p4m0+6VUFlr+uTqF8lVWGL/+Pl/Tm4VbpXQM28o5oSc99s45Dw==
Date: Wed, 18 Jun 2025 11:32:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Ayush Singh <ayush@beagleboard.org>, Rob
 Herring <robh@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>,
 devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
Message-ID: <20250618113232.6d237208@bootlin.com>
In-Reply-To: <49e1e1fc-412d-4334-8337-16e352a34788@kernel.org>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-2-herve.codina@bootlin.com>
	<0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
	<20250528185740.4bf91bef@bootlin.com>
	<49e1e1fc-412d-4334-8337-16e352a34788@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

Hi Krzysztof,

On Wed, 4 Jun 2025 20:35:51 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

...

> > 
> > Symbols are exported only when an overlay is applied on the node where the
> > export-symbols node is available. Those symbols are visible only from the
> > overlay applied. Symbols exported thanks to export-symbols are not global
> > to the all device-tree (it is not __symbols__) but local to a node.
> > 
> > If an overlay is applied at connector1 node, it can use the 'connector'
> > symbols and thanks to export-symbols, the 'connector' symbol will be
> > resolved to foo_connector.
> > 
> > If the overlay is applied at connector2 node, the 'connector' symbol is then
> > resolved to bar_connector.  
> 
> OK, this explains a lot. Unless I missed it, would be nice to include it
> in binding description.

Sure, I will add something in the next iteration.

...

> >>> +patternProperties:
> >>> +  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":    
> >>
> >> This messes up with coding style which I would prefer keep intact.
> >> Basically these properties will be using label style.  
> > 
> > Yes, those properties remap phandles.
> > 
> > Their names are the name of the label used from the overlay and their
> > values are the phandle mapped.
> > 
> > You already have this kind properties using label style in __symbols__,
> > __fixups__, __local_fixups__ nodes.  
> 
> I have them in DTB, but I don't have these in DTS. The exported-symbols
> would be in the DTS and that is what coding style is about.
> 

I think export-symbols has to be in DTS.
Maybe it could be described in an other way in order to avoid the coding style
issue you reported.

Hardware:
  i2c0 from SoC --------- connector 1, I2C A signals
  i2c1 from SoC --------- connector 1, I2C B signals

  connector1 {
      export-symbols {
	  i2c_a = <&i2c0>;
	  i2c_b = <&i2c1>;
      };
  };

In order to avoid the coding style issue, this could be replace
with:
 connector1 {
      export-symbols {
	  symbol-names = "i2c_a", "i2c_b";
	  symbols = <&i2c0>, <&i2c1>;
      };
  };

Krzysztof, Rob, do you think this could be accepted ?

Ayush, David, do you thing this could be easily implemented in fdtoverlay ?

Best regards,
Hervé

