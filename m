Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D1326F45D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422235; cv=none; b=peWei6M04E3+CFwmRsTVeKt7diw1574lkuM7NT+Ad91TH9ItVhS3Ov4cmCeyWEe8RS1BsNjxJfHA5C3G+4LjNkUv25fFa/UINakHs/mBgH8wTf+elMFfJRAokpriYi6WxX8859ZlTH5dHTw6MlhQMWN88QcZwh/wsMQIWW5HXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422235; c=relaxed/simple;
	bh=5isr1KMvKIol+JfAyILNZwX7BWeoRuMsLFNTNLOqo6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=QT27ZvqAL/9c2+/GzM03fdxoImGE7JznY97lUuue/T936wdbrlulmjuUBSp6wpjSnNg9S4DGWocECPzBktYDC97jIqBD7TFQKYQQyxqjyVLvbHgOW3Q/SNxoZc0GueAomcY3bBBkEesqqYTeAaAE6+oJqsk/mZ3vrwmmc8tf+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3CF422FC;
	Wed, 28 May 2025 01:50:10 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 448213F673;
	Wed, 28 May 2025 01:50:26 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 28 May 2025 09:49:41 +0100
Subject: [PATCH 1/3] firmware: arm_ffa: Fix memory leak by freeing notifier
 callback node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2

Commit e0573444edbf ("firmware: arm_ffa: Add interfaces to request
notification callbacks") adds support for notifier callbacks by allocating
and inserting a callback node into a hashtable during registration of
notifiers. However, during unregistration, the code only removes the
node from the hashtable without freeing the associated memory, resulting
in a memory leak.

Resolve the memory leak issue by ensuring the allocated notifier callback
node is properly freed after it is removed from the hashtable entry.

Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index fe55613a8ea993378474671d3c5756309da34fbc..6f75cdf29720993b1cd95eb7d3a36d01b0fdd1de 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1284,6 +1284,7 @@ update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
 		hash_add(drv_info->notifier_hash, &cb_info->hnode, notify_id);
 	} else {
 		hash_del(&cb_info->hnode);
+		kfree(cb_info);
 	}
 
 	return 0;

-- 
2.34.1

