Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE142571AB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150856; cv=none; b=Ri/TKGDb5JL6HmLra4GeCv1z/UWIM7nqCDIyl0OViOBjTPtq+krL2GRGQ/UcwJDbG1+fe4TSmDPYPHFXpNSMSYIq9PThXYSzZzi6P1KTd1bjAnzUA9VjawvPqBR89iXxaCm2DEWvS9q+OVxMwI7kdBDjqWvQNkbBkQIOPBwWlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150856; c=relaxed/simple;
	bh=jF1a24mfxL1jqFtVcwZ6+GluDtbO5GZ51S9pedvlPxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBtfnjH56ec/R3tvdGATxNgUNYepxaTrdqeHXORzaac8+UX+qL7y1SQnokw5Dyjof3tNJyUTDzeKh7PJlYcYLt0dVGZzB/7W9+5yDlgArMEai3wqkr+oIMvNX4NVcbgHImy40ENM3/NxRyBrbrhCRGxoWfcFwdCHq+5taFrkw9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=TyFZDWuH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="TyFZDWuH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so85342025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150854; x=1744755654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33nZ6O0N2cVQEHFgAZzBVBerjSy6t3qmg2lY5yN+LEg=;
        b=TyFZDWuHSpCjXQPytuJhXJ1tbZEr21doRAnP3DbHefOFaZNXHrrrCmHC5aUqeHJcEg
         xJGmkQ5W8Sg0eKHIwNLsFDr/Fb6zrHcgEX3AVDO0ZCqBNilVsYyZ4JjCdMRy/9+A+2sO
         Y8jtQG01HaQ7CwJirYc0QkbujhFyXzLtrbKotxnpjBY3mI+0gNLVTff8UA96raUns1eW
         btYSC3/iVBtpHrP9PG7RbQywOV7Ql5c15Cm9UwatpIVUxtDHumfI4l4ThxRsnMLmxBIg
         MZNX9AXiqJ6DI09s7Q8zEcYqHD0uzro08WnY0QLnm7GVRSmD36xtG+OVZQkVC9Zs6DoK
         i2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150854; x=1744755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33nZ6O0N2cVQEHFgAZzBVBerjSy6t3qmg2lY5yN+LEg=;
        b=Olj4UDBFHuldsvWrIXy9Xvj/7SsKwop7UBasOX5OSrGuhw7QL+attc+PwT9uTZz4B8
         YJITVeCR+iLnIS42YjXSTfBNkTlPe2iOx16beW3DoVskcBVQF3rqA/hvCP0duCEiVQfJ
         wmnD4FD2at+cpHY7HYBfcKDfJA5jNVwnoTHRUfNZEdOBXuNYw477+RsY7xY0yN06qbwu
         XWwaWHmUyohFoxqzz/97TztXjDoT7fxS/PLy76uqgKtV8wxsuP8VF8pwcezeobj3esFi
         JKMPVcwEVrBSHEDGomHPEeaPPqVclZ14jPzzUwv3+6m4IItlVH/1Q5lnagNZHI1AUVhi
         Zmig==
X-Forwarded-Encrypted: i=1; AJvYcCVnKWTbkekkMgRwVuB+TW3N1JN36bCdDtIipGSEN5f8fN7fbv+KIVg4TgXW+Ubbif7ono/j8qSCzEffV8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpkiEpzgIwIeRWaRUG9qe8P5rsNAyaGv2UXup/7NGr687uCay
	2U2KX9hmU1vrKYN2N6h8fagzhtQ3Tpy7zkyrBtoEvhs4/VdDtcXmbVn9AshL8A==
X-Gm-Gg: ASbGncuFGYcNPoaHmo2KhwO7WgwuaurB2h/t1lrM2h+BI/sSE6Dbv1vxKT7nLdo4t1J
	vExM1mIHJJJvhSx5a5B2LYPaPf8sBSzc8/8cVAs4ni+U5YCpC08NO/rk3AV33dS3IREnALm8ulV
	yGni/2Eo0rXaMEkEZAtkFI0lARza4fJImSIxg+Pa8fYrJI4HpTJAlTFrINtDZf54Pu7rj1J7ly2
	FderPKFQP2cEjDYNvuQ2du5zpHz11e2uBye/rfwvUFwyoKB6vC9MgT2tUAcyVlpDmE90+kOL94R
	6G+JItIR0E5R7c8ABBpXIDnr4qJl4CLfS3FWbkA5bG14raikTfGETQLguevGTiTPd9rFdxdIiYG
	KrjoZ+/m+nQ==
X-Google-Smtp-Source: AGHT+IGmTYIn9MZF+CcfjmeOhPrs0VWePDsbnp6cm2nW32efb/mbPpwmXL8dS1aQjP+HF+gfno1OeQ==
X-Received: by 2002:a17:90b:58e5:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-306dbc3b998mr1333320a91.33.1744150853918;
        Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9cefsm11565164a91.38.2025.04.08.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/14] staging: gpib: pc2: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:34 +0000
Message-ID: <20250408222040.186881-9-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..5ff1d52c14e3 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -106,7 +106,8 @@ static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int pc2_command(struct gpib_board *board, uint8_t *buffer,
+		       size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
 
-- 
2.43.0

