Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115D254853
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464214; cv=none; b=hBUny6jc/4fJ/hkd8LRDWf6CoaaJbVeP2PA53LsgNr/VatchrlBW31J3v6o95M9dQTX9uBJXDb+cFvFFuTulHClROM2Nw5x6YBDK6YXJG9eICj+LK0hqxLAm5xEoAognC78K7qBW0TSlaAH0TBLCl+e7QqPBjKvKFC77QEFV4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464214; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTEDsazwPkZRedpvXhEpAqy/ofDQDDOSJs/1Sa5F2WISgsUvo5BFWjDUPkxycHizaiiKhl+Nu0H4noL76HlOtdKtkAUQLycQaz1Fs2a6WyOQsaTp7jIOjGUtXV8hDJAJs1awo5/DrPWy7i7QXv+Wp44BHJpCQhreikxtbF88RJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=igQpCjfH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="igQpCjfH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-addcea380eeso571572166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464211; x=1750069011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=igQpCjfHA373kXI1oj01vS/j8YZW2KXrm1fp9U4iof1xdx2jbQtTt1Mt4Y9xqmVjNO
         zYL22SqO5s1ks4hjee/i3tM3HDBE92X9n/p3ODvFiWBYoGO5bxYcHVMWSxh+HHlDAKVK
         1ESQVoszAGqwisrn2J3an463HMfYDhl+JtBsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464211; x=1750069011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=LR2G8EyZ7shaLY38GhNsg21pufofNP8syUUcNKEoTZmq/LDWXLZG1dURSCXu4mEk/E
         PMau1Ez+XHS2QJZ9aWWhBQUMU6XnVXSPp3nEmimVvVVR2nKp2ZcaCpdRKICYw6Lc9itO
         hUOVwx5uB54de2ZZBDoqi0205j1xsG3gY9inNQQ34E6yAEmz3tD4RdXVSoz5spVK2yau
         /As+9Tih3tmGD0r3YwKGSAjOwMknFLPHUlU0JtwB6Uju7+GD8B8dB1IqUPpBfAYYShcr
         NdX6D92TgFVDuWPJROBlUzj5qBV+D/Lx2M1bdQRcvfarvJxXvUKNCABpbKKh8D8URyoU
         whJQ==
X-Gm-Message-State: AOJu0YwUzPZL5RL0Y5BNaAdNfUBsiklxEUVNlbU5KtbPfpc3ioLVlRwO
	ZNJj8K2ko1rZXUyPEuaivYLwgbz4yqeWRTzv9wSUaVZzL59Uw+SG12pqptu+Ehb5MpySMrmIKKm
	J76/l
X-Gm-Gg: ASbGnctPAtv8SG1d3xlN55vuwRJAOIlr5yEB2Grox73GyAajaCBvwcOt4SzawaPTNCX
	mcuGmT71lnkPk/Nu6R2Jyhy6sjvP+jq1KuoAV+w3vCO2Alj+7CeBwYPSm3q9tB/bIyMOM0Exwpv
	lDXvJzYrAEft7wvzUbs3QF+eUNY/ao8gbaVxIpftNB0OWdKH1NYNYEPUU5sPcr9ys9pQ7wuFccK
	NDUx75eGC+AmZ7mbjeZL1bwme79K0gIeGl0uRkOVkLsyCyc5y2SZ0VGHdMW52A7zEs1qhCqLdjT
	bS4A67MSe/ap1p3p4OBZK5SDQviGaU+JSucJ6HHAAPBN0QL3ewRxjwwxUiDTMQCOXAC2v6BiKcg
	AEYTzOeRwSstJ7PbrA1ZrtuynjEoLCbipnzIfiqlmoLaM0sTa+Bs=
X-Google-Smtp-Source: AGHT+IHVur4mTo1DAOmuoShYKnP3X3CWsYNLx4FXLXqZkGHw2GltIvMQnVbilsvCUXJISjKKmcuYsQ==
X-Received: by 2002:a17:906:6952:b0:ade:37da:2183 with SMTP id a640c23a62f3a-ade37da236fmr647331466b.45.1749464211252;
        Mon, 09 Jun 2025 03:16:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Mon,  9 Jun 2025 12:15:38 +0200
Message-ID: <20250609101637.2322809-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
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

