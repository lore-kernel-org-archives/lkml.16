Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA31DC9B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297687; cv=none; b=BHU52Tchi8V63GIlYzNhT1xFRG/2gGBZiawyiKLKzhVXGj6mvJt5uF749bj90Ya+hIp/PteBebx3K6APTCKQ7KAQZYqguG1MAegCmej1tlG6agsnjPelneRp9ZTQAGpNQvMj5CsJxb14/2ULp5zu8jUE0sYSvJLb9+Vp+bH6V08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297687; c=relaxed/simple;
	bh=ZAmSVhLWEOnCfOSz5SAqLbjsOCi3cBCWsfNIKHCnGhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=mm4RejWM1vWrDfFMTFbJTxXVIVQ+3cSnH0YBGgwVGTjWe/AZu0VSkW1hIffb1UGoCfoTw5sz71ihgmgIwxdlp7Nk1ari+i72+M5sz041eyLJzTleVUfGXff8bBSoaMXZpNieHISXfhMrp81taY3Jqd78iC/uIPdHA9CkvbtY08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SF4z6TWp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SF4z6TWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744297684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dTxv5YMVOx/xNNCzCuT62I5Fum6OWhDgWlsYhJf9AlU=;
	b=SF4z6TWpKOfVnbS8qWsu5TqJZNPhQN7jjFnRp9E/g86fbFksawP89IeIvp4Xz1j9H33MUh
	iWFgNhvv/lh86xxDSN+ftAiZ5HOqim2iqB31nH28NZnTn8zuiIZS56IyNvQ9P60pZV3+jc
	apKBFHM0yOJhkX3J2wwSchw1EckfRr0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-EU-XR6RbOGuX7Diq62IdwA-1; Thu,
 10 Apr 2025 11:08:01 -0400
X-MC-Unique: EU-XR6RbOGuX7Diq62IdwA-1
X-Mimecast-MFC-AGG-ID: EU-XR6RbOGuX7Diq62IdwA_1744297679
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B60461944D28;
	Thu, 10 Apr 2025 15:07:58 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.44.32.241])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 440EF19560AD;
	Thu, 10 Apr 2025 15:07:55 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: brauner@kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	jstancek@redhat.com
Subject: [PATCH] fs: use namespace_{lock,unlock} in dissolve_on_fput()
Date: Thu, 10 Apr 2025 17:05:42 +0200
Message-ID: <cad2f042b886bf0ced3d8e3aff120ec5e0125d61.1744297468.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

In commit b73ec10a4587 ("fs: add fastpath for dissolve_on_fput()"),
the namespace_{lock,unlock} has been replaced with scoped_guard
using the namespace_sem. This however now also skips processing of
'unmounted' list in namespace_unlock(), and mount is not (immediately)
cleaned up.

For example, this causes LTP move_mount02 fail:
    ...
    move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected: EBADF (9)
    move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expected: ENOENT (2)
    move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: EBADF (9)
    move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected: ENOENT (2)
    move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: EINVAL (22)
    tst_test.c:1833: TINFO: === Testing on ext3 ===
    tst_test.c:1170: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
    mke2fs 1.47.2 (1-Jan-2025)
    /dev/loop0 is apparently in use by the system; will not make a filesystem here!
    tst_test.c:1170: TBROK: mkfs.ext3 failed with exit code 1

The test makes number of move_mount() calls but these are all designed to fail
with specific errno. Even after test, 'losetup -d' can't detach loop device.

Define a new guard for dissolve_on_fput, that will use namespace_{lock,unlock}.

Fixes: b73ec10a4587 ("fs: add fastpath for dissolve_on_fput()")
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 fs/namespace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 14935a0500a2..ee1fdb3baee0 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1830,6 +1830,8 @@ static inline void namespace_lock(void)
 	down_write(&namespace_sem);
 }
 
+DEFINE_GUARD(namespace_locked, struct rw_semaphore *, namespace_lock(), namespace_unlock())
+
 enum umount_tree_flags {
 	UMOUNT_SYNC = 1,
 	UMOUNT_PROPAGATE = 2,
@@ -2383,7 +2385,7 @@ void dissolve_on_fput(struct vfsmount *mnt)
 			return;
 	}
 
-	scoped_guard(rwsem_write, &namespace_sem) {
+	scoped_guard(namespace_locked, &namespace_sem) {
 		ns = m->mnt_ns;
 		if (!must_dissolve(ns))
 			return;
-- 
2.43.5

