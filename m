Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41B30E840
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371353; cv=none; b=r1hOppcZSBkL90cnvTlaxYXQxB6U1UxZ3WD+zy8vXFxTRMOQIiIBJ89UNFumbZeuKjo0qFoZBFmwcL+am12q5EdV3IumUOJwQuvUZRDYRFbaFrPPrts7MbnUFr6P8iBieQrT3ydrFoileaV4/S8pVCLW/y23GCpdXCCRceS7IoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371353; c=relaxed/simple;
	bh=2O9L8KQbOaimpU/NGoGKpNOp8mQD1QYvtVyCOUYNeDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMHffWj8BCd0z0YheXosJb53McTZOPBSaGxioU/vu57hSbT4Yi2ntEDtYF30bAadiluovE6SSnM8thkFoDZFl1nkk75XDKPRvSifMFgTHMhYfhA7+xzxbnnZT7djf10DT4F+euB0Qh6ssVUT1KD0eN319t7KoKUR422sKJNTkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyBaL0Kr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyBaL0Kr"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad93ff9f714so217453066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750371350; x=1750976150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNfrG4Bfg9YObUTtipt0qO014+yc19VBfl86JokwY2s=;
        b=gyBaL0Krv1SF6H2ZFpkQPdTYgkPx+h86+IbBeZ6SgD8bdXLDNhDewndWDEYtGX0yBS
         i3zLGnXuA2QHT+Q/+J0h0bW5Md2XhoqGqHtUaDrN26ZTng9lA5kGdlbsE4/rELJ6D4vE
         wr1gI/x3SXUJUb1tlL64bNdgKrXyv7yrYoguAIQwqtmWyajoP1UVdIMriOJju8ELFgmL
         bQXyJ5YFChjn0kZlzCk/4KCXrjBR1ty8E/TOMTb84CDFMdVBXU+MUTvvCFeGozut8uLO
         moQEHUJjnT0+7l6OEPpD0nOxHEBsGs/Av1zJKB3fdJlH1A0XiNJ4SmSQyokTdYGnCRMY
         JR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750371350; x=1750976150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNfrG4Bfg9YObUTtipt0qO014+yc19VBfl86JokwY2s=;
        b=D+wtpABYqr3v1Xsy9wGD/ddOi9+tx0qgXXgpfJwc41EesrMBsqd5QrlRa6iO9Ti9dP
         VLj4cBnyb7U03yOzRt299Yby3/a0wj3lUdC0JuuDBG1Uk16RqeddoKTI/eNzEoEsli2W
         qNfD8bUCgP1CeI1btgDIGjgpYLsvChtP/GrwgkAqWuUVjnn/oKD8oH99AEQ8ppM9jDWa
         07S3BpjBXQBr48ehV14MbopCjMNrQB7GOV1YETtMbB+m8Ze+odr0SKuzfGI1fPOW4AYZ
         6Bx9hrBmF8O33Bhe7BI+pDEiTyjiot9/CEk5mG6MtEsnYlww7wfRn5s603VM5SWK/IZq
         /D/w==
X-Gm-Message-State: AOJu0YzGBb0m0kmPaQ5OK6Lqy+OeWRN9Y0nHfP6ka72xsvB8k8ZbJKDY
	/BxTNhSIuUv5b5WGE9jJ9urZW15jUZFG1cq+0+nCkefZ9Z6HixYWpbLdaNckeufM
X-Gm-Gg: ASbGnctx0wfLtjXo/yu71cVfkH0uz/tC3xtlYkMzXUxlMDFg4qU4Wm/GxYveRl929fQ
	7hYpy/CpDc+6FmB2vESqNQXWYQrKe7d9EqiOJ8n24cgQ/98V7HSyG4HNmacRF+oYYNrms7F21kh
	aLdVK9jWP2FuiCfXt55RIk4DivZRd3JKjLHJA/Lu14ZOYYPyvUxtALbCHbLz2ovT+vbKxYvV6x4
	5dG6nb5l3SnMzN47VVSYXWEgWpCR+NGWNAg6SoTkiV32y2g1/+C4gRoEnCjDjX8tvh3fg52hRTo
	5QjNBW9GghF/wAQ0dc3piuqVvmjFZ7TyMwqhTJePsXDujPvPeRMxywLkMnLxsjlLKc6PjkQsmQ8
	8eEnzyfiaAIhHJmkI8o0g4qo=
X-Google-Smtp-Source: AGHT+IGgie2CJFYfFLlpsD65jW3G2B7mxRuWH4QK/baQfgYLcBcJNtciAWtjWJm1HjfLoHpkbhHPkA==
X-Received: by 2002:a17:907:6d1e:b0:acb:5343:e75 with SMTP id a640c23a62f3a-ae057b3b0cdmr34341966b.34.1750371349428;
        Thu, 19 Jun 2025 15:15:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8109:8b08:3400:dc31:64ce:8528:9f20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm55105066b.96.2025.06.19.15.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 15:15:49 -0700 (PDT)
From: Ke Ma <makebit1999@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: justin.tee@broadcom.com,
	martin.petersen@oracle.com,
	thorsten.blum@linux.dev,
	sherry.yang@oracle.com,
	Ke Ma <makebit1999@gmail.com>
Subject: [PATCH] drivers/scsi/lpfc/lpfc_bsg.c: fix typo "recieve" -> "receive" in comment
Date: Fri, 20 Jun 2025 00:15:35 +0200
Message-ID: <20250619221535.2277-1-makebit1999@gmail.com>
X-Mailer: git-send-email 2.44.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a minor spelling mistake in one comment line

Signed-off-by: Ke Ma <makebit1999@gmail.com>
---
 drivers/scsi/lpfc/lpfc_bsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_bsg.c b/drivers/scsi/lpfc/lpfc_bsg.c
index d61d979f9b77..7033d1c3e048 100644
--- a/drivers/scsi/lpfc/lpfc_bsg.c
+++ b/drivers/scsi/lpfc/lpfc_bsg.c
@@ -5003,7 +5003,7 @@ lpfc_bsg_issue_mbox(struct lpfc_hba *phba, struct bsg_job *job,
 	} else if (phba->sli_rev == LPFC_SLI_REV4) {
 		/* Let type 4 (well known data) through because the data is
 		 * returned in varwords[4-8]
-		 * otherwise check the recieve length and fetch the buffer addr
+		 * otherwise check the receive length and fetch the buffer addr
 		 */
 		if ((pmb->mbxCommand == MBX_DUMP_MEMORY) &&
 			(pmb->un.varDmp.type != DMP_WELL_KNOWN)) {
-- 
2.44.0.windows.1

