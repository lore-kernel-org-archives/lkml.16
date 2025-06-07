Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CEC215773
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288838; cv=none; b=hXr00IXlrXwsUdnAFSAxWgcgR7T0FqjqFC8ezgu5ep0obqm3nOvzJ+a1Bz7arPeqwY63vxO7FvaljukBa5xKAt9virr+CepQwjldQfu0oaDTUEQtHaabhovGIi9YJQMJMoxgvtcgC3w7SSWL3YjsVn5BPYjUIli1aoBap4mqopk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288838; c=relaxed/simple;
	bh=Ji8FZAcHW25BE033AGpDNPViDDq6R0Ry0UGT2bdHdqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/K30BUDE8VCdFtLNnfnj9vKFgS8wRmEVMMp3FHUz8F52V4CKC5FjKMtBSAoly5rihq46cqEIF5etYpzkS8rVwo3DNGhraGQ5ssANxGAkInCE2vDuI23OJMGKsW8btE0XGZYA9zTnQ9QEht6+SArutiM4z0qPWD5c1GyWdPz8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Owb1+NXU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Owb1+NXU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo2155090a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288835; x=1749893635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=Owb1+NXUjGNtyANJbqJDcg/zCFMAVOnoOGihcXZ0d90YVODSoOR2gIrTHPNMELrkSI
         8qoMkI9/Q5HrQo9yxSop+CCxAj+ukcEmaW2tFh/g3ex4l1+AGMLojmhw2pal0YlrV/Ot
         xqvBtz2cM7HafJ1Wib5lOmrV3AhUt1a0qMP6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288835; x=1749893635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=NLSX1FCgpS61/1fqIgI9/8fwn+LiyfkBauLp6wyjMDkStktKt+HB+BcoxkjxnV8FJm
         pqNXnY+R5WV2zT+Di2ltPKcjUU/S7+NJ4ttFmHv2G4dt6OoRPxfPIxaYQIFlU/pd90q8
         O5jAZgEeMtmp6kuMT6Pxi0Y8gRP2sdaxA4Itna1TrWz3+J2k3/mxBQnPIuYED9vAen+Q
         jgMen9MIhw3ALUNBNS1s2A4O5fc8/u0I9Wl6Judn3jt751uBdJtnfprvFJVf5fKVn0Mz
         K3QGUmzJhG+Dr4qY6P7LnnAK9zdrOA8DpPPApuWCOqrDZ7pUaWZLihcd1ZiffUhca3Me
         dbGw==
X-Gm-Message-State: AOJu0Yw+2HY8F4uWW715sxz/pOw6YzdyH6BoGdtwM1vkWx9sH2QyGNYh
	tkDuLYt8P38T1BrxLX2BhKmpcN9nJlX18yX0bm5KeLnwPS9IvOuGvFpbv5q4UkEzx+O6kqJ2Ts7
	D/dV3
X-Gm-Gg: ASbGncvi4GkImZo9YxsyGcmwHhQ6N2ugGJSQ8Ko5zCElNYA3NSVUX/JkqzXtg8gmbIU
	l4ZWIZ7FPhQ1MQgQPc/XmdErOmGWLaqeBFYnf532SO9h8rdNta/Bzz/SKr6KPGAq87uxRlGQ1Xv
	RVjhfaMZ61GAFSbp4e3IVmKeeiIfuY/UnkhbNIa6y9bedNrZzB7XdrTo2El63AQXQ7q4dCeRUP7
	auNVMp2NDKhRZFp/pc/J64tYkRhwrQR3J2TPFjdP7lerj35ZP5IzCZArTvgKMrdGJZRKTYgmbTy
	YgN0QXZ5mVKX9HC9J6mQJLuP6XTz388eCNUc619mQff4BoTXitlOENG02CwrCw51mzfJv7kgTM2
	C/Q/7HepHitnC98mJzxv8we2h86w3TZc8yc49ZzQPPARF82MnJ0pWeoXhPt1VV+UgtnoZbtFb12
	160bR3SrRNRm496ROmr0k7U40=
X-Google-Smtp-Source: AGHT+IEm28qBVinuNhWsImQPcSHvtdI7CTlAx5NAM/birwbnUAeQpuKn8+d34Y03cUHERB7oLJ6qXw==
X-Received: by 2002:a17:907:1c0b:b0:ad8:9257:571b with SMTP id a640c23a62f3a-ade1a9057b3mr642580366b.16.1749288834791;
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
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
Subject: [PATCH 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Sat,  7 Jun 2025 11:33:17 +0200
Message-ID: <20250607093342.2248695-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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

