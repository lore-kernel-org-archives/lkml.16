Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DFE1991CA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256580; cv=none; b=mu2vKzbkJKbstVIk/OLYHiA3EWI/tuEBCpDJgJbmE2bJohGOVd2uzV52ifnSx0J4ql0GfHJ1vwebhSx+v87ZoVXtqaYp0hIdH5pXogeFjWJJp690U26yTp66UHKeTIloEV1DMPhZSNw4vu7OigERsdckNPAuTdtpzXeyh5frl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256580; c=relaxed/simple;
	bh=AI/cg3j/Ut/+fhoqRaaZNhb79nXzboVuf5gmypEfKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDvZtdAFlIDETQWJEkNWnR447JFo6kkHLqRwYVvGenIAZX7PTZvW1EcPXDYRkWpuZNgXij25Z0vwK8qVSAMTWBGdfCtzMINsAE9kO1uvgvU2rh5KhvskkS+XOQdJA0u9YD7zd5P8x6+mb/q6hDUrFNjT8yRuldYXUHpCgiROEJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LzYoS/8K; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LzYoS/8K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4SL9nDZol3vs1cqOSgVmLrfLfF1zwBsP/o0wOZK4nMI=; b=LzYoS/8K+xp4/lhbEcGDSbZO+u
	laJCqBSzveNaPlUQYEVydU0Yv93W/KpRmxEzRTRg/3ZuH5YAlo0d3Vv+H7UkMLBZeZ08SQH0wvyRN
	6Z9OcBuJqqKeL0f9/VBbOz0Wnsj0suvU8LcE5ENbptedFzshcqmZBV5fOe9/G6/447zzFoIIdTOoO
	YsKwF2NgPpMXSTui1/5/wP+73U8tB/xULk1yZpKGzNgltdqI66s/nlezRmMK8EaxJh77BuOEMnFrl
	V1qCgAOAyZPWFPin9K5PcMy3Gw7pWlfP5vKqRhTNPNhRulcn0LcYh2c4ob+51rL9DbdFVG/Qrn1OU
	vzGZIk5Q==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uRtgY-0056EK-58; Wed, 18 Jun 2025 16:22:42 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/2] drm: Add missing struct drm_wedge_task_info kernel doc
Date: Wed, 18 Jun 2025 11:22:30 -0300
Message-ID: <20250618142230.2407354-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618142230.2407354-1-andrealmeid@igalia.com>
References: <20250618142230.2407354-1-andrealmeid@igalia.com>
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
Signed-off-by: André Almeida <andrealmeid@igalia.com>
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

