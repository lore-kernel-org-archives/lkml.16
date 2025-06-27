Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF01A5B86
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044664; cv=none; b=dyAL1Hx9QWCiP392RjBd/owM2kvmODN2RbTS+sVg3r77GVUu86AOd/q4NcvHAtrrO/EbspwOfzc7i2rYMyt0qnyq8xDIrddHSMD6lBZZ9oQAS0ARxtJJYMDTk5XEpmL4x7jNnUzq3V5E3JbrAZh30psXdTvXqGBO0RDfmAU7HS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044664; c=relaxed/simple;
	bh=kOfo3luaaMg+eGrsjU+2gYBVIr0dVzGBHw07w0ytM48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NOJN0e/z0iQo801fgf05212mWAwUStLFuzs7TaLCjb6qU5PLawm0gI0tVIZjd60++nJ/CTxLumWc9kLB1Egg5q5MPeV/d8wo5UtQRXsCcd0VY9LokKO9cHrUUbyZg5uliSIKQDVK306DI/DyeYchnvHxAqewJDbuqynmpUTIUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=D9bEq4nw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="D9bEq4nw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e7H7k7eywQL2/UAtjmY0ggGSYxU+Gfh+qwxK/xtmbnM=; b=D9bEq4nwTaQb8hRMdTFHAp7lcz
	bkPkhpmfRyOHUuGSAy2PHqxji0iJyKxboP5VxXrwshwUT9HgbH1+jBkkt2kOCZAd1tXzS3dJ0rnSa
	eBkr65yOzMxpMs8581OrXUQrU9V40K9bphAk4kQ9tZ4uhaAsctJwbbQVGlH6u+IbIzLKOUsd+QryE
	mjAo8fDKgPXVxPbNR818DvKDwN/2EC1dMrJRkeWbPA6vpG5CnkSDDWXc5rdHGiuInLxNUgMneHaZ+
	cXYkRVHXtknbrC/eYQnjiHj1yZwZ0IHLUaVHjqssA1clJf5nX+sSPLnNREnEjmS8fLCtBByLyHd/p
	O730teZw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uVChY-009UVF-Au; Fri, 27 Jun 2025 19:17:24 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3 1/3] drm/doc: Fix title underline for "Task information"
Date: Fri, 27 Jun 2025 14:17:13 -0300
Message-ID: <20250627171715.438304-1-andrealmeid@igalia.com>
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
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: Add Reported-by tag
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

