Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D125134B0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743217133; cv=none; b=f17G/A6YaW9Jq0peYmUa04J8CqJpwYEW0uhUA6g2zeNc3TG4UFwWZiJ9fyQqosst72PxyO16mBpupyx9J+x4ev6TqbyamTO0bOOGPDYOz3Uj3tDb2eS+2i0Wk+HMCGCPhep175yEwc5HYPYJJ8tyuG90hGrpzFQ2QXmbnHdOOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743217133; c=relaxed/simple;
	bh=r2LdaEsxSH8zDtfRxaVF0UFRmxgHpyPpDq9666wTzPE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=urYk6TUpMJmSYqmk03xuIr2reTuWsok1TCnKsWOO41gKtxLxEE6g7YnHRF+h0baE21ZJywZJCDiaf84Lb0sE9BpyQYQGriZSkRxOZ7qPjKk+ujmC8T0Lqo03QMB2gij7YRT5dBbjN0ibFP47fb7aA6kuArZeiTwhfRw4TDy7L00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=qYbnx8vb; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="qYbnx8vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743216819; bh=Uc6NG4Yt9fWqdAL78Iw+MTI7bqi6LsRPKnxh6Noy7Rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qYbnx8vbge2Sst7snvwm9n8hiiMoBsCoCWd0VEA5861utbgE8UykforJTmbBEbUIZ
	 lzR6iSCt0Ez6HjepZRpwkm7jXKLoHkKVOCRBzT4Oq/w7A1YMmTatfsjJYBEMRfDwRO
	 24k9ttCWEDHQK9e4Nmc9S2iq4QXzU8is67ylni7I=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id D65808D4; Sat, 29 Mar 2025 10:53:37 +0800
X-QQ-mid: xmsmtpt1743216817t25wul2q9
Message-ID: <tencent_75D09648E85EEECECE287BF26DD42D316F0A@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTk82a9bV1VYkNxQzRiKBwfG5p29lzwJRELCEBmrD/mHxSZ8O4YtC
	 wLc9fbt4FOf8vhupyvRjzesWn6xsmHfi6kPF1VdTVrxHJIfFi0EYjEKCIul9fMykdAgGQTsBs/+z
	 JG5EW5srAhbfbPzn3VlmpDs0aRN1fs0upVU3cQUZt63GdFxScXPRvOQX4L7H3hXbvkDqU/FGBbWC
	 J4ch3nRCyfLLEQCccLYt2h52RP6oXpRQcLi4BvpF09NqnegY11CAYtUIcVdlpVo/hNU/F9onq5YG
	 c5Ap+sRg2PTl7ur7ChwFPVeqod6zygmA474fN0D2Kw3TEiTJ9Izlk3uwJSTmt3W9mw7no4A1xa/9
	 fWuFKO2QTh66/vNqrcXYchssxe/wJaz1sd1mygSIwGtqwzekhaDdRl+MT9NAH0JtNTKoPyUlJ71U
	 fGhsJE+834XkiQZSPLl2Exd2A1ltP8+J+h8zkidYC8S+Lc/h2YCJgkdF+ufALlZdXs4tdeaQvr1F
	 get6m91CyWMCfj5DCHydvjhbArl2qpeGMZG2ocQaS8bVBLwYMgRK5dGyenJCg9Zb4AjH7BLSsffB
	 d0rHXWkvSeCkzsyW0jzzyaBmUU1kTn/d/gcpxgC/mNaTzTaVvj7EicEWcHkOh7I5tOsMgj6s+AOn
	 ouuGFruUhAxdv++Kx73J6HUXH+kLYw+uZOCgAJnNHGR3BRayyLwZ0H5MCMZ212VFIioThbrBFDYA
	 6PUEULA4AHv0SuR4dm/1Zh5Hqu5zrHavWyhLSVwFUfZrMYve9AU50sUPmFsKyyQc5DqauAZxoKA2
	 lZKpq0Ok7/Rh9noTxFHUvyUUm6fIV5MJXakb52iYI19KTe8LEDTjtOdVGiQW1UtpW/a2jdYZz1vc
	 126oKp08us3yPrKKZm4Qd8kStXSKFArQ1vfezoYJPCE6NdX31plPX1gpseu1IqulYFSUpj6a0huK
	 cEsGxVNyTX976bEyM8fxzEajIrONcY2JVDa5Xy5s03DC2mU00H7Q==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Date: Sat, 29 Mar 2025 10:53:38 +0800
X-OQ-MSGID: <20250329025337.3481274-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67e57c6c.050a0220.2f068f.0036.GAE@google.com>
References: <67e57c6c.050a0220.2f068f.0036.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 691e0ae607a1..829188ef5435 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -287,12 +287,16 @@ static int afs_dynroot_readdir_cells(struct afs_net *net, struct dir_context *ct
 
 	_enter("%llu", ctx->pos);
 
+	rcu_read_lock();
 	for (;;) {
 		unsigned int ix = ctx->pos >> 1;
+		u8 name_len;
+		char *name;
+		unsigned int dynroot_ino;
 
 		cell = idr_get_next(&net->cells_dyn_ino, &ix);
 		if (!cell)
-			return 0;
+			goto unlock;
 		if (READ_ONCE(cell->state) == AFS_CELL_REMOVING ||
 		    READ_ONCE(cell->state) == AFS_CELL_DEAD) {
 			ctx->pos += 2;
@@ -306,19 +310,28 @@ static int afs_dynroot_readdir_cells(struct afs_net *net, struct dir_context *ct
 
 		_debug("pos %llu -> cell %u", ctx->pos, cell->dynroot_ino);
 
+		name_len = cell->name_len;
+		name = cell->name;
+		dynroot_ino = cell->dynroot_ino;
 		if ((ctx->pos & 1) == 0) {
-			if (!dir_emit(ctx, cell->name, cell->name_len,
-				      cell->dynroot_ino, DT_DIR))
-				return 0;
+			rcu_read_unlock();
+			if (!dir_emit(ctx, name, name_len, dynroot_ino, DT_DIR))
+				goto out;
+			rcu_read_lock();
 			ctx->pos++;
 		}
 		if ((ctx->pos & 1) == 1) {
-			if (!dir_emit(ctx, cell->name - 1, cell->name_len + 1,
-				      cell->dynroot_ino + 1, DT_DIR))
-				return 0;
+			rcu_read_unlock();
+			if (!dir_emit(ctx, name - 1, name_len + 1,
+				      dynroot_ino + 1, DT_DIR))
+				goto out;
+			rcu_read_lock();
 			ctx->pos++;
 		}
 	}
+unlock:
+	rcu_read_unlock();
+out:
 	return 0;
 }
 
@@ -348,9 +361,7 @@ static int afs_dynroot_readdir(struct file *file, struct dir_context *ctx)
 	}
 
 	if ((unsigned long long)ctx->pos <= AFS_MAX_DYNROOT_CELL_INO) {
-		rcu_read_lock();
 		ret = afs_dynroot_readdir_cells(net, ctx);
-		rcu_read_unlock();
 	}
 	return ret;
 }

