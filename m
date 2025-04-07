Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E675A33E1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744064504; cv=none; b=pSJP4wMjXVd1JEpMhn1f9LKrKszXfjzmf0Exsr/jUTCVZ9CBz4vlvhTWdKq4SfYfEqYfOim2pYt+t8FEusreQg7JvR/cMcO9XZsQl47zrZddK9OhiAfoOZIbltT9kUSJFXTv/VFjgb/DjAOp3y58KuBT3OxcaldBg30d2Y5tfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744064504; c=relaxed/simple;
	bh=0NVjScSkPVJzIge1ECmcx+Ze17C41xW5nAn7SKqPJCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qNkhPm9+P1Njgt4enWCj2zyEQIX8eAp6hWorGci3JcgNV3qvniqdGYW6S4pvACil+fs48y64Wp8bl5RN6uDBDx5qwRfxEfEIZo0K0x64+99leZYpVCFQsjjEGNU3ZP+abmMi8Ao1NqLGJQCwxiopkZS+bzXeJ0KSxJbsQGljmhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t2o8aSLc; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t2o8aSLc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744064499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TKalfcv5j8KRhUC5Mav4zI0RgTj1I1xYLS2dJzJx2uI=;
	b=t2o8aSLcQkSOAzfmYyBjsxe18HROp/YBKPvpdU+D8NxCwMTXJ0OuUHDsdUC0kSLfHAbfg1
	B3leAyk4EeKpP99CWkOSX2s6dE8TiaNG3d9GnR8BV+1XzyLTR6KnThcYV23RJm/RicSYc/
	w092TLBSVcgzdryf4nm7GssfBqMyCtU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] scripts: kernel-doc: fix parsing function-like typedefs (again)
Date: Mon,  7 Apr 2025 18:21:34 -0400
Message-Id: <20250407222134.2280553-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Typedefs like

    typedef struct phylink_pcs *(*pcs_xlate_t)(const u64 *args);

have a typedef_type that ends with a * and therefore has no word
boundary. Add an extra clause for the final group of the typedef_type so
we only require a word boundary if we match a word.

Fixes: 7d2c6b1edf79 ("scripts: kernel-doc: fix parsing function-like typedefs")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index af6cf408b96d..5db23cbf4eb2 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1325,7 +1325,7 @@ sub dump_enum($$) {
     }
 }
 
-my $typedef_type = qr { ((?:\s+[\w\*]+\b){1,8})\s* }x;
+my $typedef_type = qr { ((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s* }x;
 my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
 my $typedef_args = qr { \s*\((.*)\); }x;
 
-- 
2.35.1.1320.gc452695387.dirty

