Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146C2293725
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054071; cv=none; b=qMlshyaKmwEotR18kpVHeMMo4JM5kZSSt3HsRzZJiJ6iMJ/8uaBlINb9QvcUsjGkMIc+BZuq2baTrd2PJqAUXtPAeuVObXneNWkbxzcYtlt1DZbCX+A/tlldRsE6GDqD4Ltc2T1j5aAtgEpApmD5pZBJXfvLdM265eki3NLSPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054071; c=relaxed/simple;
	bh=1+nhmkwcFu1eh/mVxyMIdHA5WrXPXGKZShwCeQjRlhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLr7lrrUlFT91puPEaYE01+n/b9kwPMB9JwFQq3M8rDyeZ3XAJdZlbuTfrfr5VO+P/uOh6LU/ouRrtzOY8Jwuct7CuSGHb0yVIWlmOueSMuvssnxq1xTp6pCq6et4jmNC4NUnF1f+7KagQvqnQyJZjl3GGv1yjAkOfreoIsoA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lOTRFDuX; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lOTRFDuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=W7
	TPmz56+bTrrWezkI50FNZkhcBlfYF3xYROFZ7Kqfs=; b=lOTRFDuXOP4BAUVjSJ
	Q5rFUAdtQVwhl+9Oy5tf1kT/m+Q15aatk3A68LAvdmjYUk/VffXx60htnqnZFgA5
	y5A4OwVLiFBQJ2u9NaTRu//C6LQFMBXIm2LaB7b8lya5lpKa3ET70Kdj/x1f6g3M
	edxutcQHwPPygDzQFfmwK414k=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S12;
	Mon, 12 May 2025 20:46:31 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 10/10] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
Date: Mon, 12 May 2025 20:46:11 +0800
Message-ID: <20250512124615.2848731-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S12
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyUKrW8Jr48GFy7AFykuFg_yoWfWFb_AF
	1xC3y0vr4YkFWjk397Ca1fW39Ikw4xJa4fX3Z5tws7tas8AryDtwnY9Fy0qr15CF18Ga9F
	qay5XFyakry3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0a9aPUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBNLXmgh6hVNRAAAsR

From: Andy Yan <andy.yan@rock-chips.com>

Add entry for Innosilicon hdmi bridge library

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- First included in this version

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81b81cc68ca24..3718e570b4739 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11694,6 +11694,14 @@ M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
 F:	drivers/power/supply/ip5xxx_power.c
 
+INNOSILICON HDMI BRIDGE DRIVER
+M:	Andy Yan <andy.yan@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/bridge/inno-hdmi.c
+F:	include/drm/bridge/inno_hdmi.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
-- 
2.43.0

