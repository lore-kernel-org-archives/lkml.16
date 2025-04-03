Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FBD250C1D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691532; cv=none; b=dZBvN6zsl3TtouIl7zdwR8I76XAwohNpkcH43LqIUjDlj0dmmAoWJ/gKErHB8A/TiP792ayjCqhz3bMAC13rJuTCaySkNOLpFpKitIxhAzcj70BF1h9bsZ2dogWEK0K/g/wYWN37PaiKtL54Mc5Ou7JR9PbOblAutBRkFVoIkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691532; c=relaxed/simple;
	bh=RTw4bd+nFerVVw40Ha4aRIZhqdSLvqW4M3J/KVhQ2XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S3jbqfQ6yb68ASygamQysfioVlrG1w69xMkzVXMUw5Ai5yDDXJ0CLXUyCH7YaOujV1eOYSXYIIzHdeJS5aNYgVVwrVKiDsNYkzZAS32qwYjfrXv+wtNMc32hwraYYfLx3hDnh+1JlRmf5Nv1ANmVUwR1FyGQpgvcuG1ailEtJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNVKTd76; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNVKTd76"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so6827195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691528; x=1744296328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQqEJjs3j8paEAurgtMwvj4Mcq7zggHhd+MXddK/xGk=;
        b=JNVKTd76BJbAuK2YtGTAka3OMz5rWAbMdyFu9+kG8U5FZk/VlHdwHrRiQDoK+HYM6l
         PKDwRRXsxirPZzUh8SFh4R9W3gCkgAFlG6QguDD9zh2SFguh5Uf+UbTvPanVfdWQfv5v
         4VEmz9JnbqJw/00Pfgiqbv6G8uTnNTxFdUdO6oBrCwOrnmt4wc12SU0fUKEZ4KbWR8CD
         yPNm8Tvo2iZFn3PEJZR0OjOwCzMSgS0PbASV2fgUbFB6puFISEcJQ4xGJc+uky9S7/q1
         9WmZCNiVOlg506UGuDm3g99OwU7RikLvdApuhTeERe1ePhTPmWhbWKhXeBQfXSZswhBJ
         iU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691528; x=1744296328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQqEJjs3j8paEAurgtMwvj4Mcq7zggHhd+MXddK/xGk=;
        b=NV/twCV9vxUHhfdD0uB/qMg2c7rZGVj/X8v4gsnS4Jv5JnsphbLxHVhREaEWTR+p3a
         NePiWObiewTGEoOjFqLzqaMIsNGFL1TtnfPU/KKnTBQ3kVYttsXvjyyOAv8J7sJj0OfL
         +uNIk97ez9NftDtpzUlahFMKg6OxHERYPhN9+UIMTtnzt98jFPm+jZYkkWpKe9arB3Yd
         7gmqMtjsp1EOtT4zDMKTcoPQvbDZ5PLvcJf8NBaohKbJVm1p9OdW9gIo41e7DKZlZW7G
         isT6kOWQ2ikpzEDYVyBz+6mgBZ/x7EmSa4QCgewIxHvsQTLmYBAdsj2QzRRr++d26dIp
         xCmA==
X-Gm-Message-State: AOJu0Yy69oFwxDbb8OqHusgy+KfjaspIgZnukSXIcFa4TylShZ+HBmJN
	BGLlzIW529pHFulgZb/zsybFZfiSfBSzkaHnOXRqtZQ4HeZaRRf0bQWb9oJe47w=
X-Gm-Gg: ASbGnct+t6fMQSIp09D/uGuLy3UFI1JNapBnLVWUjkEj/gEjaRCJuPhatt1eTzHqQ5/
	jmwrcB94zNrAQtIn/lyfCqiEvHQrbFqrsYUWe/VY0OsZD5j2ddGpZH1yHCh+Ag7uZzy/h+3XV3+
	H8PrH3YWYxY6GH/KWVezTBvVWuhVDafFLEPilslyynVbwQfFp/CrZ3KbpOmAn3IYrLv0+0o6HLp
	i3Bfg0GOUS+uK4Apv/lmvfYIU6Aq477CnV7oI7yHpVDcOWm+qS7/zCfI+tfpZfM91+B+4JChJ+h
	U115yqU4ILnM/auKpW6El93sA2KQ5GvpgkJQWciiwAFF5e9JanKUsWwlKcnqw5QqcndqemCgCXo
	WnZtL
X-Google-Smtp-Source: AGHT+IG1TRNDKEqLSFEugF5MWzIrZCjacU0RK+ukrjSLYQ6UbdgxnB5P9pwd1TfccDW8bUsBX51SPw==
X-Received: by 2002:a05:600c:3588:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43ec42b8eeemr29897525e9.16.1743691528531;
        Thu, 03 Apr 2025 07:45:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:27 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 08/13] nvmem: core: fix bit offsets of more than one byte
Date: Thu,  3 Apr 2025 15:44:56 +0100
Message-Id: <20250403144501.202742-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=fqrKmcbiS1AKaDRrZvXTHaNkz/q/+2qHSl68uGqUaBM=; b=owGbwMvMwMVYtfBv5HGTUHPG02pJDOnv5j1+J9jbuE050+x9yg/ZM3LfYm40Fm66s7ptm7uV4 vVHXC+udDIaszAwcjHIiimyKD33jzr259G373J3e2EGsTKBTGHg4hSAiYidYf8rad5+Y9tfjXxr 0eszWXteMStfKlsYL2ZQkOTPJid0QZ6z29Ew12Wfudziv44rb4lw65dZcC48u7/AyWK9ceR0Dca SjAKOvRrH+k2fpTywtNW1iKjZvmdvr2DboXadZ+9lBfi9+cSy5k71UfZb0xV44GqkMUdtzsvy1N pbzG/b31fqH0iY5mi7orC+4d3qyXt1Az2me2wWVs8sT2t/5ht1Yp7G1ZYF2v57lxyJVfq8PTbdi bdr9aoKvze2J+OiexLPvTINPhKcJvnjXvgX+W86Er8XPz2lHsno17IpkaXItSlUp35X8facDf8j q84dDRf8dNhKW6Dw9I/txW+f/CuqeSHoJPvxynKTkzYTAQ==
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
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

