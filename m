Received: from smtp134-102.sina.com.cn (smtp134-102.sina.com.cn [180.149.134.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831811F0E37
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967817; cv=none; b=VYiYbu4songnM9h2wRGkqEtA/IuC1UOGOOyml/QmNxXCzkfn6OvFlngdSrfcch0MjpclJtZF2mTZn7GWNWB4XMIIL61RAnEA1jdekLHniLJRc/muAPWxSQ32AQhMy/LdzXKgRv8KKguCHU/sEUEUncueNHS/qanoMVfyzVYTeMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967817; c=relaxed/simple;
	bh=tsuEWF7Y4U4cgRs7BeuIASePR97OAkS45d2GfcQdQoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RfaR2Cfz82+w+vcZShZ8UkxyJbi00LvxWU5lw6/wU6F7pDVqt53SssY4IKlrCXS99yv99pokeJ8lLg06nZCbPu/YxdmGLc3LN9u9tfduae7ZZcusrbwvlK2hGGxUSxbmb36Cjf6Gsq6l5IQ7G888gPf4+3YeORKy0LNa3D+IuCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682FDF42000051ED; Fri, 23 May 2025 10:36:52 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A4FDEAD57B7345448FEDA9B8BAA690B9
X-SMAIL-UIID: A4FDEAD57B7345448FEDA9B8BAA690B9-20250523-103652
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
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
	broonie@kernel.org
Subject: RE: [PATCH v1 1/2] ASoC: dt-bindings: Add Everest ES8375 audio CODEC
Date: Fri, 23 May 2025 10:36:48 +0800
Message-Id: <20250523023649.22785-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250523023649.22785-1-zhangyi@everest-semi.com>
References: <20250523023649.22785-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> > Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> No.
> 
> This never happened.

I apologize for the mistake.
