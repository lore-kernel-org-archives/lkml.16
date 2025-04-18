Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0CD21A92F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997700; cv=none; b=RGvTlisDEQg/KPuIFZPh7pMtUtorw4tMpuCEuHThpwQex+Wi04t4yenpe4SSWRAfb2881V1ydRsRNAJFJ6NI/sY0hT4Nnafqc/2L6PPUO3lgs+5FUXzUDvFr4UjhtixgM2UF3BQ0rsllodI3xOM37SWMoTpb7+bNRfGU4QEbNso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997700; c=relaxed/simple;
	bh=912DhBbNZi7td2eyvaGCgvKiyTa/PfJmPgJRBuo1gJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SE0hCLlzLo8ngp4pyW949wm2b4fCnkTUmqHob7n9fsNpedEHZt2NFua2sSgxHFXVsL9RTTmoMhabGPMgUSlIkqF7L4941Xw7n7M9vBlXO6J9pJznrDkh+Grh0ysB80/OxfbynlSx1dcMm0Ie5FxzYz28F1tFZ5HQmHpOHDgmaV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uqra2S+F; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uqra2S+F"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so1835766f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997696; x=1745602496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+FOcgEbgZOR6HUZYr+EJt4u9kEg2pRhCKDSCtJHjy4=;
        b=Uqra2S+FaS0YdWHJjYsXsAAOvJF3ww0z1IbUetOcv6ItTU5EU1KLmuGLYth0EuRapM
         qoj/PFwaBlBj8QImoH+Hwo9xz72Kj/m6bmCi1nsGRAgdRh0HvN9VtMYcRqHjiHVEBshw
         iw7tNSpA1b1KA1MKWtbCGz9+NsBAnGhqcgZSfu1XuED4u6Tg2t5nv5+AsG9x2RQHlMMB
         hAvEsNsnRcWUI5cRN73e93C2BVzy3tGWrCKWG7mjQ8CMitc4R1Or1A6gRASBIGLu+B1O
         PImXVA6yeCDClsTaXaIOZ5DT2z83d/nhrT4EGI9w+gf76tkDgGdOyu7rWk75u4dKzWYh
         8tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997696; x=1745602496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+FOcgEbgZOR6HUZYr+EJt4u9kEg2pRhCKDSCtJHjy4=;
        b=XgVjCmWhmlVL6JicI2BEBjPEHoZZo+qcuhY0MHpVxaq0M4GhKESPvgnhd2Rd1N8k+T
         NB3dgiadeTcKuDxSXSpvjCdqhQC8yyl8svX+f5wp8LCl8vaWxOwKf1smZV/7jPWA8JXm
         RX9yvBxYguw9rXsdXql2nupwAGAwXYJw2E8ffzdbD21f9/h++1kvPe0gpG2miO7YY881
         J6PEDXAeX9B+iZjfWkXmmJTD8j6JfXjea2Vtiqk0MD0EopSUfLQhwDSb32RO2w+Sc1J/
         gs/GcRA61123dwj+VOF0TR6ThkCYkwsV4czhPCEW6vRazCZntAYwgJ+5zi8ApLweE2w6
         pvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjGqLQQFv9YaA2aTjCfqqarLmv3qQ1HwbAZoiV0EW0QBx9XmO6Sc1IOt40Pk7ZeQr35Xe0JKTo+GrzWlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhC7m0guikrAtpmr3DOSIBoJ5fvwPlsjMJVZxJtk66NjTB4aTQ
	hqbhh/NiGuk7fiONGm8TYH2rZINrzY+AOdNyK8Wy5wBHVxNliJpw
X-Gm-Gg: ASbGncsV9Zq4XomAFZpQAbRQzVlBnviGGHkQZCIfI8OR9IvopAcvoaZ2AMWeCuqFPVp
	t2xk/K5p3CZf5sbK7wyrfi8r18WZZ56ym+LdQ8d0/0ozT+7XezhTjg4h9P0+LRa+vSPF7T7mEBH
	fWgBarf7jYBrE9YIXfMgtC2uObvQ8EibsuI2Sexwb88qEAukY+Tb21GSLzhRrmqgnbSHCMU/bki
	gmcKlNr66THYnar8ENSFqYcOjyuARW0FcEVrOPIiO96zzj9nPcPKjXNtZhRU5TXpV3iuVYdV944
	B+RyTLHg877joOhZEbDG7M24/HUdb+OX4o06M8AHpUltHiGsBiSJLPXjfx+YQ49nzQsIDl14ZmJ
	p
X-Google-Smtp-Source: AGHT+IGb8/57K9ai+Ha6SyUvyBZ3Kwj0AjmdglALiUn63qt13/kokBa+B6jbxML43drs8/ss8E7FNA==
X-Received: by 2002:a5d:5987:0:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-39efbaf6e96mr2691275f8f.50.1744997696571;
        Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/8] staging: gpib: Fix setting controller-in-charge
Date: Fri, 18 Apr 2025 19:34:28 +0200
Message-ID: <20250418173434.2892-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio board can only act as system controller.
By the IEEE488.1 standard a system controller becomes
controller-in-charge when it asserts the interface-clear control
line.

Remove the setting of controller-in-charge from bb_take_control
and move it to bb_interface_clear.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 29aab72c1f0f..a92c4eda99a0 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -872,7 +872,6 @@ static int bb_take_control(struct gpib_board *board, int synchronous)
 {
 	dbg_printk(2, "%d\n", synchronous);
 	set_atn(board, 1);
-	set_bit(CIC_NUM, &board->status);
 	return 0;
 }
 
@@ -908,6 +907,7 @@ static void bb_interface_clear(struct gpib_board *board, int assert)
 		gpiod_direction_output(IFC, 0);
 		priv->talker_state = talker_idle;
 		priv->listener_state = listener_idle;
+		set_bit(CIC_NUM, &board->status);
 	} else {
 		gpiod_direction_output(IFC, 1);
 	}
-- 
2.49.0

