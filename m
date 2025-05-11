Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0A195
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 05:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941016; cv=none; b=jNWrPExHssbWNa3R1PhujOM7jIO3a2l97kxpmNE1vYamYsc0ZFS4GAsp/AWhu+PHYI4KGNKJuIjnJm1C9GAkt/L3mdf4jSML2Iac8HkskDFlgGO3Gy7RKMfOcboI9LhRsJ3K/cuhNtO4iMH/w/k28rRmRLjb5tQzThfF8EXIfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941016; c=relaxed/simple;
	bh=Wpm+A5law0LKk5KOP36ItXWFKRrAbspoK3VdE4+NpSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7XQkjugY4gd65EdtpniHyDrWRbED//pPvSDvfVHGICI2u6Qx77i1KxB905CBuVrQ2NcxbW6YgAXvuvAmTSvv9+WK9T2Gu3GkOBZMhV8sQ5TKO2p9FLcpfyiw18oJtXEbhVa8NMcn4I7FsX763bcosRC1kTl2Dgx3ZC1GDMoybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htiNqBlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htiNqBlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F122C4CEE4;
	Sun, 11 May 2025 05:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746941015;
	bh=Wpm+A5law0LKk5KOP36ItXWFKRrAbspoK3VdE4+NpSc=;
	h=From:To:Cc:Subject:Date:From;
	b=htiNqBlheVkzoqsrorFs265qU02XdQuvDqZqmNzacw9pWoBJweO7MCst0vezyz3ff
	 77hIJKGW2U4PDisHfdcjvLkpuBTljuzIzt/aS6IJgTPW35pgLL7PK93zebqM3XG5Xd
	 7A2g3MrdiquTgHXTubvFkWIgLyWE/2KvtXc8OwvaTkTO/WEEwouhnCmS0ZkNXO3KGc
	 zVjpHqKcrweMIf9WcS+hYvqwdpSoerv5ebSLJBzdF3sMNzPt+u5GcLSTb7cdc/BwBi
	 1f1GOxGcxVsEhkOEBuosYOaRLIy99EYNXliEuZGQeGN+BCr/Ucw2/SapSivp2RD9Th
	 GSEAbOYfvB3dQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <kees@kernel.org>,
	kunit-dev@googlegroups.com
Subject: [PATCH] MAINTAINERS: add crc_kunit.c back to CRC LIBRARY
Date: Sat, 10 May 2025 22:21:51 -0700
Message-ID: <20250511052151.420228-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Restore lib/tests/crc_kunit.c to CRC LIBRARY following the rename in
commit db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
which made it no longer match the file pattern lib/crc*.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

I'm planning to take this patch via the crc tree.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f8..ac70e19c53cfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6251,10 +6251,11 @@ S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
 F:	Documentation/staging/crc*
 F:	arch/*/lib/crc*
 F:	include/linux/crc*
 F:	lib/crc*
+F:	lib/tests/crc_kunit.c
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org

base-commit: 46e3311607d6c18a760fba4afbd5d24d42abb0f3
-- 
2.49.0

