Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E342550B2;
	Fri,  2 May 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196575; cv=none; b=dWOVPS1jZ8XWiLmeLc29VZ4gUXRnGs3ulUGGs+8ivd/WFJID8IlQR/C+Y9zrf+DjyZDaBKlaKLKhOFOA8tcr9KfTFNHIwfYRmKizCFLm2Slox0x3FJn1xHbx+kZroILMCS6UzBQDW8XW+2zBr9L3bxZb63I7hhhTHBpNMoUj/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196575; c=relaxed/simple;
	bh=gwcMJUkApPGDXrq/QKFxu6Y9J25Arvpy6IBH9dF4V88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vD6Pvl8Ms47DPFkJ3kwlzrZuC6QtSZ10SJgwrrusCWQ/E8s8VYxSm6I6ufS8SL5MvxuL2sVBqzWXxL3pmOpIFSe+8pt+B+PM+iOtRjiDj0y5x+yI5N/cZFHbeNMhfSFC+hCvMLzvoRtTdwTted3qrxuZUxqMC6xu8tgRVAaEUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H8efNMOx; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H8efNMOx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0970243848;
	Fri,  2 May 2025 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746196565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwfsXK8KzjO5gVC7RgW4J9kTDD0YO2FDIqbR/Q+ykHg=;
	b=H8efNMOxrLub86MsEYSPjQeUg0+vPoKT0CJxjBmYsJwRb3Z22b28+NHblwjT7d+xI1bENI
	6EBh+0+QJh6R0vrzaaV9w+X+l/ar8ZUb/2G0AyKQeRvqVllVVFfd79iD28Fp2DFPhrCEU0
	CPc9tD6McUIERiVmiekkvjHAEinUi3sOSUye5aT8QOkvyov+BqPQx4uD8EpydrC+p/sW9K
	7PBRn7yH15V6/MoDZjODU3mw2HKnO62nZwBR4YAVKlqmcyLZnRmODZp2X9hoaBPmwXdHm2
	kLxNb3ueBwpZgK/A6cSMt9k/1qMrM2BFkhR/VpWsUaFf2I/IzOrRMrD96AnGtg==
Date: Fri, 2 May 2025 16:35:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana
 Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/7] of: resolver: Add export_symbols in
 of_resolve_phandles() parameters
Message-ID: <20250502163559.0a5643e5@booty>
In-Reply-To: <20250430125154.195498-4-herve.codina@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-4-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghom
 hdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Herv=C3=A9,

On Wed, 30 Apr 2025 14:51:47 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> In order to prepare the introduction of the export symbols node
> handling, add a export_symbols parameter in of_resolve_phandles().
>=20
> The export_symbols is the export symbols device tree node the resolver
> will use for the overlay symbols resolution.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Ayush Singh <ayush@beagleboard.org>

[...]

> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -237,7 +237,8 @@ static int get_phandle_from_symbols_node(const struct=
 device_node *tree_symbols,
>  /**
>   * of_resolve_phandles - Relocate and resolve overlay against live tree
>   *
> - * @overlay:	Pointer to devicetree overlay to relocate and resolve
> + * @overlay:		Pointer to devicetree overlay to relocate and resolve
> + * @export_symbols:	Pointer to devicetree export symbols node.
>   *
>   * Modify (relocate) values of local phandles in @overlay to a range that
>   * does not conflict with the live expanded devicetree.  Update referenc=
es
> @@ -257,6 +258,10 @@ static int get_phandle_from_symbols_node(const struc=
t device_node *tree_symbols,
>   * corresponding to that symbol in the live tree.  Update the references=
 in
>   * the overlay with the phandle values in the live tree.
>   *
> + * @export_symbols can be use in this references update. The resolver tr=
ies
> + * first to find a match in the @export_symbols. If not found, it uses t=
he
> + * "__symbol__" node in the live tree.

The rationale behind this logic is not clear to me. I'd have expected
instead this logic:

  if (export-symbols !=3D NULL):
      match only in export-symbols
  else
      match only in __symbols__

following the idea that it's better to be strict when introducing
something, and possibly relax it later on.

As I see it, with the current logic if you use export-symbols but you
build dtbs with -@, you can still match a global label. export-symbols
should avoid that instead.

Let me know whether I'm missing something here (which is surely
possible).

Other than this, the series looks good to me. I'm not adding my R-by on
the implementation patches though, waiting for the above question to be
clarified.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
