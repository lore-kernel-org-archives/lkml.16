Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79633FD1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744338276; cv=none; b=B2jBJwV7iAOhyTZ3qDLOpeDg/Of6cV4falOrN3QBKLozNw3LLTcFRPJOBsQCV+C8IK5yqlr/9UxrcUaqG+b6CawbMQTzvYQHAuUU7kzv3qBXpTGbMZP4hoM3jQxOQPbjfxAc7qf4zS6v3xftvArCyKPP/IhIwZtL5EipP+OsMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744338276; c=relaxed/simple;
	bh=hT/lMRuzLt1zOyLHVW8bU55TzCJt0dTyCRlvoPgoGFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iKLHMGhThOKBWhhOxGMJYInCNaZ4owQ6Dw31YHalTPN6h2YlyR+YCqHKbQfeBkr556e1vFdQ8kXCZvYD7MzTpOvKKpIJ4lFkfpiqao/WodeYMssSROKjCgNWtyBrr5xVch6eYXbGa1houQptMkwYQKCKZfPiRMhQgt1LGdrhS40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeGTJAz9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeGTJAz9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376e311086so1925185b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744338274; x=1744943074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
        b=GeGTJAz9PrLQ7IiDbFsu9tLJ76ZZWyKsM+OgFwqqZpkzMGKBmOsCFeSnwgmTycahRB
         X1AlcFEe6n/cQAk8n7wAwOiqd5jKroQylfLWiRqf6VkqzEuutKHCSkSsdj9/tV+3sHao
         xIgM4bllBk0GEm+ZvrlDfwHLOuw0AMs/CgXivutC2kzaF7mWzZS8rAxeDXCYqlepr7Ae
         02XRpUiUsZhw40oCUNYahBGndlyG1ClV+7TxpJ9YlpgJGo1dyWzTrLo/C0FfluXSxBZn
         JBKMUgIBvciPp5Dbv936/pQDhERe7YgZ+f3cM/E5l6rjTRST8ZjmOHBEYPRJKPzZ7yEe
         eqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744338274; x=1744943074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
        b=FIsytrrdnrS52JFrf4efwGzPIe8Mc021P2Dr1xtP5ZYh8Xcl6pNo1FBYRp387wmssv
         crDagbKj370MM2ym46IGwMJdIrW7bheasN2Vv2jBP/uSeCiaf8CeLwt2VDFxxu7p8K4o
         EZeEFALSJAiKbmrdev0Ez5v/xklVGhkEYu/xhx8qfPvHJpiLly3X5q+tep/XbSj2sQDi
         dSTumlCb+PKIgJwTx4tYbHv6WF83PbfroW6XsPfZ8Ib/Hx0GsDrEfRNUjtJSts+ZOOvG
         eujjAYpRT2icOJvgTZwSV+UEgZpNM5X2FjwLAlLOEw8eeT4Q3c3/rH5kOk3SGjx6yhGK
         5/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbc8+iaIM0pZjSxK0SccGJcHLhZyPP8AwpZF/X8g1DLlJCb+tcVqYsGUs0geFy8G1hHgvqGj/co7Y91Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6fZUEIDDU361rMb0Z4u+teLgW2Qy2Epn0/oEwLVeUnqRC5k7
	iZIoOTCBSR/JcWEtp4RxjPgQvOxCGRWe1P8jpwGy4CyT18yYxYo+
X-Gm-Gg: ASbGncunwuqCJpZ46iEirPxhZSVws6YNlF/UCBpHyT+N+g9FyOY9OvA6sKBIEPzJDX1
	5wYK+xOAKNuD4153AiP+esbma1/oAcvEWI19Bmy+hz63Kms00JE5Rze16S55xP5rpnFW5Mo0vFu
	iPZhMriqkvTTr4hcrVlQulVPhZSc/1KXfNTC+Pe2rYPCeY5KDBb6p6Xkfi5tc0vlGMiT8mIVdEm
	VYHzYzkzJ7ryNw7xBQ74Hd+KXo3MjBZHeZxxxpL1IjLaAF1eya29l56TR7pU+XgLWfEiPadZ/cl
	2v2r5LIXUA9T7tsU5TRKGVbVamG1HNA+JyIcEQOyeTB/lWDKnEGuz6xIH6PaikNG7JhmlP8Sntw
	VFQ==
X-Google-Smtp-Source: AGHT+IHWqeE8BFVPVT6kvWnNVQXq8J6YpXRu6YCZc8UiscUgLxWWW+xd6xqeMJFm/G50uShEipUgyw==
X-Received: by 2002:a05:6a00:4653:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-73bd11f84a1mr1630630b3a.8.1744338273952;
        Thu, 10 Apr 2025 19:24:33 -0700 (PDT)
Received: from localhost.localdomain ([110.191.179.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198a7esm316781b3a.31.2025.04.10.19.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 19:24:33 -0700 (PDT)
From: Jiangyong Wang <wjy.scu@gmail.com>
To: obitton@habana.ai
Cc: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Jiangyong Wang <wjy.scu@gmail.com>
Subject: [PATCH] accel/habanalabs:fix typos found in command_submission.c
Date: Fri, 11 Apr 2025 10:23:31 +0800
Message-Id: <20250411022331.4511-1-wjy.scu@gmail.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos found in drivers/accel/habanalabs/common/command_submission.c.

Signed-off-by: Jiangyong Wang <wjy.scu@gmail.com>
---
 drivers/accel/habanalabs/common/command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 59823e3c3..c9c61687d 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1786,7 +1786,7 @@ static int hl_cs_ctx_switch(struct hl_fpriv *hpriv, union hl_cs_args *args,
 }
 
 /*
- * hl_cs_signal_sob_wraparound_handler: handle SOB value wrapaound case.
+ * hl_cs_signal_sob_wraparound_handler: handle SOB value wraparound case.
  * if the SOB value reaches the max value move to the other SOB reserved
  * to the queue.
  * @hdev: pointer to device structure
-- 
2.39.3

