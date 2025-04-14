Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071E1DF27E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610499; cv=none; b=ApzRO/2I5VDIL+RrCJoE3Auw5o2Z4/n2wifyMzUApV0uLure8KtpgQDTYvtVWafevsXdfVC0PsBrsEFIa6LwXxXjyMXLNFoVX4WDcxKZ+FO68uXMNmurh8s9v3jO74QBmPqhWoj8gntwEo+xhc7SdFMI2dkkSq+OmN5H236uYWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610499; c=relaxed/simple;
	bh=EcMfXzjc0f88vB3toS0ABfI5YgnwjH3e+vx22X93KFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdEKWKNJwWlLjaWj+bfhlkiV4VD7Iw5EgdL2OtbqGWUt/XlF5+QMyg7M/OneS5fQgMEaMvgUBkQFBHtkTwzn7bo6/rv848tj/EGkhOYhGWT6JKFxSKlcGkABNmsx3kd3NLWW0UKkpConOaWwKqTpu1zQv1yxUWaJiB/s65Vl77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HTYxaPAO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HTYxaPAO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4167115e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744610493; x=1745215293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaK/Duc2/P3Mm4Vaom0POcUuZzetxOATY1/LwQLjocc=;
        b=HTYxaPAO6it1X/R8hCmBGh1YukhARnKn6Sk66iZfe3d/pXcD9OPtHtHphbf7d0KDUh
         j/XWkzGBcLxkY1hvT/mZZearsnem7MmRBkpDixhokQl1Wj97eJdJai56TbPrSG6fXN+U
         t19tYiu6zYozzvlabSkJBr+HfkVr/QcHrpIyObJP/c/iuDK7eVftGIkD/bW2HbeLv1S/
         X4K4OTU4//m5I1YX20bYo12P5j4F8YKTe9SSUNbVgHbCLIBhXX6RntfFOToZTkyq/RUh
         CYBCLJ2hoD0sqESpyTEg2hCYKvDJVxeVZ7KStFd3IoCKxNX5HwpmxN9z90fGs4K9qKbF
         HrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744610493; x=1745215293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaK/Duc2/P3Mm4Vaom0POcUuZzetxOATY1/LwQLjocc=;
        b=dmAhsSj4TULhgNcTK4NXfRbYLpz01Oi9JEPFdANl82dA/+rX4n3bv0laQhYCH2QM6+
         JMWnJLRohRsHhH0PAe4G9lWsh6mdXZBgUFTNv+08YWzUd46N6Sonaw8MtDEXvLznbKua
         3hRK/G1B0LIRMeA3apv7tGlM0JHmFoXiry5Yb6K5VyNBabg0OPZBM5Y16FfC77FwxR3j
         6PvWo1NtaHC6/hIWI6yL8Te3hOc+QBGzO3qpgkQf/1/UZIyitMF4S4oD23/aF2mZJcsd
         9DQEIBXvd4w+dQbV1+Mkk5ZioMSwMl4blaDK+ElSJho7gAk1a3sc0K82mjpae2DgKfjk
         P96Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6FmoizNsTLwEhejUkqfvn3xOGvECAUAlwLqWq4dLfytFBPwfmoCOtJ7OQF+wAs6sKETpRN0koKu7eafo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/l4QteUDVqFhrIf7lyX1LPDvKYloBssSWKSEhjMdiEluB0A/s
	curFQjC4NEW+EtTVvkqP0nZGzchEVk959RYYKRIuebsDqNUCvZ7gLhCCRAe2RZU=
X-Gm-Gg: ASbGncvWLUcyf+urMzhxirhxFJ4qbE1CYMqPaPgiq7eOIVJB4ZcJ5W0LaDOPJUnG0yu
	BHF1i/9OH13tAQpAyJI/anIRArc9bkmkDR97BTAIa9pefHxntPdpo5UDhPEpcP+fxLQIpj4HhzK
	hS0SvFa4bnkFRFGFRqjHwStw/IcORserpZPkONyDHnoruT+NUIgOPIbjZYIlJ/8C28hR1ruC4y4
	anfkigJuW48q9QUHtXLQo8+nU8GNyvy3y8A+9pNG6kDDyQ+jmBJuRJxwyxxXY9nH+ZSpJDejVSz
	zzKF/fpYw6TGjlPEavHMQV7+o/pzRyqAfKx6mmIjNyzFZyjqPB9nwRQ=
X-Google-Smtp-Source: AGHT+IHaEbtzDigymltzIRWG9TwpHrh86ssXQV3ZPHNTRqiUrqlLpO+plF92DL9K5QFZp6NOJ6mEYA==
X-Received: by 2002:a05:6000:1787:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39eaaec4be4mr3176931f8f.12.1744610492739;
        Sun, 13 Apr 2025 23:01:32 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c3c1sm92029555ad.60.2025.04.13.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 23:01:32 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gautham.ananthakrishna@oracle.com
Subject: [PATCH v2 0/1] ocfs2: fix discontig allocating issue
Date: Mon, 14 Apr 2025 14:01:22 +0800
Message-ID: <20250414060125.19938-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running ocfs2-test, I found the same issue [1] regarding
discontiguous extent allocation. The previous patch [1]'s commit
is incorrect, and the fix code is insufficient, so I am sending
this patch.

PS, there is an ocfs2-test PR [2] pending for review.

[1]:
https://lore.kernel.org/ocfs2-devel/1f3049dc-5536-4a27-8768-b264be062f7c@linux.alibaba.com/T/#t

[2]:
https://github.com/markfasheh/ocfs2-test/pull/21

---
v1 -> v2.
- we will recall patch [1], so this patch merges some codes of patch [1].
- polish the 'if' condition in function ocfs2_search_chain().

---
Heming Zhao (1):
  ocfs2: fix the issue with discontiguous allocation in the
    global_bitmap

 fs/ocfs2/suballoc.c | 38 ++++++++++++++++++++++++++++++++------
 fs/ocfs2/suballoc.h |  1 +
 2 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.43.0

