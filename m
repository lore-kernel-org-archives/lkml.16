Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6F2E8E00
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256581; cv=none; b=ts7wOWjydV7n2mvmvvwI4IxKHd0hoCOz7prdfwz4Kx08FUiQSlscEg46VGWjyuV4Wg+oEYQaumtw5EwLtUGLHKHpPW3LxxPw22tdywjMVUZAOPFR4IbgnQvk01sGoB6P+uR4imDXCaYnZ6EY3Kxk7JMmdqIjur5piJ3eJowRl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256581; c=relaxed/simple;
	bh=rlyFOUfoJAOZaSnHhG9yupjOrAFyKuclWUFmCZa/QVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DySCuVmfjYdY01i7gXh0IzcF4Es+ycwbD5/Ee9LOr6dM65A0HOnroJIVt0VGd6s+vMHCFujp+HJb0UHcB5BsGfPPVgrqezJ7RnMDVai++V6P7kZf39XcKW0IMEFOcho4TuR9nGTAV44n5IOM9qLGX7QUWGUVgATB+Fy3121ceX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YW83TGeC; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YW83TGeC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=K+dHH7+W9evvJsfWnlO5gwdOc73GoK/92pbFRkewAXc=; b=YW83TGeCZFR89GOoVJpc6JjtbE
	xyCBCbtt+RgPmsRI7F0YFVFa3NtrWW78WgKSzywylAPhBXgho9LZmWdV8Jlpj+I3qijNs2Pp37QH1
	yzGSxlMTLR1dBZSdU2zWie6EAYxTdoz8+S4LxBHca5XBqf5jbYVtnz/pElR1Lo1BAR392YZ8qdlB6
	akDe1oQVmuOpRM6K4CNCtuVYpChFwhKfKJMPVaP4CqFM/3w7RBMImlrBdr1F55VMZu+1J6dAfrGGN
	XfKZhZS2oUV1d6BgCtw7R2zuFbtKGXLDCg9ce/tRzZG87Lj9fgBZ6tTV8CbVKcSAyWLNSIndSQ0ON
	XZ13lP+w==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uRtgW-0056EK-7t; Wed, 18 Jun 2025 16:22:40 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 1/2] drm/doc: Fix title underline for "Task information"
Date: Wed, 18 Jun 2025 11:22:29 -0300
Message-ID: <20250618142230.2407354-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following warning:

Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.

Task information
--------------- [docutils]

Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 263e5a97c080..10dea6a1f097 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
 Task information
----------------
+----------------
 
 The information about which application (if any) was involved in the device
 wedging is useful for userspace if they want to notify the user about what
@@ -728,4 +728,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
-- 
2.49.0

