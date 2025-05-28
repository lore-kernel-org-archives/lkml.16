Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB662220F32;
	Wed, 28 May 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470713; cv=none; b=uoivnbMqeeCkuV7liNhOe6GZ/374/SXCLFrDYJPb5uMFjCf7z4QoNNlJwNF0SRH34FJpH9a3f1MAESuwt7F2nnGEr+DsB3+JSH2sz30Q4CSc93+vCrfrjS8Y6ycIqtVmWMnwaDuN9JaKLNQaDLcSAar2HWkJdaSyK7sgDFwKeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470713; c=relaxed/simple;
	bh=bK/i1Z9dtFAZFxokvCvbpy9SK++GuCM1tsD0Z0unY9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRniXK69j9QCJT8BE+++rvCuLtX6O1ZaQMEFJt8YkoOXMWKBiegP646zbYvRBmyBEjK/kk7Fudz5o0VsHI0Nsbae4NuU+4Uc0DYKyOpWIUxn6+g6Ra9j/FWtujX9MbHoGnDIRHhFnDzV/1WnfdZKGNae3vnxEXjQmxsiBx67WkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9FEtwJt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9FEtwJt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso170086b3a.1;
        Wed, 28 May 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748470711; x=1749075511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtIyFVItmvlb0Qi7zMQtmVP45b6iqhJaWxe6x7y+EyQ=;
        b=X9FEtwJtbJtORvezlmUpS/o3xfcTpkcAFyTj1hK9jJPeOPbuVs7lxAl+Ecj5qAHOan
         mMaY16w1d5NX9g4KuhCkiP0LHX4kILGwBwY9/5KX55T1ugiS/erMhMyKrjy2cXUD1lkx
         oRi9s5eDfNeeCL64n6wroNOwY4ySwO168n5N+bhOtHWloJmDuJUivGMCICMCfuzShRZM
         Wt7dJYlbEEhzvL/X2Bpk5N5ZFdDy/UJRj4xYOAKQfY7T0HPe4eJgYAUNHodRfgilBrZa
         iqlY/LYBiT66wc3LUYBQPXL0kpBI1Z/kKgTGq3fzXDn54lYj13SDEop8kcXOOCMVXBnL
         1RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748470711; x=1749075511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtIyFVItmvlb0Qi7zMQtmVP45b6iqhJaWxe6x7y+EyQ=;
        b=KllKwncqruIIeYSnEVkkDlG6/st6rM3NoRUen9NY603oK6DUS4I2iSwPeGJWNLDZvw
         j1ujsVcQ27qG33HlGuEB8HrGQ8AMqfPn4myg3OJGc9xcP/SgSPeOSivd0Q9BSpMKOKy+
         totTOk/fbwYM8jQu36o3XVeK2RcFOCUEgoP82C8Tx3JZ+KzBnYMu72WKcKxXDD8GYW7Z
         C/RAdZsEc1Xvc2M6PyHbO6l6VoXeylEFpwz7zxLXQPDD3jfUONck5exEmaItoZXt82EH
         lm8DoPRB5uV8e6ovERzdxEhy1aJpyNDHwd/O/osO25bRspGj1mu2ZTZMUVHszNraIUXy
         WyNg==
X-Forwarded-Encrypted: i=1; AJvYcCUq27okyo+o51onqKy/WFZLwF6nPSFQAwOeGQKelgpg1cSUjwB4/40LqHvGtCyqhJIhyUE6h3IVXhcIi4dx@vger.kernel.org, AJvYcCXxQxsUory5afMoLo1ha4qd2azp7Qk6xJZQGP5PVEo8eR3TkgAhIdR1giuT5h5tgr2jQKPwgIlm/HSh@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKM42obvBx8vp9uk0hOdVevB6JhCHjvVGGqXv7kuJNQIOc3xV
	cECAEkAX9I7oyW83JGZrbyRaAuImcDiZstfyGx9FTD2QI9+/S7joZWx/
X-Gm-Gg: ASbGncvxalaELLyESXz/FyLIe0S6bpM9fLh84ceRmq3OPEOpS6wMn1QLzAzzNPvADlm
	9i9TsErPqNVqqmQvYvhlqMyZQzLu74PqC7xgN/HPOJsIeROJDpCFyzNOLVdJ9IlGvZoltxoePG7
	zizLxS7cOUB5wVcG60aCYm70RY8CeCNDNrLYXSFfDRoRQiebRq1lvIYrsplmvBmswASxccKCe8M
	I1Znlq7cZ2IkKN9UnzpmWVH3ovU42IjL9PsP4Fq8/7PN9ydSR2YxnG4Z/bE5eqqGTl1HmY3XcG4
	s8f3SZaJHzROa8+SP4++JboUSr2jtk8zaRcdvNlJmk7U8NVpnPuWIcvoslOFKEnEoQ==
X-Google-Smtp-Source: AGHT+IExOjzN75mdxRVjjLLNYQ17bfeHAMYVPsCViF5ldPFzY57HVoLNGSKqiY9sj70xQkkjQ5lIGg==
X-Received: by 2002:a05:6a20:3d8c:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-2188c24379emr27000647637.13.1748470710864;
        Wed, 28 May 2025 15:18:30 -0700 (PDT)
Received: from localhost.localdomain ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71fbsm81015b3a.165.2025.05.28.15.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:18:30 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve deRosier <derosier@cal-sierra.com>,
	Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
Date: Wed, 28 May 2025 15:18:21 -0700
Message-ID: <20250528221823.2974653-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528221823.2974653-1-joseph.kogut@gmail.com>
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
 <20250528221823.2974653-1-joseph.kogut@gmail.com>
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
index 650fb833d96e..64b0a0dfcf12 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -840,6 +840,13 @@ properties:
           - const: radxa,cm3
           - const: rockchip,rk3566
 
+      - description: Radxa Compute Module 5 (CM5)
+        items:
+          - enum:
+              - radxa,cm5-io
+          - const: radxa,cm5
+          - const: rockchip,rk3588s
+
       - description: Radxa CM3 Industrial
         items:
           - enum:
-- 
2.49.0

