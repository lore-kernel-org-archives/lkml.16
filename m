Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F03597B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241876; cv=none; b=BK7/XCcaTKF1s/jPLz5bialC5QZZ97tjMfn8zneTdNLwQESqNKUvmVkVWe9KFQzYPcuuKooPJILWc1i6R/Oh5T2PNVRYOfxbBHAd9mcIE0q6xEpgrxXCz2O6f4cP8shqIYZKEPeCD9FzDo/b//ZEetBogschGJjvHQx1KExeghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241876; c=relaxed/simple;
	bh=Hm76tCl9ilWngFmfkw+iG2Wu/U+wxdlTrtWeyLRkS6g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aQPSioVyXCWjpSnZHfcvejTbFNJToDhTtj/ir4ZSmQ8Vri1I/5Zqf0frKrCgtiWygMGvw5JFWkZosuz31+nYrtl6yFryw8zDdQbX5PMgjtek5h8E4VvQHCm/9YJNSN765n3okseGxg0W4lnn5gwj1Z8jkq3h7WWKP9yRekjh3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=unk2RVen; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="unk2RVen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743241562; bh=b1kP6fo7YCLc//pUy3ZCYbT6o0OhYwIaebDSXUFjhr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=unk2RVenF9ZK7AX6KcMh5WRu61lXGJUlWcOYeopV1eKZIUWnuWvQVdE2qhCHr3w2x
	 4FjU3qSZsn4emcE5n1EUyRCzTfn81kK8Uokj7UqxtPkojOsDna7ZUioo5dvTRCK2pi
	 4rvHeiHtPyKPFzWNoQCmycwSlT+lhEjYbiB4Flms=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 9F2276B9; Sat, 29 Mar 2025 17:39:50 +0800
X-QQ-mid: xmsmtpt1743241190toeuj4j4v
Message-ID: <tencent_FA76EF66A63CD7369E971636784A0074D509@qq.com>
X-QQ-XMAILINFO: NvgtgL4Jzwx/TMX3ybtJp5XxQxzC5BjbKPb//QMiOAXsXzQEnLywp8Y/mubPaj
	 qhJKvczdmWWB8NHuUdVAtins64sBrMak5LRe3SIdQpl6dAeoXixzbSRCnrl9L26EY7au1P6GOTbG
	 Z3Hdyxs4/PJjob3V3PDvjSXgQmCJOGOC9d1hMHIisuoVf2JtbamrIulVPvbhlj1MYfpd4UHSMo8V
	 6rKEVMEWXG+TD21Ieg8sQqQ4tEyezLrMBgd3lbXoBh5C3vyqu7w6gd1G41Z/lsMBjpgMMX4oqTOU
	 ps1rcUxQ5zo4PFCkPst5JiduZ6B5z8UPpz5SdoKxNjsOJA3ZtzfAJL2JfT3/5LPPRAcd8nOOyBD7
	 T7qCWcGMi0tv74jpeDW0IbArU9HsQbyc/WKLa/z2gcpqugZeVyJj+CB/kzbyyNWN6MdDwZGxJ0Se
	 arPacZ1MyAvvsiqJrWbeyTN099kuEJYuGdLJH0uzyzf74BxAr8TvBoOH0SADgcZArVfQlTyg0OwY
	 yOjjyh6agwWnpQG0RD0ph7AJeyoE1lBJn0nY0fwvyjJIf+PzP2rHopIZNGlqA8tanhFIMI8UHazb
	 W6Mf+JsJSb6cwJbSqboehtoulVs4Qlt8hJbJmuTSerBqKT33j/62tXWmTnOrNU6oZbvjoOzkKDbQ
	 nHtJuNCSLRmrkuIzZ3X1Xx5pNeqaDYK8yG9u3SQTyXnOEDQCqJA+CIBpEjy26SFOXCUzbQmBS1ug
	 PdikEU9ki0tppuu0CTebXVo4c0XpGJwAjDkyk8nH2qSpW3F7NIoHVqq6/Hhs4IoIATVhFNuvg+Ra
	 uwP1oxfzcnkHMJ9tjOpFVSM+pDnZdJkWfVYj0SeW7jZpRVaokRVsXtLRW8GXAFZXnBFaK6sDvu3k
	 NGVQQF0sBiexK/AfK8uDsD5ij9vGC9OM3SVLGyAjqc5bbRkdRzqAc=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Date: Sat, 29 Mar 2025 17:39:51 +0800
X-OQ-MSGID: <20250329093950.3801135-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
References: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 1d0b929fc070b4115403a0a6206a0c6a62dd61f5

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index eb20e231d7ac..8d640f6537fc 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -286,12 +286,16 @@ static int afs_dynroot_readdir_cells(struct afs_net *net, struct dir_context *ct
 
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
 		if (READ_ONCE(cell->state) == AFS_CELL_FAILED ||
 		    READ_ONCE(cell->state) == AFS_CELL_REMOVED) {
 			ctx->pos += 2;
@@ -305,19 +309,29 @@ static int afs_dynroot_readdir_cells(struct afs_net *net, struct dir_context *ct
 
 		_debug("pos %llu -> cell %u", ctx->pos, cell->dynroot_ino);
 
+		name_len = cell->name_len;
+		name = cell->name;
+		dynroot_ino = cell->dynroot_ino;
 		if ((ctx->pos & 1) == 0) {
-			if (!dir_emit(ctx, cell->name, cell->name_len,
-				      cell->dynroot_ino, DT_DIR))
-				return 0;
+			rcu_read_unlock();
+			if (!dir_emit(ctx, name, name_len,
+				      dynroot_ino, DT_DIR))
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
 
@@ -347,9 +361,7 @@ static int afs_dynroot_readdir(struct file *file, struct dir_context *ctx)
 	}
 
 	if ((unsigned long long)ctx->pos <= AFS_MAX_DYNROOT_CELL_INO) {
-		rcu_read_lock();
 		ret = afs_dynroot_readdir_cells(net, ctx);
-		rcu_read_unlock();
 	}
 	return ret;
 }

