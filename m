Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AC21A92F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747692271; cv=none; b=Ql6CLNzQ5jHSzvPdhUYYUe0XE5dqkh2upUwtPMrrHHXIis6bh3R/OyqaYbLTDtmTNQyvAHHEZ5awDehcj7EkjLMQm6hb6ViCXPyuN4Y2D7ovNeHJ+3JCKPw6hceBcuCqRUCvbAmadA79HUIN+i9IHfUS358wh7bO13FJvcUuAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747692271; c=relaxed/simple;
	bh=slbv+24brnjH3p6t3FO9486g8JCJ3wnIP6kvoCSj/Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJ7IrSVF34aOem5QTu0idF1oBmNcD8pCBEpoNPvqYPki4u4xR920sNKn+0IVWhVcGv1DodyWySo1yUDsDJOlv6m3PL50J//8ztryh/wPGbuV2yE/72LBrdszOpk2ZKd+lAYF5Y7AW4pGb9ZW6vbzZ5io28nLMLKlwSJgkx0m36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aOJ/oWJD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aOJ/oWJD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2S6oKaT48+py3QKNAk/C2dlDi8LQZkQI/D8jYucUO44=; b=aOJ/oWJD2hCBCHkNiusVmXyDW+
	cOsSA8Ua9nTt6Q2l+9m7hRtPWhFtdPxYPIyLwtRSHIAET4lLy5A0KIlNTh8zH1V3oRlt6USa7VuZf
	5HDA8cVZExkhluIPm6fCxyRvRnyd04XD5/+GNrTKlp97lIiBo+S0VrmH9H4iBBqoRQCYxcn799MwQ
	Yeq11aRYtZDitD1OtCkMl3kkechKnC8vEHEEwTxSGciEwJDstzyNyjuRpKtFp6TV5ao4gLJ758a5w
	nWuJWnFXAvOHfXzytSr9b5E2L5v8cuPPJWliolAnNqGarwZrsSe2mfa8pwHX3z43YYDwwaeRHqKmx
	/3MFkWZg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uH8ao-00AQwj-0R; Tue, 20 May 2025 00:04:18 +0200
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
Subject: [PATCH v4 2/3] drm/doc: Add a section about "App information" for the wedge API
Date: Mon, 19 May 2025 19:03:31 -0300
Message-ID: <20250519220333.101355-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519220333.101355-1-andrealmeid@igalia.com>
References: <20250519220333.101355-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a section about "App information" for the wedge API.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
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
index 69f72e71a96e..37ae4beab160 100644
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

