Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133751C700D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660333; cv=none; b=EEmN8lhDoaVa966yt22QeYNwMgmmguUVQyoIt+QBvPuwhXXIckLnRJh/3mYGyR2n4+Bz2tMjhj3WuVILnGZf5b8zVBAMQul+6seksVmNDY/kFrw/rN3KgNRSZoD299uCZtxWXvTjSddJmuWDFBGSpauqm9/WyWHKL7ikIodeVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660333; c=relaxed/simple;
	bh=STOexT3aeaNgS0jX6aWr+6om6VU5pRTy84ucbTxf4PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J4tFxaQhOGChGIJsssndI+oW6fVa0mKIt2WJF5XEIPDHXexc75v0CAiD3ZCSBRjcxVJ6ebwXR/1a7YtOFJpJfjT9BEeYOTA0q1/mEel9BpeUKu+axSNf+QCnw5l/5R5y5JOSuTNi8UD5yUKCsgxR2WhY6YHm2M6AbRBKmUuO44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=H06pDR4w; arc=none smtp.client-ip=62.149.158.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="H06pDR4w"
Received: from polimar.homenet.telecomitalia.it ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id H0EluBSummHkSH0Emu8qz3; Mon, 19 May 2025 15:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1747660140; bh=STOexT3aeaNgS0jX6aWr+6om6VU5pRTy84ucbTxf4PI=;
	h=From:To:Subject:Date:MIME-Version;
	b=H06pDR4wPPLRP/LbUc9Rjv+rNc5evEgU35POt+QJuUbmqsIDjqxi4fTngG3EokHU4
	 2WOg/3CnRJhFjUknjMlPgz3yqWQ0DfUp5+ouRzKCsDwOhY6pIcC3JjR44fU/OZpWrx
	 HykwWtx1gxrDlzgSHgGnO2i1oDc8XwZ5hMYVLqpUKf+fYKR6zs/9UA/TEsC9/SCX61
	 cMsPgyDK7FqpK6jPZwdoRo3ftufm7ibPlHQxLdh+T++Y6nbNLqXnZ6FTd/ch/ugy/Z
	 yjAmCxYrbd84hEDvKkgfBcZx+Z1ls3Sra9rB+sdkXKJ1P7eqIKDVqwRJsGv5KbJWAy
	 iw0IG008k9riQ==
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Fourmont <eric.fourmont-ext@st.com>,
	Yann GAUTIER <yann.gautier@foss.st.com>,
	Rodolfo Giometti <giometti@enneenne.com>
Subject: [V1 1/2] arm stm32mp131.dtsi: add "encoding_mode" nvmem definition
Date: Mon, 19 May 2025 13:08:58 +0000
Message-Id: <20250519130859.3389704-2-giometti@enneenne.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519130859.3389704-1-giometti@enneenne.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMh/Fpk+pwBEkLTfzO4y4TYc9xaEfBudgO7tsUE0KkBxzid2iibSSSWCC/vQ7vakhsCbCw+9PNUaoJaD6+xay9nl/QAcuPtszO9sB8jayo0P0p87WSTR
 d2/i5HCoS0x0p1B/U8E0V+iM0d4LSTMNH9DzIU6nCW6UBgz/vmCRahhK3F0mtCQpOtKbpCLy1eR1kelAN7f14CjeOvZfbTTJqmVVECrwwCcAml4KbKNund29
 FWQqVHeOAQtXh7cIH8c9ikgF/opK/9qRMZL5BQqGlnHFbSqbC/H2dsyuu9yumnoEyq9J46SJ6XwcG/hXA1Vpw5KCI+S+qD3MFLqUMqlow4DIFC/e6luDWPgW
 LHq2P9DgotXjP5V5wZFPyKbWtZkLYp92EMa/vYC/tfpa6N1wAFEywtLJfNvwwiVxmFmafiGF

This patch adds the definition for the nvmem location "encoding_mode"
related to the "cpu0" node.

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index e555717c0048..52bf497e26bb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -24,6 +24,9 @@ cpu0: cpu@0 {
 			clocks = <&scmi_perf 0>;
 			clock-names = "cpu";
 			#cooling-cells = <2>;
+
+			nvmem-cells = <&encoding_mode_otp>;
+			nvmem-cell-names = "encoding_mode";
 		};
 	};
 
@@ -1167,6 +1170,10 @@ part_number_otp: part-number-otp@4 {
 				reg = <0x4 0x2>;
 				bits = <0 12>;
 			};
+			encoding_mode_otp: encoding-mode-otp@4 {
+				reg = <0x0 0x1>;
+				bits = <0 9>;
+			};
 			vrefint: vrefin-cal@52 {
 				reg = <0x52 0x2>;
 			};
-- 
2.25.1

