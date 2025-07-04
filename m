Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B320ED
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656062; cv=none; b=c9Ti4k7CTO0jvmcyBjLS7yOJVmMJ/tBPHM51s7/OSoavCwj+96xMqS1IOeIJ22ij59AfeoDMSVzDW5QlMiV+IZeLulr8yFMueozThMK6giraFfLV6Guxbu4vB5Nria3GU3sAYYLbfOI5fvjVl8dbVKXRbwfmdAIZZuTpZv5LC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656062; c=relaxed/simple;
	bh=qwoFe8miEcg8ipzc5EkqMgTfb4StLh0rkTuML7xbQ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHlYmidwr9Qj535zIJ8YzYrAol8CwHnRMDCTV55x+zmdJLotO7U/YBmwJ+C/Hpo3rgUGxEK939DMO9qTeCbc1MwtYPYdWFdoetRl+lpfph/IndWHlePo5dr+I3RCg3Y9aWe6Q2uyXCdiHOfjIte3mFrV+ip5TCbQ7k0KwDZ+pIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mJe3ZEzL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mJe3ZEzL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a1vWsGAI3JLCC7AzUbpNGnhS1zkXPePrL6gBb84tqEU=; b=mJe3ZEzLjzFIFWevYjv6pp5OG7
	qApnYk6QRQmhdxuVndFEiqoWsdcM19S+nQek5aE/wvPKTK+gsLCImG6FRv3jmHNPjvfUKUsdrEOk5
	+IPMrMGE/vWy3hfG0qGn3w8jtiF9EGLYGtBDji69zJ2Oi73QmN5DsYGOTIWFD152DOZF4sDER25er
	chFRbFLfknualfhDEjpSDW4sUeK8CdqpjuCAZFiP498Lzjm1cdoas0x48fcs/q4R7iy8vEhsbnp3V
	P2/wGIGxTAlNr+Npr9nUid+kiVcTDXtbtofbKA6jyGb0Gfn+iqBChJWoqnazY7gFl6q4PcvHcXoY2
	A7MPccNg==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uXlkx-00CY0F-Tr; Fri, 04 Jul 2025 21:07:32 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v4 2/3] drm: Add missing struct drm_wedge_task_info kernel doc
Date: Fri,  4 Jul 2025 16:07:23 -0300
Message-ID: <20250704190724.1159416-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
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
Closes: https://lore.kernel.org/lkml/20250618151307.4a1a5e17@canb.auug.org.au/
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: Dropped "the" from the start of the sentence
v3: Make it consistent with drm_device member description
v2: Add Reported-by tag
---
---
 include/drm/drm_device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..a33aedd5e9ec 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -35,7 +35,9 @@ struct pci_controller;
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
  */
 struct drm_wedge_task_info {
+	/** @pid: pid of the task */
 	pid_t pid;
+	/** @comm: command name of the task */
 	char comm[TASK_COMM_LEN];
 };
 
-- 
2.49.0

