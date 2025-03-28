Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9D286A9;
	Fri, 28 Mar 2025 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165862; cv=none; b=DyzzvO7EMrdiSk0I/TspThW1uiJ20wa18SRm55co4fR5bzaAej+h6SabYI89YQqBSm5uK5BO/vcqSPrykelkYckRzEMoj7GxOCeh6Mf7BHtoYHWGn1SbIdDz6N9fGylKt0zcZel0t8Dd1C4hnyQrCTJ2Mml0V2K2cQbcQ6OeaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165862; c=relaxed/simple;
	bh=wegXwhmpEO39gi7WyoocQ2XUlelcvMW0ifZq3KqBSPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+C5BhyXSgxq4VDR7ecE0G32Tcaf1dnARXg2yGfhoSkC6NzU4BZxAw6qpz+uudcpspsMANfzeXbir7pdhklJwXUtEwgT3ShcKUP9Cw6+SCgt40nS0apaCHzGvXZ0xWwaYqC1Gxnu3uBDJig1qKevcI8PsVmG1NdvXjKF5hvEWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=flfuBTc8; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="flfuBTc8"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 500241F93B;
	Fri, 28 Mar 2025 13:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743165858;
	bh=wegXwhmpEO39gi7WyoocQ2XUlelcvMW0ifZq3KqBSPQ=; h=From:To:Subject;
	b=flfuBTc8xCv6X7IKyP4kp7T5LPFKSFGLH68bbXi9iq1Y+E5wfdcB30Bg6r0t8Ec77
	 3nkX99hfvoOEw86ht7d9Icudy4s96NjyZmfME79kXRN1agqfz3dzPVTCmiBoqMrbYZ
	 zf0qnR3xT0sR8o92cyN4SHLBmj7a5RWhVxfFp84I3Y4qcpb3gQWA7N7QhmpOcI2B9g
	 Im8IcXiSB0gcGZz9F38vIZsx20Mmpt59RhHXdguPjrgpyC4k/OrJxMI63Mcz5Eq+IA
	 qAOrZThGBbQAB3tk2CGkBWb79k/KsSUWgLU0hqqD9WWDyqlgoltwXZaXgKzPaI0/1R
	 M6H1Rd1KAOGhA==
Date: Fri, 28 Mar 2025 13:44:13 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Devicetree List <devicetree@vger.kernel.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/4] drm/tidss: Add OLDI bridge support
Message-ID: <20250328124413.GA44888@francesco-nb>
References: <20250226181300.756610-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226181300.756610-1-aradhya.bhatia@linux.dev>

Hello Aradhya,

On Wed, Feb 26, 2025 at 11:42:56PM +0530, Aradhya Bhatia wrote:
> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC also has
> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs of the 2
> DSSes.

Do we have support for 2 independent single link LVDS/OLDI display + 1 x DSI
display? From my understanding the SoC should support it, but it's not
clear if the SW does support it.

Thanks,
Francesco

