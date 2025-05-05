Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DE1F470E;
	Mon,  5 May 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434526; cv=none; b=IcBNSscTK0GQso6DNUb/6/s8DV5P8DmdPVB27dOKt/9+X1xbQi1Mew0Wh6TVd8+wk6tLx1PW9QqLZ25u3lz3GZ5kTHQo5KzkZJKdpQNseFokEc9esG4NYcDbd8yDeXd3vSlJ81VdsYnHOhg6cXvG0jP7QjnJuG7qPPrAnK8eAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434526; c=relaxed/simple;
	bh=0+6oZE1hwK3UeG5kCzKKYxsMJ/enj4nAcQVTQmp0PgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jf6T7KFFN2IStbEG1w75EMAyqZW63HBnlSMP0coVO8XBBnhsOHLzmjBF3l1cKGLvPf/86/4dHBgJpf15Z5QG3g+CIrprkPJeAQwSCdRtQKzGFYfRfBQmmKHFG4SpvSbmqG5QSumwV6GwbW03eTI/RWl0g2IAXk5NnyLoQtZd2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T18kbwql; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T18kbwql"
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id C16C558476A;
	Mon,  5 May 2025 08:10:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7979A1FCE8;
	Mon,  5 May 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746432637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzVOmKsYIDKNF1BIkZAw33am/9eak/yksL+SVCLIQ7A=;
	b=T18kbwql+qFAaSqfn1iAyCd1YAxHHYCjb2hrJjPQq8ea65bYxGJ9cr9/kzdeUtzMpAgy4w
	GbIr8VnutWSMgvcPo5fAjJ4GCPu1AFoR9lVRwGfYYtpgkhdWW/yrShkDj6aFQ/0Grk9LAp
	0Kn5mcpvLCl5+4UgC7Mn3wgUlqflJ7tHkGj7ajMwA5CbQRhJW9PgBwtIFCcrQR/pz7L0Mv
	4c7T4VFBWZ4T+c3EignL5hTpb+F9W8mB++oVU3CnsiIyRDI+0bn/PjPQla/hXQVUCdohFI
	lrvkgYClhTq29UHlVaJEvYCdYe8ckMhK9ZGCMjZfZkraO1hN8DEjqG5P2Lk8Kw==
Date: Mon, 5 May 2025 10:10:34 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Ayush Singh
 <ayush@beagleboard.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>,
 devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/7] of: resolver: Add export_symbols in
 of_resolve_phandles() parameters
Message-ID: <20250505101034.6e29c8bc@bootlin.com>
In-Reply-To: <20250502163559.0a5643e5@booty>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-4-herve.codina@bootlin.com>
	<20250502163559.0a5643e5@booty>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepr
 hhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

Hi Luca,

On Fri, 2 May 2025 16:35:59 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hello Hervé,
> 
> On Wed, 30 Apr 2025 14:51:47 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > In order to prepare the introduction of the export symbols node
> > handling, add a export_symbols parameter in of_resolve_phandles().
> > 
> > The export_symbols is the export symbols device tree node the resolver
> > will use for the overlay symbols resolution.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Ayush Singh <ayush@beagleboard.org>  
> 
> [...]
> 
> > --- a/drivers/of/resolver.c
> > +++ b/drivers/of/resolver.c
> > @@ -237,7 +237,8 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
> >  /**
> >   * of_resolve_phandles - Relocate and resolve overlay against live tree
> >   *
> > - * @overlay:	Pointer to devicetree overlay to relocate and resolve
> > + * @overlay:		Pointer to devicetree overlay to relocate and resolve
> > + * @export_symbols:	Pointer to devicetree export symbols node.
> >   *
> >   * Modify (relocate) values of local phandles in @overlay to a range that
> >   * does not conflict with the live expanded devicetree.  Update references
> > @@ -257,6 +258,10 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
> >   * corresponding to that symbol in the live tree.  Update the references in
> >   * the overlay with the phandle values in the live tree.
> >   *
> > + * @export_symbols can be use in this references update. The resolver tries
> > + * first to find a match in the @export_symbols. If not found, it uses the
> > + * "__symbol__" node in the live tree.  
> 
> The rationale behind this logic is not clear to me. I'd have expected
> instead this logic:
> 
>   if (export-symbols != NULL):
>       match only in export-symbols
>   else
>       match only in __symbols__
> 
> following the idea that it's better to be strict when introducing
> something, and possibly relax it later on.
> 
> As I see it, with the current logic if you use export-symbols but you
> build dtbs with -@, you can still match a global label. export-symbols
> should avoid that instead.
> 
> Let me know whether I'm missing something here (which is surely
> possible).

No, you don't miss anything, it was just a choice and I have chosen to be
not exclusive between export-symbols and __symbols__.

export-symbols is taken in priority and if the symbol is not found in
export-symbols, we try with __symbols__.

Maybe I should be stricter. I don't have any strong opinion about that.

Ayush, on fdtoverlay what is the choice done ?

If an export-symbols is present and a symbol needs to be resolved but this
symbol is not found in export-symbols, do you try to fing it in __symbols__
or do you simply abort the resolution with an error ?

Best regards,
Hervé
