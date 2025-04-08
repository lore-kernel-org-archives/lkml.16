Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54022ACC6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125356; cv=none; b=c73uO1y9fzWBDT4oDkDexjsC0x3u1bZlvFe8jTLmTh7BXTmcIYe2ZqwJ021jOtaBfom2rJVGf2Mz6cwgp5HsN5W9x1jhZ7A8l8YEmg9WwPsNFJrco7Ww7rp+aM0vmLB+NVIyTsOLhCFTPIbPQLO73MbPHupXNeOw4SnJuXk9Hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125356; c=relaxed/simple;
	bh=S10e1EKl4g7nKLhulgV8/aF9O/TCT/Mu8Jm8hC6L6KM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YJIeFUIX2x32+0hDO9sP1lneD4J1NAzmqzGVujMo0JfX4Bf/VN4QPt1e40zpdaSENWK1CUTEJ/FODDJlw2TQ2jn4wf1TZfHb+4qf9b/24xFq4ieNEkZAjUme+CoqeGpiutaFrVCZuEBRNmr2fB1fwLsLfwt8v77i+T+hXDufn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elhVyN8D; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elhVyN8D"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54acc04516fso5336968e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125352; x=1744730152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pjI1b2spCBCPygGiM6HRgXBUJIW/FFg35fPOa9S+028=;
        b=elhVyN8D5G5w1MfyVfOYWizhA+yEuD8ZGNpEG1e8SU197b51ukWhHlSZ5HKeeaVSmD
         p+0nua1pIlKPBxnawi6e5sUDPPvc63xc4z4Wtjruu8hJKwCI5hMalOG6+Pl4VD/rb9n5
         Ivg8FcN9Zw3DR3qmqQdyDBw4pgHuTu4jJShz/eu2AW73H0IDXaz3zELtJWtl5/yHAEHY
         aGmEBIR++I+iXqHwjFvQ8Azn3fm3JDynkmAU/L7ZJuRRQKb9z5ntxDhgp9xHvRNrTg6g
         0p/sv9OFePWsEEfO8G6p0ZXkyI4yLWMoXU+0REmpA7hiVsWR8nThjB6p7rM2voFhoewc
         6IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125352; x=1744730152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjI1b2spCBCPygGiM6HRgXBUJIW/FFg35fPOa9S+028=;
        b=ClcufMhS8vaZYqm7A0JU9e3tP4WkVWEZLiB28lFohz3XQUHHXgAUuj2J53DmNQ3xcL
         UfZFxGUk/D1y78blNeCEPTu0HlkY0K2N2JhtjneiEKp4Qc+l+P8eA24px5g9AIgE6j+E
         wb1jB1BLOjVvToJacyMVBMyJ5/vUL0RcpOPCmFPFFtTvwoQiFhqQQqGbaXz4A3V0m/wS
         tWmaMWIe7DjV4DMmO3ikUvGrxpBk4k/ZQs0nMXwpqRT9/TOnVmnCxVB9ExqT9w5IdUjb
         +UvSJIZoTzOOgI68d0HU+v/Wl35h22bOv7TSPJFpMSRpakhz65PWFZ/IPgmH1sOsfYCg
         /PQA==
X-Forwarded-Encrypted: i=1; AJvYcCX3jCi5j1rArxrVfM8E7v1wyFx1Tfg4MVu9iAWA6Xy6060l1FZzHN534SFBPvWRHla4pxwGoBFtVKWdKqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziAFEGMgQbNkG0Txx4IQ3MbKJK24iB0aSMbJkBq5sVDgHDLPv+
	OkogWwIoJnsxkpZw/5sBC5Q4XrfWfqgABCHPDpmHM4ZMk6fQcPjl
X-Gm-Gg: ASbGncvQXvYE61ZC6TIM4HazJN1jcPDS1jXdLr3ObPfOajLx7XopZ21trztouvejq4A
	AFvTq5ed4ub5lokwVQGarOMhMG2m9f2MEqyPuFIwIL1ofxIXNTST2Z1EaRwMpl5GwczlB1ajdAR
	2U797Nc++SHTMhMk28exWnBdVVXWW7VzDkHrWIsJVs+jCuPIMf8lUJ9sHtT4IpEyaWO1lhY+GPV
	fyG9q3LFBBLRYxdhAsuo0h/yi/YSa1zbCawGMV/V2wzaSgpFb6qbXyIf1/ABh3SYzFvu2Sbsd8Q
	HvzZqAXstyKFeOwhvZdF1lnVlihVNeIBG3+QarVm
X-Google-Smtp-Source: AGHT+IE5UgLce1CQFdWXTbdofd7Mybd692NItZFZpyyUK2Ug2JYAskRQb4EDLK6PRjY+sJHYePT5zw==
X-Received: by 2002:a05:6512:2250:b0:549:55df:8af6 with SMTP id 2adb3069b0e04-54c2335dcc9mr4505739e87.53.1744125352043;
        Tue, 08 Apr 2025 08:15:52 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65db49sm1548603e87.206.2025.04.08.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:15:51 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 1/3] vmalloc: Add for_each_vmap_node() helper
Date: Tue,  8 Apr 2025 17:15:47 +0200
Message-Id: <20250408151549.77937-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To simplify iteration over vmap-nodes, add the for_each_vmap_node()
macro that iterates over all nodes in a system. It tends to simplify
the code.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bcc90d4357e48..e42ea20713dc7 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -900,6 +900,11 @@ static struct vmap_node *vmap_nodes = &single;
 static __read_mostly unsigned int nr_vmap_nodes = 1;
 static __read_mostly unsigned int vmap_zone_size = 1;
 
+/* A simple iterator over all vmap-nodes. */
+#define for_each_vmap_node(vn)	\
+	for ((vn) = &vmap_nodes[0];	\
+		(vn) < &vmap_nodes[nr_vmap_nodes]; (vn)++)
+
 static inline unsigned int
 addr_to_node_id(unsigned long addr)
 {
-- 
2.39.5

