Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E886268FD5;
	Mon,  5 May 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462168; cv=none; b=HYcnYTz7U64bCo6IeU7Ak8Z/qtG1KUo4Kge/SMbH33GRG/63HCbwbc6Tbh+lBTLp3ELL2p6/stFHumnztkBkktI0eZNvbC5JSvRISF+Ny1241IM9w9yj4BGIeDkb27T1xr8shv+2DDYWdaVjS9rwfiHHO3OlMUqfEJcErgodhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462168; c=relaxed/simple;
	bh=U94D0rf+Tz1Qaqv9zk2XngTeTq3q3AWGj+6MFpuqQFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUSJm7wCq5Qh5X6G/OvKlpXmnKeqVzgm/YpJ98ovKTWmiNF/4X/szbtag6AVlgU6p5BamQp9yJ3eDOyD90oKOHKMc5hJoO2kyFbxF1OVDXswu6p1ptEocxfF9xs13Zu9Zo+OTOnqEasIJDaAyxbjCLCRzv8EbJ0mNg23OxltBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PzhGe4+U; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PzhGe4+U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=xs39UXgzFwF1+wT9Gyk6TYjcusmYwVS1IaNsKw2rJOk=; b=Pz
	hGe4+UicHqlww1QoOoupIHSX/TuLJYAfrBjJfItptZSJStCxBrXvixgHFbpnBEdB7m6NLBG3+lN2p
	Y1YTWyH0dlMzGt9XkOaU9eXHkXFP16giPd5Kcav59heYCHsByF1ZV1Dx5JBUX4XDxcwQVjU0pZolG
	FVDZewJjvsmZJ6I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uByaV-00Bc1H-ER; Mon, 05 May 2025 18:22:39 +0200
Date: Mon, 5 May 2025 18:22:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 marvell,orion-bridge-intc to DT schema
Message-ID: <2a0d5fb1-0fb9-4758-98e7-57a274a25d8d@lunn.ch>
References: <20250505144743.1290672-1-robh@kernel.org>
 <dd9795f1-872a-4f7f-b4df-52cee65151a7@lunn.ch>
 <CAL_JsqJx9ayQkwGP9Hjh+UfnDauW0Shcx0VjD02Nb8Yv21v0pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJx9ayQkwGP9Hjh+UfnDauW0Shcx0VjD02Nb8Yv21v0pQ@mail.gmail.com>

On Mon, May 05, 2025 at 11:01:27AM -0500, Rob Herring wrote:
> On Mon, May 5, 2025 at 10:09 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/marvell,orion-bridge-intc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Marvell Orion SoC Bridge Interrupt Controller
> > > +
> > > +maintainers:
> > > +  - Andrew Lunn <andrew@lunn.ch>
> > > +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> >
> > You should probably drop Sebastian. I've not heard from him in years.
> 
> Okay. I would have (probably) if he was not still listed in
> MAINTAINERS. Perhaps should be dropped from there too?

Yes.

Jakub Kicinski has a script he runs about once a year which compares
MAINTAINER entries for networking against activity on the netdev
list. Any email address which has not been active for a few years gets
a patch to remove it from MAINTAINERS and sometimes add an entry to
CREDITs. Maybe this can be generalised, run it against all the lore
archive?

	Andrew
