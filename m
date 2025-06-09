Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637721E08A;
	Mon,  9 Jun 2025 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481201; cv=none; b=IR3Z9RFsOQIzQdrQCVQpXh01Q0T2S80XYYUdoNOSzOj2iDJI27TqBqtebE2Iyhqdq/BXqJYPUmEgbMcukeFzmwnXdoWYpYSHR/TaIwbl9wpViMFYfI0EGzrjyz/e5lzDPnp7Kfa8M1fOdoceyLKnZdJVZWbORoyOOt46gP17S6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481201; c=relaxed/simple;
	bh=0JJhI6kqGvKy/FntRIN90GT+NgLZ4nMlsnsKmvnJqQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPZU9muep/3glxYnCGeHt54ctXENXYWz8AUQR4vtWivcOF4TFV0n4G5yGw/lEiQrqNuWOb7FhekPMIIYZ3k668nyoM7XRd66bce5HDIesS25unafMWNYOpsFKRV6SmoBKSmyEFFUNLkkVFY3dF2FN2eHTTgX/haphx9yLDnZ9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcpVoNXZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcpVoNXZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4197963b3a.0;
        Mon, 09 Jun 2025 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481199; x=1750085999; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFjG+pOfRPDSRNc20uckkUnsRJat1xE+ocwboouqkvQ=;
        b=jcpVoNXZuMIPWdXMe4wU0FbZLpL8dRYZlFg8zMCeAWCy7ZnfIWObO6ELiBED/vv++g
         qeBGWDomtbF3jQ3I23LewDo2zxZFnRw+TfMvhDVZjegl6Gr0DvoNgx3Wj7CGcUYQ8S4W
         NHJ8yzV2xG0B9F850qdQwEgLR+KYHHF7UjwvIxrd+3+3N2EGRHRW3i9IMSBq6KKHUzwq
         eAep4ihFwe/d/qXeJfWcp0IGIqUYw2Q8K73ljGvbfiabtcWiiroyW12wIHUS1iVurNVQ
         1goSW2RxsiMHspkb5TWn5HA7OYfsMOQCfdkhcEu/VQ6wWP7DXFVAvyoGfkDIEi+p3d6Q
         9UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481199; x=1750085999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFjG+pOfRPDSRNc20uckkUnsRJat1xE+ocwboouqkvQ=;
        b=V/pXRnzIm38dhCsb4Zmh85yOVZ82zizhNiK1JuCCCkZYB++VS/Ylh2MJIghy0yN4+u
         CD0yyPf/OahJckmGCmfZc8W9iteqR1519nDIA3SO8JtiqCe6VtvFhI54BSUhQ2FQCpqP
         sc0wXdvtDz9K4kOIJLsxgbxyOJ+ozozX4W6vLFs4QKk8pbB46SYlvYVqc1wWgXKA8fGe
         MZLHD1up7iYdwMpl0pUCkwBU3J97QV44aRtstOrszeJYPbX4+uQ7T/UeUb8HmWW7Pn3m
         /Q1nUXCiOpGOSHSDDMLOxRWM1eAqdW/b7rKizpr+Ldcxv0oclXB+B/m7PtoZbZA5rPLf
         nlUg==
X-Forwarded-Encrypted: i=1; AJvYcCWx6OXygGCUvqCqznUBe0t73vpUxBnHYNNtm4Lde1i1BQ6jwKt2ZVl50OLBN9B3NFzISsMnpnuC6ecz@vger.kernel.org, AJvYcCXEi4At04jOxBTT6pxQzg1qn4lAM3Z2k5SLjX7rVk6NLY5sXW0e9ibq1HCmgVTB4r+1l9vWZH3//2sXOvpf@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKGnK8ZGivS6rOpzl0s1+Q2XS6wopBtzVKmQCVDEhlXg9ezmV
	lUFXHGCz3EE4f8CjCVXF9qgsI1u32SIRA+oDIrLtRRtv0UjvwXRKUWSJ
X-Gm-Gg: ASbGnctMRAC8Y+ZCEuYaMX7cJLsMfKTB7wjrZGtPTbtxziKHzMGETZBayXVara0wO7O
	tJEo6OhH7GjS5k3pID53layVK3dhiOERN2Ih+zTdCXvF5hhyH5gHcU3PKL6XJ260uQkR8Tat31q
	QRvvF/z1x/wu6Zo0KLFj3vMSiXMgktYI2OMM28LiMCVT7Hcxxu+usv93RghoaaHp+mVk+VoVKPX
	AKEU5u886oOocRQeRO8+yoQWJRrcfOkmHwh+rd5E2q1Mr81bgqexfT8LJjSnqNVnBvRQxmkqgpd
	VRpIxND6utG2t/bvDDMGSw6Zpb+mB1UqjkmwXyMBJuQRY+Ab1dTw8zREHE8+xoR0
X-Google-Smtp-Source: AGHT+IEZ8edEBrlsCKygg+nK6CspLV0qAaKPatEqxaD8M9wx4pHm3vwzRhBcGei/aNuSaxl7Obpv2Q==
X-Received: by 2002:a05:6a00:1caa:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-74827f10b78mr15423924b3a.16.1749481199134;
        Mon, 09 Jun 2025 07:59:59 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.07.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:59:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] SPMI dt-bindings and nodes for Apple A11 and T2 SoCs
Date: Mon, 09 Jun 2025 22:59:39 +0800
Message-Id: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANv2RmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3RILA0NT3eKC3ExdC2OLpCQTyxRjk8RUJaCGgqLUtMwKsGHRsbW
 1AD8A8HRcAAAA
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=0JJhI6kqGvKy/FntRIN90GT+NgLZ4nMlsnsKmvnJqQU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbrh/dsfUqlx/OZukNJ815osELEASbfeSVkl
 2kMwpN8f5iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb26wAKCRABygi3psUI
 JCROD/9MdGwz06q2J5BkSI1sE4FjRBWgzH+YF25cFiPY7x30WY0fi8Qd9/X3ofOS1ToqDaYhvEX
 P+RR8W+NRhyzPOhP/O65qNaML/Z9LjL0A9RPLg6N6iV3PYqwjEnZm+32Sy2Pu4jj3o1+0x1rjZy
 5qly9YRCRQ812TBvLZlNP1YK2ISCw6ILoY6gUVwn22xhNlrsYqyIu+UG9suZ7bkJ7zWmZ+QC6bX
 mdAdMqaIUSo6e3ulpK31Uvi5JIdvAvMAfZkj2C7jZiDMr+u6+Xh+/g/yi0HUW834+e3jvXxi76k
 fS1HrHuucc5/Qwt/IKl7c1VOykSS7uCf9/4LLzo/pY32bQoT8QDt2sDHbY7DyQOjf6vD5YJKPmD
 GYhkSpqd+pbE8IRfn7xKbg8+QMPZxqPgSQDKJ3n+wdxHclKMHXL9M2m1ziYBcDLaB8kn8PnWOXt
 eNISMwePG/OS1VvqxjDS21ebGV+ZA7Jvj+5kqgEF8DvugoVJGPs5/fUoxmaLsd6NujZ3ulDPiEq
 klU/EeUOQkANrsCqEjRNIjEzZ16OMKG2vLM49JCAlBCPZVEL8N5S8x8riqfrrcj+A5bfFy2Y3Zm
 8GkqQHJSHNmuYhZaaOew3G2gKHRthX3RaEFjiBsC7w7lcewHZpMc2/4PYg+TkrJ0OCmpnjRVKBP
 9AGIZht0ca8wziw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 18 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

