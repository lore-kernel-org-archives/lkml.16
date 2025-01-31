Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E651C760A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322716; cv=none; b=mHsoGWKwkvm0ne/43ChYVPwgTCDs2ImythsQEbWnNoh9KTV3/wU6bw7y3Tw+B+6n5S37VLj2Zt2dmdph7S33I96wwhC8kpoiz13Cu9LsMDs6PO3fonay2aky23J1ODgxpTfmfP70lLNKf4nPcwlOJbdG9IyoywYhjEEQgbupXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322716; c=relaxed/simple;
	bh=NzKYKTJax7pPW/1p5r9wLFeoyYWNp6T+H8b/gc+oDek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=jWbz/NCftazgP6iZ1gJwXgj1Lbh3dqinn+pbBa6+Vd3UTiRuV6Lg3/ORmFHYj3XUl5HPpnuLX/iNALlZFZ9YBsNlIma+BWUxqdFzYFzFtgKu0beLKGNsjNeLWYHSw/H6++VQsQvqaZ3pr3vOEFEtRLBToTiP0/xzmPU/0Ja9cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDBC71007;
	Fri, 31 Jan 2025 03:25:38 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C919E3F63F;
	Fri, 31 Jan 2025 03:25:12 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:07 +0000
Subject: [PATCH v2 07/18] firmware: arm_ffa: Handle the presence of host
 partition in the partition info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-7-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=NzKYKTJax7pPW/1p5r9wLFeoyYWNp6T+H8b/gc+oDek=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQTwKrUk2nwtAsORQMj+77uPDpexNxTwmxk
 sUAJk00vreJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mIPiEAC0Dx2fkcPYfjDpwPAdLR/zezjoEdMKNoWqDAOjxWbTNbcKztt3Qywl1sd0Cha70uYIi1f
 Rv25U0ITRCmmiYuaLnfkVA/e8/O9EokNqR0xAIQXco28DbSrMWvPLsisvg9hIRNG6xOT1tf/+EZ
 vJZWMuvMivkuTlkcF2D+2emeKVrHI9AExeuQIL65d4j6YVvIaAm3FkLN5Fm5lRTA8atNDRl/qht
 an0JTBKCkaHdh8L+029OTANcU0/MpEdD0m79l1RSnOrgOKGr6U6oow5WY7IyjRcR3yJBT1gIkjw
 W2p9B1hMcu7Uxsv8REApjKLhP2VrT8Uq3lq8kbGoNAQe0hnUNIZ+xgxMTnN9wdwE5ZPAOW2ekYb
 6rfHBa3lpvN+nN+d5hsPgj/FOGsYU3TOQXLxBmYEkKJ5JnhbMQQkQ1nI0yNxUBXuSYaw50ZGn9D
 bQ8l360l1mJJ3S4xDzDP1Si7HHVtmtySQCqInQoDunAXbDOT329Zf+jS8ep2Lk8G253go86a6mp
 Ip5TghlZrXqP1W4WU0yCFWxrntIB7A3LB44giCc/miIGh4r5wOAlW3XmZ/bGmlzStsPUGkq4AlO
 iKvHDW7GVF0CNL2f3c7uk6offFlOtSZpWaxKc9sdAtrnNGK49as7WITf8DB/lFaAjVe6gbrY3T9
 mBdXsIPXapk0B7w==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently it is assumed that the firmware doesn't present the host
partition in the list of partitions presented as part of the response
to PARTITION_INFO_GET from the firmware. However, there are few
platforms that prefer to present the same in the list of partitions.
It is not manadatory but not restricted as well.

So handle the same by making sure to check the presence of the host
VM ID in the XArray partition information maintained/managed in the
driver before attempting to add it.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 67d5be261d83633805c81dd84fdfc2b5c702f3ca..54777055d54f5bf2dba1128e6a91bd1c0ece04fc 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1489,6 +1489,10 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
+	/* Check if the host is already added as part of partition info */
+	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
+		return 0;
+
 	/* Allocate for the host */
 	ret = ffa_xa_add_partition_info(drv_info->vm_id);
 	if (ret) {

-- 
2.34.1

