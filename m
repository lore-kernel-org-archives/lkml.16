Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8322687C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135045; cv=none; b=c9vmTpSwo5qPG7c+It3MjX+2NPjdLe+BaSWw43bAtYuk3kFDy5Sk8qULEVkss2xLpFiO2wAnrKBFf+UPC13C4WBb2c9BpiUKxAXktfGXp5sUUVBYL/T+3oZ6rlvGaOdFgiIsDpbESeUuZw0fresIeCHQkTOER/+VPq3Ih8YD4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135045; c=relaxed/simple;
	bh=WRHPFkMvhTVOHzTeZ4uUE9Rh7DS+jKs9WFZFam3kfBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gdf7Z55up3EAsjJK3I3ppJt1EYABGA+SgEvd36AOt1i3XF1vMQL2+b4eqH3losFp9k9h9Qp9o2y4o74aMOlKCwSPf/iM8djhtNn2wmYbaFGEmV2xvF8BdsOCoSsVAFSRfKj96dehDGz2f5yGYkyClxTWmn3iHsYueB6AVzYPMhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7Bj6Dvc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7Bj6Dvc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb2faa9f55so167184566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKyg0ozNzm7//cxSIfxO1lKoXW2Qa2IHKu5mo6o02A4=;
        b=f7Bj6Dvc9P0VugjbyOtkTRFMrDcuGdEYyat8YQlvhuXhbignZeSRcP25PQd6mKfWaW
         e2GTEWHWBk26PW06icW0BAUbrbgJShEeEyX8Bh0obJVsAwbHmtMljK8q6UoftXNq0N4O
         ipSU8xfOlQfzZuse15Qkn32Qyvdec+M8V79fnwL0LErJAlXw0em3GUPR1oOi/V0lEtOP
         8BqPMKnkxs9Cuv2+sFirlfZFrby2Xy70mS1Y+pz0eoGq79IbYadhCs5bO9n4kodtk0K/
         B3attceD4uONLaMZcdK2NU+feiNjjzxV3MZMqZFhlPQAqfj1KHizoAeEatd2IR90ZNUk
         ZBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKyg0ozNzm7//cxSIfxO1lKoXW2Qa2IHKu5mo6o02A4=;
        b=PXPpxNLGmyRXOhr5lCmrXp8q5DjyhxizSRuPxTKgY8Fo3TNGnFIWZRiRjZ6qIHWGFv
         +rppGX4D2PxlhArxbDS6rsx+XTu8GUrK6z4v1v7Kqb5EDSPeYPlvPXMmlGZqwzF4r4A1
         uAtBB1iE+fl6HWPxAHJuWAem90HvffPcbOk8D1Yp7p1KUUerKVoa6vZ6q4anO2mS0heN
         nb16CL/Nen5EBgAYVAX6VFuDKSbSxL2NLuXmAxqf/7LB/DAe9eNmgd8Jyzts61L92jU6
         JfM9aZY9+/htL1E97JYzdaIHVEl/wo1TszSB3BYHvZOWiPwKVLZ+gHjwn7gGJgNkc2QU
         CdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLmNKEgWpYxLrmGiSVKfjb03jPq0JuWtTwNgtpX7dGKCLHy0d12NiVWzC21+YO62axbHIJ/Ga97DbeSpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdD38Y9kfYL3QQB26DE2gSpz1oHQ9kMNxlOgRrOIWfOW9g8yv/
	HHsYAI8vyAaObx3wWDkQQQqYFbd2FV6avHMIoQYTpfbIexUB6/vh
X-Gm-Gg: ASbGncu006XT96HixvUqmKHjagNZFyPMJqsd8vgxvjlhWSlGaN8l45MvD21aPMcd0FM
	NHFGracyou+54vhvPTIsNTu9pjowmv9jKiCHAsjVP1QYprfaz2KxY6XsAZx5pfkCSDp6o/ROezL
	LR5J6wXhq0vweH0GEgsYBEbDQiN5uD72kl0Lb/kwpc0drPy0YaNHi02kxPqvmrW/tqJ+Kq1JyRo
	sTfdHQGLu48AQ4vrqpxv/9Q5E9NcQ4r1VSkSRjbxkuUpwm3Sn9c61lQHJHKP44OO/L2abVPH+M4
	9lIjCDav/h1ahA8FglmOSIAujaq4vm7GP3FHacM4GCp+yfsyuo0JQEVbFC9ixwngBkWe8TJ0oLC
	hhh0XFJx3NdXMc+S8aXQpxJAHNVA1Jafa810z9r6ssRxaouvHJgkKBZKyA3L8VmjFFZS6/cSWhN
	bXZA==
X-Google-Smtp-Source: AGHT+IExT/aJg9WflitW+HrLoVfCe6NetKKbdMQo2X2dLvCty6EdFqJWUP+btRX5BimHTUasCsz8rg==
X-Received: by 2002:a17:907:9719:b0:ac6:b811:e65b with SMTP id a640c23a62f3a-ad17adf4cf2mr59008166b.36.1746135041895;
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 4/8] Staging: gpib: Updated return type `ines_request_system_control`
Date: Thu,  1 May 2025 23:30:33 +0200
Message-Id: <9639f86fd160a5ea49f12d4f18da2c599d59e701.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update `ines_request_system_control` type from void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ines/ines.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index ff27f055a0ff..a82b9cd93129 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -46,7 +46,7 @@ int ines_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 int ines_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written);
 int ines_take_control(struct gpib_board *board, int synchronous);
 int ines_go_to_standby(struct gpib_board *board);
-void ines_request_system_control(struct gpib_board *board, int request_control);
+int ines_request_system_control(struct gpib_board *board, int request_control);
 void ines_interface_clear(struct gpib_board *board, int assert);
 void ines_remote_enable(struct gpib_board *board, int enable);
 int ines_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits);
-- 
2.34.1

