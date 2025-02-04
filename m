Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954D25A62E
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627870; cv=none; b=Eka22bNaEl2TfhYfAAoZkdINA/oAxLVK3ywzwI7+Qlz6Jxk1eObxlF8szuU0NJACAvhuNN74TaUxio3R13Ro42Ar3tfXBsmiqF/7IG2EheT/N/hoxpBH3g9yhO02SQxUIZPDHsqU5bofRnhHdnSk9tqTsuVZvVLWXujjn7DKUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627870; c=relaxed/simple;
	bh=x3gS99frbO3M11Kq2z2dRhi515gnUAm6Lo71grmzDu0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=T4idl7EYcAgTqpj59JNY5I8J5D8ZnxcP+Cwl1sAD4PzH+an6a6IYr3LjWqdzuZQT6ipuTtRDdw5VFLJ7YVs4Ditcn1ArjJbob+zChMW1xwnwDTpWJUpPy+tMMYQjSZ/vE3HZMez8HZ5GtQ6Akc25ps0D5jam28sZNkgKDZ/cDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Fl5/tSd6; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Fl5/tSd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738627859; bh=7JuVwbOv+Wxcrn4rrht8Omq2HaXmH5QmyNGlBLnvpYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fl5/tSd6EFRJUaHWbIzo6zFkEaMmEQr8WZAfUbSRxyh2qTPGSH/q5RK26dw/UPP1B
	 FxK/EtGkcVJ90vUXjlMAQlxIeedzW309h6hatNl077SjSro95pnif4+vxR4MAqY5QA
	 RxPVg7+Zf5G5WPp8XHxmrFU6lIIJhKP2tC8dDHco=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:82e5:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 2B69ECA3; Tue, 04 Feb 2025 08:10:54 +0800
X-QQ-mid: xmsmtpt1738627854tshxww8f3
Message-ID: <tencent_5BA7330C9E8B1B5B4B051B792515BADEBB08@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Ju2kcgXFnMIi/ofLuXgcY9lgb9cSEcj6Ln4LyN/svafijn/N9KoM
	 7DSok2AaUhxYJLFU6j6lMyzr5JMU++Brfsey6PQZa3u1AmdieUt4YN0lOYN080wRDGMCUT5xRmVs
	 lrXPWCdHu2sJdLDNcN3DOgmhL+gg9Ww7LDtH04Tob2l5Ja1RvODL4X4aH0IC7MWwuTPFLt8rdFkx
	 tYV84DGSWv+qXFXyKfY8lOvhZ9aFnG/1OcjVmQJm/Tf4/8O2daF9YBDSSnZb7HjxlrTcKZIElr00
	 lBhOW3Qo8ehTgd1QOYlqJQl81twGOihpU7gSTXc6GbdfngO7RowCIVWELGATpSuoTEMl3EOWImyF
	 KF68J7KZtSR6zyKvpGBS2+9TP8ZY127POCSkSyH88zMGNq5WjihKOV8jPpWpgXlEeAjG88K7YYTs
	 vPzl7hW8LkHR/HH3OEyoZwRrrYvQukEpr2I16gdyQIW6vsUJxqEAS/4au/jfmct7haqFIhwQws/f
	 pz9wsPyuwgDecU1RqAnEYiKAqvkqW4DrZgu10EbZFFxScuQ+CSs6CTWQFSWIGHA9N9kmzTTs6hNs
	 PDbx70E1BcfsC5PzB23Mj06Ay87Kll6piLwPLZ3Xd7Yek7yIiukJQ9A6nwWjx62uBPOwcBq1afY1
	 ibnrHvZbVoP7hA7n9IBpmkfKrVhh/Sb6vOeVPI1ACTBLT6rC5E8psfBXDvw5Yjxkn3P0bQg1HUKX
	 P+O+CUhzmJgVOtabirtxLzkyUteNM0g3izQGu6jfA1AxKKced8/BHJ4HsGuhNDIf5nV+4jDQXvnW
	 uBsD6PEE/sGAfcyjWKtTkVTLfK9q075wHdhoN76rEu/FNAD3Crnncel0xZgHNsu0iYWX0l0O4XDx
	 ++tEKUSRablahek5fHnbBNLKyRxWNHn/Tq6k9+NlcLkS36BjU0Don/XztJG8NzKjuLGAfUWrMDm7
	 vVA16KkbdSWYck/VZtmEauJbDNbcIP
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+a9c0867e4d1dd0c7ab19@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nilfs?] general protection fault in __d_unalias
Date: Tue,  4 Feb 2025 08:10:55 +0800
X-OQ-MSGID: <20250204001054.1579538-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67a11d8a.050a0220.163cdc.0051.GAE@google.com>
References: <67a11d8a.050a0220.163cdc.0051.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/dcache.c b/fs/dcache.c
index 9cc0d47da321..96b21a47312e 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2966,11 +2966,11 @@ static int __d_unalias(struct dentry *dentry, struct dentry *alias)
 		goto out_err;
 	m2 = &alias->d_parent->d_inode->i_rwsem;
 out_unalias:
-	if (alias->d_op->d_unalias_trylock &&
+	if (alias->d_op && alias->d_op->d_unalias_trylock &&
 	    !alias->d_op->d_unalias_trylock(alias))
 		goto out_err;
 	__d_move(alias, dentry, false);
-	if (alias->d_op->d_unalias_unlock)
+	if (alias->d_op && alias->d_op->d_unalias_unlock)
 		alias->d_op->d_unalias_unlock(alias);
 	ret = 0;
 out_err:

