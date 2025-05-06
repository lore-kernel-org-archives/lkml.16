Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9DA20B806
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554064; cv=none; b=uAwIhvXiGJdD3ihzDDKEzxbsYhJDN9Akf7Z5tb/rzJdKKgmSOKg7dcEw693CLEIbipwrwDc3O3rkBFXhiMmsonV7+TiN/4oSPu5VFvDbXJtxS+uWX4IzxefVgw/nulJFN2MLBwM5D3wVXweHcavpC9eiJ9EkjbB0kWMacET7/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554064; c=relaxed/simple;
	bh=9mgkh+3nmmF07ECHRmFqC6uyy+zi/VIkBkd/wPvcMJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ed8gF7LcXf6MHmOKD6piYsm2d1TAoZIj4vY2yRByF2Q4JSZ9LrBovzyzxO8WO0wkWeOxMhZkM93Grd9M37XO/TIkW0uMVnqVLQNii0wPPMxztdCrRX+GbPnM4jbU5uV2J80BxYzP6mm+oA0DJLiuShuDu/lfvu38VXtz29OqpWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BEpB84IT; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BEpB84IT"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-3d43bb8ac26so1694875ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746554062; x=1747158862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovyunJMzY2BM/vnqYqDfx0z8WEcxzxmQSFfHAJD53dQ=;
        b=BEpB84ITlSHvyHyScFGMmeBJl8SeD60NHgaltozn9Lb4/Eiz8opkpCVj6iF/Yln7CB
         MVkZUFdYSkI9xpnqlZp74y6Cq1T/iCeAZfd+u2xfjn1wlUqpR1ntCrHryqyekcw/T+ER
         P1pd5Pupj1RRJVfNQQC0/1Wu0wTsitv6IoLOjostAPdiywSZnccInMqW62hmupVjZZkw
         V+gAfc/b0hh03gh/1yImSsiIIXDpPhLBHH0cs1g5D2m70AwRijwCERPk2JZfNn2Zhudu
         lPIwqNQC10bqa3Z07GMnzNNVaQNQQLZdcRDplH4io8PacAQbTOrMa107DSFpemnTvtt1
         UQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746554062; x=1747158862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovyunJMzY2BM/vnqYqDfx0z8WEcxzxmQSFfHAJD53dQ=;
        b=MRLvV0JQEONeVtGwC5J3AcOyG7IJsIDh0tnSirhjpEf6VhDfrA6OmSFNgWxJnyDilO
         rK7wIVhP73FExebG4983tRlooRbcEGkHPiFySwdbP3LkH7luB0ELegMbsobUK42+A+fl
         vEHFFsMWN6P0A/ON+0r25gMsgop2IL9wg/T5VwuI8XSLF6WiVmpU1ZFdlpCUUP0jVwIn
         8A/E+nTOyrdQdbbs/4CPwj/Ww9T6x10ylvQAGIUCAViiEn0t4dbShsWO8XoSAiI84mrA
         hMpYWcULqUoz5PLMKl9o0CWTKmQyyAc1jswhJa0M/T7uX84g1N5v/eCfPLk8MU9JaFDU
         t0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWHsRkVD2lFu3rz9MPeWp6EybxSvgrIODIz1E08f6dn/gMb/pSJnwpdaLILaP/d5EpTeMfSaQQiL5Zk6Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEftcmqlUZwRmfXTIjSOGNM282PmyBoq8jEMtNJCrljP9axhU+
	sChQRN57husAt9pwN4Npp2z09agdZed3T35aA/jBT2HD7kA17dL0QhO68M/epznlqHQg0wtitml
	9vgm/HFwtfkc9Ast+UvyrJHKm0Oin48UK8h1hXy778zplt2fh
X-Gm-Gg: ASbGncvUFu3YQbCJJwuAxj8iTpk8BavdFmEdxLdNhpYARJbHHAkGucz9KCFzFwjmIl9
	q2Jg4DyCSilPijv/MKdFezuWV0xwaopgIEiMfigrOdmewP+P/vUnguhPDBtlL9AMCwniz8RIBgX
	8hLNQI3+72rWe+zxzzCh+XCH7nzEFtmao5go2NC01xUz4Om9gk6G42gq/s52sGDuOEgvfuSSc/c
	FhQhXCiOiD5UbergRBAYLFWsOsa4OhgBkkmUORiEw6YgYJHre19RtxA9MfupAgH4awqCQwXdVZz
	o8ndxXgxZ3dMU2I7kAKOmEk+4BTJBw==
X-Google-Smtp-Source: AGHT+IGG5+67z8CZz9trHjpJ22gnk/1CqPuiaRkSCUUxhooa3Yd+geotR/Vte9dYVNo7S+ByK3+DgGrMmhi2
X-Received: by 2002:a05:6e02:1b0e:b0:3d9:2961:fa01 with SMTP id e9e14a558f8ab-3da723e7850mr3279115ab.3.1746554061783;
        Tue, 06 May 2025 10:54:21 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d975e34c17sm22713665ab.2.2025.05.06.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:54:21 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6E8953401CE;
	Tue,  6 May 2025 11:54:21 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 67ED5E41E7B; Tue,  6 May 2025 11:54:21 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Kanchan Joshi <joshi.k@samsung.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme: fix write_stream_granularity initialization
Date: Tue,  6 May 2025 11:54:12 -0600
Message-ID: <20250506175413.1936110-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

write_stream_granularity is set to max(info->runs, U32_MAX), which means
that any RUNS value less than 2 ** 32 becomes U32_MAX, and any larger
value is silently truncated to an unsigned int.

Use min() instead to provide the correct semantics, capping RUNS values
at U32_MAX.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Fixes: 30b5f20bb2dd ("nvme: register fdp parameters with the block layer")
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 52331a14bce1..a9fb8cd54420 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2390,11 +2390,11 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	if (!nvme_init_integrity(ns->head, &lim, info))
 		capacity = 0;
 
 	lim.max_write_streams = ns->head->nr_plids;
 	if (lim.max_write_streams)
-		lim.write_stream_granularity = max(info->runs, U32_MAX);
+		lim.write_stream_granularity = min(info->runs, U32_MAX);
 	else
 		lim.write_stream_granularity = 0;
 
 	ret = queue_limits_commit_update(ns->disk->queue, &lim);
 	if (ret) {
-- 
2.45.2

