Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA93FBA7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179175; cv=none; b=YuKYY+7R7fmqs7dszrqeO4CsH+M83qCkAsJgb+o8XZCYWO3cxxztAPAv4myHnSSUwymfEc0n5kjPFsajrGgjUE1qPHn9oucLaEfa6c3jyuo6ds+kBisKXGJ4PterEGed2BKRJuZI3t8A7cW1l0Uj5+xje5bCMX0ebvCIjgapqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179175; c=relaxed/simple;
	bh=Hqf9aIfw0eC9nw/y8Rwa4SKcz/q+0hB2F3kBZ6f3lmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSU9YOtU/bcHZ/yf6x8W2nHy9NZ/DL7yxuwBDJOt/w7wwHKonjgtKCYt7F6NpCeIPg2VKKZdNItZ5DBRVnAHXK/zzVlSNgchvrrjqYCT8xsYP1PDwF+p6q1rT9t7GUmw19UbuQURRWgA/yYAPd77IDsa4W8QWBWqvY/4KZnMg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=mLR97Mkw; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="mLR97Mkw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1747179170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iYcQQzN6vnaXT766TJ+cVQWw0N0NG5qRoAhx0ZwZjFY=;
	b=mLR97Mkwj5zSlLnN/mlvCwd7qeWtalgeS4/J/A3+Sxl+eLFdZrt+OTWS3CmKuJjDYISsCn
	2CL4jzCj1ldnYYSHqC+CHKCNvTsxb1S6W7+LTxxKwS5he0SzrwnhUBKD18BmcvdHFqwhyj
	51A6kJmYvqs+h0K6o03t7qf6hxmc1nCewHEkJbFBhN6qDIhmo7mVZmwQUSzpG7sQoIWbU2
	pLJQQqVEvRCAoBTji9ZwD/lOc0M7I+ziOPOxUvcvFGuBBc/ST6JucGO7owcaL5cppkvln+
	GRjhf0rvCs/mlcWCBU5hBpZWsDwIfJm7ca2CVrxM3Rb4lFwF8Bcfx6y1GTa8BA==
From: George Anthony Vernon <contact@gvernon.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: George Anthony Vernon <contact@gvernon.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amdgpu: Fix docs build warning
Date: Wed, 14 May 2025 00:31:55 +0100
Message-ID: <20250513233212.21186-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The kerneldoc comment for HGCP locality check debug mask was missing a
semicolon resulting in a documentation build warning. Correct it.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.49.0

