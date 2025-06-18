Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5600317A586
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215842; cv=none; b=GMjYcShOeF2dprWlIQbzuJaBlMg3+PueaHTptu2jQnBNlSViR0YAnBkqb6H8TGO3jglDmlCPpU+ryRw+Y2USVqUfi0WGClD/uV3U8n6pY5Mn4Dm8GlFXImtcI6O+1NqwVTNv0nkx2yp+IUSlJXnSQvIVOWm8/n51lxbgDBRYtVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215842; c=relaxed/simple;
	bh=ocPlLQ5/ZIE6JsIUly4EqqDox9DPZhugdWGvGwd8ZLs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=rlHkq58PoIp7dTjSK4AKDHbm1gb8uPVXz+5qfQaXVYTQWTFQitFMKFIZYgvXsUL5yXqhjcJ7f18GbUp+64sGU29cLGeUvm6bJ1p11n8VUVRPLjbU3t7Q4zbLlW5V7OTkNPPfMJMlz4qYDsWvIp978bQLIOgOt5DtK/NP/OGJ+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QTYtrm5t; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QTYtrm5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750215836; bh=ipgjpwevFTSxmaa5BH6V/G+Q5kvrU+d7B8630zgbTTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QTYtrm5t2Hnrp6gYSgGreFok69pEzWRbK4PqtXM0ds4F99N9MQvocB5fkN8rG7FqW
	 AYq3pvqFNeT9bW9wsuctkKw2LE933l8knmDi5PG47qADaCmgTDq63hsGOpZKyqkG+J
	 nBGuHTJtUICVJSGLAZro2tu9+Ra9sKdPWgU2Aj7c=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id F5B7E12; Wed, 18 Jun 2025 11:03:53 +0800
X-QQ-mid: xmsmtpt1750215833tk166x4k3
Message-ID: <tencent_9967BB8933B49E4B1B104B091B6325E5BA08@qq.com>
X-QQ-XMAILINFO: NUygYfydBsqcjnK+BbP/ygBcJiTi2gTSrfff4wNk/hqQnrYs1rG4uP9Fm7GIwH
	 a4vx4yidzYo4thH10seLmLEob8U5ahZ7COcia4oIg5BzZBjmmEiBWTJMXo+xKADlxKfLuIg7OXMg
	 KzKEowOp39KllXSwkRdZuyqtcP9H+/EL2K7n03Rc8S+EFNe7CaCZegYuDo2Npn+DF357BETTAav0
	 qRJP+JYSLDYQxt5KKxUunUN8i51XEDxE4UKbyVDOLnbM6oj7wcHURQRLpoVP8vexEU4tDniw10t2
	 ShSCkNo5I6HvL6uVDr7sEIK8NW6ZUuKdtPj9a08onc3Y3X0gIkE5Z6kmVgc7TMvdGNiaMspzOxFx
	 ePnC1PIgSYWluZErK+78ZKpCzbt+StCsaWGTrR9yDSise8rIMIWNDIaQsufHxc36YOPKd6QJbFGH
	 /zbpkDieWyC9we9DjiOkzc2sN4NSzo2ULsswdEKvixu6t8iEJmsdfY3hf0w6Pnd/b1yjNXuYjIrB
	 N5KuL7FdLp9kLMBDFc46RuOEIrchp/TFNYEUmUnY7BUmWoQz5R9PJaLjsqdk48iwRVizs+77g5qI
	 WVr3Boa3Axp9SaeEdgZnVNr1YWRsmambzYw5wzrTc5XyF75JOH76dE672SpUhLQMMTBVX24mJZHv
	 7oDWspvr0TMR9t5zjhpEHx3eLhRvmY13O3Ep2EP3g0q83VxwS/mHBd6cQTFImp+nm4RAYI600I0E
	 6iC43/wiBBaYp8riTdzScMo3PpLKUSNp5WPjXdvZH1CUKK3jMTkEl+xUonLTCuYhxgQqZs1SVwsc
	 OlZzRV4tWxCoZkuVx+JW0NvX5ntfO4wN0Nc4xqsmmjRA2x+1mK7z7b5+BSzW1t2M39TYoRBYW7me
	 0HACLs5yQM/NFKw9qMs7mhdM1hKAbLcq7AksavJKJHNbi/6oH0iX8f8k6eNqPZohndp+fMiYlq6T
	 sr6Fk/A6WCLtF7gIwMSAyZgRaVZsFR5yOb0atGTmajm3bKuNAWG34r669Pgkt4
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
Date: Wed, 18 Jun 2025 11:03:54 +0800
X-OQ-MSGID: <20250618030353.1113022-2-eadavis@qq.com>
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
index 4bb889fc980b..291f29a04e09 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2005,6 +2005,10 @@ static const char *step_into(struct nameidata *nd, int flags,
 		if (path.mnt == nd->path.mnt)
 			mntget(path.mnt);
 	}
+
+	if (inode && !S_ISLNK(inode->i_mode))
+		return NULL;
+
 	return pick_link(nd, &path, inode, flags);
 }
 

