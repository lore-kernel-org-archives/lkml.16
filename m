Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1691E9B1F;
	Thu, 10 Apr 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298732; cv=none; b=HELiUSOS6yGOudjJo1BGp5OMAKqsbtmHllvsC/XzFE/AfXNOS7D3rBG39OAW4LFDz8LaJw1iKp5w4mj3lHLQ9XSASkPbDtm6aX50dOW0nrIjhSkiZGyFlQ+lpdoH8QheLNrU2qvixMZWa7eWfKDpu3FDHeI02aAn2AVsTG1vl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298732; c=relaxed/simple;
	bh=3hrFC8akR20pQMYn01FDGTaAf1FudakKyQp4tQR7was=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RtVkMIUvzsC+IxzUQ44cC9NCAIQRBYC0lW9Sc8TbSdtpFqDvKwlVrgA2lRk1oZF/Yo+IkNVz8Tdp0dHZycCRAgHYn5lh7PeC72GtT+LdOuJhllXsCUW88eKsc/lc7HxXr//0zng5YM3ZDRrWutpSxtk+iUSvhYVAxa9y4/2X+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=qV+M3yuZ; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="qV+M3yuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=881; q=dns/txt;
  s=NAESA-Selector1; t=1744298730; x=1775834730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hrFC8akR20pQMYn01FDGTaAf1FudakKyQp4tQR7was=;
  b=qV+M3yuZsR2xH+Hoi2JYOFuzI8oEyXUWdUW4Kn5W+oj5ZfIpi4p5fHzM
   ygbGAFYSlLHt4PHMJGYi/Kqc2Zp6L04T/1eyWbCQO/YNkTOV8OjEli4/7
   94h2tfJuSLg+kLJx17q43maWOpIzoSKp0h/ge4J/GDfJ4NtQfeZbL3sF4
   fD0iEpoGFEQ4df+Oy+yHjQxehlD94nkXF0NT8CUieMA7d68bPHM+XJ75C
   3xIp3E6u3tbGH0NUK+hOaF9HmyHBzd8pV8QGbUGvB9wji5SY4HSAOdKDJ
   va3LLEkvaZQZ107T09PVy0oidPCMgJQufPKGc8WXvkmdWN14VS3sbmYKp
   Q==;
X-CSE-ConnectionGUID: DzUgGDf+R+SWfn8KWV3x/Q==
X-CSE-MsgGUID: SR3M/mH+RQGesKzw/0yi0A==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941712"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:29 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] cache: sifive_ccache: Add ESWIN EIC7700 support
Date: Thu, 10 Apr 2025 20:55:15 +0530
Message-Id: <20250410152519.1358964-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0939 (UTC) FILETIME=[C515E130:01DBAA2C]

This adds support for the ESWIN EIC7700 SoC which also features this
SiFive composable cache controller.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 6874b72ec59d..e1a283805ea7 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -118,6 +118,8 @@ static void ccache_config_read(void)
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
+	{ .compatible = "eswin,eic7700-l3-cache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
-- 
2.25.1

