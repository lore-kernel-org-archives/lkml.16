Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375D3FD1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331545; cv=none; b=usUYN4YkmvfRQJlfFl+2iaLtYvARHwohCZylSnF5BE0JjoeBtkmNrpkCxJURyqOfmjT4j24unpuEUC1Bf88cL7iK0WX5aIG6XcmJY70WTD7GQyYjXHpmb/PnRfKXr0RRDYtHLiCHPLqiLw0ce8HUFuxnZpJWPJTR4ommxpP2IxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331545; c=relaxed/simple;
	bh=YRqr6Ii7qwUwr2w6LMJ18M2BD5ug6XXYaAD7Dv1RIlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQoGPyc40N9NRv9xCImhCD0aQgGh3jywSYxFZ5AHvlg6vbG+y3TmlsRJMOCWWW/yReHO2xmbFCWMmfgduRFG8t2otYRKvVTJwgtzFTmNBsMvXLcn3YjckYeIrorn9sqz59CzhRCTBHeWVDFJYPRHrs2lFMWGxB/EnQfzmSvE1dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kc6s4Xgu; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kc6s4Xgu"
Date: Thu, 10 Apr 2025 20:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744331531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2clB0mAcWnAgYlObzuiqKAAGiczD8l6iS9voXhdX8QQ=;
	b=kc6s4XgunSODoBRn0NHtZbYYgqZSbm66zWX59H51G7DLHbmNK4h4FSJRLft5rzXXCLg0eA
	WAMEF8MLqtFZfHSem+wIC+7hf+n4zW/CngK+ZllQq9kgOG1oRIh0npOLZ5acuXDM2cVH2T
	N0HKfeLkij7ABsAgsg31WA6MsBTa0VA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bcachefs fixes for 6.15-rc2
Message-ID: <qmulyyzrlr6jdhqoluhqr32ho5qnuf4crxouj7let2anp4n2bz@z2wthovykeul>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://evilpiepirate.org/bcachefs.git tags/bcachefs-2025-04-10

for you to fetch changes up to 55fd97fbc4744a43fb2d134908e481266cf33bda:

  bcachefs: Use sort_nonatomic() instead of sort() (2025-04-06 19:33:53 -0400)

----------------------------------------------------------------
bcachefs fixes for 6.15-rc2

Mostly minor fixes.

Eric Biggers' crypto API conversion is included because of long standing
sporadic crashes - mostly, but not entirely syzbot - in the crypto API
code when calling poly1305, which have been nigh impossible to reproduce
and debug. His rework deletes the code where we've seen the crashes, so
either it'll be a fix or we'll end up with backtraces we can debug.
(Thanks Eric!).

----------------------------------------------------------------
Eric Biggers (2):
      bcachefs: use library APIs for ChaCha20 and Poly1305
      bcachefs: Remove unnecessary softdep on xxhash

Gabriel Shahrouzi (3):
      bcachefs: Fix escape sequence in prt_printf
      bcachefs: Fix type for parameter in journal_advance_devs_to_next_bucket
      bcachefs: Use cpu_to_le16 for dirent lengths

Kent Overstreet (3):
      bcachefs: Fix UAF in bchfs_read()
      bcachefs: Fix duplicate "ro,read_only" in opts at startup
      bcachefs: Use sort_nonatomic() instead of sort()

 fs/bcachefs/Kconfig              |   5 +-
 fs/bcachefs/bcachefs.h           |   4 +-
 fs/bcachefs/btree_journal_iter.c |   5 +-
 fs/bcachefs/btree_node_scan.c    |   6 +-
 fs/bcachefs/btree_write_buffer.c |   8 +-
 fs/bcachefs/checksum.c           | 247 +++++++++------------------------------
 fs/bcachefs/checksum.h           |   3 +-
 fs/bcachefs/data_update.c        |   2 +-
 fs/bcachefs/dirent.c             |   4 +-
 fs/bcachefs/fs-io-buffered.c     |  17 ++-
 fs/bcachefs/io_read.c            |   3 +-
 fs/bcachefs/journal_io.c         |   2 +-
 fs/bcachefs/recovery.c           |   6 +-
 fs/bcachefs/super.c              |  10 --
 14 files changed, 96 insertions(+), 226 deletions(-)
