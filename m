Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76D213236
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209884; cv=none; b=oYKHoBeS7fhwAyMMVO86senX21K2EGb1X35RItAVQlnDiYfX/BKjhAu6cqSE8f2V5/2p/SgWxirGjm1GW+dZ22pcX2R5jc3Fliz/uYhgHRB0w8D3M4Liqc36eUgrL5ug/4kkTw5XxxVMcmuZ1bQcNz63HpKlYAEu9tvHDmCbc6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209884; c=relaxed/simple;
	bh=Tk/KE7Srtda+ZovswjLDO7b1i7B+ov40azD0zBdIlpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ES81UYL7yd4OppY6RTbTgzPV3hAedQWA6KvjSAmp2GdbBWgPMMNz1tl/C2IHmDSIDON3mlv3RymonCkbm1jJK8alBqRWjvN7ykgMvm8mxdF6nEv5dMCl4LDwOFwQ6cofLSzcucH1QxIleGILy0XW016KnTaJ3zlZf5QY4DSO18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Ia/jmRIz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Ia/jmRIz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7423fadbe77so4954409b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747209881; x=1747814681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1r1q9j/NiqaxCVnQX79fx6ZSieyvy37ernzXHZca/GE=;
        b=Ia/jmRIzhsCuD4YiktTiJlL9qtloSK0gj6HZVjw2wg/u/32Gt/e8byzt1Io3ZmF46F
         GhD7ROI2+kMCFGt6Y2zSCKVdqYZwGL9UaemfWlvLwJNXly/mpVYTgMDC83sRbDBg5Xzp
         WEWqKWic6a/x5pNc0ZKnC5GntryhFlDKR2ii8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209881; x=1747814681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1r1q9j/NiqaxCVnQX79fx6ZSieyvy37ernzXHZca/GE=;
        b=p33n8DwhHKi1Nh8yNTB/s8OMhwBe3SSS2ZqG9PSaC+sf/2J08CUJ0Qu1l1y5CMF9hN
         srVRkoLyKU0Q1TB4I1fbNuu+LqUtEZ2YLIDZaHcpU6BueYrbNIM9QPmeaf8lUxW7QVEk
         m7vMESkiTjajbRMkmlp8wad96UdYUbA1TfCk9/NCmWkQS5Lqg99X8uliQ7u4/N00eEQh
         qcMDwyR+b/TeWac6Tg3AXoxm98QEO5YzRMiVvtfCJigp4Ci4mENuvg742EGkiGczgXpN
         z2H63ajrf6YvCJtQi1fsmJxD1kkl3lab3aPQTkVEnz1QEhCHk5cNzCCiWx+qXR3P0MIa
         7+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVSEv/Uleo8q1whSLQJejmui4lgGG5H5WbIKN8bhq1e/hpNw5yPG34y4lRR/G7ocl01yKCd+nY0S8h39ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGHVUBrWaJCaLOuQ280qYsPYEQiKSZTx4uWzNMoZ9amt7gDbH
	Hf3V7Ax3WkIfoHSVhXioOtrv+6ME7ar6V3ZqeFmi12EccOGkanGm88c9QYsUmQc=
X-Gm-Gg: ASbGncvIWZAspn7dBZraZipzs3eHOJ5JNYHR0mnOCpT9OQh6LuHXhCqsDj6HvhknGZf
	PIuDQCCt7uVDiVOFsUImiEYLVTAzZVhM/YNrWZB71dy+5ViT6fDHH4FR1xnLQjJ8dNEGaFDTv7W
	co3P4nIXkl3YhMNy6CkiZJuYycZWIqUd/4GPOZizl7Ds+ZGHvCq33HTfXNTnhWqRqf2dbxRun66
	H3Su3oOZyi6JKNfwh4ISfOigd4qCxgEZFBqDWhZkXxhkKDGSJ6EEQWSisHfF1QqDyaREsjCDRX4
	yllbUx9mSzQhuWr3uHVFFbqxlve2hwesiMMcpwl1MChamCOab7i8wn8f5pWsGsRMHf8=
X-Google-Smtp-Source: AGHT+IGjjnzREvj/FCp6iOWskek++QwmkIK4fblbdLCYyxcvDMW5FxY5l8ARHhqFi5/9zGZiCAVtFA==
X-Received: by 2002:a05:6a21:6f13:b0:1f5:8e94:2e83 with SMTP id adf61e73a8af0-215ff093380mr4072477637.8.1747209880749;
        Wed, 14 May 2025 01:04:40 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b235252c7bdsm8426426a12.78.2025.05.14.01.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:04:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/x86: fix initial memory balloon target
Date: Wed, 14 May 2025 10:04:26 +0200
Message-ID: <20250514080427.28129-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When adding extra memory regions as ballooned pages also adjust the balloon
target, otherwise when the balloon driver is started it will populate
memory to match the target value and consume all the extra memory regions
added.

This made the usage of the Xen `dom0_mem=,max:` command line parameter for
dom0 not work as expected, as the target won't be adjusted and when the
balloon is started it will populate memory straight to the 'max:' value.
It would equally affect domUs that have memory != maxmem.

Kernels built with CONFIG_XEN_UNPOPULATED_ALLOC are not affected, because
the extra memory regions are consumed by the unpopulated allocation driver,
and then balloon_add_regions() becomes a no-op.

Reported-by: John <jw@nuclearfallout.net>
Fixes: 87af633689ce ('x86/xen: fix balloon target initialization for PVH dom0')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/xen/balloon.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 8c852807ba1c..2de37dcd7556 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -704,15 +704,18 @@ static int __init balloon_add_regions(void)
 
 		/*
 		 * Extra regions are accounted for in the physmap, but need
-		 * decreasing from current_pages to balloon down the initial
-		 * allocation, because they are already accounted for in
-		 * total_pages.
+		 * decreasing from current_pages and target_pages to balloon
+		 * down the initial allocation, because they are already
+		 * accounted for in total_pages.
 		 */
-		if (extra_pfn_end - start_pfn >= balloon_stats.current_pages) {
+		pages = extra_pfn_end - start_pfn;
+		if (pages >= balloon_stats.current_pages ||
+		    pages >= balloon_stats.target_pages) {
 			WARN(1, "Extra pages underflow current target");
 			return -ERANGE;
 		}
-		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
+		balloon_stats.current_pages -= pages;
+		balloon_stats.target_pages -= pages;
 	}
 
 	return 0;
-- 
2.48.1

