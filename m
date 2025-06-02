Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EE2040A7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880773; cv=none; b=Fu7jDSSBp6pDzwSKmA7SpSpe9OjvZyZ1nftgpszlrpheJDOAtArV6DJjaqcFygpX88q8QC7bnP4NmbKVLbvBiVM4j/p4ajIkxTnVm5ayptMQyVsZxwdHHpPr9KpHh/SwaTdt3U0v9zj5ZibCBY+LQQZFBXzc7HoIE989x8PRbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880773; c=relaxed/simple;
	bh=8jA/iA3+9deGnWlidOfDp7sR4o8DTWd+T6vtYC2cPI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtKo5JiHhbECK8WqLFJWM5+Vi/e5ApklObzkTvx/pvB6vBkEQIXGqyfQCdVqBCj4fIpsErmlYeI7FEjAE6ClY7Dbznk0uM9pjH2EA6PPaLlepxDxDX/FEufdEvBCwCRFzOH7eC8y4jXGfdS4tSOi4wYdHEIqnDLrySgz/Kk21LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAtytaG9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAtytaG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748880770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dIquVD0g8CqNKfp8Vq25V8Vb7bryIoVAcDuNtp/J3Dw=;
	b=XAtytaG9kCwHwbbYIhlWS1Qn8ojYSmS7Wvt3qRxbROM6jUunLGrPDd9/xqXVDrlCZELD0h
	JZstN//RgLlUfx9aiJRdqmR52xgTGLT6sX66jec51+vIRwhfZYTfB0qQWtYHJiA9ORoIn2
	Ii9ljXjGTH3Edy3tYmK0EBWk5C7sbWs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-4MhuWx7RNHKOiLQ12ipNSA-1; Mon,
 02 Jun 2025 12:12:47 -0400
X-MC-Unique: 4MhuWx7RNHKOiLQ12ipNSA-1
X-Mimecast-MFC-AGG-ID: 4MhuWx7RNHKOiLQ12ipNSA_1748880766
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33DCA19560AB;
	Mon,  2 Jun 2025 16:12:46 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.45.224.167])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75C761956095;
	Mon,  2 Jun 2025 16:12:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] additional gfs2 fix for 6.16
Date: Mon,  2 Jun 2025 18:12:41 +0200
Message-ID: <20250602161242.2106610-1-agruenba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Dear Linus,

please consider pulling the following additional gfs2 fix for 6.16.

Thanks,
Andreas

The following changes since commit 914873bc7df913db988284876c16257e6ab772c6:

  Merge tag 'x86-build-2025-05-25' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2025-05-26 21:41:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16-fix

for you to fetch changes up to 9126d2754c5e5d1818765811a10af0a14cf1fa0a:

  gfs2: Don't clear sb->s_fs_info in gfs2_sys_fs_add (2025-05-30 19:20:20 +0200)

----------------------------------------------------------------
additional gfs2 fix for 6.16

- Fix a NULL pointer dereference reported by syzbot.

----------------------------------------------------------------
Andrew Price (1):
      gfs2: Don't clear sb->s_fs_info in gfs2_sys_fs_add

 fs/gfs2/ops_fstype.c | 4 +++-
 fs/gfs2/sys.c        | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

