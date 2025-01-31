Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D230E1E492D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322721; cv=none; b=enJIpG+3YTR//YJk5fevdYyGwMHw10Er4qnLDKTVErk/sdLwiesBjh8f2JxJGk1HuybwnVWSw1354NdBz43ofD3sSJUUU4pFULlP0H4S3pGTW6VeD0rJhm+5x7wq1kjhEXQpMGu1XmXaPZCPhQ4APccf5BwdZELdydchFHry8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322721; c=relaxed/simple;
	bh=fdT5EChbtqfXYexU74FFsCYTiVeLlZGaxmgomF4gd0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=eLp5Gc4nicg4f6jkfYpcyXz3tLDBn+6uZxhnhMjFbVQ0pvBdDV49kcKylZKzX6WCQKWbB5eOXjAsrM16/DdbOykWZP+4obL472uQQO4r+d85eIUICIZ56p49Z3zCq3TisAprzt/I5cG1sYRN0PfyPJtPaNWVixKJxeB4daJtogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E16E1007;
	Fri, 31 Jan 2025 03:25:45 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9323F63F;
	Fri, 31 Jan 2025 03:25:18 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:13 +0000
Subject: [PATCH v2 13/18] firmware: arm_ffa: Remove unnecessary declaration
 of ffa_partitions_cleanup()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-13-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=fdT5EChbtqfXYexU74FFsCYTiVeLlZGaxmgomF4gd0M=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQOBs1P5wJN9+NbxEdLzIG52z4IW22B9MUv
 TXuIbZDDPOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mJarEACZJglyJgDihrqANB0ymj1onxs9WJ4eVEY2KAllE930ajGcPPGYTxKEsfjQsn8DVyHCHUj
 OC9kdjXrtn+ZQuXMHUuV72ihaNfP+Rd//rYL3OSWD771lf5un8VKpdoecInkqqbhLajYFv5O9K7
 DKfTLwzWaJVMQhjcWH+xSDSVdDy5ulYk2sktDZ2IrjU98UrIxhWblZbBp1sGbsVeXDjnmaNSm1/
 Pw+ST8ED565dtE+jNxTqRsg53iYtnJYGNB7XDU+S+M7f4DkqoRmQACxYJdfh+THIl6czly3p4v7
 KgsSwGlkyUyi2v5eys2q3uisA+rYPvmEo0qoziTfZfRPaBf2M1Y8NHGaS1K2LqtWBAKcRGxsf+S
 mDC4hNzCnas3s5C7OtxMswcS21Hxu1yw0d/m/ryiNujDEfz/NpzlBJTSTZ+g1Xm33/vrwp0KN9V
 iT1tmyK6VLlR++K9/74u+mCzisxVLdYGhtSbDLwHSnMVns/LSchSz+PWsjHDAPbMUJ+wvpRfjrQ
 SmtaFUpBFRQ1mRbO2lZ9xYO00ODSFZ+Lt0i0tQ46RZpr75uQ/pKGu5YI6Gapgelkzcnhj+Q1+Zr
 YxCzvEspw/liL+1HZmiX5Cj5H2M26BgNoH/7ViGKYY9cvWUJ4WTY9FvtRt+hfcNYg7io61g5uHY
 T80AgWMSqkUAhog==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

In order to keep the uniformity, just move the ffa_partitions_cleanup()
before it's first usage and drop the unnecessary forward declaration.

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 1a0f2d1d7a2220e341d4e78240e799a2919fca30..7282aeb3ee498b09010aa2867ef94bf3e0248008 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -114,7 +114,6 @@ struct ffa_drv_info {
 };
 
 static struct ffa_drv_info *drv_info;
-static void ffa_partitions_cleanup(void);
 
 /*
  * The driver must be able to support all the versions from the earliest
@@ -1452,6 +1451,22 @@ static int ffa_xa_add_partition_info(int vm_id)
 	return ret;
 }
 
+static void ffa_partitions_cleanup(void)
+{
+	struct ffa_dev_part_info *info;
+	unsigned long idx;
+
+	/* Clean up/free all registered devices */
+	ffa_devices_unregister();
+
+	xa_for_each(&drv_info->partition_info, idx, info) {
+		xa_erase(&drv_info->partition_info, idx);
+		kfree(info);
+	}
+
+	xa_destroy(&drv_info->partition_info);
+}
+
 static int ffa_setup_partitions(void)
 {
 	int count, idx, ret;
@@ -1510,22 +1525,6 @@ static int ffa_setup_partitions(void)
 	return ret;
 }
 
-static void ffa_partitions_cleanup(void)
-{
-	struct ffa_dev_part_info *info;
-	unsigned long idx;
-
-	/* Clean up/free all registered devices */
-	ffa_devices_unregister();
-
-	xa_for_each(&drv_info->partition_info, idx, info) {
-		xa_erase(&drv_info->partition_info, idx);
-		kfree(info);
-	}
-
-	xa_destroy(&drv_info->partition_info);
-}
-
 /* FFA FEATURE IDs */
 #define FFA_FEAT_NOTIFICATION_PENDING_INT	(1)
 #define FFA_FEAT_SCHEDULE_RECEIVER_INT		(2)

-- 
2.34.1

