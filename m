Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE07DA6A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622488; cv=none; b=U6uSBhJqWnuVBCQhT+J58lWCDxtuhswKG/ESFEn4N3g2gvU0cLSCOb3pQZRYIE/0g1vVuTcWBxot3PESc4pBDtOZENADAEiuE22/boUmD6MoU6uqtjORhGEzlcMRbT10egAloaZIxjUpdsz1yNXRKZ3Uk3Jd+nmlsW8fAm37jdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622488; c=relaxed/simple;
	bh=ek9FwTvpWstS6pLwqPkH9Wk/Ja/hmu8/yMqt2I2shm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhbjC9fT3OtW1tcPtE08ZCMIybLY0l/3rNOdWA1Vhs7Gy00G3iWIbg8u0F3N7H5Lhuy1yB3HMCUu0RnhbM4iixpHl/IHufZLJDp0ugMtRfVG7plz6QaOdUORESeYiWkSEoUJRGXpH4IyfCdC/5TVDeOm97/pzyK+akIHoiu290I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lpCkFA4U; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lpCkFA4U"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c542ffec37so9188385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743622486; x=1744227286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImvdCtilJthaEiYhafhJyo2XapqFCnVc2mKBR7Opxws=;
        b=lpCkFA4Usj+c9ww14y0XCttA78VZ6Bz3jpxRQDKFFYoKcy/MgzmJ5VF2aHppR6kx3V
         tjR7aEQHvwMqD21XMficXcpi3JUeQNZf/MynnRZkw2OG5HiWmGoADnwOrwYFqI/vxT0x
         lKy1InQeKPqkJrUgv+HPu/weVjveTQcsIWcQXRY2/jDYnYLJ4b60J95ildwSJt68Ua1x
         SQmVBL9hkDBOCVAdTUBiiWnmVSjtDTMEgkE4GEDgyeB+6+jCe/j5mNw7giZ08qrgD9HH
         Gd1KwofNoZnV1DBn0HUkcAagPF3Y//zOoTObiav9s9GniYa05DQdm6ynbIfeycsl53G4
         NnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743622486; x=1744227286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImvdCtilJthaEiYhafhJyo2XapqFCnVc2mKBR7Opxws=;
        b=j/XJ1b7E3P5yLbU20DQKUETfo++ZW07IXh3J0bBzrXHNA7X3kL9XyoKHgzs8nuj/aN
         JZXuK7swtkxAdgGF2hI1krvrzDJ7+vE5cZHSiNuP1TpzwLQbxZN8RJM8ewDcMignPYXA
         8uWiVK8GWQooTbbjeUDE20c3pc1iuT3WBD02KYkbhbaB43IpnltY7ok+7WIjhWGDD9GQ
         OR+C+63dfMzrOl9HiJjOuhXyOuecP8H4du0Ur5a3wtr3TZInsAONEX1rf2Wa7sTxLirO
         2831Uw3pewSc/HkwAr+9tPk+CxlXaxSOFXot/uHA6rei9+FUsTLNszXNisanvk2EOgzP
         YGCA==
X-Gm-Message-State: AOJu0YwNXxwoQJMecgPSpGXtWx8vpCF4f5Xyc8WWm29T4On9fGUJ5to/
	o7P0/dtfxUS+C6BJAHbwNvhT5UNNZk/PzVJ35+tUXAb1Eo9Jamxrlcc6PS4G0M4=
X-Gm-Gg: ASbGncs7PJ/677prd+cmC0xgvMJIiYC37PyoC/O3rRzrcApVD7h1Z1OSMrQkqffwgCx
	aKSruofoZTU3M48KHLLNHZoGkhCvPKtJpoDGCCPELIfobkwkY25aOyu6nsLmz5C2/LZmZbS0qF+
	X8NI7Q20wEpM3Kq/D12rtabUnhmY24rpav3pchRB8j66hUHGUYhOqJJDWf3luH/KNamWzTIC74e
	FPJiEXN1w38eNyN2JSO0VltIkyIT/PTsupebyCSI4S8Y7Zt92roFPlr7jY3LlWENU6rBfydzdRd
	3/NJqnu6RXyiKRMJwzVM5ENAG43zxo8PxRN7w8KOGoYcnxGHCITfM1o6ZhZ8ulC+mshOUcty5SM
	62no5DY63bt8vN4L1s1rlFsLf9ZOWvaMI
X-Google-Smtp-Source: AGHT+IE9PJpwixkYXExJXaHEoP0KU4gHdYtznJh8E1BgbNuRx6ru/Xr7FW8dYCLFwds7hsZNLKVxhA==
X-Received: by 2002:a05:620a:461e:b0:7c5:a513:1ff0 with SMTP id af79cd13be357-7c76645c32amr642482385a.34.1743622485812;
        Wed, 02 Apr 2025 12:34:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777dea3sm826277685a.102.2025.04.02.12.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:34:45 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	alison.schofield@intel.com,
	ira.weiny@intel.com
Subject: [PATCH] cxl: core/region - ignore interleave granularity when ways=1
Date: Wed,  2 Apr 2025 15:34:43 -0400
Message-ID: <20250402193443.944654-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When validating decoder IW/IG when setting up regions, the granularity
is irrelevant when iw=1 - all accesses will always route to the only
target anyway - so all ig values are "correct". Loosen the requirement
that `ig = (parent_iw * parent_ig)` when iw=1.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/cxl/core/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 04bc6cad092c..dec262eadf9a 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -1553,7 +1553,7 @@ static int cxl_port_setup_targets(struct cxl_port *port,
 
 	if (test_bit(CXL_REGION_F_AUTO, &cxlr->flags)) {
 		if (cxld->interleave_ways != iw ||
-		    cxld->interleave_granularity != ig ||
+		    (iw > 1 && cxld->interleave_granularity != ig) ||
 		    cxled->spa_range.start != p->res->start ||
 		    cxled->spa_range.end != p->res->end ||
 		    ((cxld->flags & CXL_DECODER_F_ENABLE) == 0)) {
-- 
2.47.1

