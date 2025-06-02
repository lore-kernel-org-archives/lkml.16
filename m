Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7B14C5B0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748839372; cv=none; b=OH1RUMk1CfjYMUyLWFfAcdmixQmV0+EH7lSciPFuHvs0nIegGOlIrDo3WU29E65M5XfMmYfyM3iNUzwsxTHYMKGNjhT4eMf0LlDnmXU6du/ngT+PiqB2O7S9hn7kXmgmqCjwJU1MzfrLpuFmclbQ0uMRUZ+5+5b2ie9ifx/3xXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748839372; c=relaxed/simple;
	bh=/H4AcJclBfoYYvnTJn0tBaB9d+k9Pg/5CnVkWR6g0dg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=NJ772CSEdm2NZpOD6eoybh8tu3/dveRcuA6IpMhDkvg4KS+6jhP+lqPJi8ywx+VBw1GaOc2cOwAyQjJecrTx9PFAdZ7eKDbrR+mhTtbHr6Mt+pK1txrS+RGhhcOqX/DUKcw5daflowfZ6npQR2nxvbtsUrmZYCudstKtpMdURA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=F4T+4s7X; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="F4T+4s7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1748839054; bh=TTjrmsDD2vElry3ZbewzqyhVTR+0tSeRT+GxkidNnC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F4T+4s7XcqExqWm4mKSImnv7ISDVI3hvxSM4H0Mex7/5TY5sAQ1/VrhSZcIeUC4cS
	 9pxs0aTFsHEncND24nebb8QHArYOGtYlduCBrr/H3XK1OYWBCfPkG7NfDelIMSn7A6
	 1y1+b7Fz3FA6NNyo4gccLUpeKmhyU5lXXZtcXM9M=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 95C86C4A; Mon, 02 Jun 2025 12:37:28 +0800
X-QQ-mid: xmsmtpt1748839048taox5u26r
Message-ID: <tencent_6B2EF84C8DE7C286F312E5C64889B9EEE806@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTSJrm1+4V930orNLxe7C6SObuKxDAYYSfXqjJZMPa3JYCNXxW3Q
	 K+pjYuYEsUS4q9rQZd8kFu63Re0AAajvJT0CRLi4iu8/UpY3paXf982ke42ez3XWBTBAiYfCd50m
	 KemIFuE/Ads0hhbT1Ao2wOElgto8jbIY1qRE/8bqyQ0gnFHRQUHqXMcqCx4268RqBPCnPOsLiWjh
	 GwAIKdu5Aew0W9tOWKjLjmiHk3WX3Iw3g+D0h4k3pBEyIoX+YjtqEqKjedjjYFrSuL69/w4tjwiq
	 MVL7QtV6U0fuGiQ42Y9GbmK5OMoslzlunJ3473Ms3VLCmhFwDU42xGkPFJLEOwP2EPARVtKdAnU5
	 lVD/zk0ERKS7ppKMmuCZRVwFQOe7hZRY+DTAX/Re+wDW0peNwN12GnVua4VH2h12KmZg/EAmM3KM
	 JP3GXyapKPAsgSGlVoHAXwil4WQA/zW0AweGt5xGR5w0lbm06bfXa0I2c1yB7j0q+De3Y97c5mx6
	 /sD9VLtZDD08akahkisTiBGUpbg7Q9oDy1OVPHoX3gfIBS4/NgM/Db+nJX9dqhmAYR2rDVN7g4I8
	 6Wf22RqsKEcHhuLFL0yz6hfjwskuYiOlAihLuPaZKzi6SHksnpl7ffGSZLzuG1P4yMntk2/UxfYB
	 1jmTBF22C4YaRqn5j+Hbt4kBO2xejmMXc6sMUdClW8p/fi0RbIb0/yDcpGH7xNpHgqh8pagMDVFp
	 afYUPWYNPkOxgsgbejPm3FedL5WR8bg0WqpeS09EebgUtoJ1HY4gcW1HLkFj/HJPZh1JAWIL6pUL
	 L0XpITUhAIVq1epmu+sAGxLZJbzT2EdyFQyzyLdVuMaXXsJx/LvEx06V+iU/6rWiBhTHLiliBnnA
	 ygTRWNUHzbbPGz3o79EIGGt2HSQHPZxFQyJy9ZJzN+hEooJrqvkdm49cXccE+gUUNrznmsxxP5OX
	 ZViKkiLbEv5r9aBTy6SpjsrGXzQOWTm5SUMaLVxpg=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Cc: andrealmeid@igalia.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: [PATCH] futex: sync set the hash table slot
Date: Mon,  2 Jun 2025 12:37:09 +0800
X-OQ-MSGID: <20250602043708.1500988-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <683ca389.a00a0220.d8eae.0035.GAE@google.com>
References: <683ca389.a00a0220.d8eae.0035.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent different processes from setting the hash table at the same
time to avoid hash table damage.

Reported-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
Tested-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 kernel/futex/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d37..818dc082670f 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1754,7 +1754,12 @@ int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
 			return -EINVAL;
 		if (arg4 & FH_FLAG_IMMUTABLE)
 			flags |= FH_IMMUTABLE;
+
+		static DEFINE_MUTEX(fha_syn);
+
+		mutex_lock(&fha_syn);
 		ret = futex_hash_allocate(arg3, flags);
+		mutex_unlock(&fha_syn);
 		break;
 
 	case PR_FUTEX_HASH_GET_SLOTS:
-- 
2.43.0

