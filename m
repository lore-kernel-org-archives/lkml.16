Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E81A316A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464013; cv=none; b=BDJfH929HSKymBNtUwpDrV29uT8P/WzgC/ilpUwFUx9h0zhd1uTXNi8cVRwspOZHd50XG5s5LY/vB0YGz2CwtqYa6e6iHEdT1PURRgwd4JYmpYu+0tG9ZxjAppwUHh7kRs1Y4uiyFMpsRlZnGGfSqzchwgNXZjlEXiE4ObvxRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464013; c=relaxed/simple;
	bh=dXbTaXGA2+mh4hdsOfSK2/s+3Cy/CYav9P4Gah+Lc9s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gQ2uaSfgqCCteeqzwT5U1CWeAjfYG39ccG1bqKehID8cVYhhKTFPf7Pheu6a4UM6DmKshIj640x6s4Q7Lq6Q6FVOZwEWUjhv9dRW8VGwnVC1Dlz5+JeQCfvYFrk8V2WdoJRWaxo6Cipxq89Kna4kn1UBFDm+SwZusCT0GJAhOTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zjgkd1XJ5zvWq5;
	Thu, 24 Apr 2025 11:02:33 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id AF639180B45;
	Thu, 24 Apr 2025 11:06:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Apr
 2025 11:06:42 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <huyue2@coolpad.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH] MAINTAINERS: erofs: add myself as reviewer
Date: Thu, 24 Apr 2025 11:06:53 +0800
Message-ID: <20250424030653.3308358-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemo500009.china.huawei.com (7.202.194.199)

I have a solid background in file systems and since much of my
recent work has focused on EROFS, I am familiar with it. Now I
have the time and am willing to help review EROFS patches.

I hope my participation can be helpful to the EROFS patch review
process.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..f286c96ea7db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8719,6 +8719,7 @@ M:	Chao Yu <chao@kernel.org>
 R:	Yue Hu <zbestahu@gmail.com>
 R:	Jeffle Xu <jefflexu@linux.alibaba.com>
 R:	Sandeep Dhavale <dhavale@google.com>
+R:	Hongbo Li <lihongbo22@huawei.com>
 L:	linux-erofs@lists.ozlabs.org
 S:	Maintained
 W:	https://erofs.docs.kernel.org
-- 
2.34.1

