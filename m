Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B121B6CF1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747193223; cv=none; b=mBB5ANe+GcjBL7crRnQMS1RI3PLH4P5zeTtS1ewUegLvlipJddLEYqUoPI6bkTpJOGq2eX8J4XiCae3Khj8GJfga+KeUF5625dAlDLfkFU1IXlNnWk30GdTfeN+fLfz54601LvB85YJYHqcT+L4Un9aS1nap4BERAjgzhz0ap2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747193223; c=relaxed/simple;
	bh=nPnxniUkG96DoIzIVosQNdMaJPp0eBnr+bNWONHO/Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fKkmnTy1jPXmxK63BJCpBTiG/6E68vutJwQuyTYIAGIAdqjYvh4tz9Ejw22pJOfzrOr2yBLVPCROd+zyV+tUXEaxX3fUYX4IHgJt/c11Cj80VbH10wYhhPzx6M6rRtecI0Bt/p0mrSwuEMY+NFWr3eMlefKg5UbUxyKvk4cy308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowABXkAh9DSRoaesFFQ--.21701S2;
	Wed, 14 May 2025 11:26:54 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: clemens@ladisch.de,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] hpet: Remove unnecessary NULL check before unregister_sysctl_table()
Date: Wed, 14 May 2025 11:26:37 +0800
Message-Id: <20250514032637.2317639-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXkAh9DSRoaesFFQ--.21701S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4DKw4DtFWDZrWDJwb_yoWxtwb_CF
	10qrnFgF95GrnxGa45Arn8ZryY9a15urn3Z3WjqwnxJa92vr4rWr1UZr17ZwnrG392kF9I
	kry5tr9akr12kjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjTRErWFUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

unregister_sysctl_table() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/char/hpet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index e110857824fc..0713ea2b2a51 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -1023,8 +1023,7 @@ static int __init hpet_init(void)
 
 	result = acpi_bus_register_driver(&hpet_acpi_driver);
 	if (result < 0) {
-		if (sysctl_header)
-			unregister_sysctl_table(sysctl_header);
+		unregister_sysctl_table(sysctl_header);
 		misc_deregister(&hpet_misc);
 		return result;
 	}
-- 
2.25.1

