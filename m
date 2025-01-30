Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80115C603
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244899; cv=none; b=ezmyrPDzBg0kgYFbLv/k1BqdMoGhJ7zxEJZZxG9G9hiJSQE+0yAJUeTtQ/FMw9MQoqqB3k4iTRmFLDrC3cUKg2xMQjowP3Xgu8vgxuTMq8H7+O+ISMpw+XkC4MIgXDHaCAIqEnmbiqXxQ642JPk0Gc+tRw4Zo9dIL5Y1N5X+C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244899; c=relaxed/simple;
	bh=TEb+2WWjz1ATiKEe64wSLUF8VPiK5yncSaLA4lDPCTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4rdSeTVgTJKRB+bj7fcwmE4cZWAysQr8jffNDk1khLhdo3E/JJBhJ2TTaZEi7FJZ01FoRky7TylyowGt8Uj1lLD5JT5ax4xRvIoFc8KtBxFHxbC5Wkrr4dXi/j76Frtb2VW523QpxEHEc8zDEYeaw7htvUj/9ewUKoIaPkBk4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pJaqZq9u; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pJaqZq9u"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1200444272;
	Thu, 30 Jan 2025 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hELdTXsad/60/A8Y26QMKC5rkFy3aY9DbLrvDBrrfQ=;
	b=pJaqZq9uh+sAO21h5Nob8KrBk3ivH3IX7EhyItGwVYDaW30AwwCxTKAcQeDj0dRMr9OeTf
	wux0R4mP4VWKov20ImFJA6axD7mjYv4rXZTyMQCNVa7HjQExw+HPjujsklw/fvPiVYqDzQ
	ITR3xfbRPfURxsvUCrOezzq21oapkxT45s8jiU5piaYQmHLTqtOBxdBgC6DKTG+BfcmQbL
	sho47WDFkMKf4CDR23uDb/F7jpGvVy/eU08WKWcVrPWVu+LOob8lAxui+5Fn4WXkuPgBtX
	cgNLfwgtOJVmcuMmbCeX0QblYgMMAJIcTZBgSD6jfiwd3zpZcpb6oVvfV/PIcg==
Date: Thu, 30 Jan 2025 14:48:10 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] drm/vkms: Extract vkms_connector header
Message-ID: <Z5uDGhcvNIGDwEr-@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-2-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Up until now, the logic to manage connectors was in vkms_output.c.
> 
> Since more options will be added to connectors in the future, extract
> the code to its own file.
> 
> Refactor, no functional changes.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Non blocking issue: Do you think it is possible to split this in two 
different commits: one to create vkms_connector.h/c and one to create 
struct vkms_connector?

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]
