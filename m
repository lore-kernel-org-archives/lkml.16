Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA325D8FC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829718; cv=none; b=ufClvMBzlqkWh0T0ok+PDzNvoROtUi+e9ZNWv7Is6wK/MbKMLKjXvwTAAzOF+rNy1Fu933xsGl2wk83UXFMk15HS8KuBUUOsWe+QGuM5CnqddfgD8VWKjEd3ORf31o9Gt0KudW2kjO+UObaVEPNfeQkJZ9+pWIa7ViKM4ijDYHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829718; c=relaxed/simple;
	bh=IKBa4fdDM5m3n0gUqcpAHTOYK8EQ+UNtqzJMikfZ9YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HG16wNLPXZUC7cyzp4mbIyVFyPbU543pL6XVbte0nqjP8xIDgwYQ8ewjQSg0rL/zxoMDWf594Z1KCR4Vvz1OnQM5IsEBx4gsNtoDkvU2lyhnuppCFZ+HKsBLHnqdesCtXWaIIE/3mFItjA4zMWXDjLE1/B8Dy8T88pIZZh9GC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cNt/SIIZ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cNt/SIIZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747829714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eMlnqWclCfnWGbyuoWPGL3n3kDlUTflxlSnTbzTPBEY=;
	b=cNt/SIIZhqIlNqYfQg+Ihk76ghzd2d4sq9Zb585uRIDjysML5sY+Tx5+Q52pSiqGqBQLDv
	ZuLZFhxOI7Oql/PJvnSMhPDMctGsayjX80xh2WUde4WXlwnNfllA1FMt2/eeW5+joNiS6H
	qVGLXFaxYgv38OAESe0mM8Ep1E2Ri+I=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] sparc: Remove commented out code
Date: Wed, 21 May 2025 14:15:01 +0200
Message-ID: <20250521121503.5175-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The struct fields have been commented out ever since commit 1da177e4c3f4
("Linux-2.6.12-rc2") - remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/sparc/include/asm/pbm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/include/asm/pbm.h b/arch/sparc/include/asm/pbm.h
index 0c86261721e7..a26d9d5e0631 100644
--- a/arch/sparc/include/asm/pbm.h
+++ b/arch/sparc/include/asm/pbm.h
@@ -28,8 +28,6 @@
 struct linux_pbm_info {
 	int		prom_node;
 	char		prom_name[64];
-	/* struct linux_prom_pci_ranges	pbm_ranges[PROMREG_MAX]; */
-	/* int		num_pbm_ranges; */
 
 	/* Now things for the actual PCI bus probes. */
 	unsigned int	pci_first_busno;	/* Can it be nonzero? */
-- 
2.49.0

