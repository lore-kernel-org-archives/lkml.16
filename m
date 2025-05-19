Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB527CCE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663027; cv=none; b=HqOn1y/A6whYuy6OPaevs9eKbPK+MSudwNoDDiSOlSnVvjCXrLBR7qB8pjM/A/XW97IT8MHOlRf6xujLMXOSPJ5XKsfd8NlETOgVwzIBIEqrosqyITaMvYijgn9n5OZLfPJTpsXF3A9BTyYVVTiOMzrTOHD7HR8jddPGLzhYu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663027; c=relaxed/simple;
	bh=rZgZ/8cZcK6GmxkP6B5Rj9Qd4W10PQ9uZM5AiqkSMww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k2Snj/N5JLbodNF+R2k1ZNlOpdyZWGynIgAj/bO3TCTPZtLpo5tVTNaM0SnkzjHac8i+zLbhDdAksaESEpRA5+oK3V9zJFJfAOq+BH13chnfhRxcBB8aV8Yj4qybElmhoNj1kVd+zhvvukaW0vR3TeJULl8bYRVkc3qZUfpg1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brEeSHqm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brEeSHqm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36f26584bso631652f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747663023; x=1748267823; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFCMOI9nPrYw/8JlYbGHlTlK1kDbm93jyyKWVu1S7sI=;
        b=brEeSHqmI7hIcxfmhmVyZhwO9GACtOr9E7/TFo9g7ndjHnUJhJz6k++Hn763PYTIPF
         x3L6/qBL7Y3+7saIBKqHwK30kOVG3evl84pshSVMsqGLo4e8XpIsLPi6Tu7FoJnaCGaj
         ygzQZpxNzQoOc95zE9A9WZZT9oFFkFAFUmwqDObbR2mg4tUx1rFFFyUuIZJJFofYugyr
         CUjStmT3zUR64aSqM/dbCIJ/Iup7ddEkHgQCTNQvMuk15FzFnmHQdwFt/yKA0FlUvFRT
         C8h0Fz+bwVVczsUKreOwP8gZI9VjPxW8IxUC2w1RPKgvnmpVJlDdti//lkKfallydPik
         ABLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663023; x=1748267823;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFCMOI9nPrYw/8JlYbGHlTlK1kDbm93jyyKWVu1S7sI=;
        b=w9oOeDexAc/KsB8W6kxElFvbSifqQ6Ms4zzigPgcp+9RH9HWCAHhmsf1HJrg89Bwv9
         1WSXMmkjo1Pdiu3f5qTCXg1Cy5FTsZt0jm+R+1MXxKk0Zb0IPEnamMsZxDInd7m5KL+v
         B9STre6XcT9ENv4twifIouE7GJKtnvfXEbywa3OPzKxJGOw7uyQC89uxT+RwJq7evQ1e
         JEZ5iMlVBICN1yOXO30wf+s5J1kLOqCDlyC2/hDHXcPwPgFN1BoJuIfILslQlRefmoMV
         fPf7hcMjtJl+TB/2vXt15cTeOqCU4hWlA89voeKJBNpyeBCMv+wfBYUH8qMzHdm59aGv
         Ck3A==
X-Forwarded-Encrypted: i=1; AJvYcCXSj6nTAa8jTvy55TRNzvnCQ36XQfBpJvukgLkAQ6Nj7Q2yOzDZu42dfnw94b6PW5JeTEeEnHZhFPyhR+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPBnFK467fmsHVMPvqyb2DZTKrl8OnVPTQ/1Mc7W2ot6W1X6bs
	TB5Da0U5akf8pYLYisaZBwht5X/G7mf98KmD1TWMHX59xoSyz9zdKHann4KNjOE96JE=
X-Gm-Gg: ASbGnculZ/LUBZSgkmpQMuCCMLSesXDkk7XEW7jaC2NP/fC2BixuxvbayFtAFw9Hlg4
	4UJgLYhVdCdCZJwbBUh49DQfFC8wNQIXQX1FO7ummnR2vC+KWc6Ak3ojN/sBDfPqcyHECnXhYMK
	9zRookoxzEyrlCKL1qByONl11OOf6C2XcdFSvrntjUE5t/LVHj6SV681DRR2Kp1SYNTz3QZ25C3
	4yXEdkwMwiBWUkrZGVkje8GoUz0RLGKRZYy5jsWaS8TZwXKDr7Td6ZSkc3OwbH0h4R9g5clEVoF
	b1qbF7zSqKABkj0+OAI1g1FmiNzuU3cnXiSp5ZRTjs9SLQsc0zvVafdAfrmviCpQygtQvLX4
X-Google-Smtp-Source: AGHT+IFBVJT+2kDAfJDajT8jkfNEiaJp3Qdp+HJAzDT4NXvnGe8YcuK9c2zTSlB02v/GqvZZG53/tw==
X-Received: by 2002:a05:6000:2907:b0:3a3:64b9:bced with SMTP id ffacd0b85a97d-3a364b9bd1dmr7824606f8f.54.1747663023523;
        Mon, 19 May 2025 06:57:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62961sm12732800f8f.49.2025.05.19.06.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:57:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 19 May 2025 15:57:02 +0200
Subject: [PATCH] interconnect: qcom: sm8650: remove regmap config for
 mc_virt & clk_virt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-topic-sm8650-upstream-icc-qos-fix-v1-1-6ace779250aa@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK04K2gC/x2NywqEMAwAf0VyNtDK1teviAfNZjUHbW1UFsR/t
 3icOcxcoByFFdrsgsinqPg1gc0zoHlYJ0b5JobCFM442+DugxDqUpfO4BF0jzwsKES4ecWf/NF
 WNI6OKyrpA6kTIif9Prr+vh+HcgW+cwAAAA==
X-Change-ID: 20250519-topic-sm8650-upstream-icc-qos-fix-17cbb5e7c6c4
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rZgZ/8cZcK6GmxkP6B5Rj9Qd4W10PQ9uZM5AiqkSMww=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoKziusvxmMmYLJtz6801A+fA0O7iUVXs/JZB0oyET
 lu6kuMaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaCs4rgAKCRB33NvayMhJ0d8DEA
 CT8YnsK44YmGN9l1B572Ym0X/qZl/qXLXuG4xNnOx2ypxGBqyZvCMumuiouOvc3cUHaKu2eeGT/Nfs
 FskXQo1l5IIGxNoS+VeiM1frl2XIFp/DIoz01o9NgiMA1qit7gnaUtQh5banEhULY8dAkBmyBGBpCc
 iDgr6+PB6gk6iMwM7hAepfAwLNPOzKV7tfN/31I7x/qz68b8eluftbwgwxuIGJEPbsDNdjJKQ5ovZU
 +cO5jk1XXaWMLG5R5ga6JQPNXSLMQfVIGmZ67SuqR5jeySVYvXz1RZNhnP2e4gR9gubAyA72AiApwz
 Qb9lQ07wzy8DGRNM3Ha7wFf/V11p1uaIoZeLCHEskbOdmPHqabVBzj/lYXAEdPkS9LHPfYCf03UA/J
 Dkw9DUjpchQUS8WAQXGO2mlSpzKMfOwoGIkV/UahKiKm2OXdpas0yoGmh8DkyWkUn9QbpkmjR+Qfag
 qwzwRK7UIUw2kw2hc1+O+pa4stsv05t4mg07BgszYywZjda1jHgH9GezOG6VbkaYwDrEiyYQpFWdDl
 5Sc24PmV5DuPCa8/onRlB3ElJk5VFRDuWHzz7qQOk0P+F1H2uwYoI6Kc3SCmPOzFijzVJ2UzSqkFaP
 gI2k0TAEusnHG7BAKv1Pbbf/rXkf0s/ZC5v+4UtusRYowT5CH87CJ2Wux5Cg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mc_virt & clk_virt nodes are virtual and doesn't have associated registers,
thus the regmap config will fail with:
qnoc-sm8650 interconnect-0: error -EINVAL: invalid resource (null)

Remove the regmap config since QoS will never be applied to those virtual
nodes.

Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
Fixes: 40ef9b6b778f ("interconnect: qcom: sm8650: enable QoS configuration")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/interconnect/qcom/sm8650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8650.c b/drivers/interconnect/qcom/sm8650.c
index 1eb2cc3bea672a01f88bfcf24fd82395a07ea36f..b7c321f4e4b51cbcb138e906e561325393e3e14e 100644
--- a/drivers/interconnect/qcom/sm8650.c
+++ b/drivers/interconnect/qcom/sm8650.c
@@ -1701,7 +1701,6 @@ static struct qcom_icc_node * const clk_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm8650_clk_virt = {
-	.config = &icc_regmap_config,
 	.nodes = clk_virt_nodes,
 	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
 	.bcms = clk_virt_bcms,
@@ -1881,7 +1880,6 @@ static struct qcom_icc_node * const mc_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm8650_mc_virt = {
-	.config = &icc_regmap_config,
 	.nodes = mc_virt_nodes,
 	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
 	.bcms = mc_virt_bcms,

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-topic-sm8650-upstream-icc-qos-fix-17cbb5e7c6c4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

