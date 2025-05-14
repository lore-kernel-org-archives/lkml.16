Received: from smtp134-83.sina.com.cn (smtp134-83.sina.com.cn [180.149.134.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B61F03C0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213424; cv=none; b=RGGE51091AjRO4h4aZbRUESC1uaHRj2stgICY4usNfmsy6S1wsi6+iKZFjeyWNkcdiYV9VyGjXMW1eTnI9U7kNM5hn0TOnlqO3nTo2YNniTMMB4tbeQS5dgfNzh7vM+CXtOlBX9chzdrN2T2XWGpqqwghtZW/alR9dgnMle9NQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213424; c=relaxed/simple;
	bh=ziWob2KcOHQRSNdwzOrRUz9+fKNcXjfLgssZQxm8WRs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z1R5pCYVyVDvLhqUkzKCXQqAu+n5XNhBLEY96tepGyaZLDYwwZGb7UhlPtwIFhmdvEFv6/8WYeSm+UuZO6cftPi82L2JN53eIKN9MBqMCWHB6hZjP4fhOSq2x8rKvTz1xzX08Pu78QpY83Ibb8JMIo9vWQ7+ImBActanp9yrh4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 68245C43000052F6; Wed, 14 May 2025 17:03:00 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9A565A5DA68D4B78B7225D164D86049B
X-SMAIL-UIID: 9A565A5DA68D4B78B7225D164D86049B-20250514-170300
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
Subject: RE: [RESEND v7 0/2] ASoC: codecs: add support for ES8389
Date: Wed, 14 May 2025 17:02:57 +0800
Message-Id: <20250514090257.34585-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> This doesn't apply:
> 
> Applying: ASoC: codecs: add support for ES8389
> error: sha1 information is lacking or useless (sound/soc/codecs/Kconfig).
> error: could not build fake ancestor
> Patch failed at 0001 ASoC: codecs: add support for ES8389
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> broonie@finisterre:~/git/apply$ git am --abort

I'm confused as to why this happened.
I made the patch based on the following branch
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/?h=next-20250513
