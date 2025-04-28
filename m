Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42121D88A4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823493; cv=none; b=Ut/HytRFP6ibgeivsD/LlJicU8Or/yYWAIM/UBhE09h9fAcBU9JwNILh8M4JoN/NFiXxRCzg+k4xWrhtUa5FJXL41v3RDx9YrtBi2FQt4B7ovhp4+80EtaKtUWKr1u2271zzR5/8Hwjva9JKssCCgz4C5J1ozVWkjW5N6ni31MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823493; c=relaxed/simple;
	bh=QesdOeuFd/3U5ADek4FnursgFsJEeQKVIGbHn5fY02w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NW1o1gjR5O4ODpQD3PHnk+OhjS/Lk7bHm4f8m+UqxuGjgfJzVAo51BGXbPCnfpD7/SuhGRN/stwjnnHtggaAMSZT/VJcn5nU60RpwGW3WKlDWEBPrsdnfXzFtHqCx43izelxQCZtRvOGa+txcWRcrfoemLRnIXgbIedKeI5+Kfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=tJ+uUBjI; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="tJ+uUBjI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PgSNGRhDDLimUACzMmlpyYb3XHHooMd5BY0OOU8/LWc=; b=tJ+uUBjIOr4Oo3rLKAqL6nVZrp
	mWmW7T6aRG7X5BUaNvlEpPK3jbgSlgp38C2lNW19AZCt+ngqS2Y4I1+jS//WbyrHDZYwx66R94iuy
	Gk3+k2j+0vQ5wkBllKM4pNGHIPE+yEan5cx23DKWYdladr4VPkYJwsRz9DjSCzNWe/HIJmOK1n6DT
	veyA2Ymq7xogkugdmrS3dFLYUn9scoFluif5+a+kjVytzimMaDdfZlOjn8mDGwBiU0/YEpZIfe5eJ
	ewpIfgjveqpLta8rvk4yuVm5D++ah1Hy+znIh6qFOX0u7XY/TAMLxeMfoHJKVrp6RmZVbVpHMrXUw
	bRXseRVg==;
Received: from host-90-233-217-8.mobileonline.telia.com ([90.233.217.8]:64580 helo=localhost.localdomain)
	by server4.hayhost.am with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u9IRh-00000000A3R-1Px4;
	Mon, 28 Apr 2025 10:58:29 +0400
From: Igor Belousov <igor.b@beldev.am>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	minchan@kernel.org,
	nphamcs@gmail.com,
	senozhatsky@chromium.org,
	shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH mm-new] mm/zblock: avoid failing the build
Date: Mon, 28 Apr 2025 08:57:27 +0200
Message-ID: <20250428065727.57990-1-igor.b@beldev.am>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

Don't break the build for a PAGE_SIZE that is not fully supported,
just print out a warning in that case.

Signed-off-by: Igor Belousov <igor.b@beldev.am>
---
 mm/zblock.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/zblock.h b/mm/zblock.h
index fd72961c077a..8610196b651e 100644
--- a/mm/zblock.h
+++ b/mm/zblock.h
@@ -21,7 +21,8 @@
 /* max 256 slots per block, max table size 64 */
 #define SLOT_BITS 8
 #else
-#error Unsupported PAGE_SIZE
+#warn This PAGE_SIZE is not quite supported yet
+#define SLOT_BITS 8
 #endif
 
 #define MAX_SLOTS (1 << SLOT_BITS)
@@ -101,7 +102,7 @@ static const struct block_desc block_desc[] = {
 	{ SLOT_SIZE(10, 3), 10, 3 },
 	{ SLOT_SIZE(9, 3), 9, 3 },
 	{ SLOT_SIZE(4, 2), 4, 2 },
-#elif PAGE_SIZE == 0x4000
+#else
 	{ SLOT_SIZE(255, 0), 255, 0 },
 	{ SLOT_SIZE(185, 0), 185, 0 },
 	{ SLOT_SIZE(145, 0), 145, 0 },
-- 
2.49.0

