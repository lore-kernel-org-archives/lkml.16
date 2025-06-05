Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62F3C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115024; cv=pass; b=I2BPsgt10seFF+emmpILiZVeHMKBHoPDRJySdb3LI7H12mjrFEcALkEZ2qDI/Qm8PxVmqNIKpKc1NLVt9SOTCSCP0KqMn5SKS0eulCmmlr0ENJYrsFNdSCiGpW5Zoxv2h1MQPk3N7iV5jnovf6qG4vYBIipzFdxOWXAxpCvp2pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115024; c=relaxed/simple;
	bh=Pl7ksC/0Ex/YKYlcbj7jDGoMjIQaJlTKSdx8OHu4Cgc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iKMRce3SzWe+nidwyh5eJ2VDsmvlKmHT6/8Jz/Tb/cDzpiUPI/skAH4Cmd7DTY+DNHw4D4fyGIeam3ibY19t8Skn9S7+bftMcQ1fFgHAQcxbt0CcuWtzN5wNLKYRAge4MPurq25I5/mAXL6j18KeY96FLtotJ2LtFyjeNxcGagM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=pg7+3bmw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="pg7+3bmw"
ARC-Seal: i=1; a=rsa-sha256; t=1749115017; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q3wzYLPeExFJhhoSKz4iCBi6tLo81gEazVODvnU0VI8VVmn47ldLIcWrVU5Erb3ruL1B0n+K/i+rWVFkIOBNLbIbIcRT90/uIqhDKZHpPiSA80BsK9EGorMvUHjg21vcZXkiXVCSEcyb7tFA3AJ2aNVHG3P4frYgGs28yS3oIQQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749115017; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=u9IfIPZX/RLLtZc7HhpJ8HweTzloQQVJ2JhXdew3k1s=; 
	b=mk7yO7xyKdk7XvJqQDeR3N1cg6Sw1vUfzSXpjuGXKXtzPF+DxjL94wQb+VNGqLlKxSXXaHkTo8t20jU+lRPQ9zGVFURvxaJmd4i47q/bPOZF60c2QZmX3x85WYT5Tl1xKCkdkbM6oFovH/7U8lYBnplNwEobdH5kmaadeBf3KIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749115017;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=u9IfIPZX/RLLtZc7HhpJ8HweTzloQQVJ2JhXdew3k1s=;
	b=pg7+3bmwpl8VA60D7o9Y2XzC905+/8pSS/cHfXhzsT6kLbZuyKZnCKBxXvp7Xm+f
	dW32rFBaTmYiew4Tp8aqea0uopSXxPF59ZNCk0KBRLnqV4WzB32jp76gDymZsnLcsj7
	FM0oV3g83JgWtBoJZ7M9Vn0yxVYOJwWQ9aKSmvhc=
Received: by mx.zohomail.com with SMTPS id 1749115013783586.6665986117862;
	Thu, 5 Jun 2025 02:16:53 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: rate-limit hid_warn to prevent log flooding
Date: Thu,  5 Jun 2025 17:16:50 +0800
Message-ID: <20250605091650.51093-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Syzkaller can create many uhid devices that trigger
repeated warnings like:

  "hid-generic xxxx: unknown main item tag 0x0"

These messages can flood the system log, especially if a crash occurs
(e.g., with a slow UART console, leading to soft lockups). To mitigate
this, convert `hid_warn()` to use `dev_warn_ratelimited()`.

This helps reduce log noise and improves system stability under fuzzing
or faulty device scenarios.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749bc..a73caa9fd1896 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1238,7 +1238,7 @@ void hid_quirks_exit(__u16 bus);
 #define hid_notice(hid, fmt, ...)			\
 	dev_notice(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_warn(hid, fmt, ...)				\
-	dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
+	dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_info(hid, fmt, ...)				\
 	dev_info(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_dbg(hid, fmt, ...)				\
-- 
2.49.0

