Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACF1F4E3D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355099; cv=none; b=j9CFfd8d4dTi4jmY8n1AwaA4lwKodRyJblIWt98gHRy+3adodDRzPmcwofp2Edc7foXMXFPjfzZk3vxZJcniea+LX8Y4mEIFw+8LpOhgXgdI8OlUmCbg6oQa0C5+9En67Q2S9xHyG91WnEh+Eg6/W+Hor6uRzCAW/kwECD7WurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355099; c=relaxed/simple;
	bh=9PmBYxDBeTPIR+qkVAP2ocYLrd5dNpulxJocezgRCFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fhjBoc1fzQNuI8x1Bq8jZak/ul4S5Wu9QRaNC3NdqnLezs2ajprN19VND36665F+Dc+IycZmKFROmjfGL4PyKyQWLdzzXk6OhlNYAIXCPC2bOfzdlO6yMOX/hQroFpwe4TBMfLvsrNmFr6POlPHGEaclDuBwOQPMOHHx14GI0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5OzIGU5; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5OzIGU5"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679eacf25cso16246851cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738355096; x=1738959896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obe5+dDEWY6wpBILJyNOiHlNDqL8ahP1UKm6CAQLaQE=;
        b=d5OzIGU5MA9oeTdzCdzPk12yXfj/mGH6c1utcJA3WHh+W6S9lLzw3p0Z8REh2Josfm
         NIgiNX0heseHWUhv2mgHwMruV6hRVHF1Zh4As02Bpr3m2iI4VZXbRDGcJZWLm7Vw3eUn
         m/kWSzGI0Nd5autmY5a6OAfzSdVaKcaTc39o8URWDnepsvl2OCauvwX+UEepZkpaFNEu
         vJrvqIF8jQwRq8lbV3V/5MrmddS1UsDsYRcayRA8c0viDP3CN27/j70rUNQIqYxtfVSK
         SjigmVHurL+pmtPc6Es+Eb9CzuCbgWNLfX6Li1TFsoMrR4oJ4E2kXuuplZlZfMpsG5cB
         ap7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355096; x=1738959896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obe5+dDEWY6wpBILJyNOiHlNDqL8ahP1UKm6CAQLaQE=;
        b=IAcr1oXB//9M+01LZfbB7k0I7CMMkRsWZER9SU9RtQ56gGi6ffca+nrsQyf2uidbRL
         743wy/qB+nP6d6JXwOWko0/ec2F2kLf341ENPF/TLesIIxN8ECq55HVZ/ZGZokKhoxW2
         +hxdFkzJrFanign8wkYjksl97ZMPWmVv1qQLDLIW+eplhE5YGoJOx/lkVxX5tNxh2nUs
         3pVSzj7DPLl3bL1hztnTQPXjvaDMVE2h5WbCJCyVZE7zH7MdJcabahf7LLuDjWWPruM2
         4ZLchVuAAXgwHBIOdMtYyZnZqrfv30FbNdYRRsXydFe3fJLcFYfwUgOgFljlc3QKMJ6e
         slww==
X-Gm-Message-State: AOJu0YyKs1qXmziWCs5KBdb2qgg/FWDw3nX7z2e7ELcoCmUHGwEiyBM1
	Q900UeNvm/7FPq9qNiN1LC/bFx96OM3nFCancZOdkHOtoxrtvQq2mMSf2Q==
X-Gm-Gg: ASbGncu50KBMsS4e9vbZkS3Z9h/ZBU4G+MZd2g6QTk2797vYCQFvHsxIa4e/a8D9DLf
	65WNciahVBpPbijT6ogsUClUje/JCUNlMJPWUPNxcrhRMi4dh/fljRHSlLHm7RgBJh7Z00gAPmT
	gfpMJorb37ELg9gg1AiHtEdVAF/ONvd89C0apR3Aqy4LB3SbEOFt3CQrBko+d8kk1DiWG5zApog
	oZ1aHVX+ho860hcIbgws/Ez3+ue4RfXYg/kmH6wFah0efo6n+CU2iOUzJgDNSjdXpT8W5iXa9gc
	kBOCSmZBEXuZLabL8LZKipzy0wZ9h6iFcSbO2w==
X-Google-Smtp-Source: AGHT+IHbRDHoQstkkhTISH93HFWSUOqvP9OelBjSVAvaO8WB+SZHwKu5WOxqOc+Upgtk8EflXmyGVg==
X-Received: by 2002:ac8:5aca:0:b0:467:882d:e7c6 with SMTP id d75a77b69052e-46fd0b68b4cmr206766921cf.34.1738355096316;
        Fri, 31 Jan 2025 12:24:56 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e4e38sm21743591cf.48.2025.01.31.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:56 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: phillip@squashfs.org.uk
Cc: linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] Squashfs: Add check for cache->entry to avoid NULL pointer dereference
Date: Fri, 31 Jan 2025 20:24:53 +0000
Message-Id: <20250131202453.48174-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check for "cache->entry". Otherwise, if the allocation for
"cache->entry" fails, "cache->entry[i].data" will cause a NULL pointer
dereference.

Fixes: f400e12656ab ("Squashfs: cache operations")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 fs/squashfs/cache.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 4db0d2b0aab8..5a3081583ea9 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -201,16 +201,19 @@ void squashfs_cache_delete(struct squashfs_cache *cache)
 	if (cache == NULL)
 		return;
 
-	for (i = 0; i < cache->entries; i++) {
-		if (cache->entry[i].data) {
-			for (j = 0; j < cache->pages; j++)
-				kfree(cache->entry[i].data[j]);
-			kfree(cache->entry[i].data);
+	if (cache->entry) {
+		for (i = 0; i < cache->entries; i++) {
+			if (cache->entry[i].data) {
+				for (j = 0; j < cache->pages; j++)
+					kfree(cache->entry[i].data[j]);
+				kfree(cache->entry[i].data);
+			}
+			kfree(cache->entry[i].actor);
 		}
-		kfree(cache->entry[i].actor);
+
+		kfree(cache->entry);
 	}
 
-	kfree(cache->entry);
 	kfree(cache);
 }
 
-- 
2.25.1

