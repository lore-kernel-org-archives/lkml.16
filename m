Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA41EBFFF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467016; cv=none; b=dbXcn74ZmuKatyCTJ6AC0d7vhOJouRk53KuF3+r0zW/CFlq+qEUP/mdyPpXDan/tz3hZJPwC7Do8d42/TQPFS0lcm/DjVPYRIUQKvGj8kZegOmp+7Habivz3unGTerKSC/SP6LwKmQ9u3iU/QkJ00CrzxrCzISj1PY9T7fpAFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467016; c=relaxed/simple;
	bh=Vo3fvAJBDbt6frnEaE1CoPThEN6dui6NgLCTBCNM064=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPt0QzHmhNjSIsdN6zMtorJ+S5VkxPVZUv6Wq2gwMZ1FMPwk51xPmWy/eR7kuTUFIARBIS8e+2IKdVmdY24H6ubwJPxUfGLSNeKyW8KxM3XBOc9KZD4qxSfxbFsRc6tRSbIPgKPPC9QyEvDzHhB7YcKRcCPGlaQsvy1+wdEztjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=ngpbSQsc; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="ngpbSQsc"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id B1B1038A4037;
	Sat, 12 Apr 2025 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1744467002; bh=2eYcc9iagiRSkffTNOH2pp6v9FqlkPr6nivkhdioa8E=;
	h=From:To:Cc:Subject:Date:From;
	b=ngpbSQscUUi91IuhWlnnrkToYEqDFqGEK3cC1dhn/1ZZq6IfKjkQcAcndeCtXwN3v
	 WwxXdIlTAs18Mda0LSwMnxI7/PZTjl1KMgmImuBl8+vtlE1JltpTZKYZWKj2x9MNGV
	 jQo0YM34r6ETZxO5WrM28nFzup+A7DsRCCLmdESNJhyFrOKgciFemaeWZQkIZSiOWw
	 RwtfEZPe3h9GgKN+K452F1hHLpG8a7aorRGdJF62DLBClRTsDVW9eGIeJWbRyY6G60
	 Dlin4elW4G9wAVzvfRXJmosdSOrh6K7gTwuqf6FgTlfUFnUpjtAGqMH5uG4+9OZZGO
	 9ISfwH0dgsQArxV0vx3qXVAai+G56EUFoYGeDpCAr+8n/hoJGveNvRmhM0VoEBQnT4
	 bgTO1ImoR4XudIUXEXN9QqdBSV9tlMmOBg1P9X+sE72NQllRIuppqaFifE9DOF8+Oj
	 pVd28tDsT5+oP/sFxBrfG/2rAio24vsS3dQBa7dODf1T7v2Q19DZKk/BXJ0AduuCLZ
	 8qyg/G9GDiqR1MamHKuHjq6v8McRqGIF/mHBg3V7UgRyR/M7LxkrBQ40bcv95WD2Nx
	 N+wG35rJ9qy66o3lYCKON2ZfIDnchyv4EbkKJnpU/2H3rBTpK6dZ8rt5HIs2rnQAA+
	 85ThQcXmdokAR9gEGWl/v0gw=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h359pY2B7BK0; Sat, 12 Apr 2025 14:10:00 +0000 (UTC)
Received: from xtexx.eu.org (unknown [223.73.102.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 12 Apr 2025 14:09:59 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Gao Xiang <xiang@kernel.org>
Cc: Bingwu Zhang <xtex@aosc.io>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] erofs-utils: add contrib/stress to .gitignore
Date: Sat, 12 Apr 2025 22:09:38 +0800
Message-ID: <20250412140940.88303-1-xtex@envs.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtex@aosc.io>

Signed-off-by: Bingwu Zhang <xtex@aosc.io>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 33e5d30a9cdf..348896103d66 100644
--- a/.gitignore
+++ b/.gitignore
@@ -31,3 +31,4 @@ stamp-h1
 /fuse/erofsfuse
 /dump/dump.erofs
 /fsck/fsck.erofs
+/contrib/stress

base-commit: 3689cbc2349bff05807d2f939146e92eb1bfaea1
-- 
2.49.0

