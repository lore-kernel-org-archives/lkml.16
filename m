Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C38B1EB9F3;
	Wed,  2 Apr 2025 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591854; cv=none; b=MsQ3mMiDfytT+Wn3H7gGYYhY7jNjRrTlt+2j41g2HOaFxXpbBYqk79gXWm9gtnr8n2lDgAFu7KiELAf4WaP0s/423AnLGMTMbX398JQNTQOF1GzmTKHIEmsw+3g5xNq3OJpmGnxjt8Wb47czerqh1plXz+lDq7mH7+7u23RY7vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591854; c=relaxed/simple;
	bh=6d9OGw+GQO0uLw1dN+Q6U55NaS4IXjOQQRF2LeeTj7E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=chfYdlTS1E1JfpfQKnk0JhswWONdm5huDK6Xr56e/K2ZpxhXDz5oDa6ibb9NGRpWFJShn34v8Eg/C90yCqtPNoqz1q2C9OWdTf8hkmFtFWmH4eCwxX9Y2ivxKoc75GTvBkn2H067YzGl/Jbg636kTEcn6nnYa7iEHU5uy8Oo6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cj8brkGv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FDGJ2ZJO; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cj8brkGv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FDGJ2ZJO"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0CEC22540224;
	Wed,  2 Apr 2025 07:04:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 02 Apr 2025 07:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743591849;
	 x=1743678249; bh=0+2nC1yRWO2krIGNS9hPJRkYfq3R8kYhi3T6ukOvaHI=; b=
	cj8brkGv0OS41KWvxOndfLmENKO3MsZH1cH2HAh97cmzpxFnmPgIqtQu75EqQ1lf
	fDoud6Hf5DjH5m4c1ZyAaVZpNrbGXgebn2VI6j6P3o/5KukoTHtpQrNV7AOtxJsp
	FQ6DemD38e4eYbJ22Hc9myzjT16XI5pe62qDxFSZ56TM9mcb2M7edzYUpesxa7p5
	Q8tMpTBkIrddRZkGYuajIghr10Tc4TJtReP7w6+TFXGxURW1CzaSwv91jaCrTxYh
	0dnb91j5bX6Fr67Bat3HDONGrRW8euYli8Fy6GhZ5hGdQ9vdmmJ6RB/ifT7sE473
	SKlIeWYrvJoMaeKXOWoqEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743591849; x=
	1743678249; bh=0+2nC1yRWO2krIGNS9hPJRkYfq3R8kYhi3T6ukOvaHI=; b=F
	DGJ2ZJOEMKQAABJUWyvR2R0wygnWFFAChKs5AbbZkvyrlyILDrP12bZNOq/DECrG
	XK5m7cbzolhhGS+XW4RkuAzz2GplAWEPA/Kg1FMBckGOtINVnHeX7QwqFBNqRr6q
	KohzskG7D8Ja3GuIOpQ1jY1j4TqpBxkSGc1D18zX+drV6a6ccNer8vtmnC6M2844
	LOPOuF2iRfA1tBiygTWsXHpVcP3LtzbTwAJFTB4ngPDAJz8FBS9bu8/ny7XlHPH8
	wmwDUBrEnr+KMTxDlfC1pQvarbxncwo6KsaCS91gZ8FptE9JZTiSnZeBBcnJ0iPs
	nSZM4L2lBEPUGswSoqb7g==
X-ME-Sender: <xms:qRntZ000e9FiA9fULog-htIlqrdDQ0meUAx1NE17y9t5nhahmWMLbA>
    <xme:qRntZ_GOZCe6ALDh55TQFupueBRj8BYj6Rx0n3a8ij8BiVEiMgllQxwp303Womfnv
    Ui5_DO6GK5vPCCoA3o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrkhhshhgrhidrghhuphhtrg
    esrghmugdrtghomhdprhgtphhtthhopegrnhgrnhgurdhumhgrrhhjihesrghmugdrtgho
    mhdprhgtphhtthhopehgrghuthhhrghmrdhshhgvnhhohiesrghmugdrtghomhdprhgtph
    htthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthht
    ohepnhgrvhgvvghnkhhrihhshhhnrgdrtghhrghtrhgrughhihesrghmugdrtghomhdprh
    gtphhtthhopehshhihrghmqdhsuhhnuggrrhdrshdqkhesrghmugdrtghomhdprhgtphht
    thhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlihhnuhigqdhh
    fihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qRntZ866ydlzsrFrJA1n1NjZGLxirmSTg8bCAH4YZrhkViGVjJdPWA>
    <xmx:qRntZ90JhRc7C4yKx0FarM6GmMEWipQugPvrkOcSY2jKfTzAjp2H4w>
    <xmx:qRntZ3GFgYTSLmm8T7rdwSksl-TWYbge5YzMN4LhVCfY9iTq9wmCvg>
    <xmx:qRntZ2_zG0xqqBZpwXQVbY936XMekcU0p7qj8lWq2SainAN_yydwHA>
    <xmx:qRntZxfmGW-MItUq8AZGXgaJZyny80z7MpA5MQzIrfg5RAAEL0ECuxY3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44A552220074; Wed,  2 Apr 2025 07:04:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2646875b90204225
Date: Wed, 02 Apr 2025 13:03:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Akshay Gupta" <akshay.gupta@amd.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, "Mario Limonciello" <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
Message-Id: <af416dbf-240c-4c21-954f-d69420f6bd3d@app.fastmail.com>
In-Reply-To: <20250402055840.1346384-4-akshay.gupta@amd.com>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
 <20250402055840.1346384-4-akshay.gupta@amd.com>
Subject: Re: [PATCH v7 03/10] misc: amd-sbi: Move hwmon device sensor as separate
 entity
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 2, 2025, at 07:58, Akshay Gupta wrote:

> +
> +int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data)
> +{
> +	if (IS_REACHABLE(CONFIG_HWMON)) {
> +		struct device *hwmon_dev;
> +
> +		hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
> +								 &sbrmi_chip_info, NULL);
> +		return PTR_ERR_OR_ZERO(hwmon_dev);
> +	}
> +	return 0;

I just one more problems with this bit. This was already in the
existing code, but should still be addressed:

Using IS_REACHABLE() is usually a sign that the Kconfig dependencies
are wrong. Fix the dependencies instead so the hwmon driver can
only be enabled if the subsystem is enabled. You can either add a
separate Kconfig symbol or make the driver 'depends on HWMON || !HWMON'
to express this.

       Arnd
