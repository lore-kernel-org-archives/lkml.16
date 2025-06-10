Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C05279796
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537283; cv=none; b=aBZ3K1VnE3ORcOCe1jKAAfYTat3m5zHC+nxTj55JsR0FfP7HeTJnNqYHPsGHPTpOiPTyd2zd/F7sX4d+RYFpi3UBmdiZ4jh1aA0wDv5pW/EU4QZ3d+SAJsvtu39Q9VyYQMgxsGbXvCoMhPmepKg5q8Sji6R1/4xPGSV3o9mxopo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537283; c=relaxed/simple;
	bh=5yrNw8pQv3JUpVLncdRPNjVfR54w6B/BmPAplz5EDoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sL6x6zrI9inXIwsv4EbuAIjkihzOpZFai+N1CqLG9zzdO2a9e0SRV8Eal5TzbGUPhcUaK06QVRbX/rQX2Z9yI9flOooEdEFHiZ4y6CluHMOArnonZx48Tlsr6+jbTOb7q1AuExIf2Vbowirho9UFtOybedIEp0oOt9bS6zzBu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TjW5bcYU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TjW5bcYU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2360ff7ac1bso21206575ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537281; x=1750142081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=TjW5bcYU1n6JCT3ub8dInY7QBxKSERzNzduCNyqjFM2pRGOtl8Fj9WtHZRg2vz69nl
         iMNEsW6WwnykXmkPFuO4iOzoRPuPvJ+2aERxqIFfwZLmMsNaVmXF3R8229dJwH6p68zt
         +939RI6uChzG1n5q84MBbhyfPSycxq5aSnF/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537281; x=1750142081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=mr5xg1hnEDlCEQjDbQk41tGTRDEEHgBeMUcAFtuKwP80D/VzjjZu+FyB3wzDDXqj8G
         5eZRiDJFGBD6iWWTN1Xev3hfOnII5y/cDES2ID8OGiZOJLZj906oVuBkHYV8FIIwtWyU
         3S0EeQfG+O+zmWyFWAF1yxrfntXvnMaQm47nG6JgsYHFHoprJm3chccrP1BTNuCETwT6
         LReUrciJPKm2abq1ilvbxDz5usk9D/lJOBLNIeJAPwgTtjyZ1U9NEJPonY+U5JTcoLvA
         Vfd69qfu2lh1y8cgDuHnn0kDjMjY+lbZH45b5mH1fuzQFJeTGco4+lwk90TPtAX/DBs/
         kd/g==
X-Forwarded-Encrypted: i=1; AJvYcCVtVr6+bfxJ+ctazrOtXsDrOTvf8HDggo/rqRZSMswa/9cj/TEmgj/vKrKp561aAOQWitR3AvREGoCVKpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrwP1LMsNAD4tbDdXgrpw90YoQkrYZneDDuY6nRgbUGDzJVUG
	ZgwJqP5V37r3nha4ZQITA3ErVPdaLXADO1qDQsAntVOTcCbMVm50tVanUpbwQuj9gw==
X-Gm-Gg: ASbGncv5S/R2im1XFM5MB0xi4ej56wRrNSNXG9cd25WSW1cmMKmQhK/f159SiXbV2ST
	ibQJItVG2MnYRmqyfK5+OEc/St7EY+yqdOJO5XpN8vibKe3OfPuKGiFVvhCtmtH++Y1vzEzKRQ0
	lm3nV2qK5qjDJf7Ejo4rXo3vHjq0V+lmkcLUsnGulMe2SZZQ3IHMjuZVRaUEamkBXNzoDTXal1T
	GATqWd+OvKC1p0RE6q96u2rReKyf3K787wfHhh+xOKaGCooAXsn0SRAcZz+2XbsFHPhV7+Bux8M
	Kp+h+2Ks2jZNeQEDU9V75uwd0lBcpoQK/UVQraHJhoy1ZkzyutBiCKyNyDUNZYbrocZahUULxGS
	Mzjon
X-Google-Smtp-Source: AGHT+IFMVjJL9gd/t2t1Cdy7S0Az0MbbHnKQkvJXrj2EcXFz4rjITbDsj/BO0L7kopXXEwjxKA52Ew==
X-Received: by 2002:a17:903:244e:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23601cfddb7mr217198085ad.21.1749537281092;
        Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
Date: Tue, 10 Jun 2025 14:34:28 +0800
Message-ID: <20250610063431.2955757-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
patches. In v1 [1] the change was made to the driver. Angelo, the platform
maintainer believes the change should be made to the DT binding instead
[2]. v2 adopts Angelo's argument.

Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
with no fallback, and MT8188 falls back to MT8186.

Patch 2 updates the MT8188 DT to follow the new binding.

If possible I would like to see both patches merged through the soc
tree once the DT binding maintainers give an ack. This avoids prolonged
waiting for the binding changes to land and uncertainty about whether
things have fully landed or not.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/

Chen-Yu Tsai (2):
  dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
    version
  arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
    mt8186

 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

