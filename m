Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0288F6F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679322; cv=none; b=JrEMsaXQxMdBg5uketLKZ7KOZFNCMNFTNWbGC7f/nqdBOq4JwQU9kx9F89ZUKLQhlQQPOPqtsKnuCbgNrTQARcIAVNRU3oPfRxy2FlHJltZPBwIRWKp+IAAfk+gaxSZ9h8nqbsxJjgF0hO7GF2GRi+654kbql5EqDL9gHAFY13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679322; c=relaxed/simple;
	bh=q5YydfhGtpN4iXoHAO0dYH2QUYP1BayF+l8hxHkskFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5rzTXu5w2AGm6WwQgS8L1AzhMXP5skCZT6uS4IViII/FG43HWG3UalhclNKj5xEhdPnwL+yFP6QcR0fZKIvpSxBx55PEN8VbeXMmhvreDdbblpGPcop+h1DcA41rRWAny/iTpf3qyTZc+M/4HKLp6H/ADRQgdYL5+cskKMc79w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=NV5fAcM4; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="NV5fAcM4"
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:623d:0:640:ecee:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 71BAE60D3D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:55:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 7tTcSFLLkCg0-AjbLSZHz;
	Sat, 26 Apr 2025 17:55:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1745679309; bh=3HM654FexT8qb3OhVQUdDp9BKtsmT1rjSh0VLsFVKCk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=NV5fAcM452mFlB4wvKsd3j0XIbvDzMwtLx51jyMwdKaVFdVSlD1YGDB9oqKXPafBL
	 c6Hz7UCewr0StU0n2PsILFc/k6QCw2YEUVg821myqonX2wr4qhCubuxtxRkn/IN/l3
	 VKrsGpNoU90YRFCEH8IMz4py3MLEDByehlDw6eEY=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.com
From: AncherbakNA <AncherbakNA@yandex.com>
To: linux-kernel@vger.kernel.org
Cc: AncherbakNA <AncherbakNA@yandex.com>
Subject: [PATCH] improving speed when accessing memory address
Date: Sat, 26 Apr 2025 17:53:40 +0300
Message-ID: <20250426145340.46485-1-AncherbakNA@yandex.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 net/ipv4/netfilter/iptable_nat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/netfilter/iptable_nat.c b/net/ipv4/netfilter/iptable_nat.c
index a5db7c67d61b..e6bd63b16837 100644
--- a/net/ipv4/netfilter/iptable_nat.c
+++ b/net/ipv4/netfilter/iptable_nat.c
@@ -151,12 +151,12 @@ static int __init iptable_nat_init(void)
 	 * before calling iptable_nat_table_init().
 	 */
 	ret = register_pernet_subsys(&iptable_nat_net_ops);
-	if (ret < 0)
+	if (&ret < 0)
 		return ret;
 
 	ret = xt_register_template(&nf_nat_ipv4_table,
 				   iptable_nat_table_init);
-	if (ret < 0)
+	if (&ret < 0)
 		unregister_pernet_subsys(&iptable_nat_net_ops);
 
 	return ret;
-- 
2.45.2

