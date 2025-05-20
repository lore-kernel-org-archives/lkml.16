Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15225B1D3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763264; cv=pass; b=WsC4Yeyph3r3NXJpNuP9+QSzhOLcQZrvPYFLLy+7szPBI8mWRZzftBOy57mZgXd2dMH6xP7q8KNz2U4LduBqsGiQuho733LsUKA5wss4oGRSfTnDYo7M/T1yzcn2aCRcH6nhtHKlDHRVCxq6MHk2Wtie38OWkXezpUCOCkJ/BcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763264; c=relaxed/simple;
	bh=39GY7lMDpguIGvULfrC1Qtk+riGQxOQr3qy/JDnZKGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxkgYh3VMjlt2duX9oSJ74p8kEfagJ/H9lkUTcA9Jnxn8QEWZ5YLZpp35TKlxAl9r+iejIj4QwORgK7MIpL+5vadtWoci6zXn9S1jyRrdUepBACelPlOylpEFqOlqErv6QktgEeLNHwHVztEeJdY2r7Pp2EZYyZFOlPGA7fed24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FFN7t7jW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FFN7t7jW"
ARC-Seal: i=1; a=rsa-sha256; t=1747763247; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gj+qZAv1Vqas2D98HrTYTtX89THlnMYIEfYTU0DhJoiemf23tl5gojB3h8JP+C/ieaIbFoExlbPfHXulqeHN89BUVGgtnVuIoP856ZNvykew2y2pa2NVZLXpKrvKaJGb3SJArWH7dE/+eDrG6lrrkxFnFSGdsEHskiy+iSwJDpc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747763247; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZwJNqE4R8o0XNFwOgoDwfufMDYbnprYPjqqiSXm7UnQ=; 
	b=QZB6YlLvqqaCoPwp6nH5ec3+dVntvqV9bTKGlEJBi0wrzfIGw57a65rieMKvoc+DQQHJ1KHVDSq1Uxxov1hkxVQGP4nsEtEtMIqUwy7V54s9JDyv6R/uthp7FbbF+AC99zYNqI5HWSGoXRufYvhpRJAz8pZzfEE+QIX79wLxb1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763247;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZwJNqE4R8o0XNFwOgoDwfufMDYbnprYPjqqiSXm7UnQ=;
	b=FFN7t7jW7JXxfT2X9a/iFHT5l2V8K99/2qWlDo0CBDq8dDxEEoI+mGqOP+EQ7MTH
	CcSral/3aOm6hetBVbClLW7IEaWxZ+RkxDqQOV3XZjjrOZ4LVAXSijZK7CgrJNasg5+
	ZmjBTuxFPrh0aoOAwBMkOLwaMlm0gcHLu7HYNsLY=
Received: by mx.zohomail.com with SMTPS id 1747763247490239.94632075864706;
	Tue, 20 May 2025 10:47:27 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 5/5] drm/panfrost: Fix panfrost device variable name in devfreq
Date: Tue, 20 May 2025 18:44:02 +0100
Message-ID: <20250520174634.353267-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250520174634.353267-1-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current
device frequency") was a Panfrost port of a similar fix in Panthor.

Fix the Panfrost device pointer variable name so that it follows
Panfrost naming conventions.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current device frequency")
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 3385fd3ef41a..5d0dce10336b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -29,7 +29,7 @@ static void panfrost_devfreq_update_utilization(struct panfrost_devfreq *pfdevfr
 static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 				   u32 flags)
 {
-	struct panfrost_device *ptdev = dev_get_drvdata(dev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
 	int err;
 
@@ -40,7 +40,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 
 	err = dev_pm_opp_set_rate(dev, *freq);
 	if (!err)
-		ptdev->pfdevfreq.current_frequency = *freq;
+		pfdev->pfdevfreq.current_frequency = *freq;
 
 	return err;
 }
-- 
2.48.1

