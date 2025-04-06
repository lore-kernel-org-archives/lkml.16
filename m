Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A5188734;
	Sun,  6 Apr 2025 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743973741; cv=none; b=hfJ2VxYXAivaiIoMfLiKbDg1pHmWitPAzh90nWwCx8SM0Ws0RnyQJ8Co5qkOeXLGXUysvRIkLX83O7TEdVssAl6eycwJzVMo1RHyyvyFTLGOphjR+Osxel4wq5u9Z7ZUDwXk5/Q4aO/wgaNxdmmuT6yDdnJiNcHQ8CE/INAUd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743973741; c=relaxed/simple;
	bh=gNVT4boTweoATyBcAwIKoTgbb0/FKU67SzYhH3omknQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=azT46GeG2sovW0RwNzVDXzom1+coHUVjsYJeoCKnBcjQrdjPlfF6mAcTxqlfHxgQT1nsV2FMsTc3QsyQQWhWzArj1TaWNRNWk5IBwh3NaEz/pfzAEuWj/onPg/3T/O/JQ/LYaypwrgkXQ7FFePOy0V+BgEhL8iJUcFZqNI3NaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dux/K6Op; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dux/K6Op"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5245e9a0628so75809e0c.0;
        Sun, 06 Apr 2025 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743973737; x=1744578537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=dux/K6Op8ZoF1MGxdsDRoSXqCzPg8cXFOUi0YlZyyyjy7yI8ELgItd6XDx7r2cmGlk
         QsUocC7K35VODvfiMVF6Zf1+HksTZgIxU3B6Utop33fUHvgU1JuJCo11BDcnXRDC2JbN
         Q4z749aw0gJi1n47szXDLx978YDpGNoBTvOhDbEzHFeJrnk6ptv/yIwUaBj8q3S9ivn6
         iyOPEqNFxR5/XinmpvGKy4gcVmj6UpcRbpFyNb/D0PXVwUWemfSbFWq1lQQ50UJ1PGTa
         mFJHlJKT0OlJy89X3GaldUbOyoc7Ye0En5qWPrJA3atkU0CZNACRiTpXYMk23gSE6b+Z
         ae+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743973737; x=1744578537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=l2kFMW1ETsOJtZaPB4+gK10zf6PToSR1OXXMHbgLrnHyPGTKak8DtCHZvQab9mJkX0
         S+CY/Dn+2r31rf2hAJTnxI1OcIh8idsetDhRycCJK4/IH0POo/As+NpWAihph7rXtJUe
         K5l01Llc51YZ54sShA6fuOFsI2Vr14jxQ7kUkqAdHbuyfhbeS26zemBdiqse/ikRb23U
         zYzPOKefdetxJfxa3yiV48f5HGJCnPigg6CoLkm+j2Xsu6HWjsY7TLvUPSWmOlc3v0q7
         YWHYNW5WMk3r3slGh8YDIFege0/rJ3XaRm9PGuOaRRQqwb1kO1MAfUAKtxbdfE5VVxsB
         taCw==
X-Forwarded-Encrypted: i=1; AJvYcCV0W9DTVGQVY8RIOij+jZLA41eL5CLP8SFqr79pugMfdm6nKTH0+pNRIQm09CY9WD8J/Jc0MPMPJAhoCOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSi0+/DEfXx6eGvnAlsyAC8PZVuS9zc/OowwiNZnBDxTJmZvUV
	5KVSlbiAYHlLNb9jeA0rQ2qsFTKff7eD7txU2gJ+o10ZQYboYoH9n1Qq
X-Gm-Gg: ASbGncuL7Z20Goy4RAq1owU2bi70tKCNbr4stbgdY7uKclv/ahmTy2OY+iZmpgtRTvK
	nqQJwUqXvZpEYIJVQJ2xjYU/yzuZHfdVWpp9eRZyRd+yvTybdx0ZrNUAu6HuowhmvgVN6LI+4/d
	Lu2kRO7zFTZrWtPX/uGpb867sWdCSbiLFQftsuzRqlMNIaciA2OF17Pxz3O0Ql22BrPwvbsSeBr
	oSU82G3iGP8PU88IOc9+oFGEecCXyx6C4qHUuRYf5xNwMGkv/zrzjzfky0cZuwSvslw8Orj3nsD
	80cDVr+vJp41YSo5qxAsVdgWCHiCkn5SJbHE6hyt391VR3/BAgoc
X-Google-Smtp-Source: AGHT+IGTpGiCEbxTarSt7y732oj9f2PCf4kNvnO3XFvF0pPA3Ka+/n2IuVGjqKpGPACv04v8yPFYeA==
X-Received: by 2002:a05:6122:46a0:b0:520:3f83:fdca with SMTP id 71dfb90a1353d-527642fd2d7mr2662608e0c.0.1743973737408;
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afa73b5sm1615080e0c.41.2025.04.06.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Sun,  6 Apr 2025 16:08:54 -0500
Message-Id: <20250406210854.149316-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..45e000f61ecc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.34.1

