Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C07D07D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222695; cv=none; b=jCoPUNA2g3R3UXUzR+6KmHAf2YqlT6BhfvN7MdOnyO2LyfVMPs5/kEujQjgP/5pYOFMeumzqjjYapnTgIiEiAJP7ldf1JvGUcALQ6Pnc173FjEJc0yxdsYVZ5bdhxeiPkjfptiXTx84X04iY9q51dQxsKYf46xPvsgE6BQC55XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222695; c=relaxed/simple;
	bh=4CmxrQz1pG2CKAvpdKstkQyARIpmzfZ1LOKGQOkWcYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/QBNlR+deTnPnyox1SRIpVNqeZVGcONb5bqFj9hDJtq6hZ462H/2kJMKxmvIgTlSgicsg1DpF9bApDGffnDkHfy6T1uBtOPOa1pRw5e9nCqglwZZ+zaUFfpRo6bjEGG1tmwvDFv4s2Fo+NrDkxspyZYlXclQCV3PKIi2SW/0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PsbQQ2SK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PsbQQ2SK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso9505124b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222693; x=1744827493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=PsbQQ2SKCaY0FpJbihQLFXosxsVH8ZH7VcYpMkY6KMqR+KNHjC6MTYsGlvDLFWcPk2
         iZ4uYrIdyG7SFYfxXe4bH88fMpfKTVu1oL3ScIXSRQv8mEVT+Y2LiKLT+lel5mWQexv6
         ULpkQAEAdVUf9NGtYANmvv0UygV8Cor8VzYvG5fHKCcUaX7b6DnZtwqeNXuDvhdZ//aR
         hiAwrKMZ64n1r+xtcBxL8kbPkUboREKsaqNvuHGiRsCXUO8ZsAlpvgi8EVuipY1I+/S/
         TmMmbp6vRkpTqysfp4saFT5FcHj7X5np+ZFinyjvlYaTfBelpVyuxvyd0D1OIAfDQoia
         hXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222693; x=1744827493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=t2uqD7ykUPewtHY7S90rGVUDNzxsh8KDdNbHAVsDKSrOpr17fJYNbehyKocCIX8chO
         5RGCyHfBNkKjQfpH1n1mCWLQam2GjEjHiTH3bnNCVnqCbDkuMfZxVHUuHUDPsHEhzgSJ
         tPWvr2JmYLbHI78X/buf98DyGHZn3qR+e8AfbBW7KJhTyT2a0lSq+w1ROeu/VcY8qR1X
         dJmtKibh4RSJWxj54PSDX7kLTm6gM6PBOYswRfSsFWNUw2PBrfiLpdns9x5sGE0CB3ce
         sAvbjc60XJleKpYVNo5T1BA8oK3sAEVhaDzRzq59KPUjf6aBoUgIkN/XR51LSohZsSJ9
         dwNg==
X-Forwarded-Encrypted: i=1; AJvYcCWfv8qZ7/ZjfvWj9DYo2+54kG+N/3ZZhCL5y4fF5Iv5b60yqUA2r9Ww6dBat/HopPbunmf8rOnZP9ol9HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorWcbT7OvkodvyGaM9F78gpUwrVsSN0JI6xL1tSu75QFv8B6D
	9ujmaMP12Ui2503i4osqmAyQKmua//kw8gjWxsTikNLPPOIRz+egwWQOoR+P5g==
X-Gm-Gg: ASbGncutkGpjUcxsf0QjU6W8/5shKAtRW4pK9TnIqCvODOGvS/rWxEDuCUQ9P919dVI
	CKOPPa8IFnUDkfOsT+JuUQ6mcgBbsscI9f+MYlPdlVEmjU8h91fO5KqJHSou7eSnS6od8AqPjID
	FEG1uqUPMq6pSghHJbsZBZWRo7kP8obrhIbESzGKfWhoIwx7rzvig4sPAlfsqWmtmeno1WVIofk
	JDBY88cU1TayP1ne0fsIO/cLlwOL/kR27TplUAhjbKzp6ofEV8gdE7aiYuIi4NQROOLlIYrwxnX
	Akyr4X1grgkkhhCEC3KllGCuCsseNc3uLEwxsD2VD8aSJZc9CYQ6EQvEXHzBs66aV0t+2FRpbKX
	dsoDKbg==
X-Google-Smtp-Source: AGHT+IE7sR5POVuJYVdqVa+AS4fS8UWyJ3iPy25M3/xq1EeIPiN0TAEy0j6sGsd7vhBWoEBUf8auow==
X-Received: by 2002:a05:6a00:18a6:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73bafc170a0mr3912696b3a.14.1744222692563;
        Wed, 09 Apr 2025 11:18:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e517a7sm1716316b3a.146.2025.04.09.11.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:18:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1] staging: gpib: Removing unused function CFGn
Date: Wed,  9 Apr 2025 18:18:09 +0000
Message-ID: <20250409181809.401724-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing CFGn since it is not called by kernel code nor any of the gpib
drivers.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index eaf7399a164a..1cb6b6219e67 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -192,11 +192,6 @@ static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline __u8 CFGn(unsigned int meters)
-{
-	return 0x6 | (meters & 0xf);
-}
-
 /* mask of bits that actually matter in a command byte */
 enum {
 	gpib_command_mask = 0x7f,
-- 
2.43.0

