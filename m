Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F041C71;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750394771; cv=none; b=obAjtTTy2miextLrN84MaA6eDn62/8ug8wQcVJwgyOdWeg8hIMNdjYbE2xeJOvglg8N/iRPhp6Zx724nlvuHXUp7RxiULgrUWTM1kycUJudfoTyphWa/oLbVdqewTUrkvHdmkkxZA2mQFYncNBkK7c4fXrzXlAHJv5ufEcpPUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750394771; c=relaxed/simple;
	bh=lBthyPAfKhHtbhMUBAuoaz/8Tw5PYAJ1Odx6iC5j3ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iymfT3Ja9UQvNb5oWIbYu6aJOupvCUSa12o7l+lnp0SYXEqqA/Ba+4FQLTL2iIzOXZKVHp39JyG35IL7Bqb43rK+xPnjQqYu95WrOAAuq9YOFcCbbrVIgTo2Y/x+V8qjoIhtlGhyfDUDp4SmanIAzkHuK69G1cXroqe72r3JhI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAYj52zR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAYj52zR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3205BC4CEF1;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750394771;
	bh=lBthyPAfKhHtbhMUBAuoaz/8Tw5PYAJ1Odx6iC5j3ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAYj52zRcCalqKxhgJO2wpDazmmLcVSvTAwXS/I/ZXeNY7xPmOYNr8jPJPA8MVBxI
	 HVn3sek6n3r1VXBg0b6jZ1vxklQ1m7nYq3hCvdE5qCnkEdvzoICSKwVhoW4WnaVxIl
	 wuQ9+LP39Rtf4DFAOsRtShfRrlkoKHWhObJYlvsIeEBAqhCQ66hhzhCguA0l59hfI+
	 7AWcKZTNdG9Pnup6sKzSXvS4vvOWle1A6yOpY/mbvdRRg/DdxXKxdt9i9gMMgUB8Xp
	 lklq/NHlphhZri7o4BmuyxGoOvsEVsG2rD2hvNm0F7wVbapZUgrhCCoes+ibjGND/E
	 h9B4sP5mAOZfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A30FC7115D;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Fri, 20 Jun 2025 12:46:04 +0800
Subject: [PATCH v5 2/5] firmware: stratix10-svc: Implement ID pool
 management for asynchronous operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-sip_svc_upstream-v5-2-732d4ac08a32@altera.com>
References: <20250620-sip_svc_upstream-v5-0-732d4ac08a32@altera.com>
In-Reply-To: <20250620-sip_svc_upstream-v5-0-732d4ac08a32@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750394768; l=6320;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=n18tKLs7MLh8G8eEquC0bpSpqdEDws81zjcXK5xIQgg=;
 b=UBDiUNAMiEMsXDfvedE6nCVJOCm656l3r9jwuWLHp/akUpj1yL/bWWvK03DghQIaS3D0Y2aWH
 vLqbsAbUSDqCUXWfkhV77cL0MQ7CdBpCF6giFEMQSI/Izv7x8lg4BuN
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Implement ID pool management API's which will be
used for Stratix10 Asynchronous communication with
Secure Device Manager. These API's will be used
in subsequent patches for ID management in
asynchronous operations.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/firmware/stratix10-svc.c | 194 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 73c77b8e9f2b44a6729dd349ef0947ed47be681b..a8c57963da993a3d6207dbf802633bc82006ada7 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -170,6 +170,21 @@ struct stratix10_svc_chan {
 	spinlock_t lock;
 };
 
+/**
+ * struct stratix10_sip_id_pool - Structure representing a pool of IDs for
+ *                                asynchronous operations.
+ * @head:         The head index of the ID pool.
+ * @size:         The total size of the ID pool.
+ * @id_mask:      Pointer to an array representing the mask of allocated IDs.
+ * @lock:         Mutex lock to protect access to the ID pool.
+ */
+struct stratix10_sip_id_pool {
+	unsigned long head;
+	unsigned long size;
+	unsigned long *id_mask;
+	struct mutex lock;
+};
+
 static LIST_HEAD(svc_ctrl);
 static LIST_HEAD(svc_data_mem);
 /* svc_mem_lock protects access to the svc_data_mem list for
@@ -177,6 +192,185 @@ static LIST_HEAD(svc_data_mem);
  */
 static DEFINE_MUTEX(svc_mem_lock);
 
+/**
+ * stratix10_id_pool_create - Create a new ID pool for Stratix10
+ * async operation
+ * @size: The size of the ID pool to create
+ *
+ * This function allocates and initializes a new ID pool structure
+ * for Stratix10 async operations. It allocates memory for the ID
+ * pool structure and the associated bitmaps for ID management.
+ *
+ * Return: Pointer to the newly created ID pool structure, or NULL
+ * on failure.
+ */
+static struct stratix10_sip_id_pool *stratix10_id_pool_create(unsigned long size)
+{
+	struct stratix10_sip_id_pool *id_pool = NULL;
+
+	if (size == 0)
+		return NULL;
+
+	id_pool = kzalloc(sizeof(*id_pool), GFP_KERNEL);
+	if (!id_pool)
+		return NULL;
+
+	id_pool->size = size;
+
+	id_pool->id_mask = bitmap_zalloc(size, GFP_KERNEL);
+	if (!id_pool->id_mask) {
+		kfree(id_pool);
+		return NULL;
+	}
+
+	mutex_init(&id_pool->lock);
+
+	return id_pool;
+}
+
+/**
+ * stratix10_id_pool_destroy - Destroy an ID pool for Stratix10 async operation
+ * @id_pool: Pointer to the ID pool structure
+ *
+ * This function destroys an ID pool for Stratix10 async operations. It first
+ * checks if the ID pool is valid, then frees the associated bitmap and the
+ * ID pool structure itself.
+ *
+ * Return: 0 on success, -EINVAL if the ID pool is invalid.
+ */
+static int stratix10_id_pool_destroy(struct stratix10_sip_id_pool *id_pool)
+{
+	if (!id_pool)
+		return -EINVAL;
+
+	mutex_lock(&id_pool->lock);
+
+	if (id_pool->id_mask)
+		bitmap_free(id_pool->id_mask);
+
+	mutex_unlock(&id_pool->lock);
+	mutex_destroy(&id_pool->lock);
+
+	kfree(id_pool);
+
+	return 0;
+}
+
+/**
+ * stratix10_reserve_id - Reserve an ID in the ID pool
+ * @id_pool: Pointer to the ID pool structure
+ * @id: The ID to be reserved
+ *
+ * This function reserves an ID in the given ID pool. It first checks if
+ * the ID pool is valid and if the ID is within the valid range.
+ *
+ * Return:
+ * 0 on success,
+ * -EINVAL if the ID pool is invalid, the ID is out of range, or the ID is
+ * already reserved.
+ */
+static int stratix10_reserve_id(struct stratix10_sip_id_pool *id_pool, unsigned long id)
+{
+	if (!id_pool)
+		return -EINVAL;
+
+	if (id >= id_pool->size)
+		return -EINVAL;
+
+	mutex_lock(&id_pool->lock);
+
+	if (test_bit(id, id_pool->id_mask)) {
+		mutex_unlock(&id_pool->lock);
+		return -EINVAL;
+	}
+	set_bit(id, id_pool->id_mask);
+
+	mutex_unlock(&id_pool->lock);
+	return 0;
+}
+
+/**
+ * stratix10_allocate_id - Allocate an ID from the ID pool
+ * @id_pool: Pointer to the ID pool structure
+ *
+ * This function allocates an ID from the given ID pool. It searches for
+ * the next available ID in the pool, marks it as allocated,
+ * and returns it.
+ *
+ * Return:
+ * A non-negative integer representing the allocated ID on success
+ * -EINVAL if the id_pool is NULL
+ * -ENOMEM if no IDs are available in the pool
+ */
+static int stratix10_allocate_id(struct stratix10_sip_id_pool *id_pool)
+{
+	unsigned long tries = 0;
+	int id;
+
+	if (!id_pool)
+		return -EINVAL;
+
+	if (id_pool->head >= id_pool->size)
+		return -ENOMEM;
+
+	mutex_lock(&id_pool->lock);
+
+	do {
+		id_pool->head = find_next_zero_bit(id_pool->id_mask,
+						   id_pool->size, id_pool->head);
+		if (id_pool->head >= id_pool->size) {
+			id_pool->head = 0;
+			tries++;
+		}
+		/* cycle through the whole bitmap at least once*/
+	} while (tries < 2 && test_bit(id_pool->head, id_pool->id_mask));
+
+	if (tries >= 2) {
+		mutex_unlock(&id_pool->lock);
+		return -ENOMEM;
+	}
+
+	set_bit(id_pool->head, id_pool->id_mask);
+	id = id_pool->head;
+	id_pool->head = (id_pool->head + 1) % id_pool->size;
+	mutex_unlock(&id_pool->lock);
+	return id;
+}
+
+/**
+ * stratix10_deallocate_id - Deallocate an ID in the ID pool
+ * @id_pool: Pointer to the ID pool structure
+ * @id: The ID to be deallocated
+ *
+ * This function deallocates an ID in the given ID pool. It first
+ * checks if the ID pool is valid and if the ID is within the valid
+ * range.
+ *
+ * Return:
+ * 0 on success,
+ * -EINVAL if the ID pool is invalid, the ID is out of range, or the
+ * ID is not set.
+ */
+static int stratix10_deallocate_id(struct stratix10_sip_id_pool *id_pool, unsigned long id)
+{
+	int ret = -EINVAL;
+
+	if (!id_pool)
+		return ret;
+
+	if (id >= id_pool->size)
+		return ret;
+
+	mutex_lock(&id_pool->lock);
+	if (test_bit(id, id_pool->id_mask)) {
+		clear_bit(id, id_pool->id_mask);
+		ret = 0;
+	}
+	mutex_unlock(&id_pool->lock);
+
+	return ret;
+}
+
 /**
  * svc_pa_to_va() - translate physical address to virtual address
  * @addr: to be translated physical address

-- 
2.35.3


