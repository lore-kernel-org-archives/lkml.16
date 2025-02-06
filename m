Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DBF226884
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848011; cv=none; b=tEG21j14LlskQwgWQmkTHZ04KjFTYPrM+4oOJiU56wOtpYUHXyLxQtKGseyOJ8zmOT+nwBRB1O3Hf6VGRu8KWeobGyCYWjze/1GxpctbfFesSX5Kv9W//fDZQ4Rkllm3uYyleuASe06rvsU30GTpD759s44Yo00RkPCKCJBZiDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848011; c=relaxed/simple;
	bh=0F6nOjUetrXOfzInBD9D3roQgpO3tl7/CFQLwv11kZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cddi2NO5+QZ7Iq4s6eQ0ZIw7NF56wLITZL/wg1TdLHTVyAAdUHG6pDHHpcOdvCbDt3LPMAW9VTMfHoABZkWr4Tp4UglfiBDH9QQwe9asueHtqKWrTggXOdJM2eT00Ba8VGbN6kdz8rwnErYJ9++UOMzjqOCWrMP3+WbjeUc0cKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hwJJM1ZR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hwJJM1ZR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2161eb95317so16777225ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848009; x=1739452809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf4go4iQL4QMflVyTQa4GngDZqe61egNHavae1e4JE8=;
        b=hwJJM1ZRHaGTf0qSnB9Effwzv1/KyvXpNSTs8CxQavApMmDwPmVb04MMCYKqCwjtZa
         0wZ7TMFwS0okfaaCIUbKwQAMHPcWQvkii33Va6Q1Yi57TjncuJOtQAVj8kj4OSL4qDbT
         isADFT+3wPegsoQPvi2+cgj/eb5XYhrfPxtqSwPiHc17fnTzYPObXCgtbG//wwl1mssD
         1tM9AyVhZ2/c8d30sWgsXRPUXi5lzfNle74UGN1Sq4We9cZnJDb7PgBXXZO1exC+ujE9
         kMNU7h9dk+rxnEO6+49dP0pkQf6eW0GjxU7HREaUk9C+YxHeB02DWxbg5t4fs2T8bIRX
         toMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848009; x=1739452809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf4go4iQL4QMflVyTQa4GngDZqe61egNHavae1e4JE8=;
        b=NfgBmASXZByYV6ud6zVelOTh5+jWjl0mUGqYOgDzK36jFP3wqv6iHPDiiWY7BmGwKV
         +GXQCeTtPvMIQgEUx/RCWgaU9aqXeURORsAYffG5bwRKLREShibDd6csPpiYFluK4cHp
         0AJvH/8LxHQHFgMyoaPsSzo5OyFeW3I7X6ZJGmXRRO/QvvTwqZ5LPQoSHbWzU/mb93+H
         EmAt0Pwqqj/MWhPFsKCvtRjFaQdQqhwUIKVLCruYMBZk66zxBwFAfL34B5PpMegb43NA
         VtsODb/GV0WCRYCtGzczw//3hQ+qZCqbANByREK9oALt7ljtjj3hp0dhVcsS7cgD/o7D
         u3XA==
X-Forwarded-Encrypted: i=1; AJvYcCWfJEVKkleMtSzULziGOFgEM0VsYgjoQslsYs1Gru8hYKPje+e9tadl83DD9liDAmgFEGRGtZnVNsjYf+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0fGKCUNssWNVkgn18Nk2++8KBCKeYB6Js/GVzoxBq4dD323g
	RYrgB8VcnqRsbvQ/JUoCIUDHds6wf4nVP0Bb+j75OPipir/cywx+iDXm6RRWtbM=
X-Gm-Gg: ASbGncuztN0h6opRMBnYNxb0YGyxj4uyDczjkKUx2kbxoROIivTnWEt0Qkg/D4SReEQ
	VYZnovKam9K+vPYCt4RLBxA7uB+WQCOMYMiPsdRiMgq85CXhxsd9C7xa/PaZkpqmEDKtoLNYe/i
	vCwPu97Zr2LDqPxrLCn/MnhPswPDgEKFEyMXaZOB+3m9BNYmC3ay7X0Kgx87FDKFaOorkMzDR2T
	lfnoszYQEMpDRGsXPCYhaIrLlmllRKnlbdYYVGvOytk99RZNABpsppIrb2n2xo73eDYpyt8cxQH
	tXdw9oRZ0Apik4ptZg==
X-Google-Smtp-Source: AGHT+IGCPThNvLp+8va8nWxjbFE00U6UwUxIviEx1VgOqPw4pw4AKuRjGCX0YPWkMIbmGUsUZc9LiA==
X-Received: by 2002:a17:902:cf12:b0:21f:46b:a25 with SMTP id d9443c01a7336-21f17df5701mr115615155ad.16.1738848009353;
        Thu, 06 Feb 2025 05:20:09 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:09 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 2/5] efi: add riscv APEI generic processor error printing support
Date: Thu,  6 Feb 2025 21:19:23 +0800
Message-Id: <20250206131926.91289-3-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

Add support for riscv Common Platform Error Record (CPER).

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/firmware/efi/cper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index b69e68ef3f02..50f84a0f2801 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -110,6 +110,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISCV",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -118,6 +119,9 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RISCV32",
+	"RISCV64",
+
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.20.1

