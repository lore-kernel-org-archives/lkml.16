Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAB1E5B79
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923969; cv=none; b=hajQCYZcwtXnElUN6vJTNaDD+YlLJDcZk/CSAhFkejwNaNPTkCBbTGzhEKzYTTQ4fdlBK46wOEBFyrPJ8oxuRJ/vlDO3R/ciR8RwwDUDpH5VsufCUls4WkVKPUK/xNBkdX0CaGTKuWn7usvvnXKk36VUx/r1t7T4s0dYcTAtFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923969; c=relaxed/simple;
	bh=vPIGEDlFc0zzPeBFWuupPs3ug6A9789aSn4OaxK2n14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIYqeFUGCeJCliTtdHS9Hb4NROt/gzjkJO1HGVJTLcL9LW+v/2C21GrSmiKoubpSWRu5MedpEBI4mSR7Z8fiD5a2Sss4D6UpMAtBd0emcc7nhC0tZJEljT2sNIvk8dtE9qNHTE0+QwnJ52jIqlbxO6JVqC77ReqVk+Gk/BRMxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JfsHvl8Y; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JfsHvl8Y"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5WPju9RZpCZIm5WPvuOd2h; Thu, 17 Apr 2025 23:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744923903;
	bh=N2UZc3m989RpD3vfEzzJvND1JyZJERFewm0G2Iko3Ys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JfsHvl8Yy9Pof/K2NYhq0aPNSoxiLzFs3HvKWSDJ1SY22D8PKSX5YnrOcBUdm/Co/
	 GBN+6MFxbURDv4dOZrH0FZpwb0RdNzxH1OZQ0dGmh/tsIyQ+LrAp491InwJ04MINfd
	 PVxAuKhVXeo5IL6JE0o2kJeJKVB4EobvprDVvqueoGC94QgM6oXhqxtPWDqudf71Dc
	 D1nulPQ4+Xow1DCUMOw5ugtc7xljOjf7rgQ5GJSfXm2AnNIOV2+25CFszLp5Hm236i
	 AHNTPCyq+fE5mHOVjlHnoe2yIlNJDvayKrhTHeSfgwkpm+zLJOzJ9eeqKTeGuHNDxd
	 8vnRAMQi2IeJQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 17 Apr 2025 23:05:03 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Stefani Seibold <stefani@seibold.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3] kfifo: Fix the description of kfifo_init()
Date: Thu, 17 Apr 2025 23:04:34 +0200
Message-ID: <c2a93f172366696fcebf9ef421ff29abfa4ebd0f.1744923838.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e25c871bd379f0f3595c2045925d3d25731bb194.1744923838.git.christophe.jaillet@wanadoo.fr>
References: <e25c871bd379f0f3595c2045925d3d25731bb194.1744923838.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a useless comment related to kfifo_init().

The size of the buffer is expected to be a power of 2, as already stated a
few liens above.

There is no point is speaking of "the number of elements" here. If
kfifo_init() is used, then the internal buffer is explicitly allocated
using a memory allocation function such a kvalloc() and the needed context
is stored in a struct kfifo. In such a case, the "size" of an element is
defined a sizeof(unsigned char) which is 1.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/kfifo.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 54fbe2ae6fbd..707dd90138d2 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -389,7 +389,6 @@ __kfifo_int_must_check_helper( \
  *
  * This macro initializes a fifo using a preallocated buffer.
  *
- * The number of elements will be rounded-up to a power of 2.
  * Return 0 if no error, otherwise an error code.
  */
 #define kfifo_init(fifo, buffer, size) \
-- 
2.49.0

