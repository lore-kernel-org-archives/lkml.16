Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC454F8C;
	Mon,  5 May 2025 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433083; cv=none; b=uLanLL/4xuLdmYJLMxstCZBuPS5q3r9xnb0n+RQqsRFdAZ1kVRvkGGiJRmAp6zmoy6NKri+3Yux/FFNTXESHUEcy6DZbdebRIORxHNNrXvOtJCgWwrSKDd6e0aPJA2zoEP7WX9ufqA0bDJMN2v96zEA+EZuHBfGiFSo5cw4boF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433083; c=relaxed/simple;
	bh=FQyrGJnLZ/Q9fHLW7A2NpkWtl8+bT+Q4CeJaUiIZzN4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIsHyb8e9dSKXfV+yKAcjsgnLUeZCoMS25F7jOcgc/OLBYgUIsWSWOmfutHPyHMFPXy+HsneQfN0U8Jv4jzhonhXvHzBXPulgrKYNlZtWc8d1j6v2N4YpGEu2o9R/IEEEfSQxT0CUgx1dtss3IEu4Y89zjGs5Nmv5IpLcdGjSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eigLgicF; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eigLgicF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3156A1FCED;
	Mon,  5 May 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746433078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ene3pBCls87d2ZFff3sMFaohdKR0s7zqvoRcpx4YgKI=;
	b=eigLgicFgWm6NvYLXhwU5OW2VzgTRcVAMKri8KAtivencPpK/T/V5KoOeUPJsUfw/jLOk0
	ryMm2H3ITxEnvhDmP8whs6/bZuWJTawsNAZDSHTSJEdSw/dlj+KDFvE2VzwZf636MIbQRO
	3xhJz15NjGU3zeCozQQ43qY6H6ihQI+7NWWJ1z3U4yCcKydd2DK+qraNhcUCwl3Ra5Sf3H
	6E9t3PHeqKaXyN1f4nV2wpPenI51EYxkdWnBuWnRX5VypyKSqDsyW68PqRQtaKA90234Uu
	I0Fe+cWumI40RrDESqLfNnqCf9kxJM/PUFdpWGQ9xjxr1f9A6IC8RUm7BzR8RQ==
Date: Mon, 5 May 2025 10:17:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>,
 devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/7] of: overlay: Add export_symbols_name in
 of_overlay_fdt_apply() parameters
Message-ID: <20250505101757.0b294b63@bootlin.com>
In-Reply-To: <dba95e76-3d60-41ef-b98c-5aedee808dd9@beagleboard.org>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-6-herve.codina@bootlin.com>
	<dba95e76-3d60-41ef-b98c-5aedee808dd9@beagleboard.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Fri, 2 May 2025 20:10:41 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 4/30/25 18:21, Herve Codina wrote:
> 
> > In order to prepare the introduction of the export symbols node
> > handling, add a export_symbols_name parameter in of_overlay_fdt_apply().
> >
> > The export_symbols_name is the name of the export symbols subnode
> > available in the base node that will be used by the resolver to handle
> > export symbols resolution.
> >
> > Having the name of the subnode in parameters instead of the subnode
> > itself avoids the use of an export symbol node that is not directly
> > related to the base node.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Ayush Singh <ayush@beagleboard.org>
> > ---
> >   drivers/misc/lan966x_pci.c    | 3 ++-
> >   drivers/of/of_kunit_helpers.c | 2 +-
> >   drivers/of/overlay.c          | 7 ++++++-
> >   drivers/of/unittest.c         | 4 ++--
> >   include/linux/of.h            | 6 ++++--
> >   5 files changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
> > index 9c79b58137e5..f05cb040ec69 100644
> > --- a/drivers/misc/lan966x_pci.c
> > +++ b/drivers/misc/lan966x_pci.c
> > @@ -128,7 +128,8 @@ static int lan966x_pci_load_overlay(struct lan966x_pci *data)
> >   	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
> >   	void *dtbo_start = __dtbo_lan966x_pci_begin;
> >   
> > -	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
> > +	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id,
> > +				    dev_of_node(data->dev), NULL);
> >   }
> >   
> >   static void lan966x_pci_unload_overlay(struct lan966x_pci *data)
> > diff --git a/drivers/of/of_kunit_helpers.c b/drivers/of/of_kunit_helpers.c
> > index 7b3ed5a382aa..476b43474168 100644
> > --- a/drivers/of/of_kunit_helpers.c
> > +++ b/drivers/of/of_kunit_helpers.c
> > @@ -56,7 +56,7 @@ int of_overlay_fdt_apply_kunit(struct kunit *test, void *overlay_fdt,
> >   		return -ENOMEM;
> >   
> >   	ret = of_overlay_fdt_apply(overlay_fdt, overlay_fdt_size,
> > -				   ovcs_id, NULL);
> > +				   ovcs_id, NULL, NULL);
> >   	if (ret)
> >   		return ret;
> >   
> > diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> > index aa1b97e634aa..73ff38c41de2 100644
> > --- a/drivers/of/overlay.c
> > +++ b/drivers/of/overlay.c
> > @@ -968,6 +968,10 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
> >    * @overlay_fdt_size:	number of bytes in @overlay_fdt
> >    * @ret_ovcs_id:	pointer for returning created changeset id
> >    * @base:		pointer for the target node to apply overlay
> > + * @export_symbols_name:
> > + *			Name of the export symbol subnode of the @base node to
> > + *			provide extra symbols. Those extra symbols are used in
> > + *			the overlay symbols resolution.
> >    *
> >    * Creates and applies an overlay changeset.
> >    *
> > @@ -983,7 +987,8 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
> >    */
> >   
> >   int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
> > -			 int *ret_ovcs_id, const struct device_node *base)
> > +			 int *ret_ovcs_id, const struct device_node *base,
> > +			 const char *export_symbols_name)  
> 
> Do we really need the export-symbols node name to be configurable?

Well, it depends on the export-symbols acceptance in device-tree spec or some
other global device-tree bindings.

If this export-symbols node is accepted globally, the name is not needed and
shouldn't be configurable.

If this node name can be changed from one node binding to an other, having it
configurable is interesting.

That said, according to your work done at higher level (device-tree spec), this
name tends to be global. If confirmed, I will remove the export_symbols_name
parameter in the next iteration and use 'export-symbols' for all cases.

Best regards,
Hervé
