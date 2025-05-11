Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359791917CD;
	Sun, 11 May 2025 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004153; cv=none; b=sr7BZUqWRnGr9ninsdlj9IolLsYa9ZEtruimYYOgL7gCG36e1hHdEuPijXsvsMAwDyOBD5kj7oGJlW9Vs0dsGyb8s2mbexr8eG74I1CTPX7rEp8PpoTMSxQ8o6n/JvW/ENmNwKYG6y8t/U9mUwSszm39yciMjLZSbGQ/Wch2PRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004153; c=relaxed/simple;
	bh=4vgZpA5JqntdJzm3nklbheECiUDiD2KGpqMWZVeFbPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCTvBb6F19Vn7bucS9jQIbNsbXlDcfw/eTpnGX26ufkSf070JcWXwISGqpfLT6AwWtRJPnRUOa1Le1ozeCWR0/3QxZjjvyolo/d1BsoP9iHit4irgAADB/F2wiie6oUPBsYawDZpga7rxVEWrYIInFiwvrNKPBQaqOWCk2TjbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 24A4A72C8CC;
	Mon, 12 May 2025 01:49:54 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 164F17CCB3A; Mon, 12 May 2025 01:49:53 +0300 (IDT)
Date: Mon, 12 May 2025 01:49:53 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] statmount: update STATMOUNT_SUPPORTED macro
Message-ID: <20250511224953.GA17849@strace.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to commit 8f6116b5b77b ("statmount: add a new supported_mask
field"), STATMOUNT_SUPPORTED macro shall be updated whenever a new flag
is added.

Fixes: 7a54947e727b ("Merge patch series "fs: allow changing idmappings"")
Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 fs/namespace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 1b466c54a357..e321f8bae914 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -5804,7 +5804,9 @@ static int grab_requested_root(struct mnt_namespace *ns, struct path *root)
 			     STATMOUNT_SB_SOURCE | \
 			     STATMOUNT_OPT_ARRAY | \
 			     STATMOUNT_OPT_SEC_ARRAY | \
-			     STATMOUNT_SUPPORTED_MASK)
+			     STATMOUNT_SUPPORTED_MASK | \
+			     STATMOUNT_MNT_UIDMAP | \
+			     STATMOUNT_MNT_GIDMAP)
 
 static int do_statmount(struct kstatmount *s, u64 mnt_id, u64 mnt_ns_id,
 			struct mnt_namespace *ns)
-- 
ldv
