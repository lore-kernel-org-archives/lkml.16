Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792A38DEC
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174779; cv=none; b=jHabNg18s+4UH4si75BVt3q2QD8bpvNTVWvEyBC/ubIsL+Tp9lvyDB8NBMCfWXuBK+v4iBelH6v5BM8BVAwV+sQ291nKY2zD3gkDk6b1Jt2/fBo9gy5AALiXlPPo60thn5foKJo7VdWOK3TkbkEnfysAXWuPuNRV0rVaoOvNVRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174779; c=relaxed/simple;
	bh=axQMo6kwHXLN/z4m5heSh2g9GLRPWf/fNqSLlkgMneo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFxd6vC3q/jHhYyj2sXiZNe5Xkjwlo/O8ril0s/XC02ba78UExbbm4QvHyzPBZF6sW3ngfH3BrHTldDj+vLpMOPW2xIIcnHe6DauxRcL+XIWfn9YbjzVzDs/Kp1rBxLM9uugyv4TXDohFHE2AQ2yUNElgX2TjuHR5/ttYMTKyTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fey3SCtV; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fey3SCtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=axQMo6kwHXLN/z4m5heSh2g9GLRPWf/fNqSLlkgMneo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fey3SCtV+HR8TtjYuxrWYfycDLNe1oH+IkGTNbM+vyXATOIqslemOCsxRCNQkp2Oe
	 Dg8AMfz2bvAiTBn8BLE0JE4GqsEz1YQPRw10ukGFAdcuTSPpDJnRi/Tv3XrZbjmx1X
	 hsW+axgbn7OrujpfUfTQqYK4pPwZg1rQpO21JcEI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:05 +0200
Subject: [PATCH v2 4/7] sysfs: attribute_group: enable const variants of
 is_visible()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-4-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=2324;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=axQMo6kwHXLN/z4m5heSh2g9GLRPWf/fNqSLlkgMneo=;
 b=lysOxBbCm0dY/G+aqI9b8gnvKsMBr0hOhB0/aobz0pt/AmQq0I5HBaZmx0uuyJsjmL1h6kiw8
 wAffR0k2UpVCsQK63LTQggrUNzEzUlx0EaEHShOztvsxdVa1hqm07SP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

When constifying instances of struct attribute, for consistency the
corresponding .is_visible() callback should be adapted, too.
Introduce a temporary transition mechanism until all callbacks are
converted.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 fs/sysfs/group.c      | 10 ++++++++--
 include/linux/sysfs.h |  8 ++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 2d78e94072a0d4ed957560c60cc3c5dd49ab6fb4..d514ce8ac4d964676006dc45a31bb9f5fe5fd5dd 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -36,6 +36,9 @@ static umode_t __first_visible(const struct attribute_group *grp, struct kobject
 	if (grp->attrs && grp->attrs[0] && grp->is_visible)
 		return grp->is_visible(kobj, grp->attrs[0], 0);
 
+	if (grp->attrs && grp->attrs[0] && grp->is_visible_new)
+		return grp->is_visible_new(kobj, grp->attrs[0], 0);
+
 	if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
 		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
 
@@ -61,8 +64,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			 */
 			if (update)
 				kernfs_remove_by_name(parent, (*attr)->name);
-			if (grp->is_visible) {
-				mode = grp->is_visible(kobj, *attr, i);
+			if (grp->is_visible || grp->is_visible_new) {
+				if (grp->is_visible)
+					mode = grp->is_visible(kobj, *attr, i);
+				else
+					mode = grp->is_visible_new(kobj, *attr, i);
 				mode &= ~SYSFS_GROUP_INVISIBLE;
 				if (!mode)
 					continue;
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 3966947e78b8c030971daf5ee66bf5ab40bc2a17..1807b0369bd4d993deab81c4497903468b751a19 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -104,8 +104,12 @@ do {							\
  */
 struct attribute_group {
 	const char		*name;
-	umode_t			(*is_visible)(struct kobject *,
-					      struct attribute *, int);
+	__SYSFS_FUNCTION_ALTERNATIVE(
+		umode_t			(*is_visible)(struct kobject *,
+						      struct attribute *, int);
+		umode_t			(*is_visible_new)(struct kobject *,
+							  const struct attribute *, int);
+	);
 	umode_t			(*is_bin_visible)(struct kobject *,
 						  const struct bin_attribute *, int);
 	size_t			(*bin_size)(struct kobject *,

-- 
2.50.0

