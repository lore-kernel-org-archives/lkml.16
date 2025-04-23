Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21A1EB5E1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446439; cv=none; b=J3JejYzs3yhhttozq4QckmmIxibFX5o1YwP42HQdCn8BKv14MitJIV7mpksQZnl+K5DyMil5L1t6MT1lYn9sEiqT2Ga9Z2dkM6ZilW9NgW+GMKVNNTFpR9Q7H9GL4hjDH+C71kByqsj0YbXwVCRc4gM1L3zfhlZBMSx2J9VfpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446439; c=relaxed/simple;
	bh=QDhW+cmmNYSwt3lHjiry053KlThbivIWaPccdOIP03E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TIrGBCq9blVRsKemJz9N2EGCxuzKtOBhzv1N4b2zdplAF29QliTzGiT8BXVcL10bxtPVdvhSRYNufTIDvA+HpNuyXuO11qNXhJmQKamusAi7jHxfUXe2KJix5I1h31HreeBQujTy1QpeA1f3iU6RrFKzCtvIUrp9kM6Zp5C+on4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:d851:318b:70da:57a7])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 3C1B155807;
	Wed, 23 Apr 2025 22:13:55 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:d851:318b:70da:57a7) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Thu, 24 Apr 2025 00:13:51 +0200
Subject: [PATCH] jfs: upper bound check of tree index in dbAllocAG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-ubsan-jfs-v1-1-2eab57c1ac50@arnaud-lcm.com>
X-B4-Tracking: v=1; b=H4sIAB5mCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3dKk4sQ83ay0Yl3jRFOLxOTEVNNUU3MloPqCotS0zAqwWdGxtbU
 AlHwwFlsAAAA=
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org,
 syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com,
 Arnaud Lecomte <contact@arnaud-lcm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745446435; l=1541;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=QDhW+cmmNYSwt3lHjiry053KlThbivIWaPccdOIP03E=;
 b=5aLN6ZacnP2/kPpc5ppBrtSfnIriJoSog8li82VzjHMszK0CVIgnuaoUfCoCvDTwxIViqeLsJ
 SzuH3nBapFqC2pwL97O8hoF2+rQm44O4AMbss2h8kjqWJlrYAtoP4UU
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174544643558.3864.16356517934851663975@Plesk>
X-PPP-Vhost: arnaud-lcm.com

When computing the tree index in dbAllocAG, we never check we are not
out of bounds from the size of the stree.
This could happen in a scenario where the filesystem metadata are
corrupted.

Reported-by: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cffd18309153948f3c3e
Tested-by: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com
Fixes: 263e55949d89 ("x86/cpu/amd: Fix workaround for erratum 1054")
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 fs/jfs/jfs_dmap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 26e89d0c69b6..7acebb9a21b0 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1385,6 +1385,12 @@ dbAllocAG(struct bmap * bmp, int agno, s64 nblocks, int l2nb, s64 * results)
 	    (1 << (L2LPERCTL - (bmp->db_agheight << 1))) / bmp->db_agwidth;
 	ti = bmp->db_agstart + bmp->db_agwidth * (agno & (agperlev - 1));
 
+	if (ti < 0 || ti >= le32_to_cpu(dcp->nleafs)) {
+		jfs_error(bmp->db_ipbmap->i_sb, "Corrupt dmapctl page: ti out of bounds\n");
+		release_metapage(mp);
+		return -EIO;
+	}
+
 	/* dmap control page trees fan-out by 4 and a single allocation
 	 * group may be described by 1 or 2 subtrees within the ag level
 	 * dmap control page, depending upon the ag size. examine the ag's

---
base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
change-id: 20250423-ubsan-jfs-3a58acae5e57

Best regards,
-- 
Arnaud Lecomte <contact@arnaud-lcm.com>

