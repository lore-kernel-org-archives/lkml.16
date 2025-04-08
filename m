Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB751CCEE2;
	Tue,  8 Apr 2025 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126186; cv=none; b=utmm4y94bFEjebfCY/LjF0gieWzbpN/Dy4wjEcXuyJ3oHtuxUA522x/mfPJkt/51uICnoMaCDZ8SHP+BcIydIdJUVHG7HScfZ3NFHwcTj/XX7Rmke51BMhgrdstuQGiH2PhIArOehlvzDKoP0amiUfEMXT6SthNTk184261avPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126186; c=relaxed/simple;
	bh=ZIbGmhBHgG/N7qrOk/zordXNBIseJwHuzdXUP7Zxg04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAIpYDRcAqTsfJqgd7G3UjLN5WPJqlR2ntKo60Z1fbe8C5j/a/kBYefycuTgiCJMIvu51JwECZL45f5F0/OL3uFgi7ke+Sov/SF3qOyTR4XDn4XtsSnQdjMeEvGZr/PdXJSRDSBlzfbkiHGryZiuwr1rP33gK6kloe+5KwJTKjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kd2nQ+9K; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kd2nQ+9K"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68C6820485;
	Tue,  8 Apr 2025 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744126183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brBFDGafKoqeV3gcEmJuKm4cDWkEtE8rYRLPYpQ2qcM=;
	b=Kd2nQ+9KCU4U6+NO0yih2IyNzyfW017zQ48uHzp5Rv2GDr8Hh4A13DzIJvYdiFPXIBzHc2
	aHol1ioyMW977QA7jWgIAHCWXXPzzCXbOhOHSEBz2VBFCY8usXu6oAwQkocQN6MdYYVBGN
	Z0ZxlWnJvIlNODSPJ7WSGP5z44VdKY2p8HV2C5eEc1AKwukYzaFp7iQNoHv+5zar+MB1+B
	H47iRxNJRV0dX5LP3vP9ORY93RquYu0Kx2+JFP1OE+rWEiLnXC28+w9xQ2ActJMFgxwJ3P
	nc7pXaX//5yA37iw1RzgVG3noh0vK6NjwoOtuuE/s4Jee6o3o+MIKPCdL/pmIQ==
Date: Tue, 8 Apr 2025 17:29:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "Pu, Hui" <Hui.Pu@gehealthcare.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/panel: simple: Tianma TM070JDHG34-00: add
 delays
Message-ID: <20250408172932.2b343d07@booty>
In-Reply-To: <563qsg52t5rio45xyofhihdxhsnu3j5togxoq65n6v65yevpcy@rv2eabnsuete>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
	<20250407-tianma-p0700wxf1mbaa-v2-2-ede8c5a3f538@bootlin.com>
	<563qsg52t5rio45xyofhihdxhsnu3j5togxoq65n6v65yevpcy@rv2eabnsuete>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhui
 hgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Dmitry,

Thanks for reviewing.

On Tue, 8 Apr 2025 15:52:19 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Mon, Apr 07, 2025 at 06:34:00PM +0200, Luca Ceresoli wrote:
> > Add power on/off delays for the Tianma TM070JDHG34-00.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
> >  1 file changed, 6 insertions(+)  
> 
> Fixes: bf6daaa281f7 ("drm/panel: simple: Add Tianma TM070JDHG34-00 panel support")
> 
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index df718c4a86cb7dc0cd126e807d33306e5a21d8a0..3496ed3e62056938ccc0ed2389ea46eed8d17ea2 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -4452,6 +4452,12 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
> >  		.width = 150, /* 149.76 */
> >  		.height = 94, /* 93.60 */
> >  	},
> > +	.delay = {
> > +		.prepare = 18,		/* Tr + Tp1 */  
> 
> I think this should be 15, Tr is handled by the regulator, so no need to
> handled it in the panel driver.

Hm, I think you are right.

I'm applying both changes but I'll wait a few days before sending v3,
in case of further feedback.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
