Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7741C07D8
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322711; cv=none; b=N1uw5AH1RjBr6JMSDvdq/q7y4lGGa7hX1k5hNipYz8/TL/PqfbF+otgtaWmHr/n4rVI/n7WbT4LEpfR9iBqWJXKIeBVFNybEdV9aTG16nxPJstPCHJtrnEQ714jHMlR+BOdloulKpAVMb2FsL8ul/YbqT7ZtPjQzDukknCs8Pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322711; c=relaxed/simple;
	bh=llehAUqDTyE8tsnbqX0XKeEGbtFXiSKUAGLSD+1hoi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=OCFLBi+Q23SOSbwC3WV2AUVPgAfinjGFKLYNrIm441MK46EIPqXOtqo71mz/3bnsI1+if1/qQNTpLdkTaQdIEsioOmuTd5JjzXZVuzV1PjVup9iwHGLHnezDkFCf8LIhW6mqT9vLea2jDALIOpuTti4YYFO4jHNRuyNoFqFw+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71411477;
	Fri, 31 Jan 2025 03:25:34 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10343F63F;
	Fri, 31 Jan 2025 03:25:08 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:03 +0000
Subject: [PATCH v2 03/18] firmware: arm_ffa: Align sync_send_receive{,2}
 function prototypes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-3-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=llehAUqDTyE8tsnbqX0XKeEGbtFXiSKUAGLSD+1hoi8=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPkKCWm5ZAQF/ShpVrftIiiw7VlFUeSwUBr
 AMJt2HQzGKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mB8xD/0UeYGhs1EoqVrQ2tjc49+GiEqkXvQwEcyx8tOnuXRzsERNYXlVoIcE8gEY1olxl7ASlv/
 pEERkoGGsc6YiXBh6gw/ucmjSt8t7gTZNwKNn1KocfptgHrUnRGs6jCBjz+oMEAmf8DPAr82vm2
 oiHgLeiomAIilGwwDXKTrVG4IVpdAbSwAIVhm7OX/0rYfrRbB8IGNFSmEVsusmGWkyLXwGTTLLs
 vrjd12hnZjORo3UJ+vJcIG5OBCDG0sml8PDIlyxT6k86+sUERfvT6il/noI5eCs6YVZSBUO0lRf
 0nhmZaPpuiuDWdbi4iKCP+EXceMufk5SupnMSVXLdOLxAd3ocy3PzIUCaC3NrG+JorJlzixuvNq
 iwgDRMhMySlyQOoBpqr8berBocdGrW5qb2ESgqbGNv8th9tP5jnVWc7PXKm+O8QEwx2zy2xTPnm
 Rqw0NQ6ppDQ3PNv17F3CmXMFPXpqDuCTCclBK/2Zunb4p9ZlBbUSGrTq1cDcFty1c0fpLf5CTWU
 Wvd0OiqcYTyQOhmytbxFrAxdkACEXyXpQ1ZZ03lgUGTc7SRpDr0NOrNuGnmAHvYa9JIuEmgHaFE
 JlCvoihlWWbA5Hj9iFiBOEKr505192FRR+fVQVG6Jgpx0U98JOHB+j5r9qiupfEk93pjKq+cCPC
 k5u2DlEFLL4Ug+A==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently ffa_sync_send_receive2() takes UUID as a separate parameter
instead of using the one available in ffa_device structure.

Change the prototype of ffa_sync_send_receive2() to align with the
ffa_sync_send_receive() and use ffa_device->uuid.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++--
 include/linux/arm_ffa.h           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15612168cdf0ef94022e00c08677b5..037e0d684994fd30971f40bf139367d1e45c1bf0 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1018,14 +1018,14 @@ static int ffa_indirect_msg_send(struct ffa_device *dev, void *buf, size_t sz)
 	return ffa_msg_send2(drv_info->vm_id, dev->vm_id, buf, sz);
 }
 
-static int ffa_sync_send_receive2(struct ffa_device *dev, const uuid_t *uuid,
+static int ffa_sync_send_receive2(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data)
 {
 	if (!drv_info->msg_direct_req2_supp)
 		return -EOPNOTSUPP;
 
 	return ffa_msg_send_direct_req2(drv_info->vm_id, dev->vm_id,
-					uuid, data);
+					&dev->uuid, data);
 }
 
 static int ffa_memory_share(struct ffa_mem_ops_args *args)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d..e8b8ae8b192ab11d5550c16fd33fa9d192b07f67 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -439,7 +439,7 @@ struct ffa_msg_ops {
 	int (*sync_send_receive)(struct ffa_device *dev,
 				 struct ffa_send_direct_data *data);
 	int (*indirect_send)(struct ffa_device *dev, void *buf, size_t sz);
-	int (*sync_send_receive2)(struct ffa_device *dev, const uuid_t *uuid,
+	int (*sync_send_receive2)(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data);
 };
 

-- 
2.34.1

