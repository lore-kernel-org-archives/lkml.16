Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD0256C88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150854; cv=none; b=CXfRBKHGO4oTXD5jIOIZUTEH33g7a/ki0sXyKcsk481vgGro+DbA2P7dmz3+V2syWJKTB79rJ0gjpCWI8ST8WaRsX8gorwJKNzA9asWmOA1XwOyNiXx0nCGsJTYUgzJQ1wghfVweMSssSek858cF+WSkOnhawCPejuVbPawX2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150854; c=relaxed/simple;
	bh=nMQ0gL+pfZcJTXfmdPBzajAsaQ27XDi8DNrX0tZby54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTqOPkILSRSngm5Leytf77zcNtYQmNUpt4oyKA0h631LASgFEy7Q0VdcB+qu3g1YhF0hv3ovK1xrOC2T5e+DHHUCpn4p08M0sa96btOev3jGm7dz8Us7An8sdivT97mhntDZQn21QFJzag7gw+cFOAMWs7vsU5rr5UY62Hk+Y/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gaBImIcj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gaBImIcj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22401f4d35aso69847645ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150853; x=1744755653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR83DMJzZmQDIMqImv69PpmO+f5bPv5OTfDUc03DUXs=;
        b=gaBImIcjomGe5StnmCEPvJ1SQ+8g/TIbF/RFOThgiQTzRv+5EMVZQ6gj8AmplnVQyC
         M4j3UJ3JWo8hIWFGisJzshRwwPvyTTUkX78xFQ5QQx6T+su4RE5P66lLVTSdmHS19/rr
         NMO6V4+IgIo/qn5kvQRmgz9zLG8x6mLxKlTZ6zhOKYOaXhdEL+DBl+MIoo8FesPKgt5m
         yHBXR4uRSMogx6kZCfbFeHFBam4/PEeGQaOvDCAdneMz0uwpPhVOMuRReUKSoJ6V9rtS
         85Jkrjv/U9As6sbr3H7bs7S9M5yPLUxwbAGAACbPk135g2UuV5IdcU7GAfQmxLTQc1Ea
         Egjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150853; x=1744755653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR83DMJzZmQDIMqImv69PpmO+f5bPv5OTfDUc03DUXs=;
        b=p58QdIQIEPGTF1PmQN75JAcQKspCY4y7FgZGKe4DnwEiD19EGyk5RlJIZQHbcVHnU7
         sCW5tqVtq2dqzXaOnvapRyk1nPjq0pWU+UpWOWkZaiSAoXZcKwM4k8N3YI36hy9FoKT0
         HzVROJQzMPk/9EkeFeKPR13uy6jGF8IW6CpSIF0yURhfzd/BFzHAY+3FC2U4jbXEh8bk
         M9NuBykio8U8BD9r03dsJNSi1WAYZkCYVpkAZ+VU3qdz2Ubc16QQ+9WRdKSuJ2MdbhPJ
         4KvLyZtcYZJCbgD1pfzGGTKXB3xUowqLeCDakZAeYMvCDg5pWGQZiWaQ+m4ZeQuIEpLZ
         HUEA==
X-Forwarded-Encrypted: i=1; AJvYcCUc9BDoGEU8ftW+cuG+J07VOprR/XG3418PR9IxN2kgBN8B82lplGBIYRlcZumujreAtzL3cyvkvEFMd/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjGrnI3SEo9p6GI8iMb3DH+ynt738g4dZqS+VRl/7sqU+K7ZtY
	2A+zBVz5HuGn97Idw6QcqaZQScVinq4DhcbDzPm/kmmdo61gdYn42b04HhsMFQ==
X-Gm-Gg: ASbGncsvzQ3WQXv8YxT8ROkTKWDrfk1lZ/xYOD3u2zZGxHn1HEiWqgEJy8joCqMLhNV
	DKKI60crYHQ6MSTYda/77V6RuXywtQpFn9wZAGv6WUGFPr+LH1GLNv129EAfOvsNetCLtlcFTd5
	NWd18NdzznShmDtzYuOIl7IrVbfva/hBKSJQfsse6p4sjvPkv5s85lGvGqfzOm7oGayszG2fGRp
	BQ9OJKRw4+3CMULz1gDTzx2UMKf4H5emldwY/e3haU8CX89Bpw8GWHbMmWY09OKXGlp6dZTEiAH
	gmAseNrVDgFl5MFhyoZ7KEN4iZVfLjpWjE8lmf215eR/ADwNWveVZO+OnV5dR+a1TuuUcJ8VikH
	44Z/QqV1sLA==
X-Google-Smtp-Source: AGHT+IFqDZZi2POlRYiT62mmJQAXBnyP84mVZ47BSch9E8EQIt4iM2sF0RWhjCdOu+HZX3ahvh4HCg==
X-Received: by 2002:a17:903:2ac4:b0:223:50f0:b97 with SMTP id d9443c01a7336-22ac2c2c972mr9779245ad.52.1744150852720;
        Tue, 08 Apr 2025 15:20:52 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e41esm105496405ad.128.2025.04.08.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:52 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/14] staging: gpib: ines: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:33 +0000
Message-ID: <20250408222040.186881-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ines/ines.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index ff27f055a0ff..abe977f8f961 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -36,7 +36,8 @@ struct ines_priv {
 };
 
 // interface functions
-int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
+int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+	      int *end, size_t *bytes_read);
 int ines_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 	       int send_eoi, size_t *bytes_written);
 int ines_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
-- 
2.43.0

