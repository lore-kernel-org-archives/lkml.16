Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82929C323
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370594; cv=none; b=fQ8mu4TeegMEVxDnK1JUX2FKbncZt/FrQPEXNa4nZ9HXe2BXQJzSGyCnMtrMGSXLR3+F950gutEnE2xhOApOq4h911iwHfjC81XfXgSg42EZ2cySfP86dUJDmql8noH1gq/mtcS5B+4rCnwXdb1CT2C99gfRvcBqW4ge0Ne/FUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370594; c=relaxed/simple;
	bh=RTw4bd+nFerVVw40Ha4aRIZhqdSLvqW4M3J/KVhQ2XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGis1rAY3GcmNpwyo9nqRYW/9sdlQ1vDjrdQfsECacLb8XelzFMhQ0024zlcT7N7ADo7IVW8SX/hZ7XSF6CplryuXvG3BW/U+kjjkUzaxY/dkr1HlrBOSgKrfUPXDfyBtEJ671BXPSDX3xCAYPNBm+p+kCMDaKW5+dGQx05T9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KlVBfayn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KlVBfayn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so20291095e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370591; x=1744975391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQqEJjs3j8paEAurgtMwvj4Mcq7zggHhd+MXddK/xGk=;
        b=KlVBfaynkDNo3I+twoP4OjQExDAQH2+5tYcFZ9x0by+G0rloRBIq24Y5l3K1gvUMKi
         P1HVwnSyp30oSNScUHJoLtwXsPuZTyN5qMKuV7Wurt3Wvnirv3AFbCZAy3NKpHVA3S5m
         eH2fdk0rfvus5uFgxVLRJpzw+mLvgw2INJ416TyTYfeSDPiMgIDKnb4zsBjv8fr8ugPk
         ROP2b5m2rHrI9RWE51AfcFs+viH6O0EW3SJx5dBAFlwDc2mvSC3lks/kSN1P8yHmzuPC
         b0htJxpYR4DgTBBRAY18HKK9jR2stqB6zZt6uSE/DqCSIafIjT1h2+uh87A6hyiiSr1F
         gukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370591; x=1744975391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQqEJjs3j8paEAurgtMwvj4Mcq7zggHhd+MXddK/xGk=;
        b=hGal/XNSEHKLwaz9O/kt2tgAgJxNMOrzzUIYejaIY43zfrmdQjv6/h4n3zcrrIG8Rt
         HY7alRrozPgpP6nWut39mClDPkI7z/pZ9YubXuuCMgl7C8xJB71DDwZy5pIxsRduq2/b
         aqHCsliJVgSGUs1jaOyK+Db3Sg5vt1BTg+eotf7mdoQ330Ql8GZCH0LGjbc3l0+B+B/4
         B5XV7Q/fiGp1ZIl2qprIGEiaO5tXoPOdHxiop5ud8k/utAoYYJpZ5sCfnJ6c81VQZMPf
         nWJcf96x7xaqigrG8qJkgasBzXcAJSTdosj/7Uib64LbB0SdvuWCV0qHWDZh/HKW106v
         U7cA==
X-Gm-Message-State: AOJu0YxemdUz2puPCUDEWUg066GBkoMVW/bW3Cx1Rq5rd5PkwNwIoFIM
	mHkGkTM+MxE/RlqmDrxgoyDaBWDwRMEp6/HjcLX86ulvat1wiHNDwDPnKTVa01382N23Bj09dur
	lr2s=
X-Gm-Gg: ASbGncsLqYt3VCYr6Xb7DVX6k10SogNWA9lOasg8SHZdM/w5ZmazJ+VJlheHUQG0EiA
	xe8vIU0P6EF47jnToYwm4mu6rbD+0/Eot/jhhySw0rgXCuH93JYOa5nxG1gDpTYdgnV8JxZhn8J
	92UVCbt7aN+qxhXzaFdUet5OSIiRYcqA0BrjpuxLxY4sv/n5OBpk0pQLoyj8LrCx4alCq/iML47
	4edGgjqVu0HwRqNbTdJhTICBcdpBRzja6k7Gw1Kjd525bcXjDBClE6/EqeLIWe/KF+J6O6C2+26
	x+8d5jav0oF+BvAa6lg7oohIGEUrq6AC8i6/mZzOp4xip19Rtuw0Btha+cI2ZNi/ZhaV8jJB17B
	g
X-Google-Smtp-Source: AGHT+IFXovHZkne//Y4c76LtmTXBC2PQ1iWuvprc+ozCTvAXBb3IVt1TpqGaT8D/YVAPwo3Xy4KYLQ==
X-Received: by 2002:a05:600c:1c91:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43f3a9b4870mr16558315e9.29.1744370591011;
        Fri, 11 Apr 2025 04:23:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:09 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 08/13] nvmem: core: fix bit offsets of more than one byte
Date: Fri, 11 Apr 2025 12:22:46 +0100
Message-Id: <20250411112251.68002-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If the NVMEM specifies a stride to access data, reading particular cell
might require bit offset that is bigger than one byte. Rework NVMEM core
code to support bit offsets of more than 8 bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fff85bbf0ecd..7872903c08a1 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -837,7 +837,9 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
 		if (addr && len == (2 * sizeof(u32))) {
 			info.bit_offset = be32_to_cpup(addr++);
 			info.nbits = be32_to_cpup(addr);
-			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
+			if (info.bit_offset >= BITS_PER_BYTE * info.bytes ||
+			    info.nbits < 1 ||
+			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
 				of_node_put(child);
 				return -EINVAL;
@@ -1630,21 +1632,29 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
 static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
 {
 	u8 *p, *b;
-	int i, extra, bit_offset = cell->bit_offset;
+	int i, extra, bytes_offset;
+	int bit_offset = cell->bit_offset;
 
 	p = b = buf;
-	if (bit_offset) {
+
+	bytes_offset = bit_offset / BITS_PER_BYTE;
+	b += bytes_offset;
+	bit_offset %= BITS_PER_BYTE;
+
+	if (bit_offset % BITS_PER_BYTE) {
 		/* First shift */
-		*b++ >>= bit_offset;
+		*p = *b++ >> bit_offset;
 
 		/* setup rest of the bytes if any */
 		for (i = 1; i < cell->bytes; i++) {
 			/* Get bits from next byte and shift them towards msb */
-			*p |= *b << (BITS_PER_BYTE - bit_offset);
+			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
 
-			p = b;
-			*b++ >>= bit_offset;
+			*p = *b++ >> bit_offset;
 		}
+	} else if (p != b) {
+		memmove(p, b, cell->bytes - bytes_offset);
+		p += cell->bytes - 1;
 	} else {
 		/* point to the msb */
 		p += cell->bytes - 1;
-- 
2.25.1

