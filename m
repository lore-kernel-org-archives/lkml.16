Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110C1F16B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244900; cv=none; b=WTWLMncqaWJJCEdexyLr+7n2UmdYx9vTxFLLlAh3wqzPy9x6lEDPmL32C9Gz+6Z/uaJBdtxL8omJ+JDuSLDZQjyD5XsIFm+NYVKPBMT2JXTiU66cGVuBuCTezEQa43EeORUwcqydtZU3wca0dSLbhRMRDdETgdP1qhLS8kt2uQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244900; c=relaxed/simple;
	bh=45uGVct0r5a+HCc3Kpji28rnDDR/MacGbUokf6Ppt9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0LtzsC2+/eHIYV/ymB5Jv5wRDKb87YuKbkpg9XJW1R0l+jgLuiVFnPfjd5ElHVBSq5ZbYTDD1kKHxmgUzJglig8lvSBfk+UWgCDYKfK1vfORblyYzDmuWg/TkrHDabxCG6IIKQHO3IYSe61vxTh1FnhSv7/S6UO9c112TrmmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iSHX1ckt; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iSHX1ckt"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6D01440DD;
	Thu, 30 Jan 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93VRQAmn/elFwvuM90jv+dfBNRmN5X+wbkFY1sHvbHQ=;
	b=iSHX1cktMIsfYh2R/8dAOmEIXT9MYV4CxWWUP0o7JTswSl0XAUWXTrh1jC/gNfvjSPObvk
	qrHr/x9QUTKioiJEdezxcLrDTFIHfMTATvdWiNHXCiL2CkLJY5fBAKVQpb1ozcJaOVhsCX
	BDYv7HGS4ZoRz1BJEEfSmW3utJSuJqB3tvW/0nagTHpJBmRWHM8ItwmIY82RiLyz/m3f7M
	VzK/totC0QFTlwauvHiTOF794UqYNssjQWAiSTE8AEvsrGq7GazosPwIpjeGmDZ6LCyDsE
	1Kilm05T5/FNGKIaoDTB37czsvB3wuOAF/MpYYLksZo6/PHNBafKwVDEMFgz8Q==
Date: Thu, 30 Jan 2025 14:48:12 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 02/13] drm/vkms: Add KUnit test scaffolding
Message-ID: <Z5uDHNYbfS0fBHqZ@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Arthur Grillo <arthurgrillo@riseup.net>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-3-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-3-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add the required boilerplate to start creating KUnit test.
> 
> To run the tests:
> 
>     $ ./tools/testing/kunit/kunit.py run \
>       --kunitconfig=drivers/gpu/drm/vkms/tests
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Co-developped-by: Louis	Chauvet	<louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>


Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
