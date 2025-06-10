Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB328C86A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549716; cv=none; b=tPidqcYyh3cAYZvvKNa/jNL8u6kxzQtI3rJh8Ua6gQgOaE3tufOSYynkcmi6riBChf33SwCflrvHoCMJZyX/JlgevSZmX1CCJlvi1VwVuC2TJsoXBoFNhNPgpOhlimAh5Ro01buTukUMbtdTjd06GTVPbMChoJ8rLZZln9KiaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549716; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyF3ThT0aRVtepB58GNJ2U7aAHJHzQQbBZXhOUr7bJEFzW5Te3Aw0BAE6+dx3HgRL8jetAAqKXNToVcgWZb+72XxvAF3s2DTCBdyi0O4K8HC0rv74WwoexZPxJlvPZiDryG6lz5ZEf0UuywrfnNve6w0sjzs2iefmkPF84yOCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IgSBt2uT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IgSBt2uT"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso9279665a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549713; x=1750154513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=IgSBt2uTKtSs6g3qNAnuVrfMD/751gb/ugZ/Bd9gAB1uyYVLRIHVGGrobZChDjvZWM
         yaWkgpfGdVNhSSlRVd+gGI+Sh61Trbe/1bQeFVryzKIXXDJAHkfRybcg+hOMigT4zctT
         pPEul/iAvf9+amkoNO9lY9oJwij77iO5fRVqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549713; x=1750154513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=q3wvPNE/qPU0Ey2+OLWg+M/2V8+txv7xjajXm1bH5s6An6pHQ3bOJ1rzxCY7L8WlNg
         gVaLNlbKyMHQPI9irMNFYYR/jj/tohVtIqZAbe5W00/9zX7wcJG867UnIImATZmsjOcx
         rSjyEyzutpSQl6BVy3+LzCkGz6zG5KJELL6DZnosxI53ihD2Slvf4yd0fxznrFC8Luco
         1SErvvYoq5A04Anp4PiNBY+GQOfMiy2Zmq8fSuxoBotl/A5VZn+EeliFJj5BWS9yJQSS
         HO7e0pRVIk82Xw98yTrbAB4sv+LWch/1I/xuqiRcx1ZNP1HEFjdeJcJ/CWJtkNi9VGZM
         /DdA==
X-Gm-Message-State: AOJu0YxWNRcaCETWKX76JFcf6QtUyNRihLIo9mdA4iiXOMqs/UMtgCGP
	UAv1CkOO7VDcGOPHnzES+eboeydyymQ9wFXU3VvEbGgPxYVZYFPLMfe8H30AKr+sLm6axzdvgku
	uTojd
X-Gm-Gg: ASbGnctZVx7Y7TSe1oS0mDJ2jlNk2nitC4uOMQE0M5ePlFoVG7qMSJ+7dkfvIAFP9na
	ESwmzO5DbiXYKaUp6Q78cIUUeOaJAFVu9kqZ3ze+UsUrq81bFV1/Fgzxi/j9kcnH1JWiSb5OmfJ
	H4aioih8fdY+BJkwldpLH90DzuImGywamVVoqZd3pojwB8rr4XzNM0F+s9MnEMK3L4Tvs095Dp3
	SjWA5HAhWQF+cEb2WmgpV1QIMBE0aZYuzn5NEnw7is7YsayLYCZH7WybMUy8EnrSNztKcLDS4Lj
	vyxHlGsFIbUpGuVRdS2itHkCb2+hUwQAMYh+GcNRcJQ8BEU3OdZk92V3TY4UgJ7UXQQb1Ff9AGI
	9NilPrNih10jZif4eqSBWn4BMMo0=
X-Google-Smtp-Source: AGHT+IH2ogjmL19YKgDcUsr9qdGaloNFiPiqPmqMHmLp/CVdnSTRnMn5FSL3f6mAcCf4N7SCTwQtCA==
X-Received: by 2002:a05:6402:3590:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-60773eca93bmr16613922a12.3.1749549712993;
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
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
Subject: [PATCH v3 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Tue, 10 Jun 2025 12:00:18 +0200
Message-ID: <20250610100139.2476555-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
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

