Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE828212FBD
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677121; cv=none; b=m0GcFyQWl9jIBubYkyDOnr7VihIagGG02T1OXBnwoeFoYMh/o6aPr6Y8y8No11TK2m6yqie/Kjmw1+58uS5N8srJbfu+0HMIibi/uCv/XVjVpgAC7RAsd/Is/9ICw4xRSU4yi2ekdGt21iyW7jnii3/OCvxZHHRr5joRxI6Acks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677121; c=relaxed/simple;
	bh=2TGSwxCXJQpa+8oxNj+WypV0kbSHnlTvS7h6o+3uRpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teKrEiqPupBRWxGfIRHJlUnR+EMkV2HPcAgOgnK3fU03o29cSQZY8ETxZnc49q65MEwsdHiI29P10R4bI3mGYg5pAxuZb3SoZhwV2LR/acUdG6AZSCNDLssAB56ma8mVi3aK1TMdBQHvviNJb/Qsmhkk04/tUg70bs8XFiZaD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLGsyefO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLGsyefO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f441904a42so9383988a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738677119; x=1739281919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PfMkDBo1AVubmWzaMJLsWewtHoQf9eOswkoTA+L0S4=;
        b=YLGsyefOJJItUViqKdXE07tA97jj+dlRwpMIjLbGx4D3WarnlyhI77Cc9Wo8xXtc2b
         mbQb6C0mccRg4ppJFjNpkbRurEEc5TbeRAoh3suDogNTfUMl5yldad98a0BbxF580Vf0
         mdTRNREocbSZpw+2skNmL+R8Czocgt8vJhEp3WGDhqkmYGzi/Or4hduiNJX7bi3VEgtx
         Z6iZ4WBMq1fucj6y2jaccwPucDd06H/GqZWjP5DrggnYsH487mu9Byr+3P7nVftKKina
         MvnMi21h3ahor5h4i98BfilwAGyJ52t0JneSXlp6FnXrGMOegzefdca5mjDyfma3BeVB
         FsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677119; x=1739281919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PfMkDBo1AVubmWzaMJLsWewtHoQf9eOswkoTA+L0S4=;
        b=kPA29l2ElpZiShWIRxlUMRxVL8sNKQ3YLYuNqvKvRU0nHEGWZXFgjcpPMPXGK18FHg
         FL485ssuUgF3ubHFIGk+eAJQd66CBhF4vNdYlkd0B5v10bsNqnuKabqf5IirCjYo8Xsw
         uMfhmuwO8CXu86qh7WJ6uS0SNmpyIsY/JYlHSLp2NQizwhpM41oXn0Qvf00tEK5jSl7R
         ywYPB2v+sVaSH8/a7kHodPDY2C/iIGwzFJTYd9gausLPnnDga6F5KNIZOpgZja9ooANh
         mDQIGTMATVxkEHIgS0OzG8R+PpAWkJ/g+AXygqFhcKhPvI2mcQNh7Ynzr/Wq2ECkPcQx
         6esw==
X-Forwarded-Encrypted: i=1; AJvYcCUai10QfSohAOTozGtIhTuNNNnml2YLqVvi8700ZtPMOsCkr5gljtZdJEhriS/whADUoCq6YU5VcBY/rLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YytuWxahDvXoouEiKKKD/8BgcNGbdGwNne3TeA8hJ8MP5gy1+Xv
	EY5NjyR3ML0FBR56q/BHxfxvmXM35Mt4AEsprkqgVHX/yd/BJXe8
X-Gm-Gg: ASbGncvqoWlt2ojP7uB+q6kI4jKF+iHBd5HPeG3CvBVFdIGLvYFNPVq25DQiX+t+oXU
	mUhdsyt8y2G6IoJG71dPNFlYc2dKV5mKvqfgpqODz6yUgTty6kupsLNB4Rd3INH/DbZQ4qMT16r
	GZZmBBQ2cFn5feULeHeVuxJdhQXH5trBNCHB0R6+KDi3oUCdK425ERkpbZxRSmnJ9ObuLCi3geP
	Bp1gj8XrNys2Wo6xBszYtRq3KhB6Tv5ASE5k+PQ7R0L2KSpP80QFny92AKTqCAB2TNXMDEP0+qa
	APlJ8iGD2eO8geuVHZtE
X-Google-Smtp-Source: AGHT+IHfDN4MHh/878HCRBwbQuewHXGGJtk7D2x6oQrMqapYfXQYwmMXiSNvfpENyyshkbNSmlZjog==
X-Received: by 2002:a17:90a:39cf:b0:2f9:cf97:56a6 with SMTP id 98e67ed59e1d1-2f9cf9759f5mr1630872a91.14.1738677118000;
        Tue, 04 Feb 2025 05:51:58 -0800 (PST)
Received: from virtualbox.. ([103.16.71.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848a99a50sm11167191a91.39.2025.02.04.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:51:57 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Date: Tue,  4 Feb 2025 19:21:31 +0530
Message-ID: <20250204135131.3094-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- pr_info() of hp_82341_attach() in hp_82341 uses 0x%u which is defective.
- The iobase is of u32 and correct prefix is 0x%x.
- This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective.

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 800f99c05566..740c450914dc 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -723,7 +723,7 @@ static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		hp_priv->hw_version = HW_VERSION_82341C;
 		hp_priv->io_region_offset = 0x400;
 	}
-	pr_info("hp_82341: base io 0x%u\n", iobase);
+	pr_info("hp_82341: base io 0x%x\n", iobase);
 	for (i = 0; i < hp_82341_num_io_regions; ++i) {
 		start_addr = iobase + i * hp_priv->io_region_offset;
 		if (!request_region(start_addr, hp_82341_region_iosize, "hp_82341")) {
-- 
2.43.0

