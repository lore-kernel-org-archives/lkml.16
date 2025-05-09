Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56BF26A1CF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771948; cv=none; b=em5Ykq2YRWkFxLMjqMgat8MEHuEmwFL3+ueIGxpP+JK4tYVXRcUPDa+QlM9yTHhCZKvI+S2nq4ERUHkctgPQ0CxzU6kbZtYuthUauh+5y+t45O26T9v4pKVumea7YrEJNJZlS/CTlL+rrUaZ+vgJHfM5tfB4F6iZOyNtBZL/Au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771948; c=relaxed/simple;
	bh=kaP8gmqhsNq7iiFpTlIht+RBNNMAjy3OaIVdaJNmqDI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BkLRmqA6jj+NP/Wfr9F27EuqtIFztZn89MFgnMZ7ugikBRdSb+pXON2Z6zOxlARNtCb388kNW4bLxPrBsHXfWxt4oVa52dj0RqNnmBh/Lj0CTq0nakG5o4Rztaf7RWoUsUX6r2QpLGm+TPPN+L1CKRtVtzzyL43tzjvZopk7CH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=D+Pqm7mC; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="D+Pqm7mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8b
	fbX0EXb8zbXhz+CwEL9mtfsL0roWKGDRmTAWvMFbs=; b=D+Pqm7mCfwQNnkiwjn
	ciVv8I7ImgUfkJ2L6XV1jCOuh60w+uzgMF0/gLf+j8yKV0bl5XUVouwiuQwLk+/E
	Rm082/Es/C7KDV3oF4YEkgqE66evALxBZj02vAuAjF+Yvo6Njk3MsdHaTUFdZBQQ
	a81K2XmOs+mGCp6SC5+Xf2BdU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3b85GnB1oh0uSAA--.13519S4;
	Fri, 09 May 2025 14:10:25 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [BUG?]Data key in /proc/allocinfo is a multiset
Date: Fri,  9 May 2025 14:10:13 +0800
Message-Id: <20250509061013.922944-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3b85GnB1oh0uSAA--.13519S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1rKry5Xw4rZryfWF48JFb_yoW8CF4fpF
	srGrySyay5Jry8GF1Dta40kF98tanxJayY93WrWw4rZFyjqry7Kr4DXry7G3W7CF4UAF17
	Aws8urWjkF1aqrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uidb8UUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqApIqmgdj33+6wADsR

Just start a new thread for this[1].
There are duplications in /proc/allocinfo where same [file:line]
shows up several times:

=======================
           0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc 
           0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc 
=======================
           0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options 
           0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options 
=======================
           0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node 
=======================
           0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node 
           0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node 
...

The duplication make parsing tools a little bit more complicated:
the numbers need to be added up, group by key
       81920       20 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node 20 
     1441792      352 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node 352

The script for checking:
```
#!/bin/env python
def fetch():
    r = {}
    with open("/proc/allocinfo") as f:
        for l in f:
            f = l.strip().split()[2]
            if f not in r: r[f]=[]
            r[f].append(l)
    keys = []
    for f, ls in r.items():
        if len(ls) > 1: keys.append(f)
    keys.sort()
    for f in keys:
        print "======================="
        for l in r[f]: print l,

fetch()
```

Thanks
David

[1]. https://lore.kernel.org/lkml/531adbba.b537.196b0868a8c.Coremail.00107082@163.com/

