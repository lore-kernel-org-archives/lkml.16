Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F741FF60B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039688; cv=none; b=Vu8d5f1o53p0TXFPNg/dBwS9VcwPn+Mk8k6BuUCsF/2FGWL+AiAYA3FK+YiVZ78RqJLX5kz42CwObgwsGP/xm5DiwUqylhvx+x5yRzZXfhqKHlAmZtoDV+YEtu7y0IB9OU/wyac0Id8zp7sPyZzYdM9EsFGQu4drDtvLtULHJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039688; c=relaxed/simple;
	bh=cLukb9C2aiYDFVtCN21ZKXnPdKtOqLTL6mgc0FrZp7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiRtByB4D3L5LNX3mVGVeAZCD6TcHatJvsUURruVZQevWhG3+BmTMpfAcw+Ox0RB+yXlOcoKnXgHp/cqaEpwujJFj3INETiS98felUxX2qUfPusNDXiLcce8Udc3QtRaSWazAJJ5LcGbw7dGyonJcqRBHndn6h72C1CAC/gU7JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6OlnTRM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6OlnTRM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30f30200b51so5528281fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039685; x=1744644485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8efX9K/jKkGa5RDf6t3vrgLuokcYYa4oIPfqD6CjI=;
        b=I6OlnTRM201vUy+ZXODPHeJkUzVDlZQyuP2bUYZepXdkKsibZMnX6iWhE50C5OQxRS
         Ah+VBHZLo7oaOYAn7jzEUwyKVQtSfRIzMFZymjW1tFIeW+6obJJOALVJ0RQVjLMyyMDg
         Dr0xs75cX2gcVZaFm793jtelXkQZ+GT95XZMPezG7A361vKj+yBGYx55X1bMimRLEhTR
         9Ulcwqa0rYkPPDqL6P0MWRizljf0t6/iUJjvrtlGJFJ7VocjOfJOdRn22oFrEwrOh5UR
         V8Y22Oqxu5CookFLPzBh3KoPAfUuoQMb9FQpyTZsfoMbcxj3KrblT78EZXVw6gXt5iKh
         WbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039685; x=1744644485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq8efX9K/jKkGa5RDf6t3vrgLuokcYYa4oIPfqD6CjI=;
        b=UMRu7A9aZdMuC9ObfTyUYh58aBoW8/MmCCs/BmpK2b2cT1qiPERbDWXdcoQU0xN1yK
         0FJa1eS8/i6oRFaQdn9ZmwgOaEpMhd4xqkjj+awVHy0T3R1zUmZFkqVG0jtF8A0uIX/0
         2fWJlqH+59FZIQrPWbPW/L8PNr57xMzspXURXzVnTRBh0HXOv+oemPmD+3WlRZHi6vTW
         LnSicaPCfTAiV2qKG9S/zW6oONL6rGLoatg6pR94yd16Ibl4EYNK90njkAr4Rpr1J10h
         1TeY14Z8s2zUpJ6gxpV0tW2I957fYt6O9qKyGGxBgosb3nzk4iJycn0WETEKHGUtJE4F
         5mTg==
X-Forwarded-Encrypted: i=1; AJvYcCWxHjNkJwzjN8uyVbLjfV6BbDmyNpjID3av4mI2hesnimIN0n2SGjqop2t/rBTNINjFiMeyAMtJYHSiw/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD7+e5T/xOMbY3Pwx8NNn7i0KiW/sgoskN53KAI4tcMHUofKty
	WEyOGkTL6HQLKQxzVNuHAYOtfPrx/nnSUQEoSyYb3sZnVVFTuvmzeOY9j88sDZY=
X-Gm-Gg: ASbGncsHyxNdSWwlgJxnzrNCoy+fOw26U3ZB9DtTA/MBxJNtQLiMa91R74L6P0qjhcj
	dXh++tfnmWi68MvDarhq0G+ZpYqW7N4Q9PboHRbjd08LFxcDPHWKmloPtaDfownIfmlghQJ1xcS
	mDQZm4A/27DAcGp+4GdS/5IczUB+9Bn1oYhqOs+iPBFrEfJCZJ5yDPUkF93zWCwnh1PFTOq4Fus
	K9zpXOl6fXjGfL0zaWJs/pbDtOkfuFz4/GBQFKccLk+lfQtnz4bpuW4Dg8lMIsJ+JFV+kDHnYrU
	gQp/yl205F+bbL5qV/HD503/4QtsyjfsEzI6Abvv1jq2aPjyzFwDY7cJPTeIdZyPIG4LzlHVhn9
	sWrFKMNmHD2p+csYE4o0=
X-Google-Smtp-Source: AGHT+IFObqH9uOMbw/LDaPSoxjH4CdvHzcUd44Am3VfEgwwKnpzakyOKNpnsTiRoTRb5UeyoCfSx0w==
X-Received: by 2002:a05:651c:1142:b0:30b:971c:96e6 with SMTP id 38308e7fff4ca-30f0c02cda3mr37282471fa.26.1744039685191;
        Mon, 07 Apr 2025 08:28:05 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:04 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] mmc: core: Add support for graceful host removal for eMMC/SD
Date: Mon,  7 Apr 2025 17:27:50 +0200
Message-ID: <20250407152759.25160-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
	- Added reviewed/tested-by tags.
	- Updated patch 2.

As pointed out by Wolfram Sang and already discussed at LKML [1] - an mmc host
driver may allow to unbind from its corresponding host device. If there is and
eMMC/SD card attached to the host, the mmc core will just try to cut the power
for it, without trying to make a graceful power-off, thus potentially we could
damage the card.

This series intends to fix this problem for eMMC/SD cards.

Please help to test and review!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20241007093447.33084-2-wsa+renesas@sang-engineering.com/

Ulf Hansson (5):
  mmc: core: Convert mmc_can_poweroff_notify() into a bool
  mmc: core: Further avoid re-storing power to the eMMC before a
    shutdown
  mmc: core: Convert into an enum for the poweroff-type for eMMC
  mmc: core: Add support for graceful host removal for eMMC
  mmc: core: Add support for graceful host removal for SD

 drivers/mmc/core/mmc.c | 71 +++++++++++++++++++++++++++++-------------
 drivers/mmc/core/sd.c  | 25 +++++++++------
 2 files changed, 64 insertions(+), 32 deletions(-)

-- 
2.43.0

