Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4261F1311
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164507; cv=none; b=FUKmX/eTylhRJnMT6QUTG+ZakeMajLgbim99CUIL0GmUoCAg9PSgaDjjNUjp4Y5iPKd3YSrjLoxbzKhP5FQsa8l5sSOoC5PqR4bpxHnPow2yvEazTJWQNgdPuoXNEbUm2OXNgiXTZSW++40TF5Eqso0eP4JOsHRxsqPvWyi5cYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164507; c=relaxed/simple;
	bh=4zpcS6wUru/+6aFWN7fu687cdWXnJvlcM9KfgSkXdZ8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=g30xCqqXBnjbWEvlLcv54CM/fwFOKu2C9d8UIZbFfcK14XGziP8BnwqBjL8jEHqokfvY181ZwtcBY8P5TDMVmXo88G58pZ5nXzNWuOLC8y67g5Bnr2PVxcjkkmnRNi6OJdVxWJ/OYXKJbYotrFgI7w7d91CtT4Yx39D21+gdn/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Tt156JyZ; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Tt156JyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750164495; bh=4ewfJyVfMnQFyQG6fKQO0JgYuHdUKoj68TAMekZGkts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tt156JyZR0snTwNBp0GAtMFEKdj2LICHX0ZD6Qj1HSpKNu07aX7USIBTLzoKCdeu4
	 4/Ntqal2XoHZLtfZHMd2h7zIXz4KXmwn3km8o5eJFLgH/5YDrOi2rUYztyp/Z+J6KQ
	 BTMmqDP0bwZiTB/Jyjf92UbkoVBtbn+XJeWfKsZ8=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id BB992888; Tue, 17 Jun 2025 20:46:57 +0800
X-QQ-mid: xmsmtpt1750164417t2z0pu6pn
Message-ID: <tencent_5C66A03CF936689664374C4A0A754B765709@qq.com>
X-QQ-XMAILINFO: Mm/Yx8ZY6QnD0yBpJ/GCrBYF1K9RmFiR1+6yEp2f0g81stUj8sSVtOIGFNZmX5
	 hPdLnYhb258f8R05oWfGbozeztvyBrgvdtWf/5FeHtq1ha6wihAGtWHmeDGcqRT0UNWQYHrR6jEc
	 Set+ek5NtunYdOj+jkYhXYBlDIeslSI/4PZH72QSIHfKmN9z3faWYYwTW4gmQs2GS+gzkqworKdj
	 qZEMR8VkGoTkVT0GbcIGvVTIaSDq3SQbatARhuJRH4twjFWft+WmObXO76ISI9XmEqJx1hR2/M3K
	 ZhmWF12hAk0Tv1Paz5kUG2qSHZ9l2U+t4B1lk+lYsR5NPfD89oHAh/KoPTwG/dVTBkkzmQ1mI5ON
	 Ckn9wLv54jq+6L+9Qs5STt94J4ZVQm1egzjM4d0S94acMhB7HMQICFLIHt7Q88vllMm91qQ6XIcX
	 zN8DdQV9HI+1XTyAhMrzLj06XiWRP+a4ocYcP+bBsfCmpQji8a/QGIJaNcq5s73TJ+7Hd9DFk9hy
	 CpzNCP6ucdnhf/eYIRfThnrLATUfQx7s8ekG7hPNEYoN8ru6elxxsMOv/DnB81oLhEF8VCdTb1bC
	 ZqJcvuW/b3jl72vGFoR6M/LjaMLmC3Sy9LdPr2CTGvVfVRygCGEPq4t/qZjJoK8ZIhJ9j4sonhq9
	 Hm/Ui71Gollb1UeSRJhG+oqyKy06Hrbned2LZbREXHFT+LiOmsGzFBh5zriwI3IRUTyMnJTD9Oay
	 4jNmPx3UdhJ0Ba7M1c5aJNE+2MXGXuNv9WwDpgcA60+eb+L1JHl0nZcHxbmlaM7VTNpK8ya8hHCN
	 Jr5m9rkOZT45o+B7Kh6nOrwemEAH/SFUbRXrIyB4SHgb1Z6F4vSGenRwd1LZ5/EWtZVCa7ZneIaW
	 7YlNwcnxtxo714aFjEPShUSBNmOFiaIgjHuW81aiTxbjHmASuNhQ3IhvOD/VWMG47P5V/4hZmEgv
	 y//VKf+EcCg/fgTxSXkA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
Date: Tue, 17 Jun 2025 20:46:58 +0800
X-OQ-MSGID: <20250617124657.837717-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685120d8.a70a0220.395abc.0204.GAE@google.com>
References: <685120d8.a70a0220.395abc.0204.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/namei.c b/fs/namei.c
index f761cafaeaad..5b8a69d882d1 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2005,6 +2005,10 @@ static const char *step_into(struct nameidata *nd, int flags,
 		if (path.mnt == nd->path.mnt)
 			mntget(path.mnt);
 	}
+
+	if (inode && is_bad_inode(inode))
+		return NULL;
+
 	return pick_link(nd, &path, inode, flags);
 }
 
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 756e1306fe6c..10006241fa8e 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3027,8 +3027,10 @@ int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode *new_dir_ni,
 	err = ni_add_name(new_dir_ni, ni, new_de);
 	if (!err) {
 		err = ni_remove_name(dir_ni, ni, de, &de2, &undo);
-		if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo))
+		if (err) {
+			ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo);
 			*is_bad = true;
+		}
 	}
 
 	/*

