Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFC2EA17E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254398; cv=none; b=X9r0r7Rr3QHZ2KkEf4IS0JIPTIgx/iD+IqPjlOIy1NT4zNGHaj4CTgyUeeBwrR9meD/NKQtdshgwq2xFAjgIXmcpyCaRbVGMzJM/Pz7uNtwqlZZL8VuNm9LL9K2XvOwamK4iG5C7pD68s3lgZROTpsklXivWYihB7KYct7aPUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254398; c=relaxed/simple;
	bh=knEU63UeGoDq6XpREp3XnHb9aS3Ic3huQ/zQvL115nM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EdSYCexaonj/0Rr+nzQpNL8wTgIu1OqkgtDP512eudT88vgT5023rbEORSuO/sukvJqifk/yYaXH8XRaSnVaXWLbT9xOnU8tSFKjdCii8AvQqDmqd5QxiunG4B5tseOx5L9jab4PjNPx9DZpi602JeYd12Ki7Nx+QsuRu1/NIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=fTAwG49t; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="fTAwG49t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=hpdCYUrrXy7FmAY6WEXDCTit6M/UB7ANSKwrerMHny4=; t=1750254396; x=1751463996; 
	b=fTAwG49t2Dj8+hgguu+LF4Ta4RpvOAhOE9ba/2KYyrLveP6/d0mIBDsWL0xYI+YnIoYVtyWqDTA
	Q3sZuOKROkcXRJlstDCM5/E5irLCW0uRWnvWoa9BABxf9lKc0OmneO9MxJRvRpDAlHABwJHoLvNAc
	XWAF9rjAVrAVVGwBClR14WAOgcq9uCCs9u3ThQqEtxblds2DfUlOvcj6LthHews9AcZUQFuODFjXr
	4OaT9/Om2IscEg7bnIaBkLsLbNfj+SAm/4pBL7im4K9r30p0zu6RbVp+auwR3glS8TqBeBaXPniUJ
	vMr3ChjeT6loN/eezIXlUs6lkBFyPrVdtlPw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uRt7Y-0000000GQkT-3zxa;
	Wed, 18 Jun 2025 15:46:33 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-kernel@vger.kernel.org
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH] scripts: gdb: move MNT_* constants to gdb-parsed
Date: Wed, 18 Jun 2025 15:46:02 +0200
Message-ID: <20250618134629.25700-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

Since these are now no longer defines, but in an enum.

Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
Reviewed-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 scripts/gdb/linux/constants.py.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index fd6bd69c5096..d5e3069f42a7 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -73,12 +73,12 @@ if IS_BUILTIN(CONFIG_MODULES):
     LX_GDBPARSED(MOD_RO_AFTER_INIT)
 
 /* linux/mount.h */
-LX_VALUE(MNT_NOSUID)
-LX_VALUE(MNT_NODEV)
-LX_VALUE(MNT_NOEXEC)
-LX_VALUE(MNT_NOATIME)
-LX_VALUE(MNT_NODIRATIME)
-LX_VALUE(MNT_RELATIME)
+LX_GDBPARSED(MNT_NOSUID)
+LX_GDBPARSED(MNT_NODEV)
+LX_GDBPARSED(MNT_NOEXEC)
+LX_GDBPARSED(MNT_NOATIME)
+LX_GDBPARSED(MNT_NODIRATIME)
+LX_GDBPARSED(MNT_RELATIME)
 
 /* linux/threads.h */
 LX_VALUE(NR_CPUS)
-- 
2.49.0

