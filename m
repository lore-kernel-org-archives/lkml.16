Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B702F25A624
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230030; cv=none; b=DdYh+22KZ/nze1vsrq2rdxnJTbnTnQdTUzMFrhJNf1USqk+45fpfqexj0rSykEbSPttPeECN7SHiZ2AIYH5fRT/1U6byAYjvsmmmhcUDkxL4YtLJGoGv/mJq2/F0Ce1A8eQsoRaxXq4si430yWFKDzPf2LmNc8QmCjDIheh6fkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230030; c=relaxed/simple;
	bh=nQXNcN2ZDhBljS47g4YebHyRqQY2ppfolwrHq/5nX8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QmeWY9G/aKvk38Tdl+v35bnQGpRYgbX4wkBCMgjOcfA5HNB/XKuR6KLn9fg6DLN8w4P8z8De+XQonDWwrEfzsHJRtwepDPc+2nOdZOxYxN94mAFt7BdeEm2n7wVBxrTMtKmR/HJxXVqMKuEJ3wqlnqqXjyydexsRcdcSkBpKp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=QVema8Vm; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="QVema8Vm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9zhvXqUsin6iaQ6kq9DwAc/1oZ6JFzQ51gNsfu9Q8pY=; b=QVema8VmwevIygcSjGzGgWPu2u
	DP0+eY5H0T6TnUUIdh2jHAtKGJ8JxNblt9bSxhx5dYRj8a/Bw/THTujtkqS5j2Z9tMWZtNn07e8d/
	+cNtQyXgRweClr5pa65n8++AKf3gTh4nBrGzi9Y/YBGOMCtJuxIFMB+aWhwYbPKZ9J/unQQ9Fiitr
	ukAj36U7dKS98BQnAIQO1IGMEs3k6TidJCy34zYMaVcYBlhVx3qDOV6s/Szgq7TBzfM3t/ZH04cPN
	lPv6BP7PM1s8j7GV3h9YoBD7Tjj2p0EnYBlOFOuQLFAMct1a4nduekb6laEvbqExddCzVxfaZiuSt
	BDogt7/Q==;
Received: from [89.212.21.243] (port=37146 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uRmMe-009bzw-0F;
	Wed, 18 Jun 2025 08:33:39 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Joy Zou <joy.zou@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: pca9450: Support PWM mode also for pca9451a
Date: Wed, 18 Jun 2025 08:33:39 +0200
Message-Id: <20250618063339.2508893-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Previous commit 548d770c330c ("regulator: pca9450: Add support for mode
operations") added support for setting forced PWM mode on the buck
regulators for pca9450a and pca9450bc parts. However part pca9451a also
supports this feature, thus add support for it.

Fixes: 548d770c330c ("regulator: pca9450: Add support for mode operations")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/regulator/pca9450-regulator.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index f6faf14a9c53..feadb21a8f30 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -873,12 +873,15 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK1OUT_DVS0,
 			.run_mask = BUCK1OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK1OUT_DVS1,
 			.standby_mask = BUCK1OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK1CTRL,
+			.mode_mask = BUCK1_FPWM,
 		},
 	},
 	{
@@ -902,12 +905,15 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK2OUT_DVS0,
 			.run_mask = BUCK2OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK2OUT_DVS1,
 			.standby_mask = BUCK2OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK2CTRL,
+			.mode_mask = BUCK2_FPWM,
 		},
 	},
 	{
@@ -927,6 +933,11 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.enable_mask = BUCK4_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK4CTRL,
+			.mode_mask = BUCK4_FPWM,
 		},
 	},
 	{
@@ -946,6 +957,11 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.enable_mask = BUCK5_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK5CTRL,
+			.mode_mask = BUCK5_FPWM,
 		},
 	},
 	{
@@ -965,6 +981,11 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.enable_mask = BUCK6_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK6CTRL,
+			.mode_mask = BUCK6_FPWM,
 		},
 	},
 	{
-- 
2.34.1

