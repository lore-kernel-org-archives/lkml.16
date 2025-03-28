Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591A1DED6E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159782; cv=none; b=HJzoXP/3N46gM0wCL3hocVGR0YLTUAuaX5Nx9on1umNXB0uQGmmmjVGbf5+O1fLeYbFPK0D5o4Xw/i9QC090aOix50AlJf46AC7QvGE28eQocUGEetYtnyh6lo4w2gaQr9yvLCKPu6jFNYDofn84DY9FGBjxTYfpm3a7eCSu1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159782; c=relaxed/simple;
	bh=U4GjcafDlm3dAsQF9NeUgAupHC3MbjsBzZynIBGQLGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcgYNWpuxEE9h11tiK7uLHc5blXbte0HLVBpoHrLtISURq3Vhjo7usPeLzft1SuNHZYEhDNwdTBi1Dm+FsvzQ0xflmrf0JiGvL1jDRE6QMkHUXX2JmoIK0ejr2jzrZIZ2C25xKHlGn5Tg/OFpli14THKS1G4BJjxMxwQXI8X0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cdqhQpjS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cdqhQpjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743159778;
	bh=U4GjcafDlm3dAsQF9NeUgAupHC3MbjsBzZynIBGQLGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cdqhQpjSDpndSv2hbMFQa0gPlkgKhUrFZIGtOZC+e24/qBkK7v5Iwm6JAdJ22Wvag
	 MLZJoHtR4hGjxfu7HI8q4Efv/1Is3wBH5I7yiX9NstHcHTo1WADF/8pku7K8jgI1+9
	 wDowpAivh01sE0Z6OANLat0wxIZ9At5LaSOuNNe423Ix+T7L04pQ7Rw9KTvGr+MPFg
	 0O++7eljfj+w6/biSyVyWsuAnkljNXk8S/X/dqP1zPgRkiuDbGNG8x+B60YTlZbHkX
	 kSE4sdJsYM3GF5W/DWzu28x2Ihjgv6sHFzOGvD8YswwQwe8OrAwluCvC/v/gYfietR
	 g/huYvu6JsR5g==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E42717E0EA4;
	Fri, 28 Mar 2025 12:02:55 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before fetching
Date: Fri, 28 Mar 2025 16:32:32 +0530
Message-ID: <20250328110239.993685-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328110239.993685-1-vignesh.raman@collabora.com>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the repository is not shallow before fetching branches in
check-patch job. This prevents issues where git merge-base fails
due to incomplete history. Set the timeout of check-patch job to 1h.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/check-patch.py    | 16 ++++++++++++----
 drivers/gpu/drm/ci/static-checks.yml |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/check-patch.py b/drivers/gpu/drm/ci/check-patch.py
index a5f399a20e25..b206f12feb64 100755
--- a/drivers/gpu/drm/ci/check-patch.py
+++ b/drivers/gpu/drm/ci/check-patch.py
@@ -18,12 +18,20 @@ repourl = "https://gitlab.freedesktop.org/%s.git" % os.environ["CI_MERGE_REQUEST
 # GitLab CI environment does not give us any direct info about the
 # base for the user's branch. We thus need to figure out a common
 # ancestor between the user's branch and current git master.
-os.environ["GIT_DEPTH"] = "1000"
 subprocess.call(["git", "remote", "remove", "check-patch"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
-subprocess.check_call(["git", "fetch", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+
+# Check if the repository is shallow
+shallow = subprocess.run(["git", "rev-parse", "--is-shallow-repository"],
+                         stdout=subprocess.PIPE, universal_newlines=True).stdout.strip()
+
+if shallow == "true":
+    print("Repository is shallow, unshallow git history")
+    subprocess.check_call(["git", "fetch", "--unshallow", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
+                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+else:
+    subprocess.check_call(["git", "fetch", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
+                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-patch/%s" % os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"], "HEAD"],
diff --git a/drivers/gpu/drm/ci/static-checks.yml b/drivers/gpu/drm/ci/static-checks.yml
index 13ffa827b7fa..734d6055fa65 100644
--- a/drivers/gpu/drm/ci/static-checks.yml
+++ b/drivers/gpu/drm/ci/static-checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  timeout: "1h"
   extends:
     - .build
     - .use-debian/x86_64_build
-- 
2.47.2

