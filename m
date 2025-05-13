Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41780A93D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115796; cv=none; b=HwVNYeilz4g+gncG4Q/V5ACkfWBfEczqrdmAV4d18MxEHBirsq6+/Ezl/dYILF5V1SMzzt3WIkSiwjczST0G80DaTKuzKxGc6HI2Bz9jBXwYuz1OasAWPHYhidUCkaxzUeNYvKuttXfZgo8kpzb8IA4oW0gkalvsKt1QFVQNJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115796; c=relaxed/simple;
	bh=bfgBCFcmciuJwkPC05xHjkwqwt5P6DCFva6GaSBqJUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJOVLQCAdiiHae/RhrL6mi5VuFTFKhQVV2pHeFGueXWgtGagcBZx3/Mahni4JNtiMsQmuI84NhXysBsAHM0nwJxZPcHTZWFQw23OYQVUIBIsZKhBcncEw/BG9zshzUn0zJG1lCunQVSA1Y3jFpms8Fs7zEWtWM4g4XIBVOaaab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gilTBwJB; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gilTBwJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1747115786;
	bh=Cdfa9q+LfPj/LtxoZ3TN4HjZOAHkdcdlZlPL8sLbxmM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gilTBwJB4csrnd9SAquchlc97mKa2zIeKhIT/wgREUGYH5WMwqWN87Lnxg9lw2bPQ
	 7GoDdfDHdOSIY2sWuHYbql2yHlE4ahnmEC3JWjbyob2Upysk1ynjqUHKhgXjsFSWSt
	 SW4g+fwWji+KAPBw0I+IOWaSoumJl5lpuLjXhg94=
X-QQ-mid: zesmtpip3t1747115745t002de209
X-QQ-Originating-IP: 74dfBN0ozjFYrRhJVFtCAeE4JnKwu0jg1GRcfTwQ+f0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 13:55:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13709064314909415111
EX-QQ-RecipientCnt: 16
From: WangYuli <wangyuli@uniontech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	yujiaoliang@vivo.com,
	cvam0000@gmail.com,
	colin.i.king@gmail.com,
	jesse.brandeburg@intel.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH] drm/uapi: Fix typo "restictions"
Date: Tue, 13 May 2025 13:55:21 +0800
Message-ID: <DC0C6B72CF24C41B+20250513055521.40969-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M7wLkObIDn00ubp87rm0DBH68w/DsjFOc4XQNlbGFO7Mheo3WucdO6Si
	wkY20DMpQgspH0FTtK8FHEaj92Nb14siDeOyVpsm3xpITSyT0XAJNgadeCie7u0qFeVHZBp
	ipkEVt2Z/jdY+98lsBKZYV9XkF32KaFH1DaOQpuGbnRVFt0Yn6DS0MdTlaYg9UUSskGh8KT
	1VQ2xurMLos/3sZamERzGrTW7R/K2a4s+B+O+aOHppoMZuYhT35eCdZ3ly5HKWRavH1kSrC
	OFrFO8EFdvx+Y5Q4vUTdCTzTBhlcHYmxAuoJwCwCFvhSS2bbfQxlmFwB8eBTHXgaF30OIml
	Gi9EZqWHVZ2IY2SEHFlNw0AXGVUND3lAwkf3QQijeU64sHF5/ld36MRCNg7B4YBTpMtFWkm
	DXs2ZnXoTZEMjArRwCbCDAK36OPfw2iPXQFa2NrWMjvL2eqFs0EZaCV6/6sjiUzejFrRXZ+
	C0/1cjgzlEq08mXimdBm3YM0iYP6jJQ/oLIYCb/DVCYpk6W4owo1XapiiDmo4lDCKPicFGB
	3cRI5zyzJErBx3lvnGDoH85+zlzfBLyu3jfMHeZe9JNFRCVpPd1T0Diayl0Ld682TS51lWV
	Zoa/LmrMKJuLWZ5lkkIRbDod1jfOvROhhhOhLPbG2v0uwRS6pdXrSGHBsWb5p0DJ4CxcazE
	nQaWiy9L96q/RjnX9eCCxIUp4NH2chJCxRr4e0f6BqHDfcf4MZJqa5c7zclg7bQ6vOzfzAN
	+f+sjhNGWwKD4B2Os7xu5pOXNS5vq1SB+HHKzlxE3dk9KUvqoUpl8Io8XZXRKukVWIRSUVX
	IFSkMCyzARnUuLRYVNicppLL8h3zEIU8U4rJCpqLzwXy2tnoXanhG4W+QQQ9Z4WmWjsRb7f
	PShg/IwEmXibyUxUnZfTgwGUe3MdCxUuHUhCpqYB+UqhbDN4Ceh5+812JZRDIZdCy3g8dxQ
	4n3pyxV/DPJpObzIanBEdg/NUJ7GTPwPHzRpG0FvDo6kC+dbX6fB8lCvSghaBXWVHPaZpS5
	ys4pajejhM0FAATTyr1EU+gHJcrWmo1EVxeG3r6A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'restictions' in comments which
should be 'restrictions'.

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

This typo is reported by GitHub Copilot code review. [1]

[1]. https://github.com/deepin-community/kernel/pull/796

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 include/uapi/drm/drm.h | 2 +-
 scripts/spelling.txt   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..16f772dd7069 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -860,7 +860,7 @@ struct drm_get_cap {
  * cursor and have correctly set hotspot properties.
  * If this client cap is not set the DRM core will hide cursor plane on
  * those virtualized drivers because not setting it implies that the
- * client is not capable of dealing with those extra restictions.
+ * client is not capable of dealing with those extra restrictions.
  * Clients which do set cursor hotspot and treat the cursor plane
  * like a mouse cursor should set this property.
  * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index ac94fa1c2415..c33128db7163 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1406,6 +1406,8 @@ ressizes||resizes
 ressource||resource
 ressources||resources
 restesting||retesting
+restiction||restriction
+restictions||restrictions
 resumbmitting||resubmitting
 retransmited||retransmitted
 retreived||retrieved
-- 
2.49.0

