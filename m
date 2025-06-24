Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332C25C81F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754153; cv=none; b=MmgdPMgcAB1A3yS5/w2NW+iOyTvq7FoCGq3fTlq6hd3uC4fLhzWU7Gmx73YXI4Q4Ji86DvPu/NbxnWLoLYJwUScb47GC1Wy7+lHc2QgNT8/HToWkesa8+2iuCZP8s422T6Y5FVL7F8GM9KMVSh70Ev5uaQJrDQr6rspB4YJo56A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754153; c=relaxed/simple;
	bh=79sCu4PyYzVHW/Z8QGotil/TpK5J5xXTNlL9Xox50k8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=i2JwoY/kQoW4Pj5jchzDriB9Hyo2ZAALHx6iPXk0BwqdkshEgFuRls2XzEyRfIKQObEooSvuTakMibNb1Q0DQ8kkb4c7g/oTHfv4yOH5CpwtXX8HSiN7EJYgWOc2J4DhqAOmmffYSwqn8MwNPPGCWSmiTg6/XZKpZ4e9UzYZ7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=aa7PBuhK; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="aa7PBuhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750754148;
	bh=v6o/ShoJvWLhlSyxTPkbAI0fwmABW2L1+nINfU74Drk=;
	h=From:To:Cc:Subject:Date;
	b=aa7PBuhK0AaTGz2s8/2WFMA0irbyCGeqFAIVq6xT+iRhsA77Zfpd3sYcOwq08COtJ
	 6VnDabDk3yl3B2l3oubNoIlDh6OeqJGLqrU255SHv44YpEues26UpeW50rultUkAcG
	 sD9wMCQTzVkDrlsMva/+i5lOa6KU9Fc6YD6jAd+8=
Received: from KernelDevBox.byted.org ([115.190.40.13])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 8ED3EC23; Tue, 24 Jun 2025 16:35:45 +0800
X-QQ-mid: xmsmtpt1750754145t96osdqnj
Message-ID: <tencent_889D023A2A9B04DE8D592DFE961C5893C706@qq.com>
X-QQ-XMAILINFO: MKFQA+k1yb/29nquRTkIAQGt4f0wbGob7cvjvfJ8CF+sR9wKkmiBC4dNgvLeJp
	 fixeD0fmRyYLywArMVqyEdBYo7uQ8yPnXXLlbyMm4HBRjboZHX3FLGP4Bbb7VFN4RaNqY+X4GehU
	 f4QYVOorW3Bk3TABhklZlbqMXxqjYgdjIHBSF4Ze3WiBFF8Wv9Byx2YmeTcfCtdvLpQKe3UlSf2F
	 b8F/Y4uWPkjishF6MQA0NyXN9TLHNhK9Y6O4VvhufylnkiCIJLLurm4AOKaV/VM3U9HXSdZv4L4p
	 YRzqU8Okk51I6z9qMfccSJVOUHHIOh74DSiYVlqtWg/dJI/6e1LoAhejfUTvBhxk8o23H7c0Ium4
	 uqiGeop7q/29K2vxFgGHvjqwk+1mBqGS40M3erJFpy9d64szRhXiOxcMmuIfQrcjDDLqOsBllKaX
	 uG8OEpOwstYHThd+rBlObgV4oaebCyV0y9r1riLs3rMHmNghnrCbJ0duI2nm/OQZz2CSWstBA3pb
	 xTEsTFO2A5SQSi56BC8el+mhuVVlA9sNf+1d5k8SZVDqL7pp/j0z5jhxLbgl3JMOyGgPaTeNVGrB
	 xVdXzslCI7I5XDLr73rTMZnsA6beB3UkWvNGb6Y9qNCLOhblY3oplPcR5m5aAI55nmauJloK36rY
	 e55jd8RhPTGRdnbbXBkTKCGgtZCsfNJqWUzhRaa19caR5M+KRIHQwWyMWgByD11bV3cePftyoCGw
	 waNu4oaU8wfrlpic9SsIckgUYPvbGo2wyyhBA+tBpuFMX37B9qLms8GgW8faqCFHiFB9fBEZRjPz
	 0WUhwSxqMZjhBrn57Qhpko3uKfVxmeZQnQXTCqx9Kb229VWpQutaezaNyNQzZsvTvoCQJcdKMlw/
	 FT2TiyaEtrenAcNntLbl/wHU2LSPNE+rxUvbDzkJZc6ftfgeeI+C0T7NQzW2N29jPAeiG849zwcD
	 4SLSIHudFSsaNHQ43WfkJSkDgVFXddrcbmgkySGMUgX/OA/p1X6E1bivdg54fwW44odbtAetliGU
	 2NO1WuaA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: joro@8bytes.org
Cc: will@kernel.org,
	robin.murphy@arm.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] The sun50i_iommu_of_xlate() function didn't properly handle the case where of_find_device_by_node() returns NULL. This could lead to a NULL pointer dereference when accessing platform_get_drvdata(iommu_pdev) if the device node couldn't be found.
Date: Tue, 24 Jun 2025 16:35:43 +0800
X-OQ-MSGID: <20250624083543.1232205-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a WARN_ON() check to detect this condition and return -ENODEV when it
occurs. This ensures proper error handling and helps diagnose incorrect
device tree configurations at runtime.

Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/iommu/sun50i-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 76c9620af4bb..0f85850269ae 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -833,6 +833,9 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 				 const struct of_phandle_args *args)
 {
 	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
+	if (WARN_ON(!iommu_pdev))
+		return -ENODEV;
+
 	unsigned id = args->args[0];
 
 	dev_iommu_priv_set(dev, platform_get_drvdata(iommu_pdev));
-- 
2.39.5

