Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A31DF990
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329393; cv=none; b=nW97TogTJ7PHMcyVSTMZxI9Pud8T2BnFmHktGy2qodNtUC+epileBR/cSdrOFAgcw8fcDU08HYP6KFwO9cnHRpdL7kz1xpvvXqL1kOFfgV5hQAw1uAQxE3+tf1k/nVp75G03pb0W3DamsBddnQGNkEe0g9L5gIVQaQUNkLQBQ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329393; c=relaxed/simple;
	bh=HAgq5TsL2J5W1qSWohscDi0sEpw741h+gH1OrIGfCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRX5aYL/1STFlf5iYNCxiMfiVbNw85OJXdolUW9qZ/oR2Np0WEF/iIZp6rdwLoo8EscPFmDBHm+wR2Qy5s5tUKp4QzOprhDW0d5p8+oo1M47F3iiyDL9sspw+56AuNtbIvpaOhoKR3s1L3yjriLylvcDD1ULgNf8ZyrIAUa2Q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu3mGpa2; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu3mGpa2"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7caeeef95d4so115228485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747329390; x=1747934190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WodONXQd65P/c0ED7hKX8l21r+p4b/r4p9198gArTno=;
        b=Tu3mGpa2qepzDTwwqZO/3dHzXyuroBI+Xmh9QXC30mrr/AnE4oIeXVceauXdGGpyLS
         BesBcqHGMwFwBn1dUS+1W2teHe3j4A1K65p8uzxPE8Yziz6O7TZl+6KaRt9EYs/2KlnX
         20U9NHbr8wQVkH9cG6BgnS+vQFmunQWRxb5A4VSW0DxNj1piznnEQZ2WOYaQKcBfvqd5
         wS1SqqCFjfKqP2f4O6cCCgJNoJrDMlviQkqW+zxvdn55CJ/PPAbcDMJPPYWZkp+bs1nf
         BHynwa9YfD9RPLj4SI2O10k8hHlKkGyKcbUDItOcfckJmMgfiUJoaWh/JMFqIoJRakmF
         SAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329390; x=1747934190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WodONXQd65P/c0ED7hKX8l21r+p4b/r4p9198gArTno=;
        b=q6JnESoXJAbP+zV24m2dI8RHVh8FfBTmAhW5bJhsGKoLl9dxjwFD+vlcULIL5Sfb3f
         5V1XyLvsnsYpKt8+Wn7BuBbPBIxV0IiLraUIF/Qv1HYBtObPu8kBcHeoRSvqSSX6Ugoy
         dHR+5HDbkSH8hfuWXVhfU//ow4fYs+PpZl9bjqe5+igcOm1BCh/sGxMF7EMwMKi4cY+M
         RRUm5q+91DoN/CRqASmk0U1D3NVKPePa9I8/uQ/ph5IP061HLqWjJE5A+F3f1Jx5Ao1N
         rZ96HBwjOpZ6juHqAXxcXfAQ4Vqu2W2qsIc7kmCq2ryKcme6VkTnWrMYjCCEbzGCt6GX
         pOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj4AYvjFj1rRWviWb0yvw4S3a/yWUdWceruX5mEBivskI37TlOWtathQGZ+RYaRAWZAw2MiAObwGO+/hU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQ7Uu/cxQvy2aZTk24Ko5S4Q1vnwBQNL1/bHoNVQx2dCZw1xC
	C2f4HT9N2RPWYNtRDPnCcU6xByIfQe1BrDh1bEqx5pzVOZjTTmKVSo3Q
X-Gm-Gg: ASbGncu+ag/Kl/WIO3kSM7oAkFwxKCLGnDM5GkbKx3whwVoVjBQ3ErGHaW3b2RyWPU7
	1AAqMlEgMLriwPwCxsmm17gAuvpof/DCi0MfH4c2n+/R3mANyplamgoHS3ddGjAoMxTXWecG3+4
	eeokWpFvvmpH4fHlidlIVCluglvio/PvSl5DoJzMRDMG+x+7XQR3BbRjMT606w4SQYcYsyqoNP9
	etBPNvoQUBEZxNoPq7Bgt/cpFkup48gknbsPFcanqLm+A4oH3JEvO+nmtCyDv8jgxVDF80rFouc
	A0smjPZVp43c2EPzfk9ns8wb8zdcIWvVgkiiDuLoNh+2UWNtGLHmf9KYsrxRri4w8cCTsFq6r6W
	u+8YBDOqLRldoku9NbWp1hTJgo4F7
X-Google-Smtp-Source: AGHT+IGBIt5ADRN2ko2Y/bSo2YzdOgjYQbooGlhBSnGM0XLl4mv1yIyOiDT13nx1ErQ3x4cJwuQPOg==
X-Received: by 2002:a05:622a:5081:b0:494:a31b:c3ac with SMTP id d75a77b69052e-494ae33623bmr2581021cf.1.1747329388435;
        Thu, 15 May 2025 10:16:28 -0700 (PDT)
Received: from gmail.com (pool-173-48-161-18.bstnma.fios.verizon.net. [173.48.161.18])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f89a9sm409611cf.20.2025.05.15.10.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 10:16:28 -0700 (PDT)
From: Tanav Chinthapatla <tanavc01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tanavc01@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
Date: Thu, 15 May 2025 13:11:48 -0400
Message-ID: <20250515171148.22735-1-tanavc01@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tanav Chinthapatla <tanavc01@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..98d89e836 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 		buf[1] = 0;
 	else if (cmd_idx == BTINFO_BT_AUTO_RPT)
 		buf[1] = 2;
-	hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+	hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }
 
 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
-- 
2.34.1

