Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88885336D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744677374; cv=none; b=URO+NaSQzTeZUtd19x3qsrmEhNmCgmMkZAsj6Wwbrn0wN0Loa6wlObRwEvedWvP1RQQiFhfppCJSN7H6LHcDDzUlIHxPEDMnhws6RXfUVMJx6gsEgM4/bG3ln4aRTTR4E+x7TZFAhgsiiWMyZLyIkob9LmGMS8KO7X9klElkMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744677374; c=relaxed/simple;
	bh=LEuj0zTeLLpkG05dg2Zoyugw7298JWwWjK2vmeLX3bE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hNCm5Tuy85DCi7S7K71kQvexT1Jd1g5iaRtVdN+VEsAv5LkCqfECQCYvcqK1sMatNATWMMT0jhmhV72evl+9XMHKHAFVx3ZPXHpLcnsGrzGPL8b8JzEWIMxc71BDn5Gac8N/14yx3IMM32KSiYOPpWnxlT47Q81+8Ru1JlZproE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COEyQ5Nc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COEyQ5Nc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2260c91576aso41587535ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744677372; x=1745282172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FObC1FQoX7wcUW8DIX5C+4G4/pYkkiqq1+xi8wpD7gk=;
        b=COEyQ5Ncd0F8VjnCc5VMnJ2dKjrplo97ttcCfQM2HcKNgQ3iIqhvjxytKzVVNAZUkz
         QWnjON6/emte55WI8OJaCfiVICEoToiLex0V6uTttcb85IRFeaPOuOat6P4e9SGUpLML
         7tHmt7zHRIYWRtuHtbeKFYIJ/uAUiQrL/cHpW6a3UoTc69Sqnp9JBG9ctKWSgnKOvofY
         g96NIIXqSAosNHDbdjfuRoodXG299zrGIJ+YOKhHnM4gdKWun4sax1Pod6fUXIw2w4BX
         8s0Ld8TJBArkPhbdlNV/itNFRE/JM9zOpQ592jUHewbnfLsmYRuihNeIpyXlUrrkG0i8
         8QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744677372; x=1745282172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FObC1FQoX7wcUW8DIX5C+4G4/pYkkiqq1+xi8wpD7gk=;
        b=efqkpKO8I2JFR5FONqEXW/15o8U92jZ8nCMwuFSKJFQyhz5LSYjBcDEt9cHgAVCQcz
         rz1OKIkS3EzNAJLRPTlbGI+iLjHocu834IIOL+BgVOP2seJFYHqzQvE9TBpLrcaPAbFa
         dMKnvI5hvRcPSSyu/1gHO2qKCJnoO9wZIFdl3n2h2jDkfXim1tos/FX+ND8hT3zWgNPW
         OxW7HE01NPsq9KknjCadBzyktWcmu98s+k0+sjDmNzDYzT6eAVbYfqLcYIsaf2RT5Wv1
         ixzM/Gnvw7WGGh7W39TD6XtNQDavWYXL3wFXo/m6a8eQhoQEmkMYCE/vibEMtM+6yG/b
         oWjA==
X-Forwarded-Encrypted: i=1; AJvYcCVgovaudMt2wgkzZGT1MKGvA6Zcgybjmh1c6JrK5/o0bU55uhI/c59GVxIxNXZzBDLVVxC5VOt3NlV0IB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8jf1s/5HIyB/80Ynf04XPU7bN4Yh02IEBcHfjtZ9zWyGMsroc
	9iA6SZXFejPnBjnW/JF9IaaaV4qp5Y7eN3iDSOamfbM3TMra7msH
X-Gm-Gg: ASbGncs9o2s+/6FvKtMMVxF7bXH7iN3OLk1jiOAfV053OcPt4wzIab3C0ps9ztX2V0N
	A7xNWg7EdVrQ4y4MfVQB3fLGuEu9BNMmhLLqgRncXQCJQi1jr7Nidii9ndKDp9Cp3x0/6psOXSt
	bPNpbc/RiVp3G2iKuO2NlbKHqTL7qPF1ZsK/ldjy7vN9z+zy+kNELHWra03H3diTHVtJV1HPlaa
	BKr3r4wCirU65EmPWa3//PuBN8RoScZZxk0k9S+LO4j1c/ZQs+1CkxW3toYLC3Jc0uR0afbI+17
	wTUxV6dajXhdc5r9Eh5+2U8wEyxIdknOayIxJp4oMVu780Je8CyhUdB5ECkmLQ==
X-Google-Smtp-Source: AGHT+IHo9LqK4Na+HLPhDXqQiD/oIy0QbEs94gYSuUXhtOzqo9jzw1vy7QEfFLmVyrvmb9ocol3/2Q==
X-Received: by 2002:a17:902:db0b:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22bea4fe110mr196569255ad.53.1744677371792;
        Mon, 14 Apr 2025 17:36:11 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:6591:e5b9:9bcc:87c7:66b0:4484])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97233sm105464445ad.109.2025.04.14.17.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 17:36:11 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kevinpaul468@gmail.com
Subject: [PATCH] nvme: Removing deprecated strncpy()
Date: Tue, 15 Apr 2025 06:05:51 +0530
Message-Id: <20250415003551.22949-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch suggests the replacement of strncpy with strscpy
as per Documentation/process/deprecated.
The strncpy() fails to guarantee NULL termination,
The function adds zero pads which isn't really convenient for short strings
as it may cause performance issues.

strscpy() is a preferred replacement because
it overcomes the limitations of strncpy mentioned above.

Compile Tested

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 drivers/nvme/target/discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/discovery.c b/drivers/nvme/target/discovery.c
index df7207640506..c06f3e04296c 100644
--- a/drivers/nvme/target/discovery.c
+++ b/drivers/nvme/target/discovery.c
@@ -119,7 +119,7 @@ static void nvmet_format_discovery_entry(struct nvmf_disc_rsp_page_hdr *hdr,
 	memcpy(e->trsvcid, port->disc_addr.trsvcid, NVMF_TRSVCID_SIZE);
 	memcpy(e->traddr, traddr, NVMF_TRADDR_SIZE);
 	memcpy(e->tsas.common, port->disc_addr.tsas.common, NVMF_TSAS_SIZE);
-	strncpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
+	strscpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
 }
 
 /*
-- 
2.39.5

