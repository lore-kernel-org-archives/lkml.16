Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541EB27E7C1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366124; cv=none; b=lhV4CQeRpgCTeoiEoGghJwJZRQsGDvH3IfTAgRQKAz/kIWLZmldblcmqjeLBaqYVddX8uFxaXOstN5+DEBZ1XfihzQ8f9R4uf/Wr9qlGuiaKrzyynDiis44wxCdXNdA1Y/8883Lci9A8kTLenV7wUwtQTaoyBNAS8EbSUUXjYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366124; c=relaxed/simple;
	bh=lo7q0vAjnRMqOT4+3JKAMcw3uToSM7aewQO5nGtZTVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZ3bLBSn534pJ2plBOW8nFaZpEOAjCUw2kXhgpOw2o/q7+mxTALSJjY5VU3No43Yl/nYIaAf2FU5CkbUT3swvMTX7UXuV5zzos1A+CSg9Szf2CwgZ1939/WDqT0Pdr2ZmZQkQAQ8rurbwTzNeEtHtu94TuRhkz2gasZA22kPbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PQ6LvW6j; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PQ6LvW6j"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a37ed01aa0so3591524f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748366119; x=1748970919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MF27c9rRKSYoup9DCYicRvlKjG8K16l+EHL6jMeQHzM=;
        b=PQ6LvW6jFZcrnZiNV0/7Tx6rj0hUEG3gYcz4PUbKyVfgOqQI3zFCKfn4sdNy8Rhz6R
         X4WQT4D3hLeEq8b+lwJgqph4cw2H4PPVZT2W60K6w3f7oCVZF72BsCq99biiphG74wIX
         KnYWGb79EhPa3nSThDK1Gvl64IncI0/v4u7ZGEjm88AOc0rk9b6m1RUU5E6RcAf6B1gl
         ZPB4eWW0n4V4pWtAYoOTN1cCXM2ZvUhU7dLYJL7hvysk5SkM+OHTsJ9FVaaY6K5Zx5Kd
         c5muqO070k3hdjUCjV0HsyQ0Ot4r8y1djM0Vd1MB99XXda15fjLyvNzIeSfDQsr4Pceu
         Qkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748366119; x=1748970919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MF27c9rRKSYoup9DCYicRvlKjG8K16l+EHL6jMeQHzM=;
        b=CB0cYxGYSPziqIKzWrUWBPlTlqJAm2YvEHt2ZnLjqWYGDEAgAnCYmQrTxLayIeJOHk
         yI+Lmb1cnQqL9a/Bb5Bb0XcI0ZOqs+YhrGDXwXGDHtOXeurXm+d2lU1NtDEmQtLZNPDo
         OsnVVQeNmKm4GU09NPGTwoFEIRQNOKHm6pP4VmDs8c703WR6cni6TDOmq/OSpl3kZhSJ
         oYjZOEytE3oChkRAxdywcaQGgttdsinI59nWWYyk+vbHFoawqQ2nUr0x8FXq7PzC7p65
         yq4iZwuB71UiffqMVszsLSaTy+9adVARp222I6aAKB1E+KQfvn4AhDUabm8G+MHEX/No
         e8jQ==
X-Gm-Message-State: AOJu0Yzw00+YIisYjQstzqil90JUJv+AtFuOGzfmy2WnRlw0OIMDNsw8
	wNP9fb8Gf4Se6uTThOmsNst88Kd8aJ5PFziqAawLDeddL36jRj3GoN99eK1P2IZCPwY=
X-Gm-Gg: ASbGnctDyfgNNW7vkDjJ5sw8HDCDr1OtXf7ia69izrHNYVEkvO2X0gotFDsfFnDYuPa
	VTBybnCymlUfWeGrHsfNVz47qj/kSHsx8VDs7QHBzluuLtw7kooChSuFvCJVRkK3pbqwO94LI71
	pP+kKGC5+1EMyzZW9NtbP5EgOExQgLwfaX08i2aiT2I0Hhlh9Ruq8SMc6aOimzPdWc+QbrgfOVj
	WNgB2uL3gBCjpQiwm2KZym7juFOyfDt+DXxCQXTDJJF7I7+3+NgMjAcjZUYOlJDJ2uP22F5EYgH
	XQ0vlq0dIEgLZszAQJKot3k762SdmtLEgqaIFkmt1mSz2PhYu7zAHSdVo4MO4mlZ6lu9MRxVJxs
	eKdtPSIy+8A5qjzhw7g==
X-Google-Smtp-Source: AGHT+IFpTB7TNLh6pQDK/oXXCIK8emry0Gzw8WKuisddY7ds5DeVmLH7BHeY5kquTGkx95P40nkhsQ==
X-Received: by 2002:a05:6000:2586:b0:3a4:c6bc:df46 with SMTP id ffacd0b85a97d-3a4cb498f7cmr11355655f8f.49.1748366119417;
        Tue, 27 May 2025 10:15:19 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4e1fe9430sm2417186f8f.75.2025.05.27.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:15:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@seco.com>
Cc: linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: xlnx,xps-timer: Make PWM in example usable
Date: Tue, 27 May 2025 19:15:02 +0200
Message-ID: <20250527171504.346696-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lo7q0vAjnRMqOT4+3JKAMcw3uToSM7aewQO5nGtZTVk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoNfMZAti7WzkSVbkgZKbDhL7HlMQghcuZss1Rk gySeAVOl3iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaDXzGQAKCRCPgPtYfRL+ To7jB/9HOOPDuH+KcIJZ2UNKgt5nOFBdUE882ug7qeqFaYQHAAd7DWA/qoCuwxJSxu4Qs/bIoqg T/ujO/oyxurwcn/5j3bQSRkoUFPWcX+Bar7XfBaqpiiEltEuA2VZ4oxVr1VY0E1dtUwuJKHydZ3 bbTM7J2+tpB6fEB5yGrwy2LQAA2yKtTEo0wB27sMkWyYdhS1rI0Ib9qbWsZs+HDvbRSgloQbTL9 DobcZmP8ESede9SXcZpt1cqT/e4Hj4He5ryBrIfBX1oCVMGbIpL/hwuCo2oe528VL+VKtQ5n5vt ShYPRPSz94vrctseCcl2vQSxB6AjkN72G/kUKrCcV3hOpbwa
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With #pwm-cells = <0> no usable reference to that PWM can be created.
Even though a xlnx,xps-timer device only provides a single PWM line, Linux
would fail to determine the right (pwmchip, pwmnumber) combination.

Fix the example to use the recommended value 3 for #pwm-cells.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
index b1597db04263..d36cbf0efbd6 100644
--- a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
@@ -82,7 +82,7 @@ examples:
     };
 
     timer@800f0000 {
-        #pwm-cells = <0>;
+        #pwm-cells = <3>;
         clock-names = "s_axi_aclk";
         clocks = <&zynqmp_clk 71>;
         compatible = "xlnx,xps-timer-1.00.a";

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.47.2

