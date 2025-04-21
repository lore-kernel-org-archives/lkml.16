Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94C4C92
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260411; cv=none; b=LcwivRQsINOXV2aDHV7TO8FGM/Qez8ZpFbR8gUULcrivGlzMW1lY77k1MANWv+ebGyeBoIYkkFfDLvGl86xSLEj88jB7ekq3loj72XD6Z2mSWOsb68T0CTz4lkhRYKpmzkFcXeqKxBUIzQFLYAzJMfTrp4MVbC2yOXZW/BiXlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260411; c=relaxed/simple;
	bh=IKBa4fdDM5m3n0gUqcpAHTOYK8EQ+UNtqzJMikfZ9YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Budf0f54Hfs3kUsdWkjIW/4HDHpp6zf1c1R2PTJtp1bN+7rRuPdV1tK1APunKGMXyM0THCYiwbCbzBJk0DZWm4joILw5lAY0flnJmSG0GxJfev3AeetXfYX5MMWaUmIidEd02/Yo33aIXCN6sa29J/BN+aFSqYVXqKJ+FpEoSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H79bPuG6; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H79bPuG6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745260406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eMlnqWclCfnWGbyuoWPGL3n3kDlUTflxlSnTbzTPBEY=;
	b=H79bPuG63UDESbTVgxOJYhNmPb4SJ3bS4jVTmzZ3TzkwzlGKM1ctO/uoveJi2VIVCzvP8q
	LinyCIB+1Cn7Oy96S7/JAch7D2oH+8Co3hoVbNSWHlhIcebAhwxF+94RfaZm4f/lHyAcYV
	rYyS1gx8Z1mq7Ka5kxM0aHtKPmGHlsQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sparc: Remove commented out code
Date: Mon, 21 Apr 2025 20:33:19 +0200
Message-ID: <20250421183321.436449-1-thorsten.blum@linux.dev>
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

