Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FB243953;
	Tue,  8 Apr 2025 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088552; cv=none; b=Z1P9P6RD9hl9augxApgbDcOGgdUYXmRboH7Waq89j6o2WIEoY+VZCcnbc6uFk+XG9Tw0Bmx04Xlpv1LIlHl7/DYy43eR53GCeOjQxLWK5aRQpr7l+Du24dOZLpFyPUmjdEY+j8D7R7doPIqNGcnSkFVpDTIPwHO0tD22Gb0SWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088552; c=relaxed/simple;
	bh=LkOhOos6SsTIWVmokwBKQK+MCR4inwBdNq09QmcdbXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAoXkrRuqRvIhCCSNK2WFkGFfwtMVSml1uKtJG+0+bgUj3PNa4p4c2fuN/Lg+k4SS+3py8SC1/EKyinJdQ9BRZYSGTeBrsS3V+MSAQ0kABJlcW63b2HqM+8VG72pQW4SGA6uRs67y++fZabSeQpn1HkLrgNLZHdV+LGw7cpKs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+/9mnY7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+/9mnY7"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso53529136d6.3;
        Mon, 07 Apr 2025 22:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088549; x=1744693349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2OL/h5MecGrz6go7y1U0zeNfXujAsxg32wsyMhUhFc=;
        b=N+/9mnY79oXDiCYOdGnKEZaJC79b2g/xu0wx0ifU3Mr5PKgmX8D10AyGALeB1mugiV
         gPoKa7Asbeg1NA7IAM3M9w76cdB9zhFseCbJTYpJtjLGuNo/QqpZNti7kkrdnAbKoxiA
         +zpFaugK25zQNFfTb1ch4vUKpMlEZvxPE5+7DSBgJDyufRIL0yIBjXNg0cG3ZVse2h7W
         8MATh44UjXoyW/ZQUysQJintcHx33cVTZegU6hi3oKQmnK8bhLJsO3ah4zdH/xS4dJ7Z
         u+nQQ1lyyg27ut9etX7PkERWj/j46dUri1IeMs75kqi/GkzvcDnkUJHskjG2gVkLYGX8
         HagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088549; x=1744693349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2OL/h5MecGrz6go7y1U0zeNfXujAsxg32wsyMhUhFc=;
        b=DA03Vm4Ci7GOu/imUzsrbv1Y7nbgvg7nTPRF+yigkQ2ME2KSFU4CPJfhy+VA5mB7b8
         +4uDL03Lk3Baf/1Rl4E7f6CnMfvR+MCZX6TA2eVLU2QR3aEXdoq6E1s9MbJyOqtsfDhn
         o9HHyrejDiowL8aGzkhatpGZPwWvHCR5U9euKTY7FMGu0Rbv649Bb0qjJsBQzo9DWbj+
         Ac+BN4vRLo/wj+Tj4BBFSBp1loDNdBKrx0D3w5VNUcAkK9XdZ6XY/mtWv9LejneCUICc
         bUzyzPTJF+YH7wefXSsru/oH+Et2aqtFjmqWIeDrUrzrLwZHtvPNDS3ZJXjqksKooCcS
         VOfw==
X-Forwarded-Encrypted: i=1; AJvYcCUyHQPGRJN+pRPZ3zUh5W2/tn0TKAxn8m++TmEdFX+9SUowPYzWsAJ12/ZrLkOvOMMecvk1gV/Yav+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4b/tXmd4sLLDDS3srJgo0l7ttxgnWBp9viqPfpOH17oT3XYn
	JnCuXPC4yK7d97SirwnurVmjI8UrEJICfjalZA/hV+PZsn+D3WYu
X-Gm-Gg: ASbGnctugL2yzZlzAjy2fQb2xfhiNGJvCzBQgn6UtQ/Kg18uMMht2gkrP+cNMdn7lse
	KrTmJ/Is+hcNa2PgmcRIEz+c2H9MP5dPBDicrAyaBICJT9FSJwpmwKTRpddsD4LsrnP/GWt0YbA
	x9xcxRmpojyko+YJWya+CyLeambz/cK2JUJCVyiWSyVE4R+bDuxDxpJxeqBmR72b7vCp9itaXG3
	Joo23i586/RMcJNG5EEms9ND6DjAufIGmRj519MwUd6dfBMye2FE8iaKy/opIMePfzFsB3/wOoI
	T3NGTpEIBIK+0RTXGrZk
X-Google-Smtp-Source: AGHT+IFudylIoJX9TM2xVCYwLnDirGDkk1XJD5I5ishPdtU9+Tos+yJgYa7KNlWI0L6fX3868MmKCQ==
X-Received: by 2002:a05:6214:f63:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f064b2888fmr249775806d6.44.1744088549391;
        Mon, 07 Apr 2025 22:02:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc128fsm69354356d6.23.2025.04.07.22.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Tue,  8 Apr 2025 13:01:42 +0800
Message-ID: <20250408050147.774987-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, SG2044 also uses an external msi controller to provide
MSI interrupt for PCIe controllers. The difference between these
two msi controlling are summary as follows:

1. SG2044 acks the interrupt by writing 0, as on SG2042 by setting
   related bit.
2. SG2044 uses interrupt number mod 32 as msi message data, but
   SG2042 uses setting related bit.

Add support for the SG2044 msi controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/interrupt-controller/sophgo,sg2042-msi.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
index e1ffd55fa7bf..f6b8b1d92f79 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2042-msi
+    enum:
+      - sophgo,sg2042-msi
+      - sophgo,sg2044-msi
 
   reg:
     items:
-- 
2.49.0

