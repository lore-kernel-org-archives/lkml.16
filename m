Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DBB1A23A9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921479; cv=none; b=WJRErxJkkqN12CraSfOeuPekjwHwumqR6DvoJhxxdWxNPgNQQrgIVIrkNUUQTY5pKF5b2d3bzNjzyFZXYza57tpWirw1ObcFA/90cHU+alX3q3vRu2gpNuQOJ2dY8ZX2CVlQXrhKIbLxwVX51iRBpcDE6/vLQuCl5DyT1/361T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921479; c=relaxed/simple;
	bh=d2ITcAefxdIh0F5/1MMFs5XE0rGFN5d1sS+KU0R/OBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kx5FLwn4sw29R12ghsn2HLqOh9RuMKbzEOnWjW+sxQYYZXOYF32yBzUwsj6WY3BWLRiJaYmJTy7jMsMF7hDN4WBGITgcyUvLU8fgKlloD/0LtqjrbllzAun0l9hF/vB+6Xpi7zPlJ6MLY/Gr4FLr1vb0DdMLeJv1vM1W9HWLDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=i7gHCJj2; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="i7gHCJj2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921472; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=EGHE22JNOgVTm0fKKQ9rTbfnsV4oV5XFAO63xRbgM58=;
	b=i7gHCJj2w+RxG2tEUTFWIBVb+fcCZ/rk1BGqLQ3+mYoJGmiXP/ULHwnIzOk6nLiA4yJevicKiWcRAs7q9l+O3/gCGWlR6jL+dN/LX8SV0qTK+sIVpfDUCOP4+Cki7d0BY/doI/Bllla+vgDhs3dYtieHR9i32yXYyKU46yylCPU=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz4okr_1738921471 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:32 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] MAINTAINERS: add myself as shmem reviewer
Date: Fri,  7 Feb 2025 17:44:22 +0800
Message-Id: <bcefbba9b2b44d4e661e6cc2c4187292a5beb467.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
References: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the past year, I've primarily focused on shmem and added several features
to it, such as support for mTHP, large folio swap-out and swap-in support,
mTHP collapse support, skipping swapcache, and tmpfs support for large folios,
and so on. Meanwhile I've also been helping with testing and reviewing shmem
related patches.

So I am willing to continue assisting with testing and reviewing shmem
related patches. Let me be Cc'd on patches related to shmem.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 577592e3af82..7fe4ea237afe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23883,6 +23883,7 @@ F:	drivers/hwmon/tmp513.c
 
 TMPFS (SHMEM FILESYSTEM)
 M:	Hugh Dickins <hughd@google.com>
+R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	include/linux/shmem_fs.h
-- 
2.39.3

