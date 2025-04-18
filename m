Received: from pku.edu.cn (mx17.pku.edu.cn [162.105.129.180])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D575433C4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993951; cv=none; b=scPmCakBi5VhZrSFNKwSqYentyvss0CrSFGQEnQ8/xlmdio7633piAy6NSiWMk6tMfDs2voRjtHQXmn9CNvuQmtv+i6h/aBhw7vBDI+w4DXCv63HxfR60M1mQBz0zAN6RHO63znHP6reVFpgAHXvUb4/OBExet/MKOkLmkT0Rrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993951; c=relaxed/simple;
	bh=jtJlER8Kh77wvIs7Efci+IP/JTJP7Oidp+gy0wCLX5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nPWKc6oMZmPRydA8yWD1cmwMbMORInR8rUNtjbwwSJRcBPcwM9snl3DZ5vfDWdBCjYnei2i43NHa4H3ElS6qydzXbPfGIyN6Onhc8zfy1twzeMUWP53LgrdWOygrtEZbfNelESiK2kQhnFNdQXrNPqQ9vXenDANVdrJFuW7NNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=Pb6AFGXq; arc=none smtp.client-ip=162.105.129.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="Pb6AFGXq"
Received: from pku.edu.cn (unknown [10.4.225.203])
	by mtasvr (Coremail) with SMTP id _____7DwygmBfQJoTxNLAA--.9685S3;
	Sat, 19 Apr 2025 00:27:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=MjC1UiVgx6
	t8vymYAgIB/8OCTv6MNdGah24Cp6lJ0PM=; b=Pb6AFGXqbY9rf/a2nyq/kl7xR2
	LYNkgRRdKzIPcy8r8+weWLAVDhKG4g/10Dsq7fzCpsR657KJcznblEAeDo93Lo5p
	9oYTqcOKxw1JR5G0IpWSgHuVDbfIlDzUErbhlnklSyOyY3yW0PPCzz1tzZv6N0l9
	o1LRaJtuxaYSBDn0s=
Received: from localhost.localdomain (unknown [10.4.225.203])
	by front01 (Coremail) with SMTP id 5oFpogCXbcd9fQJo4ZwQAA--.9688S2;
	Sat, 19 Apr 2025 00:27:45 +0800 (CST)
From: Ruihan Li <lrh2000@pku.edu.cn>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Date: Sat, 19 Apr 2025 00:27:27 +0800
Message-ID: <20250418162727.1535335-1-lrh2000@pku.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:5oFpogCXbcd9fQJo4ZwQAA--.9688S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwALs9
X-CM-DELIVERINFO: =?B?FMI+P6aAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7CfVLni9Tfp1zfQxCWN8VB6Q31UtKCC16PIt30HY+/E8pUc7
	d+yaDfFdCcwUIsdrIXjB/DMJ8BbkAvMOkWIiFx0Mg+INz0+BGBeWEvME05QNHA==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Currently, memmap_init initializes pfn_hole with 0 instead of
ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
page from the page at address zero to the first available page, but it
won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
won't pass.

If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
kernel is used as a library and loaded at a very high address), the
pointless iteration for pages below ARCH_PFN_OFFSET will take a very
long time, and the kernel will look stuck at boot time.

This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
avoids the problematic and useless iteration mentioned above.

Fixes: 907ec5fca3dc ("mm: zero remaining unavailable struct pages")
Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 84f14fa12..b3ae9f797 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -966,7 +966,7 @@ static void __init memmap_init_zone_range(struct zone *zone,
 static void __init memmap_init(void)
 {
 	unsigned long start_pfn, end_pfn;
-	unsigned long hole_pfn = 0;
+	unsigned long hole_pfn = ARCH_PFN_OFFSET;
 	int i, j, zone_id = 0, nid;
 
 	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
-- 
2.49.0

