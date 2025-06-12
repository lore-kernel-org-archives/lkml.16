Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9147622DFF3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719318; cv=none; b=at1O/Df5sml+rhmOaVC3wVv92hxG3uVSXtoAHiY1UTqP6aLE6qvQ7OMJOVPxkObUtqoUylVYehA8+DkgpcpVIxKqWOFFcj9ZXuaN77C+JNG7QxqTSpMqHDtRp7DIf4myreouCSheOgk6b5R2SKBWeaqIGbCT4zU9NrHbVPVu2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719318; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4B/0Pl4lU6AQc672hD6pedOom226KJ60mPuSdGQ84X53Kib6qFdApO40E/sLml9JTyT1nViiBVcnD9g8gpCcD60KisHghhBZYr0uOYPQuVSoBcpMuMGdip8nJ+2NSAeg3XCbNhq+/IJTfRN4i243L2IDW7dXmY08XsJ6bBdxM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YABndYCT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YABndYCT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-adb4e36904bso138564966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719315; x=1750324115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=YABndYCT4SGpSdklKqXBDMXh+L1ZnFwR1TjYXLIRI8SNiub4PSvbudMyHEkfkGOMcT
         F3PYw9fRq62CEeP+V9OuKpWk8YWi9lK82d6YeWRdtvbE4koxFcGnzj5DZfbuX4Nzp3tE
         tib1uDmKiN5Zu7u15cwkaEqvXFgegF9KO0730=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719315; x=1750324115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=S14HZsg0/CaGGMt7LCnxqW7VSW34w33PNcjmb12UJlfEA5fPEuJQtZDz8xrb76ZwTK
         LQksuejI78Ivi2aIMDds/bx1ym6kWU+gzKKooptia8Y63t2V3EncUJqLn7e+UmiWBm0m
         Vfj22AUImimCrxp8HBIdVW0OfdJGlVPjT1Q5c9ZNwQmK1w8fcSTKim/lKDqCAgCQ/SE5
         ttaELsCSzVQPi+nCG1ETJ31US72+H+lmeftsxeIK8yYJErSMOjwLFiOis8Eq2Yqib1m6
         jj8BqUkgS6P7xtWvUsbsHbljpFnf2qpqMlegfxJ9T5d37TyvHnwSWC+wb8xyv27sYUQZ
         mzog==
X-Gm-Message-State: AOJu0Ywh2D/I21C5dvqxu3yp41Cbv0bW8hS8xP1YLFAijKuxGuku16nH
	IG5hQEQS8Jk3wYsfMSeBe8CHlXTH9bPH2E5Ktrzd298NnOmGzCkw5R3QO8M0ahREA4VkAWVo0WV
	lxs4f
X-Gm-Gg: ASbGnct47GvtL5Ndcyv2KGVCQk4fFHFBE3C9EFBUgsQ0KUnC1s4DQqwnJrWYMSjT8SM
	xYYqQa3RmFq2CpgOlHvWgAoOeXS0jcJeWmmGydEwc947WqxMI8WE19uupBdotHdQS5H0E2pA5va
	f80qJQtj75frA3V4+W1WC0FAhdSb1ms9ND1aZhh9oL9yKKDKvwjarAQxwc+7SolSH87ZICwfuCr
	buxJxWYXMVYXEef7mJ8ouhbVNDa8WZbxzYGGEaIAlj/bjS2hQCqsoLyIs42zaPavNdWQ/7GdslZ
	kQpqCuAYxPeGNJQZNpvfzagH9ieruP7EugYwHdCsPLA55l83pypIWLuUbGsjJtvMAr0yOhYkE9W
	flP0MApoZKGxii7FpYeUkZU+IVg==
X-Google-Smtp-Source: AGHT+IHw+40tHRpT0a1pb4c5L8hi+hHN6rjyVSOULz4Jjlr+LKsqnaDwCLiI3mpNwIAMKOAJoxYTlQ==
X-Received: by 2002:a17:907:986:b0:ad8:88f6:a7d with SMTP id a640c23a62f3a-adea3809b1dmr281579466b.58.1749719314703;
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
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
Subject: [PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Thu, 12 Jun 2025 11:07:50 +0200
Message-ID: <20250612090823.2519183-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
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

