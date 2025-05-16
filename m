Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A32815530C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387466; cv=none; b=Fm9hPIa3hoYKbgvO4izSt7cqFdhTEAUW+0z55mB/bHR5jFEUgB7aDBuvN0wzbyDwWVs0dcERpVDEnzq+nfC8u8uqKFnS4ypxNPLFE8kqbl4JR8gyW62mTYf/huIF7LyjLlntFTBlkGKv/VjgqOPl450e/URCFzQdweYEowNktDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387466; c=relaxed/simple;
	bh=/ZFMIpLs6h2/doDXwg0M82XGokZD8rAL9KluIl3aZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VEToNxpBx9Rzr1ogzlxyDUtNYxvbD79lUsTi0oU966SYcJi51SuzzOI0WnKfZ6tqWHpkiuy/lUawugKYcGpG30y2zuph7U7EIgj7+HlPzIwgaZ2KQ2df5OeLC2JqvjoCud8q8ygknZ+Q0Jxc0D7DlUIJN4ltIGw2B9Y5e3AilWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ohFhW1oB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ohFhW1oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HT
	Nhmctmjx4Z/bGQiWHj5z1Zlft6woH0PtPOT4ao6Qo=; b=ohFhW1oBCY9KWubs99
	QZ+/ZhJcN8vxocqeGvn5kO4cUuHjX1eNq0jog+ptxQnx1kU9e3NDHzndkK7Wj93d
	FaUud4rsrqOwzlhTc2+gXc6M/AjQARW3/X0et8NMFQY3PtKGZrUgG/ia9yA/SRij
	N9YyU56Uq9a+diF9UJFj25x4Q=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3_3UgBCdo+HWMAw--.22577S2;
	Fri, 16 May 2025 17:23:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm: Fix one indentation issue in drm_auth.h
Date: Fri, 16 May 2025 17:23:38 +0800
Message-ID: <20250516092343.3206846-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3_3UgBCdo+HWMAw--.22577S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWrAr4xZry5XrWrJFWxXrb_yoWxCrc_Aa
	4xW3W8Wry8u343Ar1xZa95Aryaga4rXan0qFn5XF47AF1kJr4Yqas5GFyUta4rWr18GrZ3
	Wan8Jr9xAr13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpVbqPUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBFPXmgnAPF43gAAsw

This should be one space.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 include/drm/drm_auth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index 50131383ed81..830386804f91 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -86,7 +86,7 @@ struct drm_master {
 	 * ID for lessees. Owners (i.e. @lessor is NULL) always have ID 0.
 	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
 	 */
-	int	lessee_id;
+	int lessee_id;
 
 	/**
 	 * @lessee_list:
-- 
2.43.0

base-commit: a4f3be422d87958ef9f17d96df142e5d573d2f23
branch: drm-misc-next

