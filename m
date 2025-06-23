Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2329ACD7;
	Mon, 23 Jun 2025 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695155; cv=none; b=Wbi4OThmkSKeQOew4485wd+P6Yq59NvcC+LUOav0bG17Sno5/Md8iDzhxu8W9aVMAicnYvIL4YkpuKdAuWkxwWKfxhvsdujCwNhOPzvLeys9UgBEJD7a+OxNIcsOjd5bXCjGoDvh9B9vd0WwhC6fo/kJeBx9DqZV2AG2yh85rUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695155; c=relaxed/simple;
	bh=oF5OxwaPl8/tUwW6hn/n8Zaw40InOJKWmwFd6oyspzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U0mucaA10/ofIn6OXkbb9ANBgfqMQ5tOYbGLFXSEQGRMJXfN4/1+0elE3RqwNfzjfklh4FwlcLXVPNLxu5/NZ/i+jLl2hkO1AxmSuD6Y5fVjPtOTj465RwSRS1rg56FmlNWUE41J1TDSIDmo/GXVXMuzSMkVJOwMM992eAh8r64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMI8GYWs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMI8GYWs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-749248d06faso1767486b3a.2;
        Mon, 23 Jun 2025 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695154; x=1751299954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VtcumMQpGWJUhK15pJtoo02/DLnPfbplbsv3dC/LoQ=;
        b=DMI8GYWsZmMz24REQuyEJJF9lMoZ+sWFvEqf2NGDhLw1UybtMMdqm5lyCPbImi9z3Q
         jIaWv24vo7+9/jLv04Sv+hAyJppy873mTnjglRM/axCGilPU0+J2FTJ2nu0Gv8SAsHdb
         dXgEPxzybyh8d2rWcjRWjJcY32dDvhs1QHnoT3k9u/03q0dSh5zHAs974efV6OrVqrCe
         Uva0+YvP2GoaiNg3kDeMSUbKurEe4jU3fccEHxzf4/K6bfUgxE+xXRQ/O/4D5xmIgeAs
         egdvYnnmmvzbumzSwGT8CsoUW3HUKleuI+bhgsitEwbTf8uXsLyNk3png8CsLOiDJw3F
         Ibeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695154; x=1751299954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VtcumMQpGWJUhK15pJtoo02/DLnPfbplbsv3dC/LoQ=;
        b=JsQKfGf6QviZAwhuSFidWHnHSH1Iw/P0vU9sP5gdkBHQvoadHFfI1G504/NW7EGiLQ
         bBQntXcuPU/tPfF2tHviQg9OFyy2fblTETYaRiJw/8tL3ZmXL31CY4FBx6Kk24yOB3s4
         RaFkT6lu371Z1SKrafWIkDq2aNGQMgjUDLiV5S4BPRiNTC3h7tMN9L4/IXUrdPowg6tD
         rU60IJpNkXiJqtMPa+wh4FDtL0QnVaXiU92SgyUgi+usHlJkvA200w0yhMsH62PbstAJ
         TNuuAwNsB1Gugqor/TLZePNUKgAK2L0CxVw5TW8gA4gfXzgWT16qgWhguiPIilGj/gX0
         zKFg==
X-Forwarded-Encrypted: i=1; AJvYcCUIIC+4yQ5fvsDKSoHMgL6nXSC9SX2vN5iTa8HFtqSl00ojJ1ROUx3Bd1W2z40tPA0AbQL3SVqTJHdH/BHy@vger.kernel.org, AJvYcCV4GBVPJqxKI0WV8jqi0q/EXizHZzY+K83IlWuYiDMkMK9CW9bejI/w3qn+Nm0PPJOYQqkKLuBJngck@vger.kernel.org
X-Gm-Message-State: AOJu0Yyebn5prWSTnFiuTO9oep29pD9fvibaSCBFmQRbYmjn6XLHq0ND
	7NNQZHmUu/eySQlgWBUPOihIf4CUYJNv0+Aa+oL7g+eL55U7Ky1SvCzy
X-Gm-Gg: ASbGncsxOz9cruxs49o2H+kaOB0TIJQpumZPTi68wTSIcVuxHoO1FOxRjsZAhfwzPpc
	lIXVihbmM85LavZQrbYWtuesSFQKIhD6JgFP1d/93pT5ZQwdEvNUM4Hp4ccUBJAnyZo1iUfCxzk
	2npcnnXgq29rP1sTDFQSj4bPEwiZqfa1hyERdjCW8G8RcMCrJ+tJIz2xrRSIDxNfzAsJxuJMBXA
	tFVfbujLOK6NhxQ7ZHQwBUgAxAnuO2FDl/dFhFYcLtqQGslQe0GPmwFS1lp1s6vGdO7/28Uwv3K
	cvWEEofoy4uhJT7Jws9AT+7wIhTGKCOzaAh/xE8Cyzq7IFTSl92XETMCOhFZVS6qn6mbKfG7SsR
	TFGXsIlc148NmE6A=
X-Google-Smtp-Source: AGHT+IHW3hfevuEAc7PYQYSetzR7HrPI8vD9FdBDkz+I2rAyNHC54TdMIOOA/EJsqo1/5/SmxuoIvQ==
X-Received: by 2002:a05:6a00:3e17:b0:748:ff39:a0ed with SMTP id d2e1a72fcca58-7490d6a2b0bmr17949578b3a.20.1750695153598;
        Mon, 23 Jun 2025 09:12:33 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:33 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH 0/2] arm64: dts: ti: k3-am62p|j722s: Add passive trip
 points
Date: Mon, 23 Jun 2025 13:12:25 -0300
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOl8WWgC/x2NQQqDMBQFryJ/7YckxGh7FXGRJk/7oU0kASmId
 29wOYuZOamiCCo9u5MKDqmSUwPddxTePm1giY3JKDMopyd+WT5QoiT2X2d2Djl/JG0cmxzAzo4
 PBKu0mkAtshes8rsH83Jdf+DqMGpwAAAA
X-Change-ID: 20250618-b4-verdin-am62p-cooling-device-6479ec40108e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

Enable CPU frequency throttling on AM62P/J722S when an alert temperature
threshold is reached before the critical temperature for shutdown.

Adjust Verdin AM62P thermal threshold accordingly to the SoM
thermal specification.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
João Paulo Gonçalves (2):
      arm64: dts: ti: k3-am62p-j722s: Enable freq throttling on thermal alert
      arm64: dts: ti: k3-am62p-verdin: Adjust temperature trip points

 .../boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 24 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi              |  4 ++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  4 ++
 4 files changed, 83 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250618-b4-verdin-am62p-cooling-device-6479ec40108e

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

