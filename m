Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7395D433A8;
	Fri, 13 Jun 2025 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782767; cv=none; b=sQYGJTK66etK3aqAPRYTWT+o1ze6g1CM5M80L+uRkcANSAX3iHoIpHQ55SSjVRaUdsaFXSbBLGIV5TVMOvP2f1qlRwiImujrEmXLpTZ4x209WSwYQIwvJVE+Qfh0JN3/AnylzWhFQeiTRcpmOv/D4kyeiqzAKvjCmSb/L3dFb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782767; c=relaxed/simple;
	bh=vP6Vl51rn8HbULBWJ9PixFJ0hLtwaoysTsW+pJHOzrc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YYmK8PZIJx7mhOHS5GRcpaq/0U8h3O9CLuuz5uT9gh0i5i2Xoc0BuiM7Le9/UxSJXORamMbaXVVeBB5ost4cGf/MJUb/h54zMOtnVbN8jLk9ufUo75iumTLYnlJS6HUzSfF2jxCXwAn/uwlE2c1MrB0EJcvAThigZuwe00ttQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXtnk/Zs; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXtnk/Zs"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52413efd0d3so496480e0c.2;
        Thu, 12 Jun 2025 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749782765; x=1750387565; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yixrxsNNf1iSkGw+yBG0ekEfXFJpb0BV1ZT2qbnYcwQ=;
        b=VXtnk/ZsHi3HVNMSWw6s7P/zzx1knRiUoVD0Av8BwGhvYsp3P04RlXopri8snUQDVg
         sIPw0YFMLtdX8PkFdm5ApDKWU1JHr2LaTUna5N5hByUw84uieuq4Rs/+MvyGnxmzqoUE
         8NV7ED7Oozl9i+6kzoYRKeN0cG0B7lNQI/0wF7xGMXZJ31Sc34X+oohaFW3GkdqHAZBe
         wv//BWVJAcMsLPnSoN24OvakSUf7yslDfnypQsjG7JLs32o3eZdfHGqBcWCTtPNsxtpC
         ZJcew2+OOdGyNGeXXTqeb8An9BMFtTpRkPaL+rVGKa++hn+6v2Sgz5bOIu8gipXkQPi4
         9g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749782765; x=1750387565;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yixrxsNNf1iSkGw+yBG0ekEfXFJpb0BV1ZT2qbnYcwQ=;
        b=SpLum0C3L7T+oBQxanuonZX8X5kSuIKxYoocVAQbQ//c+kI/ScuhYMpm+HyyfhcLP+
         hZfcNPlsIVPbBEkG5t3ohzOUoTqLxTXrdxYJcZ5VxaTo14kCI5FXfvQoIdj9BTBGETR8
         hw1saFHwM7sGZya9SM5SeZY+DoEm1R/xdUG6Kp0UQU3dnJGTZfMxvFSmCm3yvckTDgeC
         HyuTHwNlHLgi9qMbTuefpJ1sTMpSG+TxmieR9C5DvJfK1OLirqXeET6dAf6ZgqXNzuXq
         9MKVYHKkcG6BpqH6Hd9qiTXzQR1ddHK2O6+g7kmKDkvUJZy2ZW33CxRYKbQDBeV1gtwR
         X5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUtsJKWyM+NlNTSrmSCwslP2wL+Hyb1dyMJLix0NiCtQuwezq+++kIvchUu04VjnlCmH7JX12yAuz4zXCw=@vger.kernel.org, AJvYcCVSds9hMJT0HzgIYMyfe5ezBWMkAfq7l3zGsIW9kmEUHLQ1HnmqC9GPTRzNMo+sjCqoZPCob5YUmTAa9BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8uSuzvEIdOt4dyc+z7SfBgHP5I+oaI5yf9+OBmrHEHUkLQQJ
	3KnQXpNBuXZbLvxaNPJKBQ3eKOgQbMebAOlF+iZ6K5EhB7gpraWTiLHg8YgTiiHNirJxXgVCBfr
	wGH84gPElEcwXEiZ/8GiAGSAjMaPDr+w=
X-Gm-Gg: ASbGncvi+OwmNnj3yx3TdD3It+jcvYnx+ODQYHRN358oazD3kd+umEqpta14P1GZkZY
	ccisLDCZUwG7DOOTPwcsJPOQUFL7QDwvNN8QzQ0JZ4WcFaC/bwBQB3PrHDWYC+H1j/V7erhPkD4
	J13mQVKHbx6GP9q5hCYSdmVnjcV9gzwA+O55ds8AFF/x0=
X-Google-Smtp-Source: AGHT+IEVvW2EymtGbpTHCUsfmlkW62t9klpMMe54D1b27waoMvsr+LSx5x6Xi7bmxFQTDcspytxilj8MR4acJyAlhzw=
X-Received: by 2002:a05:6122:3a1a:b0:526:7f3:16e0 with SMTP id
 71dfb90a1353d-5313ca1e1bfmr781246e0c.1.1749782765351; Thu, 12 Jun 2025
 19:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raven Black <ravenblack@gmail.com>
Date: Thu, 12 Jun 2025 22:45:53 -0400
X-Gm-Features: AX0GCFvp4e9qWQUFKrewf2AlOaL67UOxIEAVF6YMVB4IUv9QqB0iuZAieNhCTew
Message-ID: <CAEUaNDfDmSDs19NU7+dW+-_zGgvUsaaK7ox2YhjQ-q3+xvFF1w@mail.gmail.com>
Subject: [PATCH] Add HP Victus to yc_acp_quirk_table
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Talhah Peerbhai <talhah.peerbhai@gmail.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make the internal microphone work on several models of HP Victus laptops.

Signed-off-by: Raven Black <ravenblack@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7e62445e02c1..3451d2f9c9ba 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -514,6 +514,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
  DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
  }
  },
+ {
+ .driver_data = &acp6x_card,
+ .matches = {
+ DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+ DMI_MATCH(DMI_PRODUCT_NAME, "Victus by HP Gaming Laptop 15-fb2xxx"),
+ }
+ },
  {
  .driver_data = &acp6x_card,
  .matches = {
-- 
2.43.0
