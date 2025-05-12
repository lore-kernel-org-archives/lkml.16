Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396641B6CF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082128; cv=none; b=AoRgEvXWi4RZ1eTqnjBg7QvY0GR6KG8pclx1oOXplTJDDJJ/O8p78GOUszv0yoZk9PtJUUPfjYzeYQ2DllyOPWaoq5u32fyEoTgE2XdahKF16GkPYr0meyawPMCTHaYRXEHJRYbZ/orsYY0s9cCDY60wmTRzFByJL820JqHDTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082128; c=relaxed/simple;
	bh=hMq2OzLKnYsyj+X0Hsnfkyo8yCgar5kO5vw/I18zzV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGRIOcWEJ2qhFOTZNsgKzALY2ZrNZxutHiyDi79xfD3GL+ElloswhDuWxhwfmIkvnP23moJWfF2aTGaapZegHVJuQcSaKrKJW8kgpKmq2WdChPXSHtQZM6Ktw+p2hnPNUHaST0OiRLtE7jcBF5EFjEb2/oc8FDVTPP7EucSu6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=a/Jw4OYW; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="a/Jw4OYW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=L1LxK4TZQDE52pEV0Jwgeq4wCFdLfv5GHDtN18/XliQ=; b=a/Jw4OYWkUu9i9ligkRfj88aZL
	Tkyvpy7o7Y2v3Y+3bhlUnJAPwwLtckpSHNV6Ko4NVTD1NoZ15zuAvHzfNw5fAXzgLB+d1NRUXv3fJ
	Nqg/ydNNwTyQ5kHjfI59Vw8vmN/yuNxvQq6tWdZhgmaTv5MUqFFsSmyCmTfNL4BSnZTui0kKk/CLS
	ooOAwqcAleCIwxoX5+rPyRa7shbaYKG1ZckAbVvjb1/fHQRVZKg0KD3Mkxb6cWifJtHYf0PVy3JxU
	bMy+9nN+h1qOM6UXnrdE38EU9GK66CIetCIH4UnBV/8iPA6Cj25hmpSm1wT6Z+SHTJlk0YChLQACC
	m70PJxkw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEZmW-007G93-4g; Mon, 12 May 2025 22:35:13 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	"Raag Jadav" <raag.jadav@intel.com>,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v3 2/3] drm/doc: Add a section about "App information" for the wedge API
Date: Mon, 12 May 2025 17:34:36 -0300
Message-ID: <20250512203437.989894-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512203437.989894-1-andrealmeid@igalia.com>
References: <20250512203437.989894-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a section about "App information" for the wedge API.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v3:
 - Change "app that caused ..." to "app involved ..."
 - Clarify that devcoredump have more information about what happened
 - Update that PID and APP will be empty if there's no app info
---
 Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..3300a928d8ef 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -446,6 +446,23 @@ telemetry information (devcoredump, syslog). This is useful because the first
 hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
+App information
+---------------
+
+The information about which application (if any) was involved in the device
+wedging is useful for userspace if they want to notify the user about what
+happened (e.g. the compositor display a message to the user "The <app name>
+caused a graphical error and the system recovered") or to implement policies
+(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
+information is available, the uevent will display as ``PID=<pid>`` and
+``APP=<task name>``. Otherwise, ``PID`` and ``APP`` will not appear in the event
+string.
+
+The reliability of this information is driver and hardware specific, and should
+be taken with a caution regarding it's precision. To have a big picture of what
+happened, the devcoredump file provides should have much more detailed
+information about the device state and about the event.
+
 Consumer prerequisites
 ----------------------
 
-- 
2.49.0

