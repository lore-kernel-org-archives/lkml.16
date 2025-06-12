Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D710E5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747361; cv=none; b=ANO+0SyONzJZ7E10HgB+b0bihgLizeVQB0P/D/NIaAEk+jzXOx98KgLNIwZ0WLn7XxEpWRKRBroK0WE1OFQTg9h2/2XmdzNILO8fwAZB4Jgxm9yvsU43LF0K7i/k0FF+CG0g6vAZF2klO2pW0xryBJ3xgb9iC3aN7swyqLvwqwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747361; c=relaxed/simple;
	bh=L+nj7VSATDTtQ8qziHcnn2N7SXjAfvLfGVPJ4UEQAjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C2pqifaUrnXcZncgvqUPCINbCIIjhf7cahcDhEQuqIgepiBFYLUprHf7TMXzh6R3kjBceyOW3FMPXMfRYMJk/8Twso6++PC32I5ZXAH89QhaoCDIdHkrNkBIHnSwhGUnr5t6l73qDlpyH8K/cMiF7U4O7dzeZWUHwzivucdyAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=uVwahqQU; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="uVwahqQU"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1uPlDS-00Dv6v-8N; Thu, 12 Jun 2025 18:55:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From;
	bh=h78SstLB+SKD2vCmdildXITOov0xVYk3Rhb763rP10o=; b=uVwahqQUmSqPo2FdTJiu5DYZs7
	iu5POcB7G6wc7xoOuJ1Czw0lzfgXFDL0d7AmfYHhyNNPxSUe7lmOUmIzjAaycbbe2SsGOwzF33Smp
	B3d9X7So8ymtrgwZEIQJ1yRnHjOTQNsuuaQjRpq2xxaXhg0cUVJfRm/28D9dUIHcMMTdJdZpEdrBk
	MKm3NrZXghh8ZoYQKG0kGMgpkuucWaqg1IWHY7y+SDjt2h005uITZRBO6fgYwo2Kp3MpTkd5biRyp
	FrMGSCJTMQ9pbWtBgQPwXI43wGMFNEZu0UgxK0k5FRzORtCQf4d8Aum6EMeYb8CGC3JMf4EirdLTp
	WyLvwE1w==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1uPlDM-00010g-7U; Thu, 12 Jun 2025 18:55:44 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1uPlDG-00Gn5Y-4O; Thu, 12 Jun 2025 18:55:38 +0200
From: Michal Luczaj <mhal@rbox.co>
Date: Thu, 12 Jun 2025 18:55:09 +0200
Subject: [PATCH v2] scripts/sorttable: Handle mmap() failure gracefully
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-sorttable-fix-v2-1-9cbb747e6b6d@rbox.co>
X-B4-Tracking: v=1; b=H4sIAG0GS2gC/13MQQrCMBCF4auUWTuSpNFWV95DukjSqR2QRpIQK
 iV3NxbcuPwfvG+DSIEpwrXZIFDmyH6poQ4NuNksD0Iea4MSSotOtRh9SMnYJ+HEK4reXhz1crS
 tgvp5Barz7t2H2jPH5MN757P8rj/p/CdliRJ7e7JGO607Od2C9evReRhKKR/Y1HFnqAAAAA==
X-Change-ID: 20240723-sorttable-fix-08b9ce81db32
To: Steven Rostedt <rostedt@goodmis.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Michal Luczaj <mhal@rbox.co>
X-Mailer: b4 0.14.2

When mmap() fails, don't propagate MAP_FAILED as a return value. Caller
expects NULL on error.

Fixes: 3c47b787b651 ("scripts/sortextable: Rewrite error/success handling")
Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
...
  LD      vmlinux
  BTFIDS  vmlinux
  NM      System.map
  SORTTAB vmlinux
Could not mmap file: vmlinux
scripts/link-vmlinux.sh: line 200:  2688 Segmentation fault      (core dumped) ${objtree}/scripts/sorttable ${1}
Failed to sort kernel tables
---
Changes in v2:
- Rebase, resend
- Link to v1: https://lore.kernel.org/r/20240726-sorttable-fix-v1-1-8b5ba4c4471f@rbox.co
---
 scripts/sorttable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index deed676bfe384deb0333b6dde78c60bc3c6622da..2fe0974b53719b5660e1053af438ad098cdcaf28 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -334,6 +334,7 @@ static void *mmap_file(char const *fname, size_t *size)
 	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	if (addr == MAP_FAILED) {
 		fprintf(stderr, "Could not mmap file: %s\n", fname);
+		addr = NULL;
 		goto out;
 	}
 

---
base-commit: 9cc7d5904bab74f54aad4948a04535c1f07c74d8
change-id: 20240723-sorttable-fix-08b9ce81db32

Best regards,
-- 
Michal Luczaj <mhal@rbox.co>

