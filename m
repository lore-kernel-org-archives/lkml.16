Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837E1E1C36
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084440; cv=none; b=eGQmuOpJEgoE1QWg5wS6wNl1qhhhKgfdPAl/Pk1V5c102AWbxpI1oP/Bam7zFdKKsEIFoORxTzzQPF7AHE2RIOJj4Qm5I8gniVb0dtBP7zeyzgTtEdg+uC36ppcb9SMugYoqDvaP18+vsZu80cbLZmp/IQBbMwYeomIIsNN7txw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084440; c=relaxed/simple;
	bh=4xNh2lhTG0rhBmyIj3i75Ktf9mjebgJlLZdNho8P3uE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EypFQmmDwP5UIiJ4FegSxQtm/a9ZLRy87bJrT3D4+Ssy7UTkOIyd37va47P4Xg+2PYWoMXP/9spmTOuLGHEo6NqH41JM9bGZ3+BsCzgeTS9OYoeEvmRPNpLWnjhdhk1Cb7P4IBjlKZjNAAJb+TQIqsO8eHDpIDiH8j3byFIJ1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Soi7IpU6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Soi7IpU6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4533a53a6efso11138445e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750084436; x=1750689236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjYWwMAn574NDA8zKjETWNZDW1d4gxcRMlquZ/twLmI=;
        b=Soi7IpU6wPZnUR6vS8qRQfzVUEZGKCgFZNiF47mYK7DM8ocSdijI6VHF4Inct1dmUL
         THX1XIkRHTBGuhjTdxGXg+R+EWkpVTwQuC5v34A5B5wioQjFN9zkqm9TwUun/GK9+lqD
         1BZ/BYUxEQnuWgTxpAtQAfvkFb06hyBMigEa20TIwfTPDb86PmNGS100TTUdsgIkHhJA
         W8E2vxoQFVC0Yb7uJ/3Da9feLpUYjL6CflSS28+p2mC6a9jAx3q7sZKbmjLvlFA0/xGQ
         gZOOg+nF0b8g/yiOE4pH22eB1WGGhum9mgFBSs/LOsxvv6nn9MKEp57CkQ2O8qNRnW4d
         QXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084436; x=1750689236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjYWwMAn574NDA8zKjETWNZDW1d4gxcRMlquZ/twLmI=;
        b=XWvAk9Xpv/lZFiqFg+03JJON0rlgj4idCCnY+SqIpVzLCHkP0OpUDiNp/nW6+dv5HK
         ZYRLjgx5EBaBhpvIWZe35hdKKq6LqUjYSHrJXG+ZSMvKJ9iAy8N/sCZXKTFFhJboqLuq
         OpdcYR0xt/PilureKXrx3dk+8nLLp/arlRIOFGcNT4hcTFu5u1O8JsET1Opbd9LhRsrR
         2umnajTC/02J8nnx82aOQ3jEOQyyEBorBvb8Up4oYpzltHPQxmF3I1TQsKk2R5WKFQmX
         K1/V7z3m/zTW8L7XbHNsPdjmQ3ImoZOz7HAYFqJrQYevCJBbAxrupn8Q5Q9Yvi74EG6+
         6FUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM1jXRH+6QKEv1pDciEqYafjz7iMYZ6anMyDM5xNDKUP5Bno4QcWy+VwTcXC69hMNFThzYIZgC3eoy5PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nt3L/iWjEaNpXb8MwzipXivski8LrQDrv7anFOiNg+iAeNAL
	8KinC2oaLJ3H+t+RCW3/vVBjwnOTPzYmBWQ8hwM6snawSIuRpiswwwX5jVB3HUfmbro=
X-Gm-Gg: ASbGncuDyJ1SEPF7UneLJCEAUtoCUBn7opo0ZdBYrFOMdn4Ooijmr9XnAy4yCsrMjp5
	cSY9/qhuQR+gj2YthsX/OBmeyNksdrG2uBP5x3pIR5hJP+5nnnJJ2uzH/JH9WxfNFJJISpG1kA8
	KV+krAit0gtAbbw/CN516FaTEW3KTZEpcwaHIxg4Ni7nNcCWFlnWZWJI8QWkDh54YtP03+rRPRD
	cFDjHInLWYiO2/OU1TdA8rJX1cb9vGhD/r83iP4gOlSCpjqHDg1Vdi0HJc4gu4YTj4gytMX7pCF
	m7eIEHK9tqQl+wyh/CK7RZ9Z2MbdX7ns2TT8G8F9/pc3u/FMZla8NwmR/P+gEw==
X-Google-Smtp-Source: AGHT+IEkKlsjTJOZ7xD1hvpkJ6pL/BYV7+Qy4hoDku5ob31YSgbW7jPZbexdLG5gWcjm4pcq4o+6/g==
X-Received: by 2002:a05:600c:5013:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-4533c8fe4b1mr97134035e9.8.1750084436289;
        Mon, 16 Jun 2025 07:33:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fc6578csm77862345e9.19.2025.06.16.07.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:33:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO ranges on RB2
Date: Mon, 16 Jun 2025 16:33:41 +0200
Message-ID: <20250616143341.51944-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO12 and GPIO13 are used for the debug UART and must not be available
to drivers or user-space. Add them to the gpio-reserved-ranges.

Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a37860175d273..384427e98dfbd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -606,9 +606,8 @@ &sleep_clk {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
-			       <56 3>, <61 2>, <64 1>,
-			       <68 1>, <72 8>, <96 1>;
+	gpio-reserved-ranges = <12 2>, <43 2>, <49 1>, <54 1>, <56 3>,
+			       <61 2>, <64 1>, <68 1>, <72 8>, <96 1>;
 
 	uart3_default: uart3-default-state {
 		cts-pins {
-- 
2.48.1

