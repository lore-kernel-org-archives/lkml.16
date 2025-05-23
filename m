Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F108157A6C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748033492; cv=none; b=cfZwXxoXGuMtUaZH3sZA+2IQhilYCLNa0eDbrqDMtsbmXXCP3eCGOv0Xc724XaEkHMrvmgt/X+K4A62ii4PgUVLj9sIkh0g3Wf46zRk9qZP43gjs5h6GWmxBc5bqEFdWUl3o9TKNX+hRRPwzUiEP2nSnnnqTfTxhRyXKYrg8tTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748033492; c=relaxed/simple;
	bh=FOCe2QtzkFHytesx0PdwIEOXylumeOaR4MXRgnJN/jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDSVneiVx+/uSn+Gy9oz+UWc2x/o/gtnXMsVvKuTqmeaow6x222tg/VgiEeyMM2aZXHl3Lo21LLMlqvQeP2Y56E6Cu/2F4+GivQ+sQIHNTjVIfzQ6iQTegCcZEr0HZ0bFReuVZ8bFBQRw0P0L1YPYPdNhGcUSh/5bLdcyONWrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/Jp2ouj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/Jp2ouj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748033489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3tmG53e0wFq++pCF0XqqY430ke1LDloYB9/YCJmMx0=;
	b=c/Jp2oujeoiSOR/2/Rp4cZTZwfNDmJXYTAmY/z5W8vzzsxg3vlJFO26OVVaPVKVLW4+Ro6
	B87vP3i/BPb9BgdQ3c74Jh/8klOoLu8De6xsvgWYrxyHvM3J/GoiZGGegHmFxUgzih8e04
	5UlJ6QeoLladVNx6Opde++YUSm5Ivno=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-r0uUXODJPNqgLqsykMw6wQ-1; Fri,
 23 May 2025 16:51:27 -0400
X-MC-Unique: r0uUXODJPNqgLqsykMw6wQ-1
X-Mimecast-MFC-AGG-ID: r0uUXODJPNqgLqsykMw6wQ_1748033486
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 669D5180036E;
	Fri, 23 May 2025 20:51:26 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.45.224.234])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 833B51800DB9;
	Fri, 23 May 2025 20:51:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] gfs2 changes for 6.16
Date: Fri, 23 May 2025 22:51:21 +0200
Message-ID: <20250523205122.1783753-1-agruenba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Dear Linus,

please consider pulling the following gfs2 changes for 6.16.

Thanks,
Andreas

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16

for you to fetch changes up to e320050eb75e914aa5e12de2a9ab830c9a2ce311:

  gfs2: No more gfs2_find_jhead caching (2025-05-22 09:12:27 +0200)

----------------------------------------------------------------
gfs2 changes

- Fix the long-standing warnings in inode_to_wb() when CONFIG_LOCKDEP is
  enabled: gfs2 doesn't support cgroup writeback and so inode->i_wb will never
  change.  This is the counterpart of commit 9e888998ea4d ("writeback: fix
  false warning in inode_to_wb()").

- Fix a hang introduced by commit 8d391972ae2d ("gfs2: Remove
  __gfs2_writepage()"): prevent gfs2_logd from creating transactions for jdata
  pages while trying to flush the log.

- Fix a race between gfs2_create_inode() and gfs2_evict_inode() by deallocating
  partially created inodes on the gfs2_create_inode() error path.

- Fix a bug in the journal head lookup code that could cause mount to fail
  after successful recovery.

- Various smaller fixes and cleanups from various people.

----------------------------------------------------------------
Alexander Aring (2):
      gfs2: move msleep to sleepable context
      gfs2: only apply DLM_LKF_VALBLK if sb_lvbptr is not NULL

Andreas Gruenbacher (16):
      gfs2: replace sd_aspace with sd_inode
      gfs2: gfs2_create_inode error handling fix
      gfs2: Don't reread inodes unnecessarily
      gfs2: Move gfs2_dinode_dealloc
      gfs2: Move GIF_ALLOC_FAILED check out of gfs2_ea_dealloc
      gfs2: deallocate inodes in gfs2_create_inode
      gfs2: Do not call iomap_zero_range beyond eof
      gfs2: Rename jdata_dirty_folio to gfs2_jdata_dirty_folio
      gfs2: Move gfs2_trans_add_databufs
      gfs2: Don't start unnecessary transactions during log flush
      gfs2: Minor comments fix
      gfs2: Move gfs2_log_pointers_init
      gfs2: Simplify gfs2_log_pointers_init
      gfs2: Simplify clean_journal
      gfs2: Get rid of duplicate log head lookup
      gfs2: No more gfs2_find_jhead caching

Andrew Price (1):
      gfs2: Fix usage of bio->bi_status in gfs2_end_log_write

Chen Ni (1):
      gfs2: Remove unnecessary NULL check before free_percpu()

Christoph Hellwig (1):
      gfs: don't check for AOP_WRITEPAGE_ACTIVATE in gfs2_write_jdata_batch

Edward Adam Davis (1):
      gfs2: check sb_min_blocksize return value

Eric Biggers (1):
      gfs2: avoid inefficient use of crc32_le_shift()

 fs/gfs2/aops.c       | 86 +++++++++++++++++++++++----------------------
 fs/gfs2/aops.h       |  3 +-
 fs/gfs2/bmap.c       |  9 +++--
 fs/gfs2/glock.c      |  3 +-
 fs/gfs2/glops.c      |  9 +++--
 fs/gfs2/incore.h     |  9 ++++-
 fs/gfs2/inode.c      | 99 +++++++++++++++++++++++++++++++++++++++++++++++-----
 fs/gfs2/inode.h      |  1 +
 fs/gfs2/lock_dlm.c   | 11 ++++--
 fs/gfs2/log.c        |  7 +++-
 fs/gfs2/log.h        | 11 ------
 fs/gfs2/lops.c       | 17 +++++----
 fs/gfs2/lops.h       |  2 +-
 fs/gfs2/meta_io.c    |  2 +-
 fs/gfs2/meta_io.h    |  4 +--
 fs/gfs2/ops_fstype.c | 41 +++++++++++++---------
 fs/gfs2/recovery.c   | 28 ++++++++++-----
 fs/gfs2/recovery.h   |  2 ++
 fs/gfs2/super.c      | 94 ++++---------------------------------------------
 fs/gfs2/trans.c      | 21 +++++++++++
 fs/gfs2/trans.h      |  2 ++
 fs/gfs2/util.c       |  2 +-
 fs/gfs2/xattr.c      | 11 +++---
 fs/gfs2/xattr.h      |  2 +-
 24 files changed, 263 insertions(+), 213 deletions(-)

