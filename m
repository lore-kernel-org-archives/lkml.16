Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A931DB34B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132156; cv=none; b=bTDEjlI93wNGuXtOIE1/KFRcdyGiUtzHzVa0/POmxNubl4QKeKFLvb6R15uz95GpMPBMxAPM/Bx7fXDytENydW7txC9dvbl+G2KJoQz7k1DLFrfbte7QDNnAmUZIRaQtrsJFj4X06a4LjDLU3b9J8zyXdMxPQ6ursb7d3ZdxMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132156; c=relaxed/simple;
	bh=L5g0PkGPSJOiCfw2MjofVlVLMfOKrDIGLngWSTSOBJM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=koEj6dBTQ3dLoPlO+usIG3yQeZYCZ2R481fsAWal62d95KcNSlZzvUN2cB7IZHaaULR9cXFo1uLSNyffprYUsPYlHNqDA96GJzq6vxnhMS3IozPgS3hFFk6+/gqGeljMvWJV6XYPgrNPMPK4oSaIqjvwa6rdLdOABPf/4KmyQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kicMZ6G6; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kicMZ6G6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749132147; bh=AyQ/K4lqOYsGnXqOB2tPbBC5xyXIKt+7XorqKIlZ2Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kicMZ6G6+Jec/lujTyjergkTP2g54Ykpc9YJyA3FjnzjnrpXupk4J/2U22y/d27WV
	 bPV+H8yA7Oit30xtC78rtol5xzix7bYOM5cp3empEZ+daPjb/os6fG/WKKeVmz5dLT
	 xB+4cYpO1NM7UY7v/vez52Iy++6AFiRm2CHDMM7w=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id E0F86C60; Thu, 05 Jun 2025 21:56:15 +0800
X-QQ-mid: xmsmtpt1749131775t6r0h47d6
Message-ID: <tencent_5E9E6E1BDB4B9B1B062565BA47BB9A336A08@qq.com>
X-QQ-XMAILINFO: Mg/0DM1Zd+nH1sGD8QNgTVbF5aJBb4AotGy7AN1N9Gjh2HjXpMvldwxU6TBoqb
	 XLhFv9mOuBhJWTe3VHx3N3TCKWoO0G52wi42Q8D+F5k4NyHXfVmg+R1d2M3hMtQy1ODcgWrBRjG8
	 I3K1v13wj1kXjCli/U7Ab0Dx2YxYnq6lKMbuFc6DysnEGkYl8BOluvi4tnYItyaE/c/J+PjHOnSz
	 9zhLxGEMK4ySz0roBZg4SaYJk+/MUNkCA+5qU5FNHXhiYsSCoi5O8635EHqYKY91xblDMWIXcUrW
	 J8FFT+AXQjkL4rTyxQmn+jvv5jHSVke0rhxtfb9HR3u8TGfjCFsk4TbySbDyh6OLHRklIvfV+9S5
	 QcPwQ0/Ylh9nR3X3RhTAjUABDCpAzNt/WNoMYNj/xfzwKn4Sxg4OsqNcLKvRqwGr/lDJk9YfVNQc
	 ET/1VgQEKdW2FszBzUjM1t1dGjl38dNs8/xRBHbXYG00AqGAbAYVN9ZW1zzwCYZCoDlBMaoWbl6r
	 y7t4DE0TLZ6D5WX5RWwcBi5WcLAtULzCO7QoWWFSzGEliZmsca+U11TMdkVtAGzD9idVTZNU6KEI
	 S/MVKupr00vm0oUdXFVb+y2yjVU8kZEfROFAChjUpqGo2rSWVJVSa/nA/cjIAcWR7rmSOqDm1FrH
	 kTOjG7M5OmXcL1xCmHsHDXkv2mcfr3euctQ2QdPLaprRNp1bLSlkfUaQXdSG+QssMyRVMslvz2g/
	 N71GQsvvr3sHGB8Cf/zQtbIb47jTpQ76RPxa2QWXvOVfSUyR4I1VvfhF+XZNiW4k8Mb1hmIcLWFG
	 L5HEfiaLDJBGuhPz7C4LLzWsBksU1XOo7fPKm8OqmAIKkKtbg8g2PGcjfNkTgakF0nts0+5buxyJ
	 DMXdKzyA+DCOQbQOtCXWvxJntxsOExkKy8mXZmxwB4pwkkIQwQys2Hx5f80N2CSmNAFSabdopO
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls
Date: Thu,  5 Jun 2025 21:55:53 +0800
X-OQ-MSGID: <20250605135552.3698955-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <68407923.a00a0220.d8eae.008f.GAE@google.com>
References: <68407923.a00a0220.d8eae.008f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b6da80c69ca6..4f511cbd392d 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -303,9 +303,13 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 
 	if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
 		return true;
+	printk("keysize: %d, name len: %u, nls: %p, fn: %s, %s\n",
+		le16_to_cpu(e->key_size), fname->name_len,
+		sbi->options->nls, (s8*)fname->name, __func__);
 
 	name_len = ntfs_utf16_to_nls(sbi, fname->name, fname->name_len, name,
 				     PATH_MAX);
+	printk("nl: %d, name: %s, %s\n", name_len, name, __func__);
 	if (name_len <= 0) {
 		ntfs_warn(sbi->sb, "failed to convert name for inode %lx.",
 			  ino);

