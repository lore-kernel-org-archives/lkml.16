Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2D23771C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840259; cv=none; b=ox2n7WEmWX+/Bv44vn83sNG5ESW/MkHUFWNuMFDYeXiq/1Qs8mzPZELvY0i3DIh8nxTZ/OLCgOvSzh9XHn8Z4Ztg/WqZh8+WdnGc+fqxAs04Aq9R2YPe92jdX5eNk01DRa3Ee7CPfpqAV7OBpnn1aWb+PVhzpbNB94y+L+EzeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840259; c=relaxed/simple;
	bh=vDHKuEB52NE3FyntkV/XWuE9A1twU7QMvf0KaC9hsyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcoQM3UxGWrcd9l6YyXhYdjFv2ReSXxQv0GBGheRvrwYroPj4Uip/A8aaLoVinx+ff71Y8ND4rMTnjlGZiap/WFpJMmFzEO+Q25MkK0GxK1IPmjXHmeO7wuXdzrt6OTa5LhkaEY4hmDQ17ITv43N6JHziJZhxxZ8hdblNONUvvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Zo6icWzF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Zo6icWzF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5bW97YWvE2WNp84/m7LouGNWv9aZZ0XfiU91U9Q+7L4=; b=Zo6icWzFyINiSyU+TOThbUnoHD
	HuceCzinkloqBxARJ66WINhSBbJP2LFMdgOYiSlUCXwTwU88uX2LK7B4ojcTb1TQcrtI8fHPAlRaW
	iSkEz2iAkVkhFfK5St7psyEkI6yQo4XIrkzwENnL+Bw1ik934lyVj11VyUYGWzYBj+jpWEKPalosy
	GEWVwo5CvxlAZm0BP/n9luvUqT2k+nbZj7CkgR3MYVuNxZ51DG4oI011rNZLixzv6FPaqN6+XkAE9
	9Ujzl3O5/YdL764CFRHqTETG4Dq5ARbKQONrO6bgnk2c+G8pxVzkN82UXcF50kgk8lQd+wHJ5TSRN
	qQzYs9+g==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ9Nn-003AD0-Le; Fri, 13 Jun 2025 20:44:08 +0200
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
Subject: [PATCH v7 3/5] drm/doc: Add a section about "Task information" for the wedge API
Date: Fri, 13 Jun 2025 15:43:46 -0300
Message-ID: <20250613184348.1761020-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613184348.1761020-1-andrealmeid@igalia.com>
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
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
index 4863a4deb0ee..263e5a97c080 100644
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

