Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B328CF7C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880131; cv=none; b=cOyktw89BpVNcSup/zf9dzijzgSD0jTEl+i+TyXnYvu/60bo2n+TGNHRcug9J4RDzeQt1wS8VB5CxexMWxRAqsgb0SEBWzrGU+ZohmXgL3fh7mGs/JwMrAlZindLQoyvmmO9TqDT+9UhbpEgmcrHE7hNSgeDnSJauILFl/2ZGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880131; c=relaxed/simple;
	bh=9CBiR9TOWCnKgNQi8KK+PKvJFP1JysS8i8mIWb+NpbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5x0QhMbdW24K/oeZCMrvba9FjPFHKp3d9q14sp18cQu2Nyc2yMPJ43f3SB3kJBab2GYofO0mDuybUETT0Vzu1qv9S60niiWgU30tyVQP/5W/pN9NfvaVkikRnFXfBi4upvFOwUAhvnUFEb77yL94NnFn+lplCBJS7JEdih2pDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y0i7U9zH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0i7U9zH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso470065f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751880128; x=1752484928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/RGT5HGBF+8VjhFRui57jjPUPIu0aezjJFq6MnGr2Q=;
        b=Y0i7U9zHjV3m9cOBRDDBSijrVlffvSqGB9Em/ZPdOhU4XpFVWKPV8ohOWFiG2cOVKG
         F7jeMDh+gW23wy4r/pVVZ7OKWQku79w9DG9OjROr1oD+WpfB1CGGJK2PlQvWxO/1f9FN
         HrN3sNOKcMjPkftjbiFpOJ+XfYJ+uwAjU1kdmKtsUDJiNqo/Q1gwhVbDSFL1i7mPl7gS
         90cIGxj5rRcNVo/wa9WnKCLSnibsSSOtAxW9VKP875uqzcqtxjFjgC62XScQWUuMqdDJ
         m6DR9tW2W4h0de4j2y97RpV98BmS1hV5PgAaAHWr1xxz9EfRJGOraa8ZxeVFvzrZo2/O
         vqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880128; x=1752484928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/RGT5HGBF+8VjhFRui57jjPUPIu0aezjJFq6MnGr2Q=;
        b=TEotap7FZGR8H1AxRUt6SYUd8NkXA3W41kD51SSO6fIuNnYXbemzOkvzTWDIhQkVdZ
         yEejU4ZjwYegs+i6CWPfYesVpKAl/WJ5a6+3KwXF5WsUUDWu2J+jEFb1OEl1bhCuC7JO
         qeKFsnRUh/yLrP+jdRIrVsHZcOE7WQ2Pdi/roDhpViVouaIzAJ+La7acFoqNN6JNB6W7
         klM2YFYMONS5iCb7b4+umgVVQE648aSPONzy+WscgnM7DSpXKWftX9zOOahDcNa+lqVH
         21NBaeNuQnYeeRhATkBjpiV4DdK8XvQL2cyCUZEzhXxgAb2Nem0FQupeJHEwJo0RHPAj
         qokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyy7b7F+G+wTBx5K6sMYSC/k4x+tOmusdi84gmpIOTNy57efxhrnWh84hXFHHNmJgXUy01e3FLGQa2aqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC89L2+htuYpDa4K4u8c72f8JvkABmMOUOKUJfkuh8RxdSuOMc
	BfuW2eHpvsiqg2I08BMeIlWB+EbgLu+rkOf7mvX0OIkRYIFX2gT6W74xByjYo3j6GeAlGeVfwCl
	+c0M0
X-Gm-Gg: ASbGncuseIOD2VBPGfL35tY5E9PIxdjEwezgjleEubom1f4eBdi4cpCyIOX4oxWDjVU
	7qPbYwLr/DnQwfWvMNcmNwkhJqWC0dspwgaMC02ES9nXB6Yifm2+FIKoATCfVbMSCDehQ70D+OL
	F0y/CetL+CPek6ahjiPfqtaJrwhc1qvSWmZ4Y9tKcGjczqWPLqeOWmdIfkHC+CG6r9kzlQavbWC
	QSjKQNk1xYGcT2w4Qb2qEc2veh5VDqUtK0o7LRTgdZ0Wk91areUbsRjoKGqI/Sr7b5TWK9r8G+R
	0qkTwLN6SdoV9GvRNI/hVIvgyG3rk20feshj977nPP3t+XUFbh0lNZD83RYIaH3MP9xiHjFRryU
	=
X-Google-Smtp-Source: AGHT+IEmtBu6YeZKoKQoiegI8X/Gknyma+eZ6JqiTsHUQ2DPjssPW5sDnI5kUumTkTjFeRMOXlB7pA==
X-Received: by 2002:a05:6000:2582:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3b49660cf7fmr3536908f8f.14.1751880127510;
        Mon, 07 Jul 2025 02:22:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470caa1b3sm9453446f8f.43.2025.07.07.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:22:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dev.tailor@samsung.com
Subject: [PATCH] rtc: s3c: Put 'const' just after 'static' keyword for data
Date: Mon,  7 Jul 2025 11:22:01 +0200
Message-ID: <20250707092200.48862-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=9CBiR9TOWCnKgNQi8KK+PKvJFP1JysS8i8mIWb+NpbM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoa5G5aTFUfeFtggW4NUSSXknQqlLnRJGeXM5E4
 0cN6JK6DeaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGuRuQAKCRDBN2bmhouD
 1znpD/9Duh8C60/047e8drJ3MdCrHRGwxIIHp5ZZi1uwZ5cb7XVJoHylKxZso4Oey3EH2Xxw9/O
 jtQlJ1VgP386O73+AUMMUs40Y9tnZtpAZFzjpKHALNSeDeCgjnZyLKt1vZjsi6V8c+45Z9UcBVt
 1IpulK7zTzW8ZZj4HuK737DgEQdDsRe9APMxSvB2gXaq9iQ9CkB+f8DOYcNf/rqR2XMoAcl5K9M
 FWTfnFW4VrJv98M+a/P+kU6EtbZw7IbMDdZF4sI4FgOSWvY0hp9X5Cad/64JPUfZ9VaXD0qONkD
 k/I0mfQiBUstgIO8PVmqtbwgFQn7bzU5eutyvNat3KaJWtH3kH8KKMwte84BCmg9NGI6L7EfqBZ
 aLgb6UFyIJf/gleef5gsbL/vJSEg1VutSNenIiY6OfVA4LqDlG4rRD3LV10ivWa/mqjD6x6gpkV
 v+D2RHivRiMGoZSxzDb3GUmkc9xt+0MlVameleYkEea6o3J8vosHNZrYQYZ8CirZ9a0y7k2v6CX
 jDHmbR7Dkyu4V6fSRaJ2BYIKWAMigPL+E5Vo4UfFPGqp2hT/jREW4e3XNVkFJ0F5haXjsby7GgT
 lttMLV9FBlG5HduFM52TGHCwpF6jwF10OoimHMKInqhf8nv9ChDCdt3TEjIptFOaoUbxTyGfmMm Pv6dcfhYyLtyAHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Convention is to define static data as 'static const ...', not 'static
... const' because of readability, even if the code is functionally
equal.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: dev.tailor@samsung.com
---
 drivers/rtc/rtc-s3c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 5dd575865adf..79b2a16f15ad 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -549,25 +549,25 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
 	writeb(mask, info->base + S3C2410_INTP);
 }
 
-static struct s3c_rtc_data const s3c2410_rtc_data = {
+static const struct s3c_rtc_data s3c2410_rtc_data = {
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
-static struct s3c_rtc_data const s3c2416_rtc_data = {
+static const struct s3c_rtc_data s3c2416_rtc_data = {
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
-static struct s3c_rtc_data const s3c2443_rtc_data = {
+static const struct s3c_rtc_data s3c2443_rtc_data = {
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
-static struct s3c_rtc_data const s3c6410_rtc_data = {
+static const struct s3c_rtc_data s3c6410_rtc_data = {
 	.needs_src_clk		= true,
 	.irq_handler		= s3c6410_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
-- 
2.43.0

