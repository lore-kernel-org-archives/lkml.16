Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26E140E30
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089600; cv=none; b=d+gtJya/+5cdCdomR+2SigkvbEukwpEuSNlvxqU/qkZe7gOi7oq8xE03tJLVeaSTA9/nPcEy/vKGBsQW5vDvCFyFJ90MyV6LQcdVJL5NOYEAyJN/DObRIuMiquoOA0LlPKCFD0p1+wFLV8VuagqmBn6xcHmyXegoEjF9ASm0Ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089600; c=relaxed/simple;
	bh=erlXei2sBYo5h7v1S6Syq41Q79Vj69yo6grMNUihDdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VipYYwE4LZoFS5AEe0p1zygZV6H97AXVzVEX5haNlvIei6o3cGyc7rm8m0i8DRke2tNkfoThY3DTIgm9KD1mehy2lS9WUijnRcHTcg7FvxohSpOc0G3426xGPQtz3oLaJAYQmO4xypscE6XeTbVve6Yp8/aj0NUL8ti83nRPQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZNnjf3BVlz4xgDc
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:33:10 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b1ef:107c:7814:6642])
	by xavier.telenet-ops.be with cmsmtp
	id VrZ32E0025Szt1p01rZ3Wy; Thu, 27 Mar 2025 16:33:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1txpE6-0000000Fsh6-1v3j;
	Thu, 27 Mar 2025 16:33:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1txpE6-00000006DBv-40wM;
	Thu, 27 Mar 2025 16:33:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] kunit: Spelling s/slowm/slow/
Date: Thu, 27 Mar 2025 16:33:01 +0100
Message-ID: <1f7ebf98598418914ec9f5b6d5cb8583d24a4bf0.1743089563.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a misspelling of "slow".

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/kunit/test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 58dbab60f8530588..9b773406e01f3c43 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -67,7 +67,7 @@ enum kunit_status {
 
 /*
  * Speed Attribute is stored as an enum and separated into categories of
- * speed: very_slowm, slow, and normal. These speeds are relative to
+ * speed: very_slow, slow, and normal. These speeds are relative to
  * other KUnit tests.
  *
  * Note: unset speed attribute acts as default of KUNIT_SPEED_NORMAL.
-- 
2.43.0

