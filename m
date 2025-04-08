Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734E267711
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105177; cv=none; b=e6kCe5wzfMrUckOtKX+d+crH4PedDPoEHzzTmYyGgY8OLPRtKKiGwTMMO6zkojDHGRrCjqLx4FlpVCd5oF6V5SlSO2wsyWLDOg+rO5VXdV9DBvOod3Ge8XuyeKZAcAAgX6z5YAQ22ifvGXB7Fgg5ikZasfXdOjKXtMUSjeg06Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105177; c=relaxed/simple;
	bh=IkYBTEY6JhvGb7MAKQi0he4gyc4Ltpd1gFbX323IaCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esDiVCNPfwwAwHOk9JKjUlEeqy+mQfauKAdI6FM/2NoA+N5qAZnxQt4AkH9g2uZVAGRjlDGRutA3F2XxT5kfS4lrWzdfKaVPIBDOUmfehaOGy0qmxS+3F970uvr6ke99mdHrJvqJptbB0IzAMcUu4z7E0tdR05SqeQuJMvyKKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aLL9h1an; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Oepx9Jh9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aLL9h1an";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Oepx9Jh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744105176; x=1775641176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HU7g7r1daBdnZNOhq0DQ0MLmTBrujJofZRa/dyTPJIw=;
  b=aLL9h1anO3bu48DZZzvuWkHXuu4M8awTqmJWS2v0jSIrctCN5Q4YHai/
   ikUL/W0RtPrOjBVEMy4VpvyxlXwQITj592vX9AKR6AfIM8xfjH6yTGrg5
   tnZZE+RBsJUgiCSk4MhnmnKGXWSE4IU7R/1AiNtHz1lh9+wZdd7JG51KI
   CyvsQwH5pQXZW8N7l0pwqwuDWHAh1TqB7aHAMMamnQeUBjDsz3gFCF2Uy
   sY6aoZ+IK34vnVDhc2GUwC2xmSzibdDu5UvFiuQQbRZXaQKmKNF/jbVjs
   giZyTchJqQLg/pAywXvENF9d1vdEMn0p2Ra/bYiyzKpDZWVF0qJyt1kt7
   g==;
X-CSE-ConnectionGUID: hzs8KWMxQxGAzt1+U9BmKw==
X-CSE-MsgGUID: 7eOUdWqzTXybavMJaetD4A==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397721"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:39:33 +0200
X-CheckPoint: {67F4EED5-1C-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 5DE4081C7AAE060DB9A2527449C61BD9_4
X-Control-Analysis: str=0001.0A006377.67F4EECF.0011,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1F2D169628;
	Tue,  8 Apr 2025 11:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744105169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HU7g7r1daBdnZNOhq0DQ0MLmTBrujJofZRa/dyTPJIw=;
	b=Oepx9Jh9X5FqQhfDWbNUPuu2O97KuqOoKERIBMVRZUWgtArj1oXIWKimDfBYqpeAiNYJTE
	kvdCqeFADrMUz8MZ6NnwnX5WeIVxViXrepYP3S+yXhVQq+YWsSm5h5qc0QAlpGzCZ2EnuY
	vH14jUfYGQlHw/h0J6i0Ub8GWX0nEw2VZZOv6QwA9jKmfxSkjfL5Drrd9262+o8E5kkSzV
	f9MMcxELhMbxPQojRnZmA9r9sodAb1IWaWCUkVZyxzdOpc8NETt7i3GeE1swQ8PhLVeWV3
	xoLKScsazfea9JHPGlYPspzR7mldUuZU5tk/Pw2su9DXfbfmscS7xj4abrAwXQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev
Subject: [PATCH 1/1] MAINTAINERS: Add i.MX team to all arm NXP platforms
Date: Tue,  8 Apr 2025 11:39:26 +0200
Message-ID: <20250408093926.554091-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

i.MX team maintains layerscape as well, so add the whole
arch/arm/boot/dts/nxp directory as requested in [1].

[1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-5810/
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8627b2024cee4..b1fac2a3bc948 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2519,8 +2519,7 @@ L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
-F:	arch/arm/boot/dts/nxp/imx/
-F:	arch/arm/boot/dts/nxp/mxs/
+F:	arch/arm/boot/dts/nxp/
 F:	arch/arm64/boot/dts/freescale/
 X:	arch/arm64/boot/dts/freescale/fsl-*
 X:	arch/arm64/boot/dts/freescale/qoriq-*
-- 
2.43.0

