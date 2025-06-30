Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9825C807;
	Mon, 30 Jun 2025 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282507; cv=none; b=LtlYlGP4snkc9ghsy+5ChEq0WGV54DlCNSEjlznpsR2uK8UTJjHgdFitTxSvOyzzT3a4O78h09bh6tJG9tyQVDBpK6tvkWLlDpirnvjvs20qVuMtvhiS/IU4qHrK5aa22DaBBwC/J8QBGGn+B9u6t+ADUCEkWsYA/ra7XPTN1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282507; c=relaxed/simple;
	bh=pvXD6KeDURX4UpmQi/NlGLO9mceU4Q0W2vgwOpEK1Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RD1plsdz5/Km951YCDuF6Sxh1xY478oDBJ9g5ceZ2sLwrOrlUI2ninDsQ2kx7Xpa1WZKGnLStmVV1jbhzZ6gEqrZzLffs5bw5BkD7U/7CxviJqA1kk1jWbbCxOs4B45zrQn4SYxQ02fPLsOut+i9344mHJZV1xGhuVCTaVVxSlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0HiAD4U; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0HiAD4U"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236470b2dceso13811685ad.0;
        Mon, 30 Jun 2025 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751282503; x=1751887303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WYtjpN0wIOV07YHe+0X8eRhjynp8w7rK9GL5xUtRUI=;
        b=Z0HiAD4U3t+MNATZrfylytUOeeFvY1OtlaF31zDcWsPfh7z1bZ2RZ/WhZeroR1P6QM
         WkKhbfpO50AbkSk1nzAMAbkOCRLmhYWNsSY78IkG42uZHgH/hMGY7SoNh7RlfZadKlcm
         OTVwHjzB8j6w7f8/+l6FidRb5Q1tKBJmD4UTx5JAtqCOVtt3Vgyhjws/h1tWpbLlCatc
         5wgoWsvGz+2GVfY3bHQJYedXNpPlpefVx/k4W/2/nDzSpQsp+8zRs3e0PPs1VdLG3CU/
         jtT+ci2wIRimMoFv2r9+UdwG0rddhq78V4k/PbLKFrKUhm2xzdHRbHC7th5WKYs6hBqD
         GKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282503; x=1751887303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WYtjpN0wIOV07YHe+0X8eRhjynp8w7rK9GL5xUtRUI=;
        b=nnOr2zqf5wGi0np20MvM4Yh0VW1xNbpxarGbQ81s1P5BZcBqyVXLp49677XzpXvqrR
         Oa4rMmviA5vkYl7vbjzQXA5u8JP+wNWxvehnc+S1F57rezzm7QVtR283iflzWm6HTuJR
         +nqxDW8sPnBdOlM27HWxI0OAxZLqSbkYsSrvMd6cvGOb1PgQdafsYvK7tS6uLLsY+IUY
         oAj2dHD9elzS9tzY6GV+0uMEBKbNVoISaWyeuqbkamWGiNJH5hmhmBtIP2Y7OowkjOzo
         JPJ9q6Hf5Hqs5zqgLOY5fvq28Avh5JCmGwS/zA2ArhZykGW5U/Qv4BKdpIYT9ZTPPnW/
         FAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9wlpXhQJvmSHwNEErbMrY0jwFF4Fn/eocPdz/1y0Owr2CrQricOR9kFFNCFezIld2pKHFHzLZV/p/@vger.kernel.org, AJvYcCW+IOpDs2CD6EmMBg1E5UddjvhsPjexK+2EouMJ/JEf7OvQHNN1+D/DlZtTLaQmKmgA0L8MaJSqQ2ApZvx4@vger.kernel.org, AJvYcCW/WxG+9vWEgEpEhST0CWl+KxgFjRVkxRUNPHQJFuUA0h+tGXd7xGE/njobzGOMguxm186gV9FZZnsvHuM=@vger.kernel.org, AJvYcCXITAz2JrxAo0cXhtzfRFvzB100QHhNoKZSxG+SlkYa1Q4Wuf4Bz86h3y1omYQDiUlrGMSNNxvgrepu@vger.kernel.org
X-Gm-Message-State: AOJu0YwCL8Gg95fAHl348J8QPNLI5cgaq+CNckbVCw3UHrewl8e5ZMSX
	RtmPmip0L7+rUmKgwB22RSri6gCWoJZlUF+C8cWW4vHVeCTLc6PGK6jS
X-Gm-Gg: ASbGnculCwk5pfgOy0PWs7L1yzazQt7LWFr78vPh/qt3vNJpL0De2Pn+jwNgytvWnBx
	juEQcbWPNqCjUS0FflcMjZQEBAmycd7smV63ipPaJV+DAgPXdHbtdFNYHo8RRp23DZXfgv+TPDC
	OtWnrtqiy5bp/kDtAV5xRChjVc3Vi2PuqpG4319wuwnZR7dcjcx+zDGGVR2e0OzQ0PHquq0jz+S
	ZA/ZHC34ouSLhM0QziWflLpQR0O0L/i61FG6yPByt5Jln1Ffg6djmx39iEyYwtfcU4zfnkSAUVO
	sYp68XEdFUNAZS+WcLvlbt64a+q1Mvwda56GEebcPHh8KHfakkRTTiE9lk+s+i/Lf3y4XqChpNR
	MMH6RukpkaK9gcYuzHmtb
X-Google-Smtp-Source: AGHT+IGkCueCr+E0S2CN2ENK3mfpdLQX62pD7/25UN7OWo5koATblrs3JQleJcXe85kMNXbX+JOzmw==
X-Received: by 2002:a17:902:e551:b0:234:9375:e081 with SMTP id d9443c01a7336-23ac460719bmr192857675ad.42.1751282502763;
        Mon, 30 Jun 2025 04:21:42 -0700 (PDT)
Received: from localhost (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7f5dsm76812315ad.179.2025.06.30.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:21:42 -0700 (PDT)
From: tzuhao.wtmh@gmail.com
X-Google-Original-From: Henry_Wu@quantatw.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Nuno Sa <nuno.sa@analog.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 2/2] dt-bindings: trivial-devices: Add mp2869a/mp29612a device entry
Date: Mon, 30 Jun 2025 19:20:51 +0800
Message-ID: <20250630112120.588246-3-Henry_Wu@quantatw.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630112120.588246-1-Henry_Wu@quantatw.com>
References: <20250630112120.588246-1-Henry_Wu@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Henry Wu <Henry_Wu@quantatw.com>

Add trivial-devices binding for mp2869a/mp29612a to enable automatic matching
in device tree.

Signed-off-by: Henry Wu <Henry_Wu@quantatw.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..5657fdcabb45 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -285,10 +285,14 @@ properties:
           - mps,mp2856
             # Monolithic Power Systems Inc. multi-phase controller mp2857
           - mps,mp2857
+            # Monolithic Power Systems Inc. multi-phase controller mp2869a
+          - mps,mp2869a
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp29612a
+          - mps,mp29612a
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
-- 
2.43.0

