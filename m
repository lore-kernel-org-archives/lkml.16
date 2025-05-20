Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B825A620
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758804; cv=none; b=A5NduRcKbZR7jkQ4S8/j0GX+2F7EhbFxMyPIDqBDkcNursou+EoB+FYESeDdIO4mM3ZHZFwIsdp6M6Ql3enuVA/Wk4FqlBNPwZE+7BNwmsmB0z+WSTKmiKMzYJtzBilGkOuqebm6BypuJOt921k62X4Y1ns98FuxudgdOHpeAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758804; c=relaxed/simple;
	bh=A4B7mRZzDVqSEGqs/E7LEIqLxy39i6ZKVj4JhVcVQJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V8ECPLp6RWxzsD8h+4ZRelHpTQpXfNx4uoCr3fGtK9O3q4kYP8xW9tNNvfyqq1JdRxM9YVsT+xJ/COLIOwNH752Lxv5l1W9tWbxHOmaaWxk1LctS5SfA/g6Wcp7cW255qrQA4pUw1IH6J2aFu3G/YpA0uZa5sbHMzBzz7PBW+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MqOag8Ot; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MqOag8Ot"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g1AFS96Z9JPDmTxa4c4KuWoTuO5ZT6F1LDqypU8z0N8=; b=MqOag8Otgri/06dsZ+7g8lmKBz
	n9tTIbD/SEn177t5ra91eP7mhW5gdpzxE1nhSdFSiFpNskg13X285Dh73gh0J/p9RCwfmq1MVWqsS
	ZlIKCFp3c0lfFS232BmbOLDDCyQwkPUApIYA6AJk8VysRAx+EWeQpPkAlxXVCVUsDx4NHyE1lVVqS
	1ct2WyjFmYVSu78euCfw1ono/9ATlBN72/5zMc7GeXfPKrMnieGUiyCk0NjDP3X+4opCx3rHx9v5w
	gJUqJ47GPHG9daCWyFqoSzryLR7dzP0gCb+xc5SGW4p2aKec/bLGGALvHBFr7WIM0mG8ZT7gzDyVX
	JMU/hqTw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uHPtx-00AnEg-B9; Tue, 20 May 2025 18:33:13 +0200
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
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v5 2/3] drm/doc: Add a section about "Task information" for the wedge API
Date: Tue, 20 May 2025 13:32:42 -0300
Message-ID: <20250520163243.328746-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520163243.328746-1-andrealmeid@igalia.com>
References: <20250520163243.328746-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a section about "Task information" for the wedge API.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v5:
 - Change app to task in the text as well
v4:
 - Change APP to TASK
v3:
 - Change "app that caused ..." to "app involved ..."
 - Clarify that devcoredump have more information about what happened
 - Update that PID and APP will be empty if there's no app info
---
 Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..24aa9f320ebc 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -446,6 +446,23 @@ telemetry information (devcoredump, syslog). This is useful because the first
 hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
+Task information
+---------------
+
+The information about which application (if any) was involved in the device
+wedging is useful for userspace if they want to notify the user about what
+happened (e.g. the compositor display a message to the user "The <task name>
+caused a graphical error and the system recovered") or to implement policies
+(e.g. the daemon may "ban" an task that keeps resetting the device). If the task
+information is available, the uevent will display as ``PID=<pid>`` and
+``TASK=<task name>``. Otherwise, ``PID`` and ``TASK`` will not appear in the
+event string.
+
+The reliability of this information is driver and hardware specific, and should
+be taken with a caution regarding it's precision. To have a big picture of what
+really happened, the devcoredump file provides should have much more detailed
+information about the device state and about the event.
+
 Consumer prerequisites
 ----------------------
 
-- 
2.49.0

