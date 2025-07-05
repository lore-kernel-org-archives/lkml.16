Received: from mail-m83240.xmail.ntesmail.com (mail-m83240.xmail.ntesmail.com [156.224.83.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24023881E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.83.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751772783; cv=none; b=s3iLoqj5cy3Kd4n49VTLgJjHdnmF1Ze65bdaihgrKofsn9TNBgSDiSNB+vtmz2u5VdHUAaXFhlWe+GaPJmi00HuA/n18hKsCZdS92oL5B2in7PTQs7nyLyX6ujHDR2+j9FNdFZTNSshEoHLB9s3ZQHN7VxbEM/B/iRqsFR8RU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751772783; c=relaxed/simple;
	bh=w7rA17lwUWoB3hjmWs9ojGXEi+yhbK/jo2/Ny9s9QZg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=QRiFwi/JT2UUdcdgVmNNayvhVVUads4Z8vuOdCKj1N51qnb9Ptn7+U1k8ymj6RyvJTfgGLvR0GwSaSqnqK64+nBdj2RhPrm4ypDpcmj/7WactFzUCcvH/VGMbJ5TKwkjCOwouzDDZYuttXpQHxPQXmSC15tqYUjNFvqrlHVTznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sangfor.com.cn; spf=pass smtp.mailfrom=sangfor.com.cn; arc=none smtp.client-ip=156.224.83.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sangfor.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sangfor.com.cn
Received: from localhost.localdomain (unknown [IPV6:240e:3b7:3270:7ec0:65c8:5d28:7d9f:a739])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b0484a1c;
	Sun, 6 Jul 2025 00:16:05 +0800 (GMT+08:00)
From: Ding Hui <dinghui@sangfor.com.cn>
To: sfrench@samba.org,
	pc@manguebit.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	piastry@etersoft.ru,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Cc: Ding Hui <dinghui@sangfor.com.cn>
Subject: [PATCH] cifs: fix an OOB issue in cifsConvertToUTF16()
Date: Sun,  6 Jul 2025 00:15:15 +0800
Message-Id: <20250705161515.12202-1-dinghui@sangfor.com.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkJMVklIGklJSEJJSxpNT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJT0seQUgZTEFISUxLQUweGEtBTU4YQ0FOH0lDQUwfQh1BGkxIQllXWR
	YaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSkJLS1kG
X-HM-Tid: 0a97db5f9cf309d9kunmab1a5d7ed8696a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6Ngw4AzE8TjwpMys0KCgp
	NDcKCQ1VSlVKTE5KTEhJSk1NTkJIVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
	QVlJT0seQUgZTEFISUxLQUweGEtBTU4YQ0FOH0lDQUwfQh1BGkxIQllXWQgBWUFKT01CNwY+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The OOB can be triggered by making symlink in reparse=native mode.

Limit the srclen can not greater than maxlen.

Fixes: 2503a0dba989 ("CIFS: Add SMB2 support for is_path_accessible")
Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
---
 fs/smb/client/cifs_unicode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/cifs_unicode.c b/fs/smb/client/cifs_unicode.c
index 4cc6e0896fad..cee43e71fa87 100644
--- a/fs/smb/client/cifs_unicode.c
+++ b/fs/smb/client/cifs_unicode.c
@@ -636,7 +636,7 @@ cifs_strndup_to_utf16(const char *src, const int maxlen, int *utf16_len,
 		*utf16_len = 0;
 		return NULL;
 	}
-	cifsConvertToUTF16(dst, src, strlen(src), cp, remap);
+	cifsConvertToUTF16(dst, src, strnlen(src, maxlen), cp, remap);
 	*utf16_len = len;
 	return dst;
 }
-- 
2.17.1

