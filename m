Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02B322616E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834112; cv=none; b=lXYxpVapL46S297S1slR+yQN4G69C/RmqbDizMCb0Qkiyk96bQZvnKPRcn9wGWCKjG2yJ51Vx2TvpR8ZSTtfN9E0NXwsh6KSKL49KfRROCDPRjrkOA8zePwAOpCNsbijeICJ7MCTY7HU2eDDsgu6aNRNgBKVRMwL12xHhi6sOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834112; c=relaxed/simple;
	bh=OF971a4q8HwnxSC0ySetrRs3ZIDkHcOF0xo4y73zDds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldTT4MuhQ95FfDu3cKQLbgEik0Po4HrvxY8SZyyDQsewNcfcuKSBe0WYailLXtFfpcs5Kn0ESY6ctcbIBridD8bpUixl+VEn1MpWMs8nMLRlnfSYThUvx5cOJn5nckwVdHUgMDm347miEcm85tLdCzKFX/rt1c5tBYTyCnyjYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3wRoQnY; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3wRoQnY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so452119a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738834110; x=1739438910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2byJgRGWBVViDhx8IapV9YTVY9KGkswpq6ruK43H46Y=;
        b=l3wRoQnYpzlGt+rlFSByYaOQ/OIrpnG8QGzo+EU9T3AQvlcH++iiP6bzcrrWYgpnLr
         uco3/HM0hWYkn55N4UIGaR9/pWG84/noI+60TOswPC1Fy2sJ8g7NUCULUkWyX2xhgmQO
         ooXMI7wTR7K7bitMl4pw6OUQJMyck2Yv3gJUcUWlQqjHmgcBndWfXz2mBkvuLp4yXuw0
         +0rDw+AZ2S4XOjJjyk+QaPkWvdmNxd2Q9shMboZ8puBKq5nOCBEagiT0vvciiMvdeDan
         ME9o6rNKC7ryUrmqBcqbQNCgRRpFV6GuZm83p5qHhTVRSmtOQjReCa4RVqJSMcoCdJOU
         2Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834110; x=1739438910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2byJgRGWBVViDhx8IapV9YTVY9KGkswpq6ruK43H46Y=;
        b=sjubg/VZd1rmp7hWt/9hcNaRBf3xk7JYh0J4Aw5N6OwSaPIZA5eSfLES+H0MydRbs0
         aiRzI81xHk8eAIfObsWUpVpfBqKiIh23dtTwQtFAldvsg7dS0aYvWnXSCBspD/uhVl37
         nxnWtQYLgTIKlq69v6dDWn6yoKXdbqeIoVzQKKJBAkO6GBASicUUXgQzB8JBiwPiUAes
         cFdr0e/06G66NixQJWhL6BTEfiOPkTZ66C4GZMggclq2BGz9lup9QVBYUBBGvfdO/kSg
         /FXgAA6S/08wy1QKINwssuSsbfHGl0AQJbPU1vyMddM+R60/p1aWwcSiOp5T8f4cVr1j
         EbNA==
X-Forwarded-Encrypted: i=1; AJvYcCWtzdHuyMFu3/g4+Ocp+6R3+2Ebtqfexv1MNW8/yNLo4Gxu5t90V7999zaT6pbe4rZTeUz5CNxiT6DBfcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEh5v2A/4Kq91j/Vvp09Q5PQYnBIDnn3nKtIx+BOXZMVCH/fk/
	UXshy85BatGCdCeiWJbtUqHGndTQuBVBMyI3eYX71G8lF7dPyYeu
X-Gm-Gg: ASbGnctiD9qMIvsUOM8SnJcQfZsT03yAYMXzrAhOKWMO9/4ZA7stHkg4vl4S7/nycBl
	LcTXoMyP2Y3sAzoa2zwgUTz8b/M6vktoBJ05csySvm6sKRR2a01pXzljA6lJPGVi/jZl822LroZ
	+/hoWNIgs9RLtTcgWICId7j06KeGGU/Ff8lT70262juxCCmAiVjCXMzZcOkMxywFwVUzflbzjEE
	c5aHwqyTDHQZ4LtiJUbgpdDPJepXAp30uRHE9JKGVE3TpOx4i8AoPfIVWU3bGHCLTO055Stc7c3
	BetAJ2toN+zlwww2Ce2z
X-Google-Smtp-Source: AGHT+IE8bXyGkF6GFPLQ+AZx6Ht9QYvHf0fJunNuAvLpU60xJLuQbXCvhab2bPj1k2yIL4ip47V19g==
X-Received: by 2002:a05:6a00:3908:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-73035103911mr8408512b3a.6.1738834110271;
        Thu, 06 Feb 2025 01:28:30 -0800 (PST)
Received: from virtualbox.. ([103.16.71.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d195sm884979b3a.18.2025.02.06.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:30 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Date: Thu,  6 Feb 2025 14:58:15 +0530
Message-ID: <20250206092815.3267-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- pr_err() of hp82335_attach() in hp82335 uses 0x%u which is defective.
- The iobase is of u32 and correct prefix is 0x%x.
- This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 451d5dc6d340..6ce79b17a419 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -274,7 +274,7 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
 	case 0xfc000:
 		break;
 	default:
-		pr_err("hp82335: invalid base io address 0x%u\n", config->ibbase);
+		pr_err("hp82335: invalid base io address 0x%x\n", config->ibbase);
 		return -EINVAL;
 	}
 	if (!request_mem_region(upper_iomem_base, hp82335_upper_iomem_size, "hp82335")) {
-- 
2.43.0

