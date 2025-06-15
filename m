Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5425569
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991704; cv=none; b=A4RZP/krNdKABiSpcC79nnmfMWzXZE5PCfApvcYW3r+RevpCLmRDgmrExo61Qv960xwgk5xCikshJ3KweuJz+CqVXIvlO6jdsnAsVBRCZ9JEBbFmPklrrZd0MqlzIap2wHI1+tApp/YlP2NKlKatx1dvDQDSa4AhGK1VP+y/lvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991704; c=relaxed/simple;
	bh=lN3quvoXwWLExHa7K8vdoquKMaGbC+AUpiEbMqEtHz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+NZQqbIHq/+nefyViU+EpKbtAvv1oNdAwxU7vYJUIdlewKg6ikEVgw+bWxA7hviiTqtjolU/TN1Ab1ItIVJf6WxPmfoAnm/hTcMZIcUG7aA9O/aOaxv8vo4HnHpt6ZbV/D2TZOUN9ESBvZ7SqqCkRiZLNJKduvQQQuvBAoeeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X2DFuobA; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X2DFuobA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DY
	PPwqvNL8fC15KTTAngtGu9F1vDdsYl53+GJ+XtrVs=; b=X2DFuobAV+K/avY9Dc
	qlcSYlrv+UUSiDdAbUn5ZMNpDR+71zhAAlkgTl6JmHvN4sm+rSZc6oqQkW7hoHIH
	lSE5ZjyWpBRjQnRt1J2Eyo3X6J+HxK2U0NJS8PWgUYwyqx9Zz/lbxkQ8tJjbrwnV
	vV7WZ7rEJb2nEwcZXFqWnmXJE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXvMxnvU5o6YjaAQ--.9624S2;
	Sun, 15 Jun 2025 20:32:40 +0800 (CST)
From: Wei Nanxin <n9winx@163.com>
To: andreyknvl@gmail.com,
	elver@google.com,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.org,
	Wei Nanxin <n9winx@163.com>
Subject: [PATCH] kcov: fix typo in comment of kcov_fault_in_area
Date: Sun, 15 Jun 2025 20:32:37 +0800
Message-ID: <20250615123237.110144-1-n9winx@163.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDXvMxnvU5o6YjaAQ--.9624S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1rCw4kCrWrWFyfXF45Awb_yoW3JFX_Gr
	48Aw1UGay5uF9rZF4aka18Xr42g3y8XFyIkay3WayxAa4UuF9FqrWDKwn8uFs8Wrsruasx
	Z39xJryqyr4SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbtx6UUUUUU==
X-CM-SenderInfo: nqzzx0r06rljoofrz/1tbiUgttWmhOvGcT8AAAsw

change '__santizer_cov_trace_pc()' to '__sanitizer_cov_trace_pc()'

Signed-off-by: Wei Nanxin <n9winx@163.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 187ba1b80bda..1d85597057e1 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -552,7 +552,7 @@ static int kcov_get_mode(unsigned long arg)
 
 /*
  * Fault in a lazily-faulted vmalloc area before it can be used by
- * __santizer_cov_trace_pc(), to avoid recursion issues if any code on the
+ * __sanitizer_cov_trace_pc(), to avoid recursion issues if any code on the
  * vmalloc fault handling path is instrumented.
  */
 static void kcov_fault_in_area(struct kcov *kcov)
-- 
2.49.0

