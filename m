Received: from smtp134-100.sina.com.cn (smtp134-100.sina.com.cn [180.149.134.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3812356DA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907713; cv=none; b=YTjievam7xyHvFLGiBr/ZBclVktBY5IHUkHPpaq+XeQzFDbrRRd+DcT2Mvuy/gwR+/PS7bxdngJHJsuGsTQEf+yk0ShTvFuAukiPbbyNJRJRpkAK+T8CzofwLW/ezv1rluxEAJqQcyRZUwCZn/qe8tONwQFLI/KivFKZ1ixn/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907713; c=relaxed/simple;
	bh=v5mx8hHSC8ujjutLkZQ4+PgocT6absct5dh6c41uN8Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kmzxy8am3O4LJJBnraqNfu3qWIH6NY7ekpcwFaHypHw+upRrWUgUnKUew1RcMLohwmVziBOUxfRLAf2jOGCtEyFGyWbgDoGnrPlQvB04ln50lYZPrhanktWy8MyaSA1LbyJr/fqcatvaxcfABXGhITozyp9lkeKemp270s3m0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682EF4770000799E; Thu, 22 May 2025 17:55:04 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: F6B89C767C2C49F3A68479481D15E0B9
X-SMAIL-UIID: F6B89C767C2C49F3A68479481D15E0B9-20250522-175504
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org
Subject: RE: [PATCH 2/2] ASoC: codecs: add support for ES8375
Date: Thu, 22 May 2025 17:55:02 +0800
Message-Id: <20250522095502.10106-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> > Because the default value of the chip's volume register is 0x00,
> > initializing the device without setting it to 0xbf will
> > cause the device to mute until the customer sets the volume.
> 
> That's normal and expected, it's totally fine and normal for the user to
> have to do some configuration.

I got it. Thanks.
