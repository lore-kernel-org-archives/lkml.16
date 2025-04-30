Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252CC13E02D;
	Wed, 30 Apr 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025110; cv=none; b=B41DPnUhcemLktyBDjy4811S4DycEw2DA/syior0vIIqz+rFpds9aqUmY291hevrETfVG15R6Nh35m6gg/xT5g5KNUYK/cJi55uPQZ6CkBEh2ks9ZOxD52OQ+iYig31WibDmjVp9iYNU4lS3PDHisS3qhq08iI/Te3+InaEDTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025110; c=relaxed/simple;
	bh=zhLsWIzaVd/28CSJJmAL1dPPRCRbZV6NuJGmpzsIMqo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISpxE6A6FdI8+LBABGgscMiU0l+YVtBRslt8vLLD0ipo1RJwQra0KojSEG100q6vHPip9TqDPhAfkDINL1ZM5mcVHfV/UQPMB1VFHnZW9TylkXbQsq4WBgRezHeyCLxTY8bmgHOYvDyEzWmvG65le9+I3hHIdCGQVLivlz5LAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pzJz7VHU; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pzJz7VHU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36A8942F79;
	Wed, 30 Apr 2025 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746025106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWb3y9rvaKjUa+nJ070nC3BUTQkyv2bB+91VyJE+4yo=;
	b=pzJz7VHUB0z8Vh65UEY387JIu5us46i9OGfDnS8KDDadyGfJLuDzogSR9c8uSJYDRHZbPE
	6gu0YWHU5BZ+jY0J1OKpAEXP7diGa1ot3acrkgKDNyp/oACU70Gap72Gg7qJHAXFb1MJWs
	dwVUZNuSLE+x8KsnWARhNGL+9+SvC6yrLjl3gYpv8L+OXcEmc8hNC6jKucRzgzkKtS2wHe
	VTjiuaodNCDgHYE3qThLN5sLiAJCVQP04lodVNwrXOklPyp9oIdZ2eivDUKol+R07OGaGG
	KZ23Q1Qr7w0mbOQHEDCf4tRaN/2b9RfKQcbgUJD39PlCLgpEeoWnitw8I6iTxQ==
Date: Wed, 30 Apr 2025 16:58:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ayush Singh <ayush@beagleboard.org>, xypron.glpk@gmx.de, Jason Kridner
 <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>,
 Dhruva Gole <d-gole@ti.com>, Robert Nelson <robertcnelson@beagleboard.org>,
 Andrew Davis <afd@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Gibson <david@gibson.dropbear.id.au>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon
 board + connector setups
Message-ID: <20250430165823.076e645b@bootlin.com>
In-Reply-To: <CAMuHMdXoNk3cFm10dJNMK19Ym2RWZ_hyRpDXRZ_gjPAPZpAuVQ@mail.gmail.com>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
	<20250430160944.7740d5e9@bootlin.com>
	<CAMuHMdXoNk3cFm10dJNMK19Ym2RWZ_hyRpDXRZ_gjPAPZpAuVQ@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepgiihphhrohhnrdhglhhpkhesghhmgidruggvpdhrtghpthhtohepjhhkrhhiughnvghrsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheplhhorhhfohhrlhhinhhugiessggvrghglhgvsghorghrugdrohhrghdpr
 hgtphhtthhopeguqdhgohhlvgesthhirdgtohhmpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopegrfhgusehtihdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Geert,

On Wed, 30 Apr 2025 16:31:17 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Wed, 30 Apr 2025 at 16:09, Herve Codina <herve.codina@bootlin.com> wrote:
> > On Wed, 30 Apr 2025 17:37:33 +0530
> > Ayush Singh <ayush@beagleboard.org> wrote:
> >
> > ...
> >  
> > > 1. __symbols__ based approach [3]
> > >
> > >
> > > This was originally proposed by Andre Davis [3]. It defines an overlay
> > > with just special names in `__symbols__`, which is used along with an
> > > overlay for the addon-board, which makes use of the node names defined
> > > in the connector `__symbols__` overlay. Please take a look at the
> > > original patch series since it provides a working example of how it can
> > > be used [3].
> > >  
> >
> > The __symbols__ based approach needs 2 overlays to handle the case where
> > 2 connectors (A and B) are present an you want to connect a board described
> > by a single overlay.
> >
> > The first overlay applied "adapts" the __symbols__ node for the connector
> > where the board is connected (for instance connector A) in order to have
> > the symbols used by the overlay describing the board resolved to the
> > correct symbols.
> >
> > I think this open race conditions when the overlay is applied by the kernel
> > itself. Indeed, we need to perform 2 steps in an atomic way:
> >   1) Adapt symbols
> >   2) Applied board overlay  
> 
> I think that can be solved by not applying them in two steps, but by
> in-memory merging of the symbol and board overlays first, and applying
> the result.

Yes, indeed.

This implies a significant work for the __symbols__ based approach. I think
we can say that "it works pretty well with existing infrastructure" is no
more fully true.

Best regards,
Hervé
