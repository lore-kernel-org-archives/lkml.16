Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781013D2B2;
	Fri,  2 May 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196411; cv=none; b=r331JxHe7swVAkD/tl4gZGMwxoU99TvPBCx6MyPS+5sw/PbU4+AgtJOIMNN49R15dYY2Nz0PnSsKWWoP/lwe/x6R7qY2uYDKzq48iLP04g+CAGB86PPFiJKQMdYEiOj9hRWUNF3fu2bLJbREQHBgm+QCeVDSxg2+TziZ5SGVHtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196411; c=relaxed/simple;
	bh=Da9pU0S33Sm8761fbLW109yCTeHilJy0K3ZjKqxSk8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OwHHlG60S4ggjtpN+yeI6VvEPr5dsYj1d9mFQ0t5HOJW9SlEKj1162ecpNQ6BZj5PSfil8Utq2OZ+6ADygnVLGkYwTfubOns6U4xYvkm/yhKHsCUNQRaEl7s/zxjbH/QmfO/N64ZR43Rk1dYNi1hwXE+5VuRCjmgmUzU1xISvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SshfHWT5; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SshfHWT5"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F40E843B2B;
	Fri,  2 May 2025 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746196407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG38rxrxedshMrjwOdKoCWkbIQoaDAbwPk5ua/Lna1o=;
	b=SshfHWT5AAEbvqga99fh44jx331gw9A8WTnlDEbKtt0/zookyFHOYY3J3vRkTG41a/9rSf
	OZQXJNTcoN3sNJ7DPW0q5YWoZDF577i5RSuj+1FJL//n459FxSXkJz1tAJhGMtqao5Uzs7
	hQKnjLOqYRrFNIL57rF6MCqsf1j79Isejc2c/LURRzqE5DcwKHbHKyO4TBnPqfM+tYxy5D
	fg1AWqn5a3TLF7k/tOX6hjPXRTmWm9uGJKe6C3XTIjQ17L8XDs5P8ucDio5Dv8QEspdi+k
	g0jyN7Wcw+8ABRQCMqzl07Xzb5SPmzNr0lcInImLFb8mossP0zW3iJ32eUctoQ==
Date: Fri, 2 May 2025 16:33:19 +0200
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
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
Message-ID: <20250502163311.1e23aa9a@booty>
In-Reply-To: <20250430125154.195498-2-herve.codina@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-2-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgusehtihdrtghom
 hdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Wed, 30 Apr 2025 14:51:45 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> An export-symbols node allows to export symbols for symbols resolution
> performed when applying a device tree overlay.
> 
> When a device tree overlay is applied on a node having an export-symbols
> node, symbols listed in the export-symbols node are used to resolve
> undefined symbols referenced from the overlay.
> 
> This allows:
>   - Referencing symbols from an device tree overlay without the need to
>     know the full base board. Only the connector definition is needed.
> 
>   - Using the exact same overlay on several connectors available on a given
>     board.
> 
> For instance, the following description is supported with the
> export-symbols node:
>  - Base device tree board A:
>     ...
>     foo_connector: connector1 {
>         export-symbols {
>            connector = <&foo_connector>;
>         };
>     };
> 
>     bar_connector: connector2 {
>         export-symbols {
>            connector = <&bar_connector>;
>         };
>     };
>     ...
> 
>  - Base device tree board B:
>     ...
>     front_connector: addon-connector {
>         export-symbols {
>            connector = <&front_connector>;
>         };
>     };
>     ...
> 
>  - Overlay describing an addon board the can be connected on connectors:
>     ...
>     node {
>         ...
>         connector = <&connector>;
>         ...
>     };
>     ...
> 
> Thanks to the export-symbols node, the overlay can be applied on
> connector1 or connector2 available on board A but also on
> addon-connector available on board B.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Ayush Singh <ayush@beagleboard.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
