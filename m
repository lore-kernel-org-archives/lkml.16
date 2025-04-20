Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C741433B3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745146089; cv=none; b=XLApH3CPGDaLe9Xq+af9BVvTtSLnFxmujbGRAIpXxmWZcPVTXq4X7EMh/gHnimx4NujuGTV+EgXwxIg0CFGzteQI5d9FCA8Ja+i2NMcNajZskQcSRave5G5q4b5wOn2oq2v7Epn1/DBG2FOAH3B68dTccP2IuBTEwR7v/S95ZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745146089; c=relaxed/simple;
	bh=tmUNixq6zPlv+TrOVRSV/A+QcCbcaAEOJtkojtHcOt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8JHXHelOcLQA5ehkLY0Iwentz2CKhnZaM+OysI4KuwpJmj8pS4yVjto7GhbhLV0kIUMisEK3bzbPEvUa6dsteYF/1Ogu9hqJWSAuphmrD85BRTga7sL/qiT895U87vg6wqH1X7c+xdIWeofOGa0CHFeYQvzfJFKGif5bboVcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3A956298567;
	Sun, 20 Apr 2025 12:47:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xY4LTf1S-asA; Sun, 20 Apr 2025 12:47:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E255B298562;
	Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id llVxRfCL_f69; Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
Received: from anvil.corp.sigma-star.at (84-115-238-41.cable.dynamic.surfer.at [84.115.238.41])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 83470298566;
	Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	a.hindborg@kernel.org,
	leitao@debian.org,
	kch@nvidia.com,
	sagi@grimberg.me,
	hch@lst.de,
	upstream+nvme@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] nvmet: Restrict in-band config files to root
Date: Sun, 20 Apr 2025 12:47:26 +0200
Message-ID: <20250420104726.2963750-2-richard@nod.at>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250420104726.2963750-1-richard@nod.at>
References: <20250420104726.2963750-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is no need to have key material world readable.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/nvme/target/configfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configf=
s.c
index e44ef69dffc2..7327543f161d 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -2128,7 +2128,7 @@ static ssize_t nvmet_host_dhchap_key_store(struct c=
onfig_item *item,
 	return ret < 0 ? ret : count;
 }
=20
-CONFIGFS_ATTR(nvmet_host_, dhchap_key);
+CONFIGFS_ATTR_PERM(nvmet_host_, dhchap_key, S_IRUSR | S_IWUSR);
=20
 static ssize_t nvmet_host_dhchap_ctrl_key_show(struct config_item *item,
 		char *page)
@@ -2161,7 +2161,7 @@ static ssize_t nvmet_host_dhchap_ctrl_key_store(str=
uct config_item *item,
 	return ret < 0 ? ret : count;
 }
=20
-CONFIGFS_ATTR(nvmet_host_, dhchap_ctrl_key);
+CONFIGFS_ATTR_PERM(nvmet_host_, dhchap_ctrl_key, S_IRUSR | S_IWUSR);
=20
 static ssize_t nvmet_host_dhchap_hash_show(struct config_item *item,
 		char *page)
@@ -2187,7 +2187,7 @@ static ssize_t nvmet_host_dhchap_hash_store(struct =
config_item *item,
 	return count;
 }
=20
-CONFIGFS_ATTR(nvmet_host_, dhchap_hash);
+CONFIGFS_ATTR_PERM(nvmet_host_, dhchap_hash, S_IRUSR | S_IWUSR);
=20
 static ssize_t nvmet_host_dhchap_dhgroup_show(struct config_item *item,
 		char *page)
@@ -2217,7 +2217,7 @@ static ssize_t nvmet_host_dhchap_dhgroup_store(stru=
ct config_item *item,
 	return count;
 }
=20
-CONFIGFS_ATTR(nvmet_host_, dhchap_dhgroup);
+CONFIGFS_ATTR_PERM(nvmet_host_, dhchap_dhgroup, S_IRUSR | S_IWUSR);
=20
 static struct configfs_attribute *nvmet_host_attrs[] =3D {
 	&nvmet_host_attr_dhchap_key,
--=20
2.48.1

