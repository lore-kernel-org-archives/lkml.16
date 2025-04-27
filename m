Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6891EFF88
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745034; cv=none; b=IFXhAqIP/yNBSARTJbO1Xh5gLxifrkdjlJry8BNbAh1++gq3YvYwzTSDDAUlgzdskAPP8Tl5xkj1XO4zZbj916W2AXQhOt6GajqeRramlZo7+OOSMdvVRyeUdGWDWkyjwB13vFMyx1aVHZIOJYUfXzc4Cwm5VemaP4Vn3rZuSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745034; c=relaxed/simple;
	bh=EnC5cdHF3TbsKUEY55JwJp8080ea0nqVvuu+9SIRm84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNUQsdh0pZ0wzV6/HIx+71+s8JzzC8MRUS0phlBSu+Gwwg4fDW38sDK/3IOSDstVzZLgKJBdxeSXp4/uHqHbWEJ+0x1XVzbGAspuyRakOb/kUuNrUeKk9xULcruIear+jrf2TnIE9tw9tJhPI97vvWw72DmUIo06PTr1P1cQegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZgrPy3a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZgrPy3a"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c14016868so3569582f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745029; x=1746349829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=kZgrPy3amvhIf/IaJc6kogqc09IlXXN5H2wiQweeZWttCN/7PMuBza9fG/LOHMm0SX
         0XiVCCUnoFcAHZzg8wzxBaaTe78f3RRgjjvpaMF+IOf68OHMfuMh0IjrhVHvQ7jWvcFH
         VH1NQNwlIXFqQPFO2MSuaV1vRUiDS92KPgIe1KFZ0Z5HZZrtiSTfAw9wpiNSyO7gXYYD
         Ot6GFGCwUenbnX5I/o3AlrxiQ1kLsZMjHotzkn/ArtZr5LftMfipo8DQqk/UeYAvoCX6
         1AG0SmlBa37pepaLA6gA9XfQ5MBoKx2ViInvKWWn/VnPJMF0PzKktf7hEGpuS9E4qz3N
         v29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745029; x=1746349829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=pkUhA8sZZQ8Tzn00LbD23EeYHq74Yq5CSIwIGx13AsWHHo72glnPAkze81hzUX5zBH
         K3Q1AOe/qFbF+4DITmeELnusfO2NxE6/C7Ju2S5UvFmWgU5uCqvadbXsDUTVc2Oj24bx
         pKVDEVEpaYtkqye+e0uzShJLy+OO28x3i21nj3JzgctKZcUCccKaBgI6uBZVTY1p9q1t
         1Xs5bEmxeqFPOmS8m3f/4+ahP/pgwYhQ5n/Tql/P++WRv8yMAsah9MfV52XLeSOkqY/N
         9zQwR8qC344QTgb2lrNc9CtAmnP4fzKj29WdresPzh7HXyElWsnBDkrg4zPUtbOJVxrp
         v3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUsvb37g+iNB1ZqL5I42cYPLDMOzyVlXozxC2KwPAtd6UQPTqARmFygaJoctUahs5ifaKAmD222bG2n5tM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8Y9M1EXR+JaBehCY+fEk8M7029hB+t0+dw3zv9+rI1IGIccp
	bHs7hoxInrg1MtONX9r8j/jWw3kC0c3DoI4gcr1mzVWcUBhCep/o
X-Gm-Gg: ASbGncsBGcAOhZq94z/cipp7LuVxMopGP97xfUP9qtCpUv5ni5meTNll+8BkV2zu6Jq
	rbajzXp2eLHQHr2mf08wTobbhVwri2tYbbuJPHoSgFD6LQjXh+WgZy6I85VW//cNABirQu0WlvB
	/UpATOpmh3XERmTTaK6DFvRt8xqxIZhWPPsuif0uc88ABSKTwt2wXdY0DT3w9zg1yjttl1iNzB0
	/X4glhSzemZ9Uy5Xa/ahGga2I1/1omYB7LIp5JvTnCcg78vTxctKHnOd68w72zd8FqGzE4ht4fm
	t+Fgz33T04BswYl9L/1u5Kz7IIeOPmJYOP6qhmJ5wmdfmscuwqknbOe5uPnC09OxsI+66yTM0u3
	J
X-Google-Smtp-Source: AGHT+IFjT0QtbADZJwmJkM23xNAEU7wyxJ9Xcu7JImBWXzFnNESTaT0IxeVosdf/WiBpaJrm2A4WMA==
X-Received: by 2002:a05:6000:4284:b0:3a0:836e:4a26 with SMTP id ffacd0b85a97d-3a0836e4a7cmr456728f8f.37.1745745029249;
        Sun, 27 Apr 2025 02:10:29 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:28 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/3] staging: gpib: Fix PCMCIA config identifier
Date: Sun, 27 Apr 2025 11:10:16 +0200
Message-ID: <20250427091018.13705-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427091018.13705-1-dpenkler@gmail.com>
References: <20250427091018.13705-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCMCIA config identifier in the ines_exit_module function
was never changed because it was misspelled in the original commit.

Update the config parameter to use the correct identifier from
gpib/Kconfig

Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 49947ac30feb..5168811ee850 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1487,7 +1487,7 @@ static void __exit ines_exit_module(void)
 	gpib_unregister_driver(&ines_pci_unaccel_interface);
 	gpib_unregister_driver(&ines_pci_accel_interface);
 	gpib_unregister_driver(&ines_isa_interface);
-#ifdef GPIB__PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ines_pcmcia_interface);
 	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
-- 
2.49.0

