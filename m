Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A766418641
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 05:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227752; cv=none; b=QLR1bExen5F6F591z+eCvw+GBN8yCROkehmHG94KdxhCgItOcR1gG7Q7aiC9DrVR2YmjvtmxB2i9aDJ3OWFO/nRElmmrNJwOh7d6NkIMY8xym+aUxOKdPd5BUx96oat2bGRJDpBt22jh3Ubh1iJt/qbux2oVvZ0m0ot1ksfTOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227752; c=relaxed/simple;
	bh=DVPFkZD/Y6Zldm/QQyFPNt8cXg3lrar9hsLfU3x8kU4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=f000U1v/Gg66g6q6DXikh2ZjGRt0BP7GK6DIeMl37d/OuHL4QjzutdewWAjUUWKs5jB0FuKFRe9TdXpAti66AgJ78C2jwFm3ifu64jz4Mu/UgldTtOWEqREeGTYHYSC2R/8ECngf+B4Z8TqMSbHG23iToCeNs3vgSBsssCxgQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EqNgrWsX; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EqNgrWsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743227743; bh=hSGKXcb4g5RsAu496xtxQpecNrjY6h3Kp5zxxJz1xk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EqNgrWsXiHSpEHRVdYpX6eLXaZd7xh3dMGe1SN23G92S4xdOzkcjxX3TQzDQrF8rK
	 Ivb0YFU/zuwTxBr2X+mysl+0yAxBKYpC6AKexHcZaxBGkkIp8pT2BM0geJRIC20ldR
	 DBkybZ0gmmGZoWcWMnODiOL/24IoWtjOWRP+ZBDQ=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id DE990C6D; Sat, 29 Mar 2025 13:55:41 +0800
X-QQ-mid: xmsmtpt1743227741tsfyy0ibn
Message-ID: <tencent_43A5890D8A92615DC95DBA99714FD50D8207@qq.com>
X-QQ-XMAILINFO: NVd9ZAvGcUb9n/HYMMbk4lINs11djBqtX59tyU3dusveEFjVwn5Lzi7WQO1E5g
	 eZhfUk0zcBC+EHfyMCNjCa/s8zhnp8ldOnXa76c2fZnLCaTgInOrYYRNhOinjp5/6cnzpPx8lPLe
	 WDX4Y5+is1Rwp5bkhLSbXurxwMBmKRR4tlv4Lkb+Mpr9T8rJYfcvaAtkNUz0oatzNzKxiEx/NP4E
	 dp7gaeuHO2yqtrKOwvd2t0/yPVuiCd6exYOya93IgQ/qGjPl0sWDbxe0XV6HGeyrqXTAK0hgG7Z5
	 4+ii1NkBC2RhBdSO1JMAo2nrPC2Hem6C4pxfn8DWjGqqzQIUeRFUTXyQM/jMdyQMQs8PkcI6l5mm
	 ZLBuU84WBUSfdu/g1ytBGZ12qO6Z0z9jYKzLxvRYTtF1I3ONh76wXg/p2qNHrUvTNX+X6sRzLYkD
	 f87pwJmkt3ZsZidj6rWw6JB0OBR+2PMbjjjFoso5NBEOB7Q6CNti28bTRwyoZdMSnJ1i7QeNYiKM
	 QNDeEiMYj1oM+yJMD+Tqd88i0G3vLjVt8zvAFP3fEEPlgaWgdSf6w38Iq+ZOXdt3ba8CtbPr7Ktx
	 e/uIcjNzzE2eiQH4uFr2tKdjQxgCW/VqKThLzgJXGgvXA4hFgmMnZ3nk77tBAk6WockbSWjmgFs+
	 /A2JKE2yxMDUGM8raGgmiIqGR+NnCTIzdj6e4RSrLU68f789Xqrp9h1BvzWVz9o5F0UrzGmtUIAe
	 zIH9AE62DkYhaSk/Qcdf6Y25TF7l0QjyZWlGpTrOPWESfbK3Rq05pJNs4HdMlt2Z7LXi5B1+ViR8
	 fvpDsLaYWRd3eaC0YvfFk/HR/qlC21v8VrMbFPvzQxKCb9JFIG+7/wu+0XnoRd8rh0xkBV2hqL/t
	 Ksjjdte6tR1vkYF0H0xfxIEyNEoYaHS8UbaitxtYZ72JnLZ4C3s4r/vZ9MypacY4lpWTRQb89nmZ
	 U5OoCaU251xFswv5hfcw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Date: Sat, 29 Mar 2025 13:55:42 +0800
X-OQ-MSGID: <20250329055541.3607901-2-eadavis@qq.com>
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

