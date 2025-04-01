Received: from smtp.cecloud.com (unknown [1.203.97.240])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B029C1DFE00
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.203.97.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743488437; cv=none; b=e9gHtknL4vyp+cCCl/fkwzXbmymDpnprgADMn8JmPD1qgvB705vqVn2w3axwZQFe9A49snBOBei6fXY04LTR304o+BSNq9IgSoBCSeF0bX9+y7C4q96irOhqKknBsirs9H7M9p29Qy1I9irV/o/g4947JZpDJaMi6dMS6l6hqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743488437; c=relaxed/simple;
	bh=jmV99yArrBPA/nnfmylI1MioIzoi0+3j4hedDcV0kNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgGuPNDpHGGC7WTBvCORTTb0xfu8vpdB9qiwjdYkywmBQoGqNK4ewNQZrhhAVfBBRRg8CWYrz4uxMgDdiyiN6/E3dpKEox8odRHlHMR5sYPES5t2W77Uw8kChBM41PibAnEN9Lfiq4Rg3SsDs+XAETLS/nu+WrLud5n3UOq5/XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn; spf=pass smtp.mailfrom=cestc.cn; arc=none smtp.client-ip=1.203.97.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cestc.cn
Received: from localhost (localhost [127.0.0.1])
	by smtp.cecloud.com (Postfix) with ESMTP id 5B2EA900113;
	Tue,  1 Apr 2025 14:20:25 +0800 (CST)
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-SKE-CHECKED:1
X-ANTISPAM-LEVEL:2
Received: from localhost.localdomain (unknown [111.48.58.12])
	by smtp.cecloud.com (postfix) whith ESMTP id P3907747T281458888339824S1743488424274530_;
	Tue, 01 Apr 2025 14:20:25 +0800 (CST)
X-IP-DOMAINF:1
X-RL-SENDER:shaopeijie@cestc.cn
X-SENDER:shaopeijie@cestc.cn
X-LOGIN-NAME:shaopeijie@cestc.cn
X-FST-TO:kbusch@kernel.org
X-RCPT-COUNT:9
X-LOCAL-RCPT-COUNT:3
X-MUTI-DOMAIN-COUNT:0
X-SENDER-IP:111.48.58.12
X-ATTACHMENT-NUM:0
X-UNIQUE-TAG:<d5211473a6f7e9d5e0070690dcad5376>
X-System-Flag:0
From: shaopeijie@cestc.cn
To: kbusch@kernel.org,
	sagi@grimberg.me,
	axboe@kernel.dk,
	hch@lst.de
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gechangzhong@cestc.cn,
	zhang.guanghui@cestc.cn,
	Peijie Shao <shaopeijie@cestc.cn>
Subject: [PATCH] Fix netns UAF introduced by commit 1be52169c348
Date: Tue,  1 Apr 2025 14:19:34 +0800
Message-ID: <20250401061934.2304210-1-shaopeijie@cestc.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn>
References: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peijie Shao <shaopeijie@cestc.cn>

The patch is for nvme-tcp host side.

commit 1be52169c348
("nvme-tcp: fix selinux denied when calling sock_sendmsg")
uses sock_create_kern instead of sock_create to solve SELinux
problem, however sock_create_kern does not take a reference of
given netns, which results in a use-after-freewhen the
non-init_net netns is destroyed before sock_release.

For example: a container not share with host's network namespace
doing a 'nvme connect', and is stopped without 'nvme disconnect'.

The patch changes parameter current->nsproxy->net_ns to init_net,
makes the socket always belongs to the host. It also naturally
avoids changing sock's netns from previous creator's netns to
init_net when sock is re-created by nvme recovery path
(workqueue is in init_net namespace).

Signed-off-by: Peijie Shao <shaopeijie@cestc.cn>
---

Hi all,
This is the v1 patch. Before this version, I tried to
get_net(current->nsproxy->net_ns) in nvme_tcp_alloc_queue() to
fix the issue, but failed to find a suitable placeto do
put_net(). Because the socket is released by fput() internally.
I think code like below:
    nvme_tcp_free_queue() {
        fput()
        put_net()
    }
can not ensure the socket was released before put_net, since
someone is still holding the file.

So I prefer using the 'init_net' net namespace.

---
 drivers/nvme/host/tcp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..1b2d3d37656d 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1789,7 +1789,13 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
 						NVME_TCP_ADMIN_CCSZ;
 
-	ret = sock_create_kern(current->nsproxy->net_ns,
+	/* sock_create_kern() does not take a reference to
+	 * current->nsproxy->net_ns, use init_net instead.
+	 * This also avoid changing sock's netns from previous
+	 * creator's netns to init_net when sock is re-created
+	 * by nvme recovery path.
+	 */
+	ret = sock_create_kern(&init_net,
 			ctrl->addr.ss_family, SOCK_STREAM,
 			IPPROTO_TCP, &queue->sock);
 	if (ret) {
-- 
2.43.0



