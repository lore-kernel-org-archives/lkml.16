Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A19230BFF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406172; cv=none; b=i28v9zAELmQzOzqpANcStrCd17c86QuEis0W+RD4aZQeDvgkreCjYcCZbFs3F5kgbGArrMxMmdyJ6hLdU+pUSJo8moxpHeILZ/RXvRo1jsOna6GaugJq7/Jyf/4msL1YISrx9SuOT3i+kCfzXaCzizcvj2BkV4Hw7OBGYBVo2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406172; c=relaxed/simple;
	bh=Y/lCaeibLecauQgNTC/mOcsFmA87wn5O1ZEIoqiFswM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4rkT21Icx4zrYejYMZ2BBSAE24ykfTX76PlU9EzkWj8wfSTt7SXqiPWbJeerJv6NK9gCkUO2zKfJe3wtPG90caF8Ch8/VrSctMwoxppF0UbJwHFkqZcX7mCtJXCbPbgJ1E+dJz7OM/BvvrgW3bCiOtBF73jE23l74MLKIJkY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkmRIIAE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkmRIIAE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso2181865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750406169; x=1751010969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvY87dOFEDSl5uZTK8KSbQcIdJ58gT9kw8uM9F5GHbk=;
        b=gkmRIIAEr1ZMAeFNk0JGcW7UIS4msrug3rlQUXFeM14hcbSYpG0tGnCYJNbzm50aq2
         7SQhc4KuAyos7ohsee9GAIamOctkkCUzj9lOOF4RosN0y/zcgxrm5/WB/dHQHULnNjXy
         Yg45Lw9ahQeLcefcRXUKqSuIWADcUKRlTzqkyLO1t8ylQxFZs31im6HgRptfTmdsm5Tr
         q7G2KmKROLISTicrVZkPktb612695k9a9NHjFrCOAsFtWeTMxXgfkwW7sPI4dRvNHU5m
         VS3QghS4Tr8G5ACfm5Wlx8hQnj0jV1CmUuHgHkMXZ84pL34HTBLPTboJzKlsvnfGfRf/
         v0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406169; x=1751010969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvY87dOFEDSl5uZTK8KSbQcIdJ58gT9kw8uM9F5GHbk=;
        b=QdLVHk9rCEkh0nZefLbQ6eqyCZTAV+Th/aN2pCPHhubdc5ncCf1zB9pXGtRIFesus5
         5/GyAN4bcTjwrbA1W7MFYT69rTP2KZ5vOnSv9vD0EDwHjxmciCh6HW98dwRjhrntVoVW
         o4NGkxdamej6g3lwPM9UNyPt01Tb0BGnTbVtO1gJ8kBWA6ZSb7t1mFVqozBSgUE8Aytc
         pM1tJx780402us3b5RHRV4y+/0hpo1XlcctiBCA665rJMRGxGktS/B7/ivpXieGo3tqb
         epZdSUlaj/ajO+ul8H8IUhimhXzcyHxW1nSq99DXwdQcvH9rfAQ4RB7KRI+swNzQnMP3
         tcNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXScejfz+hsi3MO4TZilMkSxrdKO3LlkX4E2xmgTDCOXOrIU4ynyD39/k0khQbHc13rOKNvm2x0BMjzJ4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61OVwG3d7p/GLxAEzUZ6EsHbdIUxZTlvqYy+YndSnJDNq57pT
	CptMdlbPqTmBP2JZiXB7nX47Y7vXz1zvNjDyecRFunc08ai9CkLV6tJby+tlvRJg
X-Gm-Gg: ASbGncs5pUkPJXH4icnRjllLn0QqVvyMhRwx4xFV3TiXZ2pvq8OIDBtPKVT62ZZTlZC
	EMD2vu9oT5YwS0uORTOTzDzaB2AxbIxuCp0vY5ydiInnHIxW1nM3dn1DL1od0dYIFuwAppa0XAG
	lfHy7bGRkqqLESFXlOSSEmZRbz1OfCtRSUXhIP7z8mlAV+qd5C2fwhFpOIEjEHpQeGJ5BVOOOCJ
	+8ld5JZjcQcHtnWHwCaEBRae+aOkyye45hR+9qufScPV3Dys6D+iovYIcJkp5lplA2/YZPEgqHi
	yQILyNG8FVcIhpG7jRNzn/hJ+tKHpoBUszf18axZH4DxpAy8zJysxe+QNv2AGxYEslCn3qJs60e
	vFYdJdBC0PPpoJ/PLVnk=
X-Google-Smtp-Source: AGHT+IHYS7jIIxnZIERmDkugdwivLbicxS7Nxqbv3Ggs0pGVY2hWqBpMywyYJbdSBt8oaWkIcL7YNg==
X-Received: by 2002:a05:6000:2890:b0:3a6:d2ca:df15 with SMTP id ffacd0b85a97d-3a6d2cafb34mr347317f8f.11.1750406169025;
        Fri, 20 Jun 2025 00:56:09 -0700 (PDT)
Received: from thomas-precision3591.. ([2a0d:e487:44f:8ec9:e0c0:3bc5:bbdf:e81])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm50814715e9.35.2025.06.20.00.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:56:08 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
Date: Fri, 20 Jun 2025 09:55:55 +0200
Message-ID: <20250620075602.12575-1-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/include/asm/floppy.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..34abf8bea2cc 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -144,9 +144,12 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 		bus_addr = 0;
 	}
 
-	if (!bus_addr)	/* need to map it */
+	if (!bus_addr) {	/* need to map it */
 		bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
 					  dir);
+		if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr))
+			return -ENOMEM;
+	}
 
 	/* remember this one as prev */
 	prev_addr = addr;
-- 
2.43.0

