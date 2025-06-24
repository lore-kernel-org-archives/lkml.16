Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161352D1F40
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775555; cv=none; b=LkUo9mqd/mmwKKDI3MJd2vB62aGOJwb/vqFmOXvNiKrui3OR7jzuG7QGk/p6aHlhdickzV5UWQI0M/USeOAWAgASOW85/3B85eo8Mz1NKjqoLP+LZdNsBRyhBPQvjlhbXwzxZhEbj3mB/DenB3d1uKcFwEERuiUfkWKibPdqLQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775555; c=relaxed/simple;
	bh=+D4uOP5vHeDxcBfKnALP9BU1U70aiP8xL1HjoKmbPi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alFQG1/UsgJTQGIq5eIAY48lyRPXBO6wsmvmkBdiFcDzQqaR+/5ec+pJrsNzzz6kSf3Bb/f3XvNxZBZR6+qlvX1F4CyDqO7sFt+tLNpZobTdZEWB9NxaeDHxm/mEnQEGzBq6arjQC3wkF0Q/GXaPHDHjgEggXQ4YyONdq2y5c6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E3iuHZEo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E3iuHZEo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3288858f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775552; x=1751380352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Su6uvjagrhQm2+A4aWPWKHya+70faQtybJRQwFqh2Vo=;
        b=E3iuHZEo1qd2MBwOsLW4xPg/WrQnQNcw9Co8QtOnkETssppD1IYMns/SWzOmiunvJE
         sXDBI+NXeLR3evRKQ3XZst8PXVTzKzP7Bt11BrIpxySPzxEH/jUguLUYY/5iKODZfSeR
         Kc/9Z+Tw6gRhTbLMHCursn4Ic59eo3YXBfusxm5+X5lDW9nAsb7Vj0CfVU7rxfENNo2B
         xhnkOCkEcXrZY4F0yyzK6uMZj0lRC5+oME3EY2kvGaFXwtdQc2KA9ixu8QVSKoE2QSBn
         VRUogYdD2kqW9sC27WnNw10HpZ/o2acksuVZhU0LWQztT+RwhlKEMBxMPc9nygcdJVeH
         8GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775552; x=1751380352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su6uvjagrhQm2+A4aWPWKHya+70faQtybJRQwFqh2Vo=;
        b=JjqR6cwp3f9giAQVxIvOvbhkZ9hJR3U84GHVnbJBoiMlzo8PhVkqAFoLIjWvouReaJ
         6giKuLfrjF4oSDv7Jaoh2b1UN4EA6AtZVu1sGANvT0XV7iGC1i8OBV8QeWwi+WTO6pNj
         8d98zRKN+ag6zvTTxdLrreDxhODpDNh+TOEISATsE6uxcMPIRohw6mkSwfo+ULF50ed9
         VLptB7s0/xGDhPodxhJwviVPTqtIyi17e307foVkBn7zlmUqSuvepVH7h8EpBcHM/IFl
         /DM8XrYw3YK1n94cHBzRDUfUpRbKnWkkGcEnqFGoB0CHgCc0sZrJqTyaNPyvd0ENPXJ2
         Wt7A==
X-Forwarded-Encrypted: i=1; AJvYcCUooSP1pbCTbhjIU+aeDYruXFPMLcuEmRStaEELyPnJyaRseP+zUIAYbk90J4PoZ1aosh5eypheS17uDz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhR7WNeCmyrmpIi2ceBMIe2fCfbEuHnTj/+otN4MwsA2Yav6Y
	szs3l7mmItgXAI6esGC3hgjw+OsCgG7T/T6htH+BMIV3MuJ4O8pZngZWvF59I8faJao=
X-Gm-Gg: ASbGncvLUF2wyaHyySdBVVPt1DZi0vmgsiMdxTiAg8VYxjjoxNr4IHk3EFVVFpwMmG9
	GubZ+UuV0IRQwb/DZdY0cemvTf1xgE0VgjNmRQ/ln4W2d6IFJZQ1LgmxJ9iKWwgdVVXiMyDv+kB
	9e7CkOEyoeIJcNlarcjz7kTpifWuoqwb7cP3qMayLpcJNEcaPaUxuKO/ev5dJADVvwzqoTIXOm8
	2FLeoYA7zr6F9VwFwIhxe0MWsMnFDmXLlQvZQ73554AxU4aJxze/hjGHAqDuWKtml8JM3al8zhJ
	gePHErFIc7SC3GM2jg3DdvfmLNIU2rMbooDXldqZItRnDBxfyjbhfeKKpOpnXT4JTCs=
X-Google-Smtp-Source: AGHT+IEqXp+4046/1a48emVv6WT4DJQxmL7NALHH1PRyVleJz/05O5wIr5faYMuecDyE7ZJ2se4mJw==
X-Received: by 2002:a05:6000:3c5:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a6d11910bdmr15012296f8f.4.1750775552199;
        Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:21 +0200
Subject: [PATCH 4/5] pwrseq: qcom-wcn: use new defines for match() return
 values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-pwrseq-match-defines-v1-4-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=77i3qsK8qByImTRYb4pkjjreQflQxYOmzaELISuv1AU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6J4keJ9TSryqRVLq4WC3+bSEZseJ5nqpe8
 M3As9C59KGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 cixRD/4tJVxOEb4GTPQqaMf4hfMmoPFTISVrXRdKDvzvP/b5etdhaf1p8cC1M6B7lM1EY+PHv2Z
 w+2pYEK2H9Y5Pcb5Xp+Y6+R+6co52Bs6cYt9hAFx5gcMMlT+pqgsZL7dv0C+F4R5O/xiD5BNI5K
 VSMrGU4/X44cV2vWMy+UKrwX1/LclxmXne6FGAzQYbtnTVc9Ih7zskmYRzGA9p1VQSHqSv0cQcf
 onW996VTqs1Dgho0f/60A1yk+nHFLhDeZfehyrCGPmfq/zNhnw4OZ64tk1VA+Qm3CnB9cetvSUl
 Q4rtCRYwa8r+vB/COWEVm0ZVTJByInGp/I4OZCrFQ/YsElf79EKxoX15+IyheuLCu3Fqp7VCrY9
 ZBv+HWVDSvZa3EPeGpViCOfTdTkA44HYmiA9DxKgz9QQYCQVP5Yn0opW7+sobI5rMZf0TAx6+I1
 qUEC1GHiB96dMQ/+IEe/OzpA+dsHAWuhEEEoj4Fko/A08lrzyKTorkdHuBYREl+51kgqxhIgc6d
 MAdo+EyC8tkiO7A+C9FBe/Pn3xKpyFry0XNnKLaMUdwRfeS//da9BTQq/k+r6C3JPYMFfYDO/nO
 jjcflV7gpIhEVx4KdYG2+jiIlCzR89FKZxe3XAifglZpWmGJfZ0g+cLdM7k0Pv82mDdJ9zU5JeY
 FYLiN6A8e1oUI/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the magic numbers with proper defines we now have in the header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index e8f5030f2639a69254ad5efe0a313d2f3d10fa1d..f14801b4c28e53c5905fd2345b773c2aa96af44c 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -341,12 +341,12 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	 * device.
 	 */
 	if (!of_property_present(dev_node, "vddaon-supply"))
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	struct device_node *reg_node __free(device_node) =
 			of_parse_phandle(dev_node, "vddaon-supply", 0);
 	if (!reg_node)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	/*
 	 * `reg_node` is the PMU AON regulator, its parent is the `regulators`
@@ -355,9 +355,9 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	 */
 	if (!reg_node->parent || !reg_node->parent->parent ||
 	    reg_node->parent->parent != ctx->of_node)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 }
 
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)

-- 
2.48.1

