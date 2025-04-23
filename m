Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F319282D98
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444842; cv=none; b=DrQzZL85Lvwy8Xx7DB7cHXAbxJksz9RXRaxAGzxHOzhZyAp0HUeBKMaVWyef92jP5vX/eUFRmtcS031a5aV8sMmyZ4gmOQAFEt2E+rl4kifrQmeocRSPUMyXE5w1YqSpjNGHmg6h2oNZx8a1F2UeXEO9nRMqxipl9wKjFbfWljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444842; c=relaxed/simple;
	bh=iURqJoDE/cEU9OWPb6NsdQwX4f1qzRzXkuvbnjF9p70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO5ZTxrxlxs3XZhgWp6Wmf63jofLtYewszFjYGWN+65LqJ/Vul5MG2yUo+pNOQq60nwOivxu8ikEfp1sVBXHgz1WTW9/Avg5ZmVB4Kt/ohmFIVJIlaMAtRvPQS42CnpeCcJq5AfudBwL1MynFnGJgK04a3cDpnxQuRImsfLf7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:d851:318b:70da:57a7])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 197C63237FB;
	Wed, 23 Apr 2025 21:47:17 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:d851:318b:70da:57a7) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shaggy@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: syztest
Date: Wed, 23 Apr 2025 23:47:10 +0200
Message-ID: <20250423214710.551189-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68094bc8.050a0220.2c0118.0ac0.GAE@google.com>
References: <68094bc8.050a0220.2c0118.0ac0.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174544483750.12415.18414490868860721087@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test

--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1385,6 +1385,12 @@ dbAllocAG(struct bmap * bmp, int agno, s64 nblocks, int l2nb, s64 * results)
            (1 << (L2LPERCTL - (bmp->db_agheight << 1))) / bmp->db_agwidth;
        ti = bmp->db_agstart + bmp->db_agwidth * (agno & (agperlev - 1));
 
+       if (ti >= le32_to_cpu(dcp->nleafs)) {
+               jfs_error(bmp->db_ipbmap->i_sb, "Corrupt dmapctl page: ti out of bounds\n");
+               release_metapage(mp);
+               return -EIO;
+       }
+
        /* dmap control page trees fan-out by 4 and a single allocation
         * group may be described by 1 or 2 subtrees within the ag level
         * dmap control page, depending upon the ag size. examine the ag's

