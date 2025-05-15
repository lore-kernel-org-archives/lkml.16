Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D382192EB;
	Thu, 15 May 2025 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346642; cv=none; b=AXCs4a5FiSQLTngTloisBf5HrW5KN2+zQCPbDXPi6njk7XDbkdWH7dJDVPBeJ94RfoLt9MQi6ny3m5VR3pNQXKJXy67Hr7TabsoZzBArDKtHvx9dE4nIJos5Eb1KmOevDZzWh7YlKpGt62FcF5UJC6lfQAscxgFzrf9WDik5Qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346642; c=relaxed/simple;
	bh=myqbMmuISLBc8NWdxpmMnZmTWdPoef+ZJQqAK75OSMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dEUEdJYD/k5Tcjie3mr3F8wOPet648kTIGMarhcqVzL9aTDSXv0V7rjH0yk8qigYeZQY68mBWHQNEx/leNEM8Pcz9ISygf48B80Pw37QriNQyu+3SNdKJMgwRqFAybetuqZa8T7nWtniw5xEX3vvOotJe+MzSAqP2PIP8q1G3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbwBTVo2; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbwBTVo2"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1539367b3a.1;
        Thu, 15 May 2025 15:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747346640; x=1747951440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLZVl59i+cLGSuNYnHKizgt3XCFfJAE/Fk11Cib4KvY=;
        b=MbwBTVo2euxlb1eP0FC6kpidutOfrlXMq1ntuG50B/bT9u/86NMGbdqWg1RxE+yMMV
         2Yvje8OoMRXghWUqp0hK4t64VJgP0u6ZXC43/K/VkEZfjpEoq+rmcOh6ELkqvKjfzNPT
         1neISC9snX/siowBR/BG6vqIj6ZTvML0iVgAoTQP1C7GVZJYNk5GLWm53/3CB6FKjaWQ
         ISEgOyRTS/VDL+qCoo43/n7hHF9Wi7zcBR9J+L2IxxhCfiPYQryIoGir0xhADD3t3fh9
         vxCzORCDZ0gh5i6vsXctsbYLQYkPRiCf//JK//JAvtCVmmMJQf8UOTZdCe6qdcngADtc
         j0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346640; x=1747951440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLZVl59i+cLGSuNYnHKizgt3XCFfJAE/Fk11Cib4KvY=;
        b=t8Qo76/QEPoN/mPBOtkn7Er5p1qrVwoqoL56P8Xkscil9Qpk7AQCOFfcjBRJU7CR7y
         Q/24ky0koRHulVhEZSBiB33XjL5cwuv+6q0p6+fP2qsw4PNr8oPP4be5MFfuAHJSce8L
         nO6/+gShA3CUSuE7uwFhcqz8kq6wm2Xu9pvqWFHEQCVCNCkFyY299xJ/FMgnbHBUPxPX
         8YVIL38bX5Bth3MDIXXapfB+I1/sfY+6ADpf3byKjX1VHvgxw25KNj7RjtSHTstymiWX
         lnjsZ00Q0QH32eZnwN2LYXXhmIY+HsGxc3KxW+zQkYe6xouzxTUHQ3SosGHtqKcBqv1v
         eHUg==
X-Forwarded-Encrypted: i=1; AJvYcCUvyLfdgDEh8fd7jCYul78LmOj7er5DqZE6Md7SLNO6T74ExGB9Wwr9rMqV51hxR5YHjzSGfnUwDE40XLA5@vger.kernel.org, AJvYcCW7IiIDS+sBMfdoy+FNhJHqW5/5zf5SYIc6aDIh6XyNCd4HH6e6ekAyL76MuB/Y+Z07/X9dHOT+aarG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxesha33Xz5lt3OfHJNB8kZGuXZRccX6e6kufekwghH9Urf/ZcU
	ZaNOhlXRo5u2pRjADiKf2CCpKfLtx9dNhJHhm7JdI5wJwd+duSHhsK0A
X-Gm-Gg: ASbGnctwjrtiU5Qz72/excR280G26u96zrwII9rb0UbEom977dg6nKWx2Z4QTIlV5D1
	YrgI6IAgcJp180QT50l62Cs7ouW5lFfOEBSuvPbkJaNXsndtXSWg9fvuUC801SuWX3ji3M2/bqG
	CoBIGpyCGAnXsncA6uowp4yUxZ4KPM3cDSUL15vD5u+1pDoHjSxakZIB2htzHiJkancjn4H+LM6
	CWnS/Vu1rPaNMRKAllTUGypvEyYqWSxIGkbHPMvf5p8iSt5tWyBq/bwHyOoUPRmlg/RimUXvBIB
	CwVl1yxmTGO+02g900W7RT3omphZppSWhX4ZMlStKkGIuRX/qMTm4cZisfpUfB9KrA==
X-Google-Smtp-Source: AGHT+IFBtph9fv+7fKDEC6nUWw7uIsIzzIOwz1cYir/tCyC84UZwVDLtqukgWlfF7ed346exY4Vk/g==
X-Received: by 2002:a05:6a00:21c3:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-742a979672dmr1193531b3a.6.1747346640178;
        Thu, 15 May 2025 15:04:00 -0700 (PDT)
Received: from localhost.localdomain ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm284352b3a.130.2025.05.15.15.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:03:59 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve deRosier <derosier@cal-sierra.com>,
	Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
Date: Thu, 15 May 2025 15:00:33 -0700
Message-ID: <20250515220034.393303-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the Radxa CM5 IO board.

This board is based on the rk3588s.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..d9ca282c0b4f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -840,6 +840,13 @@ properties:
           - const: radxa,cm3
           - const: rockchip,rk3566
 
+      - description: Radxa Compute Module 5 (CM5)
+        items:
+          - enum:
+            - radxa,cm5-io
+          - const: radxa,cm5
+          - const: rockchip,rk3588s
+
       - description: Radxa CM3 Industrial
         items:
           - enum:

base-commit: c94d59a126cb9a8d1f71e3e044363d654dcd7af8
-- 
2.49.0

