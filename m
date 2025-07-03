Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAE9233D88;
	Thu,  3 Jul 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537363; cv=none; b=eIwBHNMNzYY7rXB8t1lTAsS/ob+9c7/4IkOzzDSYXN07t8WoO31sQlFWOFK+7N+969KvCZoKglYLIypPs9siIAKO+4JUp2r6TuGM7X+hvAplDILu3QNmWBrrTrXj7ccMUTOsQBOb7adOWLMrnEoxKj07d9Eqye51LVAVPS9H14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537363; c=relaxed/simple;
	bh=8oFnaDx8yWVXgMM76SE9vU05ZBgM/KqyVMU9quvFQu8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RvsaJCAck3OZw4DG3O29pHfzZC9u+hTQwH5eRW8Uuu+qM/Wj3xZCkK/74bM2+RPPGxzsMAuQDiIRmrK35tR2RISJcFjYOeN0ujQofXaQGLFZSeGngcRNpCXmD4/MQm0bbYqkhVt8ar5m48HhH/q9qb7VTXaZH6+/RgNgHXWvn4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YtOtvu6f; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YtOtvu6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=We
	qACTZgfJCdNsvenNHl/KCtlQOAdLai2F3zW9rTuY4=; b=YtOtvu6f1su/Vp0mcq
	AWl9cuBDquXN85rS/vpg7sVG5BDVuuEurnYJ2LQnqxfi+zual8OrKmXKZhGTfgWR
	kX0oSdAJvvNYNmcNqoGMaSgA7QVdAJv30Sxa3316Dkd9vaTuUf7nNIdTpvkVrgUN
	kkYht8ULbfrF9iFhfxQmVT8BQ=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBn3nOKVmZobwkoCQ--.29235S4;
	Thu, 03 Jul 2025 18:08:12 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	haoxiang_li2024@163.com,
	dan.j.williams@intel.com
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RESEND] x86/pmem: Fix a null pointer dereference in register_e820_pmem()
Date: Thu,  3 Jul 2025 18:08:09 +0800
Message-Id: <20250703100809.2542430-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn3nOKVmZobwkoCQ--.29235S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruw48urWkAr1Dur1DWrWkXrb_yoW3Awb_Kr
	17K3yDurWFvr929F13Aw4fZr1fJwn7tFWF9r1UKFnavr90gr45X3yjqFWFyr43XrZ7KrWU
	XasxCrZxGFy7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRG0PfUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkAl-bmhmVB1MfQAAs+

Add check for the return value of platform_device_alloc()
to prevent null pointer dereference.

Fixes: 7a67832c7e44 ("libnvdimm, e820: make CONFIG_X86_PMEM_LEGACY a tristate option")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/x86/kernel/pmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/pmem.c b/arch/x86/kernel/pmem.c
index 23154d24b117..04fb221716ff 100644
--- a/arch/x86/kernel/pmem.c
+++ b/arch/x86/kernel/pmem.c
@@ -27,6 +27,8 @@ static __init int register_e820_pmem(void)
 	 * simply here to trigger the module to load on demand.
 	 */
 	pdev = platform_device_alloc("e820_pmem", -1);
+	if (!pdev)
+		return -ENOMEM;
 
 	rc = platform_device_add(pdev);
 	if (rc)
-- 
2.25.1

