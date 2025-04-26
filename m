Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22569221266
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745667417; cv=none; b=iTt3SV4lkkrIZYWMFZOITJj6sGXcU+DF9npvWldbj04Zj+bbjCMFSmwZCZcN7p9qgq4dsEMdkzFnWQeJk6q4Ox0ygCCNF7Wp7cL+j6a6uUxpjJOVaqwEi4WNsca1QxaZMAytVBDFpZE9K7j2z63Q4pv18/yKfGgS00V9wv7z2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745667417; c=relaxed/simple;
	bh=TMXGzls145JZPx0Jr/HCsy7YFmzt3afYUBJieX1EcUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNjoaYlno7z5PSsufDRo70cKEgNi8SVNARqyBIku9DGgwiwrtYdd9PnTnOcBUF3Q2rPDdP9p7ji/rqqWdHDXOhN3xvp9Fxwi/Tpey4ZfmIrm3d4R8d2I9NCva2XyVPOFUuIpxVPkreGG/aGEViA6ptO/IZVuOlb19B8lYIfjtFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cULeZN5P; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cULeZN5P"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bb647eb23so2728781b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745667415; x=1746272215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ31PiGWR14ALO3eZTihChu6gSdJQVhVuQNq4pfsfDA=;
        b=cULeZN5PLVQFcvi2OEUyBDSs9lG1hcTF1cNntqEAVV6yFASq42xNhw6hU6RF/evU+r
         YjjedWUxgDuI/IKzHieOQZB0qj82/IIUBMO9XldyZTlPeZwzjodMjX8PbqoAn+TpIoor
         b/ZxifMsCZCXxu+Zu0/QVHw/GHhNbwll7fyTkViShqsKP/KLOXXs7ewoptN4HdKQlTgO
         urPdWabz1b8Qgnz+2Uoyp2N13GRXTR36YC7w1dJcUwz1CTrw9CjZTqGku1ucDYwZR60e
         X1cfiIjEdhiiTZ9kx5rwiBDZ/stAbLuYqBrjGA70Dc4/yEVmdoa30rEHCCTaE6Pnoi96
         SgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745667415; x=1746272215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ31PiGWR14ALO3eZTihChu6gSdJQVhVuQNq4pfsfDA=;
        b=auVg3FW95pnAGhnARg0k2QjXHqqKdA0jWEKhWSuRBwWoJdS4f2+X+8++J+2WJF7cTX
         7q0fdRZaocBcKayGXOuHXkNOUx2A+27JCRExTGhf16nXuDSS5MmiEZ60NdmClX5TaAqf
         R7IGfnAXeTVvehOjcYSjHMW5iDqQbkALt15IRIzuzw3T8GBcwtr/TBP0JoV5cEkyeGpu
         8AMkSCqGQIIe7ohRzGTXVXy9qoyFB8JI3r9uuxTuu6rZy1koc8h7csUqU+BhbucSTABT
         y2cULanHX5oQpaXu9lnHNFXnS160++6m/1/96D6U34KY/yi2PPtfubPldH29QXX86L2L
         iTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwEfRQCyU0vQhn7NbIvtK7tjHI8n081rQHm5m/3RmfcQsme6MpE+S0MMOAnONfU6EVcSWyy1DtYakt1ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxERkefn9508ryh2AAMIIyRVZmIHvKkPIfrEt+i6YK7Pwnfxbr
	ZwBrf0eU73eqKY9XBWDnz5Lye/0gQ3YNbxB7aam5FAiGHZ/p7hJE5iPu5YHo3EU=
X-Gm-Gg: ASbGncvNNBpbuHaccsqxwrp8esJ88vvlxGZt/xbq4fPPKlmJGEayrUYCboBrysu134F
	jga9g5AOiOQQS+Eh6s4XqYuj29jLzpq4x1i4CEhXgjt9m+BI+bTfGCgTPr/bDbrDcEa5YR5EHDN
	LfZDgviCl9/uKPKxAk1prJVhNiMTg46AEoDb4vBCXtpci6Js712abmk7vI6+0D7PWzqeBT9OTnG
	VYEY1S2JrrGhtIC0Yw4VoRplTIwuYULgd4loue4o0njeU/GXN4gppBghV+N1KhwdAXlb9BHb/jC
	5Ud+qm3CQnrbcC6HhSX52uRIFObbKmRDL/bh8/NJgNyfdyOAAlvgZMRUYa+gSaFf
X-Google-Smtp-Source: AGHT+IGGyjuZeyvual3SpMAZsA9vKjssaPPAI54rrl94SqHOvQZle0H2psV5wK3ogAuBsX7XOwAQxQ==
X-Received: by 2002:a05:6a00:130d:b0:736:4fe0:2661 with SMTP id d2e1a72fcca58-73ff72af24emr3304618b3a.11.1745667415253;
        Sat, 26 Apr 2025 04:36:55 -0700 (PDT)
Received: from localhost.localdomain ([122.182.179.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e53sm4812494b3a.56.2025.04.26.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:36:54 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: abbotti@mev.co.uk0
Cc: hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] Staging: comedi: das16: Fixed a stucture warning in code
Date: Sat, 26 Apr 2025 11:36:27 +0000
Message-ID: <20250426113627.36525-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a warning message in das16.c file.
Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/comedi/drivers/das16.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index f5ca6c0d4d0c..73717f75d60f 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -956,8 +956,8 @@ static const struct comedi_lrange *das16_ai_range(struct comedi_device *dev,
 
 	/* get any user-defined input range */
 	if (pg_type == das16_pg_none && (min || max)) {
-		struct comedi_lrange *lrange;
-		struct comedi_krange *krange;
+		const struct comedi_lrange *lrange;
+		const struct comedi_krange *krange;
 
 		/* allocate single-range range table */
 		lrange = comedi_alloc_spriv(s,
@@ -990,8 +990,8 @@ static const struct comedi_lrange *das16_ao_range(struct comedi_device *dev,
 
 	/* get any user-defined output range */
 	if (min || max) {
-		struct comedi_lrange *lrange;
-		struct comedi_krange *krange;
+		const struct comedi_lrange *lrange;
+		const struct comedi_krange *krange;
 
 		/* allocate single-range range table */
 		lrange = comedi_alloc_spriv(s,
-- 
2.43.0

