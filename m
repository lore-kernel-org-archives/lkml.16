Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492BB1E1C22
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252258; cv=none; b=MPC2W/1gVLNwvhGwdhhDs+uGtz8ThCuNSMZxlPK2/fTI2Tfli0Z9GnLrLf5l8lv8NlCh4xIm3PohWWdFjo3RswDh0rmOALvNzR/tIiESl8gwlGhU04bWbdtB3oTpFObEwIOPesncy1IaQDuzjlAjl5NEx9Hn/uRlllCkyJuBA2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252258; c=relaxed/simple;
	bh=Q2BBs4sgBC+rV3+H3rPoTA6kzcY/ni/Xy190be33v9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyQH1tLSBzaIE+1zCE4xZ8Kez0PvHAXSwlDwvU1H2vYtMQyziwgfCLdvbsTgm8MA96xq+W1uuuU28gF0OV1xfD1uqoryvi83ral67jIKMjGajVOze5E7RzqPQwqyiVb1PtVaI1hxY/EDGjHZPcOooIqAry0Q9Kww8rkBfis19jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aTGcSbve; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aTGcSbve"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-b0b229639e3so381795a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745252255; x=1745857055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMEgWb5Zpf4MCf6w3ykJFs0Ob9U5wFpE+oGVVEOi8uc=;
        b=aTGcSbve1ZyaeEYwBN/5AT4C6qNObh2dyCg9XKcEbN1rf8q2T3xc6R1UzPuANpvQ4g
         D6ZznlxOsrS1mSeQ7Rtw2Htryi4ZZFiQyDO6o2bzvbFKDs4hRtFRviSbwVuYKbl7bayR
         H94OxMfIQo/J3ho9kLy7cKf7dHLmSXSQeNnDDgqJiyA5niYbLWIO3qtxjyL9fDzanzWj
         zF00H+PB1uiVnazrX4KYCVfxJs7hfi4CQvnEpjLNBYajiQs2t50NqbTyNKVSEdRK2BSW
         /nY3Bp6OXXysuv7HjWF30IDwRjXdWvDgaosgpWTal+u4Z1aJjsVNMFVBpgzczJ/pyANE
         tNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745252255; x=1745857055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMEgWb5Zpf4MCf6w3ykJFs0Ob9U5wFpE+oGVVEOi8uc=;
        b=w7Iuax00148S7ZEKCR2Kvn6Z/n6JrQblD/XufalHqKhJOb3nMeQbRXHSq0vk6+4DEI
         JHWdlqePsQ6EGboRjawrzHZWoX3s3eLt58BkWUoXoBPqYvE/fZEHk0Z98ryhFkDBFi+y
         c2mrIsrJaqYTwbBERMjK7YVKglkInn+SSLgaYjOKxtqgQqsv7avMpJUnJPjg00Slek7z
         WxciNApKdnsWIp0db65swxMX3zx+xDbhEkHtaDY5G8TmKQMLtHjgI1lt1h28Sp6/U75d
         Cx9Cc4Q9gR74uDkdSmsH+HKmejcuFCF/2hMTRpIrhosE6mLzcEVKfph+c6pYcNhJOK8k
         faAg==
X-Forwarded-Encrypted: i=1; AJvYcCUEgrj+EqmQOgucMTm+z8eVRwGKgtaYQe5f5AgnpR2e+4PGrQtfLA1Xp9fLH18i3vMyPmEN1GdMg8GOtYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXyVR93HjBYkf1+0LVKwTRyt4Gu9g8VMOwg+aWfMNp7pT6ThUq
	XjGzPtaSkUmyVWlCKAZyUqH75bXoaOsvIQ4vCfmjXLfAo3LO3q5WrviEVq29k77AxkFFI2J7r6W
	QIjrp5KEuaJbPTEaiggB5FVxQuxCKpMjO
X-Gm-Gg: ASbGnctCGy6Kt/XLTj8kZpFZRTPByh7h27vFRpn2rdOL9hKeUz33cig1vFcy5dw0u1z
	NzqMPBn5pQXM8xn8LU21Ry3RlWrIc++L1bWuyKPSDDNYvQCtwl7bxj7hju9Gi/1kBNHL2Q9OyaX
	ozLhBQBKdtUFeFVWwtGOZjw5ZzoX8rqa00ZCFvKe5DS2Y/b8iTmzwdTFpxUyp9QHm5JttGq/n5O
	BWzEKfVLrRwiButpAOUN087UUIwK2uNwnUgiu3iKeOupniEnySWFx8ajoDmW3N5S0zCRY1tOI7o
	/yJIqgIjExjzKMhKezS0U8QlhrKq7GH9LB0+7yWc9bfc
X-Google-Smtp-Source: AGHT+IE6loebWB1SWVve/qgKlrBiVTBt8NCR34+v7ti1HB8vnb5fZGntVJutHi+ayxKstwkEGksjiK0bSxi0
X-Received: by 2002:a17:90b:3e85:b0:301:1c11:aa7a with SMTP id 98e67ed59e1d1-3087bba8573mr6764330a91.3.1745252255440;
        Mon, 21 Apr 2025 09:17:35 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3087e05ee89sm472211a91.15.2025.04.21.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:17:35 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E961C3402B2;
	Mon, 21 Apr 2025 10:17:34 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E72EEE41856; Mon, 21 Apr 2025 10:17:34 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 1/2] nvme/pci: factor out nvme_init_hctx() helper
Date: Mon, 21 Apr 2025 10:17:24 -0600
Message-ID: <20250421161725.1610286-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421161725.1610286-1-csander@purestorage.com>
References: <20250421161725.1610286-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_init_hctx() and nvme_admin_init_hctx() are very similar. In
preparation for adding more logic, factor out a nvme_init_hctx() helper.
Rename the old nvme_init_hctx() to nvme_io_init_hctx().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/pci.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b178d52eac1b..642890ddada5 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -395,32 +395,33 @@ static int nvme_pci_npages_prp(void)
 	unsigned max_bytes = (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_SIZE;
 	unsigned nprps = DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);
 	return DIV_ROUND_UP(8 * nprps, NVME_CTRL_PAGE_SIZE - 8);
 }
 
-static int nvme_admin_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
-				unsigned int hctx_idx)
+static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data, unsigned qid)
 {
 	struct nvme_dev *dev = to_nvme_dev(data);
-	struct nvme_queue *nvmeq = &dev->queues[0];
-
-	WARN_ON(hctx_idx != 0);
-	WARN_ON(dev->admin_tagset.tags[0] != hctx->tags);
+	struct nvme_queue *nvmeq = &dev->queues[qid];
+	struct blk_mq_tags *tags;
 
+	tags = qid ? dev->tagset.tags[qid - 1] : dev->admin_tagset.tags[0];
+	WARN_ON(tags != hctx->tags);
 	hctx->driver_data = nvmeq;
 	return 0;
 }
 
-static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
-			  unsigned int hctx_idx)
+static int nvme_admin_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
+				unsigned int hctx_idx)
 {
-	struct nvme_dev *dev = to_nvme_dev(data);
-	struct nvme_queue *nvmeq = &dev->queues[hctx_idx + 1];
+	WARN_ON(hctx_idx != 0);
+	return nvme_init_hctx(hctx, data, 0);
+}
 
-	WARN_ON(dev->tagset.tags[hctx_idx] != hctx->tags);
-	hctx->driver_data = nvmeq;
-	return 0;
+static int nvme_io_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
+			     unsigned int hctx_idx)
+{
+	return nvme_init_hctx(hctx, data, hctx_idx + 1);
 }
 
 static int nvme_pci_init_request(struct blk_mq_tag_set *set,
 		struct request *req, unsigned int hctx_idx,
 		unsigned int numa_node)
@@ -1813,11 +1814,11 @@ static const struct blk_mq_ops nvme_mq_admin_ops = {
 static const struct blk_mq_ops nvme_mq_ops = {
 	.queue_rq	= nvme_queue_rq,
 	.queue_rqs	= nvme_queue_rqs,
 	.complete	= nvme_pci_complete_rq,
 	.commit_rqs	= nvme_commit_rqs,
-	.init_hctx	= nvme_init_hctx,
+	.init_hctx	= nvme_io_init_hctx,
 	.init_request	= nvme_pci_init_request,
 	.map_queues	= nvme_pci_map_queues,
 	.timeout	= nvme_timeout,
 	.poll		= nvme_poll,
 };
-- 
2.45.2

