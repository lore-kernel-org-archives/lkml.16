Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726D31A9B3D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226680; cv=none; b=ZiAnpXzXDZOmC5KH3vDCoxxrjlLIwvtxv7e2xmMbv0sH4/zo4B7grQYvlUMQVtfo69Dwm1TihEK+eF6kiLb4EJnQsL8yt71KFamfr/iRgSnMIKh2qIa8ub/4Wo4/l6rzRl69WefX+f71NRkHghhsRcQcxlI7uPx1prg+nRt4HC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226680; c=relaxed/simple;
	bh=f5TXy+fk3l9QPCAnfXY5KdIf6x2Vyvo8oQ8dtsUQwiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+JFAPWduzKEOr5NShdIUuvA3aBi5p+qWr6uFBJvWu7SccEk6c7g5GbAFtU01P0Y+5kVtDSb9a8eCiFROfmKl5cdbW1i7S9t4OTmgtW7qQRp31haruuwQMCuAA0JIx+JLxmjkUEG78PQxgrCmj3f9i9fP3QXVKgu0fN0Rez5nMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-51-685256e95ae4
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v3] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
Date: Wed, 18 Jun 2025 15:04:13 +0900
Message-ID: <20250618060414.97-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhesuzUPdlWFCGwetOVYvTU88yWTxZP4vZ
	4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4Mh5NeMJa8IKz4uCC
	5AbGqRxdjJwcEgImEq9XNrDD2EtWfGcCsdkENCT+9PYyg9giApoSRzpnAtVwcTALtDFKtB9t
	YgVJCAt4S/Sv3QJUxMHBIqAqsX6iOUiYF2jOypZTUDM1JXZ8Oc8EEReUODnzCQuIzSwgL9G8
	dTYzyEwJgYesEjObdjJDNEhKHFxxg2UCI+8sJD2zkPQsYGRaxSiSmVeWm5iZY6xXnJ1RmZdZ
	oZecn7uJERhMy2r/RO5g/HYh+BCjAAejEg/vBq/ADCHWxLLiytxDjBIczEoivItP+GUI8aYk
	VlalFuXHF5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYOxc/3vmEk8/i99l
	Mg/vtFj9ntCRuWHnnMCU2oLzD8S0uHbdVL5/ZqIw1xoG8YuWlnJfg4SM1WztbW77z1wkIba1
	c5KwU4TQ7LW75rEem8HyxVVx/uQNX2abrvLsKvt34JHm7+1mL9rNWy/eueT54LHLq5mfuY6b
	zNkaPzPes5rhbueNGZ8vW+YosRRnJBpqMRcVJwIAM2ejqSICAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsXCNUNlju7LsKAMgzs/pSxOTz3LZPFk/Sxm
	i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
	t0vgyng04QlrwQvOioMLkhsYp3J0MXJySAiYSCxZ8Z0JxGYT0JD409vLDGKLCGhKHOmcyd7F
	yMXBLNDGKNF+tIkVJCEs4C3Rv3YLUBEHB4uAqsT6ieYgYV6gOStbTrFDzNSU2PHlPBNEXFDi
	5MwnLCA2s4C8RPPW2cwTGLlmIUnNQpJawMi0ilEkM68sNzEzx0yvODujMi+zQi85P3cTIzA8
	ltX+mbSD8dtl90OMAhyMSjy8G7wCM4RYE8uKK3MPMUpwMCuJ8C4+4ZchxJuSWFmVWpQfX1Sa
	k1p8iFGag0VJnNcrPDVBSCA9sSQ1OzW1ILUIJsvEwSnVwNj8X0pjxmcl+9fvGqZfCd7EOfFP
	lSLvtYY/ChO/u9gFdVfZ9lkemV33+yp3ktnDF9/U15jc2Ri4YZ/G27obcZfTyo7OCeVIy1nG
	Y2MxS+rFwZqpUxllNt9bcLml28CBQVVQ9MqN2EPrf9qwFk5f/8qXO6VGXUpTTVHg7599Uwr8
	Ds1SSZ1Ww6TEUpyRaKjFXFScCABKlo6eCwIAAA==
X-CFilter-Loop: Reflected

to allow users to dynamically tune
the boost_zoned_gc_percent parameter

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.h    | 3 ++-
 fs/f2fs/sysfs.c | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..11fba7636af7 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+				sbi->gc_thread->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..d0ec9963ff1b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.33.0

