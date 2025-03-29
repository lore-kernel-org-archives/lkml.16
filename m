Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB50A932
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743216842; cv=none; b=rfATXkiKI6kGQohp9CUfarKguT8k8x41sthY+5DJrwVVe51AbeyOwr3owcFyoJRvXBBMKXSUHxsoL9EPt2+87yYfQynh1peKQdUdUIam1kmusrEWLyAvrR5SNpRp18UzuWOKW7Pccr+YO3cE3/eCrzR1RDGqoOklxRM4Hox2x8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743216842; c=relaxed/simple;
	bh=r2LdaEsxSH8zDtfRxaVF0UFRmxgHpyPpDq9666wTzPE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ux5JJlKBALMy3zYGoVMEDbgLNAfmLQmjYv9q72LzmVaMExTB38HB+3A27knN7dh8tjytTbrbK6o8RTg3FV6jF5JZwQX5bSnSTQ0O1oKub0e1P+grWHkD9kJrt0mP1wLkVKX9Bq6oUzdZcB9snbYsMReOght1ZYPwYDbqBkvy/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=H34dVDd8; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="H34dVDd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743216827; bh=Uc6NG4Yt9fWqdAL78Iw+MTI7bqi6LsRPKnxh6Noy7Rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H34dVDd8SkPWjuKbpwvWwWqvUiMQMHCXlfkZd6OOxV6emE7ZEkFc6CdjrdhTukjqB
	 laA7LBRUlvhSPRNxz8cH0I9biOykn765I27qSgAJEkI8ifASO5wFTQzrelBjQqAyZ3
	 AAMJmowbrZRowYtPPUujb926POT8iRckcMCn6Je0=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id BDFAA6B5; Sat, 29 Mar 2025 10:47:31 +0800
X-QQ-mid: xmsmtpt1743216451tpyqercs7
Message-ID: <tencent_FAEE0ECDAC784E6DBC2C896FC094ACE96A0A@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1j68GC9Fp5X6/GfcHBgdJ3VZAmNTm3CQBk7nDA8vBLXARWh6Uer6
	 aXpaVDd8SUydK/i4qOCNnJPsvWbNH8gvm3wKL19VneY2C/dSr6Wne82Xv42TblvpPBcQ+YBTOjSU
	 3t51G+Uc+GENjLfVhup6aSwnVB4weKP48/LR6REmPXw/lWRCtpqtvVxmHXk8+HooQHIjE43ShHPi
	 qTVYO7actp9iFu0bkQVncJuTAik0xc8dPywOHhspaoRYOsVzMMV8oLEBcH+6jKToHVP3SUPFSTed
	 9kQQVhng1MQq0IFOOQq7NU01K6ACjXlcHmOflASs9ejBHniMJZ4bnFGidQrnaen9ltxdk7RovS6g
	 ClTxK+koKqaW9ENkVSdQo/3cnZ/nR0jJVG47I15L+ZOV/fVuZDcHFiNcGYsGliHnCePbKePdbxIs
	 OTsoYw6T3CKh8oJ9wI+vdAIqj4PrYHn4b4eKmDGi6GXesbTs9fauOWZh2kCFOd2ZNdJnkoEGIjhF
	 Wf6ZI+Sp+3ZyJUz5mpIXv/uVhDLwTgDxzmoqNP6Vg9bcSI7ZKzFVWjPD8Iz0RCdnPJ3I4F0FfLFV
	 FQ8azKijRbP+ZOmUwMS6Uw5Qs8TPWQ3Zq/C8tAFMUtSqaFdD1S6+0J1wfFY8Q3dmgD/sn/YUDNrA
	 2Q+0dhFY3Wn7BviSa+R1XGPaZL0D6gTSJ7HbyGgLSqCUy83/GXXggikkc7282qwF6FQIBvkezJTS
	 CZ8rcq7Fj5bp3YcBmc0vZtMG70T7us3rxGOcuFdT4ScEwkgGJVWEZsfOWUsTUEICSp0cT9Fz67h0
	 XMgS0G9Btdz4cza2KkepCwC5NPvQLli+us1QyexGabijyCHeltGCR7otQ8afEcOO4MysF51fBKa1
	 BGHVk2PWCYpW6PHWRYxpUJttUMtqyOYgYHIaHdILSq
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Date: Sat, 29 Mar 2025 10:47:32 +0800
X-OQ-MSGID: <20250329024731.3473152-2-eadavis@qq.com>
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

