Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8891662EF;
	Fri,  7 Feb 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917417; cv=none; b=A2wtCdQVsTjmlTnZW8w5HvCltvMYIy6vkcR83mLJfrjlMtIBXgSCSy0XVa3zwvnzkGnA9nzqrf+D7LV8xI2zvaWXrGPI+tIAiX5honKlFI6NhGonpx3U9uPVlwWGSfJqObymIjEgsyPDzTPdVjaDyNYeYjsX1IVi2augiAMXhGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917417; c=relaxed/simple;
	bh=xWp5ra6gYPVLbYnoMKe2+J4XQbtvlIsZnh8wBYY3nBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TPBloEWSiSo1L7nywPLcgonDUXkIcJBmawLz0xohJCHzU9J84qNKZvfRFK/FKII6ODJZcE72VXtv5juikzpTgncjWeBo4zJUk8ijgvrhY3RI1/13gdT/kdGXRcfeGZltWyifLo60+PXJcoK3nlpsiNGBarRZ5Jlfox/qlvMXdm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=k6fXL+Ww; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ezGpVGzl reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="k6fXL+Ww";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ezGpVGzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917416; x=1770453416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cohisc53PIngdtiEuKddzpfpUOAYLyd71oVKYWuoODo=;
  b=k6fXL+WwsLjdC0eAwtgQ2p90DP13ZhT05Fdy4vN3OyPxG2J8kIdRbIAE
   K/QYRaSZducMNlHIQaA1izUyaqv7yTgE9z8Jl4A4crLnTFaH+GMy1jMGA
   5rUtQW4oO1kjVx/b0OB8Gix83PC4cI+dyJh01diLAgAv8e8LEhR7u3A1g
   7wYmQgLN9oP4aJYOnrK/71VleT/q3H9d270N5GqfeXGNDkdGYJjnNHnLs
   5zMUuexchKu63hZLlE5+t3P4KVP2d9BEXQerlDa1Ewg5Ys877eWA/rmpu
   H/mpnTPB1xYlgTQq7BBhC6MDsfmpd4vmq5gdfrpc0AGuxpH3M22GMLISE
   A==;
X-CSE-ConnectionGUID: EENx/bX8QuCOnQ9UWiMVVw==
X-CSE-MsgGUID: SOaYPm6BSvGKFA24Uq0bVg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636069"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:31 +0100
X-CheckPoint: {67A5C60E-1B-8F72533B-EF5B5974}
X-MAIL-CPID: E05294FDD4142515796B62385014CE81_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68995164DDA;
	Fri,  7 Feb 2025 09:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cohisc53PIngdtiEuKddzpfpUOAYLyd71oVKYWuoODo=;
	b=ezGpVGzl/xjUJadO46srQmbebuHY9bFSt1a7eiIH+TrFVR3vfVtSgIxn8UBsrhETpVZ3ug
	xQpKvj32fRLVOYzd580v5MgQws5fadQYu7FYV3EWHkmmsZb1HzT0XwhGBR0TC3WXL2tV/s
	PLCr4DSiloE7CmzDCmzTFj/q6ad3PtHgMw21Fo+BfKlaT5wJ075vqvloGNNLFWXOPXH5My
	tuo+V+LWa7yrsPHsPH2psTWwRC+lquKEq3Va3MPN1l4XGoztqNdqOjUj8pr0AyLBnUEK+p
	aFmVBFlAhWdeX7R4TFz7IK1Ih6ctVz3nUAwp0nfGcfcnHxiNYu7XPAkZBDXtDQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 01/10] nvmem: imx-ocotp: Sort header alphabetically
Date: Fri,  7 Feb 2025 09:36:06 +0100
Message-Id: <20250207083616.1442887-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Move linux/delay.h to the right position.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/imx-ocotp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda03295..c5086a16450ac 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
-- 
2.34.1

