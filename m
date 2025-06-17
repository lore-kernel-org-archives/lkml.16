Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882628ECE3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150714; cv=none; b=gd1e57o7QXT10sv/umBUcIAK+N/3eD2o3nl1ZmtXcMQfXlpHf9aeFeP4ATOFt6whV74htg2V1Y0e3ieGE0quJUgeyFsRB0/j5SoxVH2SGBZWbxCIU8+vZCCmSC2wNfMXrbtY83bGS642SKXK7BuXXr3sEggqDXnCFy/Gj3TUdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150714; c=relaxed/simple;
	bh=8TJDpueM5eiUXlQ9M07mk6zW4xitzqgSw3sC9cTsssM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJ8r5aqW8DErFrfCfEsXVrdGcP0WLMgaDESHeKX/Vb6P50pqe85Grg+YaV1YLdHUSTJr2xkjhPQDX45S06388q/munZk41/FHKPD1eMpMhsEqgphdW+QTCUVt9vCISdhcxIfG86cAOk8a/Wlrc9X6ANNipSHe/DiPhSRYCy3yQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce671a08so33759505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150711; x=1750755511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfjJLTpJyFXMLQ6/r7KECBJ9DkGKQT2YdbRrrQuTa+I=;
        b=Pnugegtg4vCk8uyHxG5ye6tTURHucKw9fwViKxkxG2clx6LLe2BbIG6nLjlcWDD0ul
         Yc+YQclQM2ttYiAntP0o056mGj90rM6IpPxg9jqONnKXnD40CRxxzHhKhWPPVL9xTymV
         zxPp9sl/CI8EJ+PseRb+XIIeAxG+/+x69tuDxOz9ti+btYltnqdVaFeUNd/YJ6rxnpZo
         8TsIHqZlmKw4OLEDMeHmwoALJ8p32GRP/qH+ovxmiMxIqNzeh+ygGb0WdCsky0gXxbqw
         49wPGEFqe6skow18I2CiJZrers+XDd6wmu9HuQBPj0eZtGIqGzg+uXhYHL5AxJfhbZYW
         7fwA==
X-Forwarded-Encrypted: i=1; AJvYcCXgTwx+I8ESXm2ddBLR6/DOGNtGR9EbtxvDewaOZs02vlruXfjEnWATrqad1ZgpKPLPKX+o57iWY1Suzwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6hElxslZq/rqF2ZDpBkyzdxFYA7ck711kmTeLpn7dB6mKlhFL
	8cpzf1jCg9KdZNiEVHAcGZoZRxvDu+XBFHCalXBL9Z0WCoY5TmwF9jww
X-Gm-Gg: ASbGnctEx9Sa6GcYoZ17UqZuGFYdxrhvl5WhD9LQPLH81AgWIvNEHzU4FRL2rtiU8eL
	CNTGKRr74r0ShMgOWOi+aNgfdMw+LsvN8qZYamwIvLUgNGWS8DM5MXVsEOZEjgeiT+5uP7hk8Pg
	DsSRHptwOcqYoYzhQG9c15X+tjmmgra7cjfZFfo+lHFwWJP1PI8ZYwleqyH9tAqRgGKoaPrLsbR
	WdwBpaf6DgPZhP81+JKWRicZk74eYbEhzGIQS4549D9f2AuXUmb1q4ktjD8UeiI7Ui9kB4+gRQN
	pTMwyt908z+skBCotUj5Wvm1l1Rjgui5y7Uiaz7vxQf3qB44YUaUrD+Vyq7hrYuqdCIN0l2g4yV
	B8K6aMH7cYk+jWpqos/jGKBX18NLk
X-Google-Smtp-Source: AGHT+IHOzHfJW1Ovlgj62rYyUFLF1W9UVnWrn5HIV5a/F+KJdjXTW4q9XQsGMgNDlpVD4HrCcObB7w==
X-Received: by 2002:a05:600c:8b64:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-4533cb534c2mr91467835e9.25.1750150710646;
        Tue, 17 Jun 2025 01:58:30 -0700 (PDT)
Received: from localhost.localdomain (109-81-93-212.rct.o2.cz. [109.81.93.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm172588345e9.12.2025.06.17.01.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:58:30 -0700 (PDT)
From: Michal Hocko <mhocko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	<linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH] mm: add OOM killer maintainer structure
Date: Tue, 17 Jun 2025 10:58:19 +0200
Message-ID: <20250617085819.355838-1-mhocko@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Hocko <mhocko@suse.com>

Acked-by: David Rientjes <rientjes@google.com>
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..5e339c1457ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15841,6 +15841,14 @@ F:	mm/numa.c
 F:	mm/numa_emulation.c
 F:	mm/numa_memblks.c
 
+MEMORY MANAGEMENT - OOM KILLER
+M:	Michal Hocko <mhocko@suse.com
+R:	David Rientjes <rientjes@google.com>
+R:	Shakeel Butt <shakeel.butt@linux.dev>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	mm/oom_kill.c
+
 MEMORY MANAGEMENT - PAGE ALLOCATOR
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Vlastimil Babka <vbabka@suse.cz>
-- 
2.49.0

