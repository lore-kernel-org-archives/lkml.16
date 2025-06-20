Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44F23AB8A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408072; cv=none; b=LteRG9LEcaf89qGQ4x4cKwOfD5zQQ9WQS/4z3bqWlcgPzhwaHLBjG7L4y3jsiW5EuXeunVfhAp1FCcQZxfTxZNCk65hxjODGqYjw1we8Qlg6c4oYmsdfDyCn5bPkveT4idaLwtNDSO4xePBKeAz8l1H2KayiNdjUOpZNWlTOKSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408072; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQ082Q0YalzrKIp2uzZ0/Ev6lzHH8F4+2faf+P4ZCKTALmk6/H+GiYsfG4YerQFx7ynxGwCfnk+Mru9CeKsI2NAFqaaUu9B/EkQlXlZj+R23kvHtlU5ff7kextxHi3BzAmNoZdfcmnlimFIGXoRfFSD3DdEo3TZSjEpHQlPr9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jfTYLixn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jfTYLixn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so9079815e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408069; x=1751012869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=jfTYLixnPAhFVZrz0BknhUf080LS8P8AxvVNzcNRdVJ7fFpRzr0zOeX9ZMp6t3kxZL
         lTx8zQlx8mDuUzep/mDfzfH76/kykwyYStYhuxc1rcHM0CDVhxbTOnYm6nfcF2d6Ap7y
         amO+sE2KXo4VGe+5hwTcnuFI+486YENDz9Mqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408069; x=1751012869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=IslKH0kcMuhDVRodP995WC8WSbYWfDRb0MDPCo2CkVex21s5tbhQ0bPii817iDtJVK
         blNdVr/+3M9fblJrfwnkcOaUPIWNV2uKRr/U/GV4sHVdsPPt2r1F1B4igxVZZAGz82OA
         8JhftCikftyD87AjGp9vbfsDF+xb554TCPahmVu3yv3Lu5tRRulOTr6l9tRsgi4zWLUb
         8gh4vk1AJbV8r0ZO29ZWqwEeEH8IwjvIoXWsr8g7E6j2/rYmeVu7lhJ1zo/r3P2eVyrp
         uBI/fhIbm8GyWnDBpPpQtJkyljn+ZwtP2IQ9AsK6q8qdKNlhYU4jwJ6HQVulyWbi7RAx
         BlRw==
X-Gm-Message-State: AOJu0Yz45ISJ3fnxelDyTRtv+DM3eR0sroQs9x/QMeb3PIvPCkezLBj9
	PnWh5X9hDxhUL5QZrCPFza96c4hElPx63cEnWz/bGpJQWueTsIvbGmofgBReJ1FZveGyAestgvs
	fg0sl
X-Gm-Gg: ASbGncs4zb6g4GsiZ7oTf5JP1uhguGHAp4wce/KAR843AezZvQfwoH2KlRSdcRHpT2h
	RI0B3H16NKwGOdz2BusHR8y8PxtaHmk6+S1e+JsxqymoYEiRdYvHnccrOyM1xef7TkfTYChODG3
	rOw96jtRgvv6vChqd7XLlmeFpsO5cMVXK8ex77Vi0JDiydvJZHDrqBwTSISV7lxftg8CfTxMwD1
	SJdM7FJKMK1nxAsKeCI3EKfRa1Eq1P/PTcmHRkQoGBs3OGkcvwHIeWDmh/Q8eKAEIHLqQogcGb4
	uubDj0PKRh0CvB68zNTSACsLP24hmq9pJnA8TS/s+9YEMIZQn2xFu+fUC2uXAtET5nB3/konLu8
	Mu7OFtnw0ZKgyIghKCDPjpI7Y/KjTQ9B+eYkYG67Soe/JfiND2C2J
X-Google-Smtp-Source: AGHT+IFxJQt2EMofYFFEc+wI60+FOtOAa7Jz8MXXVt/8qC8IgOmSsAJ9wzBvAyuIOyuqmNjPgJydyg==
X-Received: by 2002:a05:6000:40da:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3a6d1322ba4mr1436177f8f.33.1750408069390;
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Fri, 20 Jun 2025 10:27:09 +0200
Message-ID: <20250620082736.3582691-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0

