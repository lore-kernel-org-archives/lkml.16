Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB682C60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639781; cv=none; b=GN6CXiyQUNMaz9Ms4NEah/8C0UrhKYS8cdTrrMXUr1xBKRBfGXb6d3fuKyRCJUDddPTEg5gEYAegaoRG7qPTc5xjq+EFIZlKxEehjAAV45S2iVqH2rzRc/oQNzR5x+Du6xFSoYzBBUfL7u1xlTw+4gyVF8MD3pTyWaw6/WJt5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639781; c=relaxed/simple;
	bh=AhbBIgHkLNVCNMm17JJi+tNpziBECUFPFNFEnQtPCi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRqLl0Eh5vSTv3tZNTfurajoP4dzWOHQwZx5qsREIGaEuKkaBAgUZdBNdK5FO28XZ7f5483bxz7x8Q7oBf1UoZ71IQM/fyBi+uIowdJzH1ViEB5obwTYZLacrZ8A94o9kwd0N0vPL4gusQ5tyeUFjpspYtIHyDlmfDVFJXIoL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBrjTStw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBrjTStw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7776945e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639778; x=1752244578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Hs2oYF3e3J4FN8zRTDauoaC2/4C3r7PLe1ATMwxGhY=;
        b=LBrjTStwPVZTMHr4KltOxl/G/bDJqOq7OpNs5sFhYwOAtT5X8J2xFNTnfVB70KkXwr
         UStiVz+lIFq2cM+fMni5XI3ui1Z9kOPa/dvhpPkON3A85Y6BRT2eMCntIffVmLkqWhg/
         IXKSCSG4XwR5QlZyfNGbzZ+6sYaCFlkp9br+b9OTX5a8De31AkpMRQE4CedTWeSANInX
         JoIDB0c3q7qgIhVsHfNND9vve4Mdy8t2S4/FY7bOz9F+DOed7XWLELflveoG9Ie32Hd7
         gcaDB3dXStdlY24x1HbCPECspOA+wDrzJ1mqHJydBR5yyFFyMBmgj0fkXvl9rtSyDiup
         SCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639778; x=1752244578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hs2oYF3e3J4FN8zRTDauoaC2/4C3r7PLe1ATMwxGhY=;
        b=Zr9jHhn1PWDkKJ++MVRxO1n3e4qntFtzCVLyU8jOJg29L0b+HNnrevb8jRCB3bUbpu
         avy1jkab3h6kOf0OCTAN+BaY5SPnsNzblRtQMpRsr/WlFcrYpDCaB92g1qy2CzTe1xw8
         /Z4m22xGQa73iGN1E2UFhDFafU4YMM6OfUp+voI9c0OBtKDDW6vuhRQfsxI7idlTLwDG
         9EM+7sdb1V/A5ADFkzEF9dvzmZC2Yjnbui6shjCW6mKGYey6Lm8ChnUz+WJH+cz3xuIL
         55r5n0C57ND2xHUbxYEgCLpS+ugcJz3NBdxxE0g4C5j1FJWC1EWBm5KHXO2LBDrCS5hg
         vJJg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zi1FnJvjLY8qKe1yPhfuOQ9/Ca6L87DTqVazxriLd98/qbnpjXFqC+SNjZZeXJC7zqXQp2mUa65NpIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMvSV2Xh3y1NPpCjEm3IVhb2YoyiswgO4Oe1OGdBWPmX1ApPeT
	yraRhaDtT45Hm7MpgaNPLI6LaqGiRUuW2Kd3HGZeuIFZu1Om/3oojr3xqp3KlIKvO30=
X-Gm-Gg: ASbGncs9wra5O2QrpS300nGRmAaeAOOzmDIVJhJiJw7a8dgobwzetutn0RSvekFvMuE
	vy/xAxDbRdtVAaP9VU2B0Hmbo8k5f5KcAmuSk8f9mn962YuVhwF2WPH5JrvM1JcoZIb5C5R8DYh
	p/Viwp+XrIxwzohKcR82bUq++AuUFAeG4lam4FXGCit2gVqafvs0VAtW3CWkSvrPPx3rU3Cxs8m
	RDLeEKzvmNm329zh2F1RCj7Hp4IpCkYHJjNOCUdVbDFBRuLLJ/nz8bWFHBI4v1IOzJ/Lu+D5cCL
	zYngDXGK3GjRhoo20AeidVDqP1pQV0KwSindW9ohXEAWm/0Ps34bNDx8f359QdwEl3s1clwV1/v
	3VHGjYA==
X-Google-Smtp-Source: AGHT+IGVXJLNTqwK5LP3uMmOBu1FgMt6ZJr2cqez2v1jW6Q3YnHqoor2gU+ujcF9q8/DDUaMcLVpiw==
X-Received: by 2002:a05:600c:8b84:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-454b929f15emr4298475e9.19.1751639777949;
        Fri, 04 Jul 2025 07:36:17 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:16 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 1/6] sched/fair: Use protect_slice() instead of direct comparison
Date: Fri,  4 Jul 2025 16:36:07 +0200
Message-ID: <20250704143612.998419-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the test by the relevant protect_slice() function.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Dhaval Giani (AMD) <dhaval@gianis.ca>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..43712403ec98 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1161,7 +1161,7 @@ static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity
 	if (!sched_feat(PREEMPT_SHORT))
 		return false;
 
-	if (curr->vlag == curr->deadline)
+	if (protect_slice(curr))
 		return false;
 
 	return !entity_eligible(cfs_rq, curr);
-- 
2.43.0

