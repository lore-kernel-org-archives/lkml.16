Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D7139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254266; cv=none; b=eCt48KGwtjkWXtjAi1QPUUL1AtvZHEheQMQYJWi6z6Z/rAe1BhAaXLS273Fc6HwmFdabNFQz0xLnJTjuST9/WQ2tSbHV3ynD+vRz7neCelpPcI6kcF1fumUtHnQ93ZgW38BMEkYmNXoXrPTCpfuRphgyEgOU2J45NmPaP5d5v5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254266; c=relaxed/simple;
	bh=FK+w/zkHZ6IpoEtaMalwmnpuKCV+gdRXixtG9QpZd+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMLnNvUf5vETdsZCtlbsT3KkgGi0J2v93DfJ7j4A1/QdRsbyFNOIzBCWHCX+6zRBTlOgh2ItlORd4QXqQuhWdU1QFxvfIVUxGJlD8+96hHv0JH77neIt373OUFqz49kOWt+S7i6SETGYX9egyNZ6v3XkDSu0o6b/dpAxUgvhBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ANNQz8Ag; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ANNQz8Ag"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38D744429C;
	Thu, 30 Jan 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738254262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZqZ36OzhJ4i8+pmOxeF05UNwEx+qzzzPorR3nI48rY=;
	b=ANNQz8AglqwVDRFfCOC73xXWmVx6iGFIY69HO2/NAVW25DoLjlEu8bRdiIDXsrHuW8KV4z
	GhQcSEgcEEKLNkyW8Lqa/gpUzcnN8vU1n3n+jRTY7m697FmMQtf3yKfz3wxVvUc8J3NbqR
	/aZ4qdJRxJ9g0J239LchQ9qOuLkO7Vf6ZiUkKUH4qw6BvthOeyPigxOwlHHjjugsIYGWCK
	Y1IXInYsrGwdp8x9Tk50WT+q+j7MgxiCEnkuvtoQCnvntLNrHuDd5RVdGo/WB2Ax0T6KlO
	CWHWUcfF2/bG9otxOoxdiFesJjYWZ0Nd3/XhMwC2/C0JIH4IJQTPxz+v2wzeZg==
Date: Thu, 30 Jan 2025 17:24:19 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Sean Paul <seanpaul@google.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Drew Davenport <ddavenport@google.com>,
	linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
Subject: Re: [PATCH v2] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z5uns4Fi0ucdZXi-@louis-chauvet-laptop>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Sean Paul <seanpaul@google.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Drew Davenport <ddavenport@google.com>,
	linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
References: <20250129142238.562999-1-pazz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129142238.562999-1-pazz@google.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefhffggfefleevkedvjeefudefgeffvdekieelueehtdfhgeejieekheehueeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehprgiiiiestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 14:20, Paz Zcharya wrote:
> From: Paz Zcharya <pazz@chromium.org>
> 
> Add support for pixel format ABGR8888, which is the default format
> on Android devices. This will allow us to use VKMS as the default
> display driver in Android Emulator (Cuttlefish) and increase VKMS
> adoption.
> 
> Signed-off-by: Paz Zcharya <pazz@chromium.org>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet
