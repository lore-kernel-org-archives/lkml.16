Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B339E266B56
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322713; cv=none; b=ecolmnyujlOf3AfDjcxempdPvgoQICiR/tyuBLel+6MsLLIJJBU2/RXa2Jsn5JuywBPOa83fr28IquJbYAFHyrg6dCCqmQg1gOlJbebdU+xpsCvdrpuvP87TjQP9HtqleQpefrzdAjPt/As7U5u5JO7RdcpYjzNr7yoesmIgkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322713; c=relaxed/simple;
	bh=8wRQGv3zkd7w5VQBvNieRLV0qggGrNgPo8gaoi8QA+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FmaXcMSKTRtWXfTT+gR7HtRQZ8CrccllEf12HXF1Bq8PENSvenjWeK2XOJteWJZIbWsw4/LQUxnR2eOtiJz00RQdbELuRTz4RTnzsdHicL9Pxg8MPwuHeleDbGEerVsVFBCRMgKB8MJkrY77XnApXTKTPkOZCG3rD7cYfIWHiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaXd/06N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaXd/06N"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so875359a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322710; x=1750927510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5X8gLMjNHyFOL2GGdyUmdBVB8Aoo+W1ibQ2rMarhgs=;
        b=iaXd/06NaLUrjckFrfb82PsJzLj1YUISHPg9HG2EdA2XUUFOGDjzyo6U0rGZ/Uy70k
         jPoAVy/w9kCKU/Ngl4klDpvIEJ6kVH9K43EdRj3mrhoVK3oGYrCgxPoebiV4Fk68yW6L
         4JtAlcg+OHSzfP5Twmu6Sp5gU5mSfxG8+6GdyhTZbLmVoDzaVPl/LHJIWb/iLP5y/+BG
         EF05TjfAv8AhHyaNCagjsyBa6FS1AV9um2HO/GLNacskOBPEyFBz+HKkf+bhzU6h96nX
         4pdlmGJOEdqjKLt4U/Fu2vilU0SDJuC9jiwG1DyREJ4+Nn0rI7THfK1C/PyuLg8eJVAZ
         La/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322710; x=1750927510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5X8gLMjNHyFOL2GGdyUmdBVB8Aoo+W1ibQ2rMarhgs=;
        b=eyfugNNj02dF6XLT+p/EX2Ho78vFgjLJQou4vvzdYe9HQS6dul7EgEg+SHoJosQQVS
         jfjaRrBq8iG7E4mKDk2JEa7ZXjA6s5vemaSVD4K5wT0cXodq61WY/V9N8DsHth2KrMKW
         bVcYxf+bxjt/tX9TEL00F3eyOwFi/sOpmZPMtp5gaMkccGKuYBOezzocP7GEakhnUuzB
         qH/yHPcN+unR2f6aPq3b4AKxUz7H9TdECLa2lSrhrGfB84PQi7SxFI4CZ11xy5NpJz1M
         8JO7oCMTF3I7B/nsswX7WLfeLKvZZed3QWfVurmM0op7Mu+rIg/N6eRpiip9Lw6srN/E
         wDSQ==
X-Gm-Message-State: AOJu0Yxk0hzx3kcIFP7J5Og/XOTgwGhb2RgPbigyRKUi7KHw8bxnVkap
	pMHp26tybANhzWp6mcmi+uqHKY+er7tVA5W0ZxtF3OMMq2B2EC4YfimR07yV1QWiD2k408ct
X-Gm-Gg: ASbGnct0DK2FGsM+t/PY6yivhVrdCnJjSdQwLxn46XAh0IQbEvyYpSi2yquEImHAjXH
	5WyxPkq8Gmfbkh2UETvt6DRxRNFC1JMqVKFmwh89SUuPbJQiee6MCykoZyPuq9tK8rGxu+Q9jn3
	hkw5KR0QND7QPwuIQFFj3tJFAXsnGJ0mBLa0hw1n+Qb4VkSB96r/rCNMKr76ib2nR/xtAmFBJq8
	ng5ZX983uF/+eXPWB+i72p8DbhcDoSUeCJmHChtyLwjUdyxhauLkhsAWg4a3pfjsaVviUrh6Gbv
	59HmaZlU8AZXcFI6L/9T47tEaXKITJQhAWH75EtoqIG7MdOkp+pbpGOx9x9QViDTqrYi1KwxUh9
	UDS/mCQ==
X-Google-Smtp-Source: AGHT+IGMjyetyOU7YuxTeXG4YgVrNbIrwYWbe4hNfU6dsQ/FW/NlzDErrsExPei/I+rW4MGBXCh/Ew==
X-Received: by 2002:a05:6402:34d3:b0:606:b778:78af with SMTP id 4fb4d7f45d1cf-608d09cf8a8mr19573568a12.27.1750322709940;
        Thu, 19 Jun 2025 01:45:09 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:09 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/4 V2] Staging: media: atomisp: i2c: removed redundand debug message
Date: Thu, 19 Jun 2025 10:44:18 +0200
Message-Id: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
                ftrace can be used instead.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d35394f1ddbb..830a38086cb8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -584,8 +584,6 @@ static void gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "gc0310_remove...\n");
-
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
-- 
2.34.1

