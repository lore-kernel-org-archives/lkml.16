Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DB242900
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400261; cv=none; b=R2RaUtRiBG7jCpNno4uX08O9P7SlR70bFC7+4eDktwOysomzcI71ePRlRVnQS4tdiu6oEPVz7LUbcrIxtctYCjqb1GZRslAC50IlKq9KRV4RYBOELj0hLXLhBSxMG7iU2q0geFdrmGYLoO/9sbg+tmuGPSa5xRGpJaJ+BlxjAJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400261; c=relaxed/simple;
	bh=+FSC98TIvnpgQW12nqD/3kXRZ0Fs9oV3gTLvM68micU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEJPmkM8gjn/hdm36KmEBZZIX7rIUIXqoOzu99tBDwBqpNfReCldCxRpZJiCyZCKkDtKJX34TDvjFn9re4gz+vTN0raVBqQ8bw8vrnoxsTllvBKI9sqonBIP5bvPfBcTl3jMTf10yC9ggl6A5VRo6sIpo0tJDfeDrsIAwqxSh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpJb7Dqz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpJb7Dqz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a206845eadso1344621f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747400258; x=1748005058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW89Tj8c9PUVGNCzuX2ZlyTNAUa8vPwg+B5bpWF7mn4=;
        b=fpJb7DqzyAbJKili4GDbkMbpmkUDvXrS2d5hAlKrghuFlzF8lVgUy/uVbdbrT4snUm
         1So37OH5BKCDVAbJ7FkS99CrS4o7NplOUX4BOhq4OrYCEcMfVYqUycug5i9RdTW2oSZF
         aNfh9GCrZYh4s3zIp8CrSLPHYflw5N7bVXkVzAEhdY1B5g/d5kiJXMs59xQxfq+ZXo39
         EdTJhqoBBY6mIEqjGSq+NHD/4/4ev8vbf75zMzT6Ca17fBMF/MraxNEqas08iRg5Yz6l
         Z4pCnzR+zekyMQ47d9kOKXKCmDtYWyzElD4K3KM6VbeEoRiXmKTjz7PqeaUaYYeuPXmx
         boow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400258; x=1748005058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW89Tj8c9PUVGNCzuX2ZlyTNAUa8vPwg+B5bpWF7mn4=;
        b=bTUwfOCLqTAs+IgZrDf4aLATZ2F9FE/UsBp6d4LzJk3hC3KYtVhC12XUvmrpJ+v3Bm
         tMwcHPUNpRDYuunc9uDUWPQiadNPYPIco9rxhxT7YEDsjzwxFqLiapQG9GKTu0pJ61vJ
         J09fe68uviy0NK5q8cn/4rN3uDh63tHwLp2/ATZJ0D0w0K7kxQjQOx3fh0Byyifp/Msv
         eGV9M1Mv9WR8fHc7MtRpQguiRiLkn62pC7EZs84iIQVNx2vxXbyuaXTxLg24XH+dy4sW
         UFWiww9u6fVjbg+DwpJ0IFEGTqzVPrbqR6tfSVJeCasCNdUefxqgkcWcZefSdrzXKbBP
         VsRg==
X-Forwarded-Encrypted: i=1; AJvYcCVLjswDdcuyPdNc4dHK60b3NSXEAZIZSXUmZrTOdecp6UYaz1mSNY04ivkyZOPFNqp6FRrz2Q3dRs+ql08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIe8zekUuTqcXWSeLwnzEv5lLETmmSnhahjWMUmrcSAJXWS8e
	g1FS5s7h2hN8KiIioYQ/FD9R2r/Ga3p3dJ2a0FqoeUpZ+qqAkKkokndx
X-Gm-Gg: ASbGncsJzrWyrh0Ui12AkDOegVKLW+DHN0EFzhS6eIXRz9+c8ry48ldWBUh1DVO9r/H
	mWfbZ+r0SJK4mjTVz/e72i9eryrL8OUdok3fIRZt3MspZhzYNEAEd7GC9tZ2TTkDL2PRgUCbBpY
	Ujbcvfg5yMnXaSzYK8SnOrSSDR9+RD0uPeZItTVxvvR5TGGv26ce+owJwC128S0bfXZojJN1qlw
	vHFL83qW83hrOY1WIJJZDdxEr6DrYeHjHIowo+Asl3a2Uq3DLSPLuLlIjlE4lGierTAOTcN3gHW
	DGGpeoKB8rukweXx5IASSZTGzmWHdBcmu3WMNiPkotoAzEUMPiyi4r2ETEN5jOTNE+8jLqsFON9
	n6uSgEwVLLKGOg4ovswi+6caVCbzlbc9MpfHcZy+PH8QT
X-Google-Smtp-Source: AGHT+IG0G1UCWDav1n+DgzbFKo/1bZ6LmsukOQf7dpPE+qHxbbihNA8ofnaXhsPLIKr+h/EAOWcePg==
X-Received: by 2002:a05:6000:1881:b0:3a1:f635:1136 with SMTP id ffacd0b85a97d-3a35fead113mr2208312f8f.28.1747400257319;
        Fri, 16 May 2025 05:57:37 -0700 (PDT)
Received: from localhost.localdomain (host86-152-218-15.range86-152.btcentralplus.com. [86.152.218.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d119sm2777040f8f.92.2025.05.16.05.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:57:36 -0700 (PDT)
From: Thomas Thelen <tommythelen@gmail.com>
To: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Thelen <tommythelen@gmail.com>
Subject: [PATCH] Fix spelling error for 'Celsius'
Date: Fri, 16 May 2025 05:56:12 -0700
Message-ID: <20250516125733.5778-1-tommythelen@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Thomas Thelen <tommythelen@gmail.com>
---
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index 19bb1f324183..f28de8cd983a 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -160,7 +160,7 @@ properties:
       SOCTHERM hardware will assert the thermal trigger signal to the Power
       Management IC, which can be configured to reset or shutdown the device.
       It is an array of pairs where each pair represents a tsensor ID followed
-      by a temperature in milli Celcius. In the absence of this property the
+      by a temperature in milli Celsius. In the absence of this property the
       critical trip point will be used for thermtrip temperature.
 
       Note:
-- 
2.48.1

