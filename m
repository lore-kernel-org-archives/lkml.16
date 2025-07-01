Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82473823DD;
	Tue,  1 Jul 2025 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329451; cv=none; b=Qp4W5YCk6nA4NeWmmE+drqTtXXsgqh1juPw5vJVUn7m43lunkW2ZTEGZ6diQTjdg5xHC7sACux4M5r4m2Vyh5lUjC7l2LNdcU0I2GcuOmAyTfWmdRXLrx7gEbLskFK+8ki0on2IJKyDZwScoSo4Z9KOlwyZgmUxqlN9aGffQkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329451; c=relaxed/simple;
	bh=jHvOOWZMwHVwUEZKHsrC/eHGLf1BTwGmWSccwPwrhNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+t3kfO1oEkkRTcjvRC7CwEcvwKXDBKiAuM8c1c6lba0sRgXOVvgdyMBmSI4s5i+77BCSTk5yu00wMcUX3JUOeE7lvV2fY+XaG/1GfZsyucgDHpufz4IruAsYpXodkotTioQqgPRCisBRPa+VO4e16otuSQWHOV6bzXVhGS5LKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRbacGHU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRbacGHU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso9520779a12.0;
        Mon, 30 Jun 2025 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329448; x=1751934248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=mRbacGHUmc7Iqjnlk3D9HaN8FwXK5dqQ+Up5k4lGC/nsp7FlJVzHkmfEslV75CyUw3
         l8hdtRVKeBSs0pYEEJM0EJbZC4+VTUNM6/VbVa3Zjd3NZZBeGVSFbDEahWtbO1aUMAIP
         L223WFQfMVSp3XPkOKeM8eiokqiApN8TWapWdY/zQxT2S5/SHd02Ov92HkmrqGQHdfYE
         xsriXzD0ir5E7dqGni/CGeDP3T3lVa3Bo5X3A+pd7LGkbb7qP+rs0Q3mK105NWxkyWCC
         RCzPqmd2Uqna/vDOrt/gOKFtiwJyiQjZ2BG+whZAKjDBnW7NFZ1rbHkTcF3Vy9YAJDhJ
         fQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329448; x=1751934248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=LBv5FgAjyMF/JG8hBAMttmJlzY3zP3rFgfWe+PEly0pHuEwINio8HEyXFIXWthaMly
         aoAAlFi12s7FWlmSJ1L/7IT/grnsFsm/qpXQu8nOiC3paQMdw64USc4p2QV3EU+BScyY
         0sGKfyKg2WCj07yxJ7/xSuK8Li5xKk0it5JkDroFmi0PLj+koxu0SfZ40yXlvVSBc8Ca
         7TdMaaCgnyTnFP4v5yHB3Nx+6ioW/bt6tE7B5K4whWRXX8iCqkp0PdWnyimDV2m3QKHM
         N3DyZLMqCoHT+L2V05oOB2MCV8e+sHTB3pzYtaectSqPQvNDF8DgIWHZ3ACjcDK9bp1i
         TNIw==
X-Forwarded-Encrypted: i=1; AJvYcCVgcR7gldca8WTzUXwoGS6rx9F9ilgg6GZa3UspVDpzDx+R8DiPbS9k1IKmxUmLdn/bMiC/3gBN1sZrBMgA@vger.kernel.org, AJvYcCXRdtD5xHre49960OHPsRw1y53q7mKAeaJmCZ5U/MDjIIrxyrshAxXeqa7Bj77CqV7/3mxpo5Zle/1j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1irzi7kTN22K8Cpm6h3/KSfZIaglKMQyjkWWHM+sOyaT3wZG4
	88pmGSVgB5h6+79vCOjuG67B6sZgUSiDfj5zzwpoW1US5Gz9VWE6zXDv
X-Gm-Gg: ASbGncuxaN7Kb0bA/sM6WscSV40LtkDBXZRyNC3EWMrbnhUMkmH8sJb26685AuVDG1H
	F1UhaVn2jYYbLB93q2UX38maEn5CD7WZdMeqbr+swe5J9vSkqDcmTMzGF9oqkWY2WThVJHAtxxx
	YBFoornZRVJ4yPC2aoqewaEANrsXWLGTmi+bbE0H4pS1Ga4IaMiVNw1VEz+Ey1RImLE936y1bg9
	IEggRdpFRvd4cTrnDnJI1qMNLyacNhGk0B8Gy+wmpP42HuznxeOZJOvafYbmr9WlSgekfwTpPjD
	0O8SD7bCjhdK8swhQpRbyBNrC/tKbBYnvAR2mmydvpi5qKZo2GlA8cNkh0W1AZ9OmGI4AbPVgGT
	lODepgrMwIYo7REIdYryG1JY=
X-Google-Smtp-Source: AGHT+IHYha9ZYRUR7w04GSYrL78W1NgyppshTXLOckZR4pG6N/j6QycRpKcE2v1wKnchhMgp2lDmOA==
X-Received: by 2002:a50:c04c:0:b0:608:f973:1bd8 with SMTP id 4fb4d7f45d1cf-60c88e9c1d5mr10426160a12.34.1751329447686;
        Mon, 30 Jun 2025 17:24:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:38 -0400
Message-Id: <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b23bc1e48866..683efaa3b4a1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1372,6 +1372,7 @@ properties:
       - description: i.MX8ULP based Boards
         items:
           - enum:
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
-- 
2.34.1

