Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577126A08F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342040; cv=none; b=aDliLFKXaQt+01e5zne8aOFG5nfgWIdUdKgW7Hdg1am+tpbm+/BdoP8yBHXXS1KcrcenpBWpPSqdQcFCpHQ5D2Nyp7da8NB8vw8UnjC/G7un5y+t3Rl4eKXr3o9aJJi945zh8VbiRYWUSLHGAYRxgqYkxEYoxsXmx5hS4ndzJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342040; c=relaxed/simple;
	bh=VHaTrvWCJ4Oi8h3JUAOP9WA8jNjiI6xwG/ZM3YnBiOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrFHYQCNixcU6oMJaLkoFcYQvRCBf1JsHDRfWpYYV2NoIdk0gHgtsETn/JC8dvlB4Yr71VfXwHvt76GFGgkuhqGvM5/k3ca6zqsNc4PbWIK759eL/fSbOSq05erJZl5ty3ydBHHXkdcUabPuzy2ICgWixUkAGonrhcn4VuUQwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TGa5At8y; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TGa5At8y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UUtQRbUMspX+La2rBM5GNHMx0Wkm1+Ue9LoMVET1CII=; b=TGa5At8yUqcDq/f0Kt0K5tAzlF
	40yNDvwls1IdT6SshstNyF/iGFyRN1DORAlf1vpn6GGBx7DTr1Y6jeBwRuGudGahBKlYfxkECqJSr
	O+Zu+lSethCRkc5sqiphwvGGsffNfiBrUuKPGNjmqLRdG8mEG8uS9f+HL4wFzjd1Ef1TXlXTuA6m1
	htvQD+Ll+r3wHiMWm62bz/ttMWETIqrvKsVqrBn2aP6u4260fDCN5nAmzIXduVW+J1xZl/e7m9zHS
	gKAqNVkHe82QBI+7heDfmUAlccIfS+dkeRJ9ITFF7dh+ig96HJyaqITA3osXCUpuMlAMI7dD4PFiv
	mdIsaCDA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uSFuv-005afy-JC; Thu, 19 Jun 2025 16:07:01 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2 2/2] drm: Add missing struct drm_wedge_task_info kernel doc
Date: Thu, 19 Jun 2025 11:06:55 -0300
Message-ID: <20250619140655.2468014-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619140655.2468014-1-andrealmeid@igalia.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following kernel doc warning:

include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'

Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: Add Reported-by tag
---
 include/drm/drm_device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..aae0800ccef1 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -33,6 +33,8 @@ struct pci_controller;
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
+ * @pid:	the pid of the task
+ * @comm:	the command name of the task
  */
 struct drm_wedge_task_info {
 	pid_t pid;
-- 
2.49.0

