Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46A4266B50;
	Mon, 24 Feb 2025 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421564; cv=none; b=R1JNpAkCIyMaFT6PIwcNbXuUK8XyViKREmCnxQeBjFGbMWTBFaSYOMGCK1Hbk4P/k4sDGaibvOGHH30O0RPpk87rw/L/+WIrXi9Ely/DsCM6pdgI1eooqbX0ISNtH0h29KIFae1ZtZcqIUzuoY2TSKMdPsqJb45UNaZdgMsLPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421564; c=relaxed/simple;
	bh=sHyfRukPY3Ldcys61ddPwDCp6mAQB4ZZFHUXAVGAiYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eV6PIWkjIXc+7UNoOD5WyzbPgwcnBuHW1nZuXeXRyk0ycDV0/5itq7kf4eti8whDBLDkxvIdErByjd6PtB28rAmMywnF24WG/tVnVHeFWo62g2tYxjLT8KQZ2V5cHH8pcQR0MHaO9WS13UPQt53tODIYTV2l+VdMOpP8Yt97TOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2FF51477;
	Mon, 24 Feb 2025 10:26:18 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 688CD3F5A1;
	Mon, 24 Feb 2025 10:26:00 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] MAINTAINERS: Add Vincenzo Frascino as Xilinx Sound Driver Maintainer
Date: Mon, 24 Feb 2025 18:25:48 +0000
Message-ID: <20250224182548.2715896-5-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224182548.2715896-1-vincenzo.frascino@arm.com>
References: <20250224182548.2715896-1-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Vincenzo Frascino <vincenzo.frascino@arm.com> as Xilinx Sound Driver
Maintainer.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ff26fa94895..ffb3178fd53c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26012,6 +26012,14 @@ S:	Maintained
 F:	drivers/pwm/pwm-xilinx.c
 F:	include/clocksource/timer-xilinx.h
 
+XILINX SOUND DRIVERS
+M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
+F:	Documentation/devicetree/bindings/sound/xlnx,audio-formatter.yaml
+F:	Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
+F:	sound/soc/xilinx/*
+
 XILINX SD-FEC IP CORES
 M:	Derek Kiernan <derek.kiernan@amd.com>
 M:	Dragan Cvetic <dragan.cvetic@amd.com>
-- 
2.43.0

