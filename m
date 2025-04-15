Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA623D289;
	Tue, 15 Apr 2025 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757986; cv=none; b=hsIevV1NGvwMPu9VqQWBtBK0DYT6O48vvpoEoLAkN2we0bSUn+xR9rJXy+4FEHWkpRUVuHz/eAnqtdOMD0sXD32iqRdQxyalaoX4EyqGktQPL8f1+4Wigq3yn6X/HXc8yZYJv2nzn51k0WK/saLcGjIv/xsprPL5K+IYNz1OnQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757986; c=relaxed/simple;
	bh=j0mWnElscAiMhtAEuXpEHA3AWW8EdQuUDMc3t5IMrRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzAWPDGCl7Qa07BK/U6x8oLY8oMMldOGHZT4tT4g7DKrMqfYsJ9m4tu86mTMjDeRqk9EOgiX9Es5vEnfGDxBjh0l47grCl+XXlSZkNL2KZlFckhgi0hxMrFUkQBHDo3DdVRer/QzuS/fDr+F+1QNzgbb9Ht5Qgal2V60SuWQu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUc54zls; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUc54zls"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d45503af24so55016705ab.2;
        Tue, 15 Apr 2025 15:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744757984; x=1745362784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKmbHtX7NVFtRAHnksifnvzo2HzNbVI/Nlz5WzatgyM=;
        b=fUc54zlsBpggsPcad6eayEO+Z91Y0rLQtgFgFus3S77B4D3bCaQoi3aX9sK4twbWL2
         RDlD8OVXi4+6aCTp74O811HYqcPvqfA4eN70AIphTZhrx28lDgwGemB3ExDBGvK8qYeo
         /7GhaDzQl2+llZdoM2v/UMAlWs2BqB2emC0ANdNcaTuKqI7j69JIvS5nKLTFvcRhqJ0N
         +GcaDHAVb+0VGKI5xDvK7+IUKvfCWWr12MwluJhom8obbuQRs4w1KuYdmkwGqk2HL5/H
         +UcLF2wC8bbpHInWnZtQ62iKDVOBtfqRv89iatBtsOqKRy1ngPJNfQXaK3ZBxGfsjrRP
         lp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757984; x=1745362784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKmbHtX7NVFtRAHnksifnvzo2HzNbVI/Nlz5WzatgyM=;
        b=SxeSfFjI4JTb28jYjknPfNhRSAfjpqbH8N3RDkJLzvb/hL3144RvDjihLsIiBZKdNJ
         ewv5odOBuXhwtl+OqQNWX5wCedNbOGZ+op3BW6TIwHNZVNqrDcvYpHHGYgeYvSlzAyz1
         ZzQYrTi6tYy7KyYh1lyGzRWoRL64Txv2wApilLmeaE56jE81HTfC1sNWSl+NnXqnTqCO
         8Kd+q2veU1JtxIYKry2hrZrFFnbvIGB6HyLlhdMUWBdgc/iyFeZU22STZQ0GfQGHF7l4
         pwkGGJOVFPCqqClaz2y0KUS+La4loDgLCR4gsnBt1m3qdSXEhllgQdvnA4A3RZAKEKR+
         TOig==
X-Forwarded-Encrypted: i=1; AJvYcCWetea5ElppPK0530tRdaEnLIlQCjfIkr0G8yUsu9UeTBoH0BEUZYmbzjjYu8IIj4UmzCobI3Lv+6W8@vger.kernel.org, AJvYcCWqNqDIyGZvWaj3dEZbbVagP6dhus93567ZZc+9ZCO5GHob0/NW9TqVgJd4i3JQ9NXl3QL+OQuBp/wASnlf@vger.kernel.org
X-Gm-Message-State: AOJu0YzmWgqz8JKOjFzLrd/vH3jigYmFtCLmpBN9opcWrlQWb2aa+ZaD
	YdU8MisggQfH9EvPHOnsoVielTRZLXRXdmP/smrOaci4iZ4JxO2Y
X-Gm-Gg: ASbGnctkntkVIUiuNd2TaWbG1w7mvN/SnTCkHT7ot5HmOgtKU52WEZ5OioluGUlyv/i
	Bjpar0eCJgrlj7D0K294CE6NyArS/7H+pt+kNQdtHoxyIBWRi2WZ9T7C7B4YJ6h6vPNFPQFei5u
	cJRQ7vE7Uj/vcRPOt53lRX2J1kNuBYxYqvdjv91qKHgCBxa9w8/QlpO7AV4BlK30AtCkN14Gb2A
	0C9uLXn31U34T+xAJvfxQgfl0t1l9stdXgCQg3kMt6Gukwk1wN3PiD1U97UBgokOWq6xEOd845P
	0KXC4QjVFPWgPG5iIuHyfL5YQMI5h3rG0+3WCk6vQmlhIl53YylJ9sWvHtad6ReGBs8ZVOWFQ7W
	3
X-Google-Smtp-Source: AGHT+IGG23NkaC44hvHCoI5gZwhtT9feCVmXAKSsDqrMmnnVmSWVZHn4aR1QZTijBERnDX4hw+WvTA==
X-Received: by 2002:a05:6e02:1fc6:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3d81256730amr12553735ab.14.1744757984259;
        Tue, 15 Apr 2025 15:59:44 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d175edsm3382356173.55.2025.04.15.15.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 15:59:43 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dhruva Gole <d-gole@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue, 15 Apr 2025 17:59:39 -0500
Message-ID: <20250415225940.3899486-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This board is based on ti,am625 family using the am6232 and am6254 variations.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v2:
 - Apply Reviewed-by from Dhruva Gole
Changes since v1:
 - Apply acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2

