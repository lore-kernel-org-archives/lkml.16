Received: from smtp.cecloud.com (unknown [1.203.97.246])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD7A24EF97
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.203.97.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691736; cv=none; b=k9woDKs4B919HtvaWzUU9Bsj7Z2qvWgThotbft5KcKTdNiR92CsZi/+wlw2W6T+irgfRAiEScM0Cgctbqqlpv7F0ONrp11VoTyfD3eEV5tiVqVoY9yX440Y+h5vpmEWnKZxcllOKKGITh+RYKNVQgbW8gHVwosu/zxd1gWh5ogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691736; c=relaxed/simple;
	bh=i7yUaupibuWSPGZFLZN+xpqWLFpTgCZVc6sr3Uk5OcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7Bwm5kyAluv+PInzvhSh0Qr4cftnACeSjJEdEH8eRX1u89Z5pznTB6D2qCm6BZm8/fxdYZ1aJC2Cv6X57JyHDDt5oKZaUO9JMObe1sbgYtB+NIkR+AfuQDhLFAZ+JGa8suBxsv4kDC5aU9u9Fx9RdzVvxtSFmbCssvyNnsCGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn; spf=pass smtp.mailfrom=cestc.cn; arc=none smtp.client-ip=1.203.97.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cestc.cn
Received: from localhost (localhost [127.0.0.1])
	by smtp.cecloud.com (Postfix) with ESMTP id 22BE07C0112;
	Thu,  3 Apr 2025 22:48:43 +0800 (CST)
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-SKE-CHECKED:1
X-ANTISPAM-LEVEL:2
Received: from localhost.localdomain (unknown [111.48.58.12])
	by smtp.cecloud.com (postfix) whith ESMTP id P1609374T281456773296496S1743691722030876_;
	Thu, 03 Apr 2025 22:48:43 +0800 (CST)
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
X-UNIQUE-TAG:<a40d0e84f2240df21e6bc4039f702bdc>
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
Subject: [PATCH v2] nvme-tcp: Fix netns UAF introduced by commit 1be52169c348
Date: Thu,  3 Apr 2025 22:47:48 +0800
Message-ID: <20250403144748.3399661-1-shaopeijie@cestc.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bd5f2f8a-94f0-43b0-af02-565422d12032@cestc.cn>
References: <bd5f2f8a-94f0-43b0-af02-565422d12032@cestc.cn>
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
the given netns, which results in a use-after-free when the
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

Changes in v2:
    1. Fix style problems reviewed by Christoph Hellwig, thanks!
    2. Add 'nvme-tcp:' prefix for the patch.

Version v1:
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

So I would like to use the 'init_net' net namespace.

---
 drivers/nvme/host/tcp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..9b1d0ad18b77 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1789,8 +1789,14 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
 						NVME_TCP_ADMIN_CCSZ;
 
-	ret = sock_create_kern(current->nsproxy->net_ns,
-			ctrl->addr.ss_family, SOCK_STREAM,
+	/*
+	 * sock_create_kern() does not take a reference to
+	 * current->nsproxy->net_ns, use init_net instead.
+	 * This also avoid changing sock's netns from previous
+	 * creator's netns to init_net when sock is re-created
+	 * by nvme recovery path.
+	 */
+	ret = sock_create_kern(&init_net, ctrl->addr.ss_family, SOCK_STREAM,
 			IPPROTO_TCP, &queue->sock);
 	if (ret) {
 		dev_err(nctrl->device,
-- 
2.43.0



