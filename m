Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71353AC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745146087; cv=none; b=AgYpqk5sckQxtUBnzX3c4/XBSNq7xu2thPNdccBKggyQyoFDtZvGyxtCbZIa1HBbUEP01NdNw7CgdULforKkbxcfyDV0vIe+G9N1gokifcEosLzVZBMXegRR+SDqPYxNBFxJioyQgbagAcVLWwkeKnGHsClsEImR93BZPSLv0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745146087; c=relaxed/simple;
	bh=MQJ6vIxK6wL4cRlnGr4pyTZNffc5UIzokVnWloZn7pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WT9e3B0dz73W9a9+CbVFy3p3LkK9gkpysPznCnwNAjHVcnch0gEWhP9kHgbVL7H6YEFE0wvXHKSGeFuX239CLcKuFeePmqiMWP5QqKm1nzDQTJAbsLIWWwYONs+Jb8ALa/gE7FTJ8Fo4iEoe+lNMJ4dA3RHNh9WKU0PtkDgi9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 03E7D298566;
	Sun, 20 Apr 2025 12:47:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id BRkj1ldQ_UCU; Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 94DBA298567;
	Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 56sgopLhutVU; Sun, 20 Apr 2025 12:47:56 +0200 (CEST)
Received: from anvil.corp.sigma-star.at (84-115-238-41.cable.dynamic.surfer.at [84.115.238.41])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 21BE0298562;
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
Subject: [PATCH 1/2] configfs: Add CONFIGFS_ATTR_PERM helper
Date: Sun, 20 Apr 2025 12:47:25 +0200
Message-ID: <20250420104726.2963750-1-richard@nod.at>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This new helper allows creating rw files with custom
permissions.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/linux/configfs.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index c771e9d0d0b9..698520b1bfdb 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -120,15 +120,19 @@ struct configfs_attribute {
 	ssize_t (*store)(struct config_item *, const char *, size_t);
 };
=20
-#define CONFIGFS_ATTR(_pfx, _name)			\
+#define CONFIGFS_ATTR_PERM(_pfx, _name, _perm)		\
 static struct configfs_attribute _pfx##attr_##_name =3D {	\
 	.ca_name	=3D __stringify(_name),		\
-	.ca_mode	=3D S_IRUGO | S_IWUSR,		\
+	.ca_mode	=3D _perm,			\
 	.ca_owner	=3D THIS_MODULE,			\
 	.show		=3D _pfx##_name##_show,		\
 	.store		=3D _pfx##_name##_store,		\
 }
=20
+#define CONFIGFS_ATTR(_pfx, _name) CONFIGFS_ATTR_PERM(	\
+		_pfx, _name, S_IRUGO | S_IWUSR		\
+)
+
 #define CONFIGFS_ATTR_RO(_pfx, _name)			\
 static struct configfs_attribute _pfx##attr_##_name =3D {	\
 	.ca_name	=3D __stringify(_name),		\
--=20
2.48.1

