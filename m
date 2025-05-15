Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391A198823;
	Thu, 15 May 2025 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747348089; cv=none; b=ocrWEab6A2uJcgMGkxAXiTfH0ZQm/NOZRjJI1KrFTyGWnBBr8dEDg6Do755VbN8jc/s1xYo50lPRiLCdFFTCN2LFQUKNbtYZ//ANYjyZs9bKtgmap4YRJZza9YLdk6fyYzBFgPuaG7u9I4Iv6LXd3XUD3NazmOkWYKyVZU9U3JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747348089; c=relaxed/simple;
	bh=IFoUYNU9sUukdcnwqzdpKJq7hcxDfBJw2SxRQCl7Uhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNr8fCiGnHfhmxtZQmFwd7fU8/sdMDSR98ZWB8hCHAaplqk5qPCA/+60mTqZe1RLjqSFuQBKXqWKfpxD2/5iOqq12mR7VR2hB0bDCI/umdoHv20n3IVw+IM2JdpgQyXUfRDxHNLTwa3+O3If7/3UCGgWXTQHDBc8RnRgdeHPhCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9FF1ZEp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9FF1ZEp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so2617060a12.0;
        Thu, 15 May 2025 15:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747348086; x=1747952886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC8o1vMF1qj7OExNV+zZktMJov/vAO+8ERvrF0MQQJc=;
        b=T9FF1ZEp6WAC3hqLhJTASkD+h01mIdYqFyUxNcVnqfymcmD/W+ebCieh1L/jfQBvFu
         D7VoE4TiGXSXAA75wIA0LlXBvq4xY3J0reJiUShxH2q9Zoby7g6quWKykgOT36i+6yA3
         Dvg5CEAnDcYdR0ibfZeLkTTfIi6gR4OZb00Zubd2XkJiOAZT2mGwvhJjbDDTsuCSV7Bc
         /nwDHscHfDqjerwjJKpvBDTexQghJv3/Btj56rrQHfSRdO6B1D4JAmvY1zNNeYa1cJDk
         TKi97e1t6tyshH3sAZ6M74SPRwYKJXx4H2W/jKHIXDp/JHiE41sDRAfVEzb0g+GwJg9D
         4Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747348086; x=1747952886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC8o1vMF1qj7OExNV+zZktMJov/vAO+8ERvrF0MQQJc=;
        b=Yf3LY1L4kDnGwMHWVfFA0pheNn6LEs4Ne9Ku/gx9fR9ubzt13E/P59yDH+3UK+KIcs
         5tVqlN1EhnZehTvkJ2FS4T6ao3HZr8kLpTxVYQKdWcwIqdqrsXXxc3wKpWE2guQIEasN
         O8OJpqe0WOcLTAvBZ+hM4kgnKhW/af1Pe/asp0prbhCh0UQywpZpZc/4ZNWgNpDzNgBP
         9XoJz3vxipAiPxbLTFFXMyImvUryQrLHRXB+ZksbXBzxbuUU0ms10V9sdzamU9Y2uSNZ
         Vm/Aaj/cdOeoNTTXYaDkeFSL9Nc1OJVE9hCmlCrlsAM1FwueZks+jPN6OHEmTaXQBu2i
         ZYyw==
X-Forwarded-Encrypted: i=1; AJvYcCVY9Ld6gU6J/JxxFXGHvjDIJvDnzJp0CCgSSAdfT5iW8bvdDOCkWcXKvfMxZgFTN/D3OQxzslP0U9jgCaU=@vger.kernel.org, AJvYcCWRvz9XnLovdRTY6oFIZZBBsxKp9pNVWwvziNf0VIODXQmjcN2u9KJbtKJ7skwkem2563SrqI3fCJx+st4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4T1W+opOXqePeqEBzgOp8pJyZOyoYaaPkMRqJfJgWte1n+cg8
	bT48Vi4a0h1+7PUsCJmh7xZQRWk28GFWXM1lKcYDS7fqgmoYl4Fkt2srvCsEhXwicTA=
X-Gm-Gg: ASbGnctFxWAy/1aJfGp0YzXGX/2eciNJGOM5HPv/oUbNCqjv1gybBm4iK7Xbse1ca/M
	zryz4GaFhhv/1lqxUQd1BD0a8NnI0u0bsnBzEqFbgyAYqTdiaKMw4AzvX0R5K13/hsXDGw7LctK
	P5c9NCz6RayCmHJazqM57xczRTQW0fcVz/9cRHYWVmD5eEqPlwo6TE44zdii6C2xQTW7jT7Aikp
	vO8tJ+aoXne0GamIWLGlUK4gex8Y3tGqaOd4WKTu8kVBLVrPIlgSwgYuEYDOD7a057loTVux7cv
	q6aVsBrVtflfICgbbdpIPjNFvzDxWBjCRwxMZy+3a/ifs9psxaRCeW7s6PTl96l6J14pQatC
X-Google-Smtp-Source: AGHT+IED0W2WAmxJKKCD0fGpSIzHghEPp79a651dw2vgPdYx1ZoTTNQeBWzG/U3NhZ2qokfnIgxGfA==
X-Received: by 2002:a05:6402:40d2:b0:5f7:eafe:76d5 with SMTP id 4fb4d7f45d1cf-6008a590e63mr848271a12.8.1747348086001;
        Thu, 15 May 2025 15:28:06 -0700 (PDT)
Received: from localhost.localdomain ([178.153.43.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b824sm376073a12.79.2025.05.15.15.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:28:05 -0700 (PDT)
From: Talhah Peerbhai <talhah.peerbhai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Talhah Peerbhai <talhah.peerbhai@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9
Date: Fri, 16 May 2025 01:27:41 +0300
Message-ID: <20250515222741.144616-1-talhah.peerbhai@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Similar to many other Lenovo models with AMD chips, the Lenovo
Yoga Pro 7 14ASP9 (product name 83HN) requires a specific quirk
to ensure internal mic detection. This patch adds a quirk fixing this.

Signed-off-by: Talhah Peerbhai <talhah.peerbhai@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e632f16c9102..3d9da93d22ee 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
@@ -360,7 +367,7 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
 		}
 	},
-        {
+	{
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
--
2.49.0

