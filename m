Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28516194C86
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237975; cv=none; b=OflZmnqJAsV9u/c3kfX1WYqLboC8UhRE6HA0LEJcD1bgb5NM/9AgRYHRBulPbxC2LH1J4cDCv7Ct7++xGh2NhgtgY5pu4juDrr/FPg5zZL2JLI7ExEyaV4WC0q9xMSBH9Q1NwaMuHUedoKSGU6pA2qmkHPVzspjslq0hlSWkacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237975; c=relaxed/simple;
	bh=3ajT/0AaF+ssgLbBu+eCQJ6PYQzsdtR6vak/LssE4is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKZtA9mfnV8YOQNcUW8YNpJ29WseNfnxO728hRlSBrYUlTipaKLmJV2ppSkGB6oiHEJYz8U1vkmTHyt3t3SJAEmzcy7ZabbxM96GWLdxP/ZvbCTbieV/sXkOq5/sjkVG4IhcG7cAJxuip5PrcIB0PNV9uo+DmXkY9BelJgHMkl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IseaZzfU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IseaZzfU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so830709a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738237972; x=1738842772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRdhxOCLTpy7gXxz6UiEgdB2jzKV6kI5ur0vXFJRzAU=;
        b=IseaZzfU3BJVfi0gQYUWVE5ptgafZpNgfPMMT66BUsVAnjjN4o6inqX5yo4kYQL2+j
         VVSCkekjY2pB7mtueMuVBU4WFp9lrYWQVl844VhZ2xRQUVGcQlpahcNcUf0inI/79Qnd
         mtVqetZs/KkzJFjXWgpXa0ZSsSInIys6NBBDjci78HzpLviE4549Tww+o6hnXmYFnZZf
         va3VieKQzLMumThin/rcgRLPIIvdTHHUaFwbSeBgdz1n53MXp4ysEi/s++R0pdiSjs2l
         EOR0O8sPqfRIkTqF+KTgxuoZOSRCIVf7M0Xf0pDWpXULi6nMiyJRg8gAjWOx7dQSCfsk
         /23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738237972; x=1738842772;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRdhxOCLTpy7gXxz6UiEgdB2jzKV6kI5ur0vXFJRzAU=;
        b=vVbYPTR+ABummIbGgh2TYlWmQIC/24PnLsQ8KI0iWfgewjS60GUxRWR/Djwlh3yiYi
         aIJwcM41eSIgzgJd1jzykX6uUMCwCC0on9s1fkpY+xAvLwxVcYe2E6GIDUp6jJSBPIXx
         NPKcWgOzKM7jjm2lllDFZvSRal2NAuawmNohcqpW82miAf6E3FmieQkShEBu+FsTYa/4
         qRmbHmEGqIGjHX/Lvr/MR8KAGSo8HimzIFNrVlVV72gx4nkHIYh2Pb3Eb6R2tjxa/OCJ
         0DvtUiZ/UhivfjPBwm7/+hHeLGMb8ySv80ZNoFfZxS6sBDfpcLEwSAKBUnY3mtfJ++Aw
         XnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFe/lJ2ihKEX/k4J5f/RFWm2QmMnOwr2mc7MA26ClbDuuVT4DE8iaDNLlGn7CPWB6NcF7LLhCCTHTJ3k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvoFTv1ow6noZyKKpxV0btYGX4J+HsRe6JVZRoLo6sPx7PKfdC
	1c//GXrXcHxFPYI1T+PLAYWd9RVB4VovdzkkDaZ2v4sX8QukrJXQ
X-Gm-Gg: ASbGncvcCIapphc6fAaOW2Ca/hLmDWfwyE6T6ngOUauPAW0sJ7PoN4joTqUl8ISK8rE
	9A8TVFD5hZGyzPCr8dyN5sPKRGrojFQc433Nj7lYEQK9d94iDh4MBDaU+FS9l1EQ7JZVvAvd/ii
	Ek2osOkuTGX4uDhLL8M0kqTnN7yjjbSW+X8XHQF5ys6enN0plPEYCXiR5jbAfvO+fH9oLGlxzHU
	UH+BaYBYIvy0//77iIqABoUvcpaulvYEPpmhSfPT008u7jjZF5xNMCC/tfjAuwtGabRHXAzcE3q
	7bV2WWfQHFYOwMKGjT1/rw25DG/gvDE1BHk=
X-Google-Smtp-Source: AGHT+IH3bJvIJrlvODXBiQSblyjvCfrjpno+BrzIiXcQsfAkh+tEDUmwi0APm6B3BYOOad/++Q5m7w==
X-Received: by 2002:a17:90a:c888:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-2f83abe98cfmr11283770a91.12.1738237972244;
        Thu, 30 Jan 2025 03:52:52 -0800 (PST)
Received: from localhost.localdomain ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489d3982sm1541031a91.24.2025.01.30.03.52.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Jan 2025 03:52:51 -0800 (PST)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH] mm, swap: fix reclaim offset calculation error during allocation
Date: Thu, 30 Jan 2025 19:51:31 +0800
Message-ID: <20250130115131.37777-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.48.1
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

There is a code error that will cause the swap entry allocator to
reclaim and check the whole cluster with an unexpected tail offset
instead of the part that needs to be reclaimed. This may cause
corruption of the swap map, so fix it.

Fixes: 3b644773eefd ("mm, swap: reduce contention on device lock")
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6e867c16ea93..ba19430dd4ea 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -794,7 +794,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 		if (!cluster_scan_range(si, ci, offset, nr_pages, &need_reclaim))
 			continue;
 		if (need_reclaim) {
-			ret = cluster_reclaim_range(si, ci, start, end);
+			ret = cluster_reclaim_range(si, ci, offset, offset + nr_pages);
 			/*
 			 * Reclaim drops ci->lock and cluster could be used
 			 * by another order. Not checking flag as off-list
-- 
2.48.1

