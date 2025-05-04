Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A1170A11;
	Sun,  4 May 2025 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746354610; cv=none; b=nSCFE7OIUPshUBfg6j8E5MbF/zW1ACZkaw7692cRHMrXcngjmyMR90EmU9cQO+Joyuylfr2IEp1xdubfGUxeDdjx3K1XxWNJy/X8Cqvl6JRKvxM7GjDhtRb1K5+1eYc4tXikbDC8WPOYCSl9uF7ns1ANTIJ17/VD5W7gBgfc/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746354610; c=relaxed/simple;
	bh=DFcXBupVCFv53qEAauxa/Y2A7G3XAu/ndYtXvOcYR7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/Wu3A3nfyfIeqCKg806PMKAvuok1urP4SHpNqFhyqp271Hzek+5iPzHOTcpw2ESQGcc2UkPieujKOBlX6H2nLqpcCnqQSGfDXlgTv0ibr29+DYGoMa0Mu0eEW2t6SJCybqPb5o/voMnvL9sgkiPoUuvOmkKQL1lxLVhlbQAI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/M9L6To; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/M9L6To"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476977848c4so47678361cf.1;
        Sun, 04 May 2025 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354608; x=1746959408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVI3WFsvVbAiXxz3fU5XE6nLo4wboKl7ftENxHDBGwk=;
        b=D/M9L6TolJSHg9EwZz59nJktVpf5vGb1NwMWTcRukzkpVaHkSnZgnIpceLK56R7m7q
         9hWdwrsjxuhrsnPvhCK6lDva/sllCwhT+LLQ7n1d8uSI90OrlcrOqUrNYGc5esZ1RhRS
         drOdwCjkmtuKgyqMZLHQrE7hyOQYT/xftb1mmgbDGjUcyDCREaSJVeeLZ15IWDRP/WDQ
         UqEVXt4VbOML+wOKKkyye43rYixXuRvQ9SXi1hw+iLMT1WST9oLGv2EtZyI98PVlGgVn
         0IxW4eJXv9oj0ypN7N9WngNFN1pcauV60bUFjo/pqwOhJ40Wl074PotBwPhdj+4eDK3H
         Fhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354608; x=1746959408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVI3WFsvVbAiXxz3fU5XE6nLo4wboKl7ftENxHDBGwk=;
        b=B/d9+ObHnHOoqJ3SBZRehD0c/BRdDtDq5mlJWTkd9L8D8CvYDVPol+GKMHui0vkUDa
         GrLvXZzLPHAPJl3IHmAonQxNqLrXsRhY39mS6XL6oeJGVsHE8IuJjV61K+7CzOIHMd7S
         Cu02DIU/hsDx2uvzMU5Q2NmMQGcD43TSZqQBqLHuJZ3L+wVzS53UNhB6ukYMaaItcDUs
         9g7Y6FcG5SYNTafqeZ+xg+6HPKrLpmC0c7id9h2kpS6FuiMYY3R3hbAcFfo95nFJWN0C
         Zew5pjgj4FGp8OIll9+ElNZtRX4uzGSzBp0Kry6NR29LMF1LmQtoSLCgFlmy90qaGRHs
         sWCA==
X-Forwarded-Encrypted: i=1; AJvYcCV6TB3vFB6dGioN8AF33RhlD1WlYqh6H0iwKh1et2umJ2Jzqm1lTf7SefsD3GRh5PJi/61Fx5mCDnGx@vger.kernel.org, AJvYcCXPzQgX6/L4undzyDgVHYTqb7wnr8XViRYbWQnkeNBtnWOT79m6307RHAGsH2BSXvazriNgmUTTySgfWWx5@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQwxP++IWPu3++8kUxW/vekmMjs/VQFZheAOcRbmtQfVu4tQm
	KH5/HTrZ6n3vnaCi4ldScWBt4p+eXDOhtNH39B78XRtqnkgfWJHO
X-Gm-Gg: ASbGncvZmY+zF66Z9EJJ7uZ3OD3nDHINoYaebTL7NcPbAtjEfaZU0fMAQarNvGoTzXk
	vhLepYb3f0Exfc6kQjWxPzstyZrGVZaJyKOhE71f0kJFcXC1lEttRyIKqkjsz+UowjK0F9TOR35
	W17I31oOoZcl3vUIUjL8nWvarD7SophHOX2A8t5PAF8Iqb6rLtVXTVBFF3XSAPlCldyqN8G9mqz
	JyPmTBXakQkyHxgqWjr4MWs+jc9sRtzt1WiMNKfNDUqbuXk1CVMQGitzflSwrZNTdp7UI3TV1RP
	IE4dq/eZ+hzi1TNxEDrXZcl+JFES8VhpTSgAN5S+xLPHY4vcuEEHfCnnU7m5rWdDWLj0Lj8973a
	5bXOrO5EaxBA49BQ=
X-Google-Smtp-Source: AGHT+IE8wMnsF2emt72M8bfj3OH6CYYZM00ZNXnO/qtTENvjFh+h4azJWXELz665Db5XJf+cLgjMvw==
X-Received: by 2002:a05:622a:1e91:b0:48b:4126:8f3f with SMTP id d75a77b69052e-48dfd311c8fmr52973441cf.0.1746354607658;
        Sun, 04 May 2025 03:30:07 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf8fbsm42937331cf.11.2025.05.04.03.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:30:07 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: davinci: da850-evm: Increase fifo threshold
Date: Sun,  4 May 2025 05:29:59 -0500
Message-ID: <20250504102959.81830-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When operating at low speeds, the display may throw an underflow
error and the display itself goes blank.  Increasing the fifo-th
value appears to correct this problem and the display can now
operate when the system is operating at speeds as low as 100MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
index 1f5cd35f8b74..38a191fb0414 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
@@ -60,7 +60,7 @@ panel-info {
 			sync-edge = <0>;
 			sync-ctrl = <1>;
 			raster-order = <0>;
-			fifo-th = <0>;
+			fifo-th = <1>;
 		};
 
 		display-timings {
-- 
2.48.1

