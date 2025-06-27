Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105A3C01
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991924; cv=none; b=e7fd3cY8BQnyMWzewhbFtuh4CRunWquDG43y2xNsAHhw3NZYJ2r5pY1qy51piWtSjRYxMefnsy/AAreUD6x//AMvA6HPElno7I+J4YfhiRnoYdSWpT4a+X2kjx67nFqKpMDdW9GAGUkfq0vL0SW4D2vBB1j2BPm6cr3X+OJSAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991924; c=relaxed/simple;
	bh=DzX/NhNydrE1FbXKlYOIdNNqYXACSw7i/Wy3/su2Q70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcLj/5l5yqtwnFTwKm/FRFcQihEDTqe7Er9KDGITzPYbnsEBeVzR7IJsb+OTubiAv3c5hLXSKc/XwnUIAwQ9E7mf5aEUI72E9KUcZ5/wArMzmOh3Q5KoHHn1sggEqoIACExfrUt0mI2vPluT5leT0sVrf1A3WmOFyUDm8gmxAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD1b19HP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD1b19HP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE470C4CEEE;
	Fri, 27 Jun 2025 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750991922;
	bh=DzX/NhNydrE1FbXKlYOIdNNqYXACSw7i/Wy3/su2Q70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bD1b19HP8i8N55wdi6AEbrP3k9D/ENSAj4fhJSfGgTNBq1amL7xXZKFfS3A8o/05X
	 +F+3uEBzng1VHCFyIaiUPcYLpEHofiBrfssusXE0zwc1ktLtNNLVkihg35hx+larQV
	 ogW8n5VPbxlhZFXl8uq5F5sQWAHzljb6OtLB7+xUX/xhzCZghPRWwoNkLNtbS3HYz2
	 b+4nIqy8y2cBx/Td4+xO70lTo1MUJG2rFdLms/YAkbNYDBKc8FjRo4trw/kzme8/Cu
	 f1cQi01oXp7ezdcYhz+LkfD3XQGJ8d5Oi4isLziM9qYgmHEBK/xS+qOQTam04Mg8SC
	 kM8WTeKCX+nsQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 2/2] f2fs: fix to check upper boundary for gc_no_zoned_gc_percent
Date: Fri, 27 Jun 2025 10:38:18 +0800
Message-ID: <20250627023818.146534-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250627023818.146534-1-chao@kernel.org>
References: <20250627023818.146534-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds missing upper boundary check while setting
gc_no_zoned_gc_percent via sysfs.

Fixes: 9a481a1c16f4 ("f2fs: create gc_no_zoned_gc_percent and gc_boost_zoned_gc_percent")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d74472d96026..bdef926b3377 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_no_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
 		if (t > 100)
 			return -EINVAL;
-- 
2.49.0

