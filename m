Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D482D1F72
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775554; cv=none; b=jhFNAIyoGTC4qhHTSraYqPwG7UObP2OlvXa1WbDRLsMhC/5O6wyP/KXcoIghUBSWLnxm6zl06djRX42Ha4lnVjIjFKMf0tMCgdx8j9Z27lRrfWTzV7ss880tCGzpdk2nR3FW5JYjN6xsgwzb9Stu0OCEjWy3kUezKwKv8Ln2WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775554; c=relaxed/simple;
	bh=tcNUMicj3q2TZD7z9sDFdteTWDh+GHAvsTNL8/OskaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiLjUkzqSQUQ8FPy7oC1KFgVlpOisXAYh0ki9pAq6sdf2aoQQ7lNaBpIPcy6TC1UhFlcaqjqi0CNTGqbzPgdXoqR4Q91oI2HylQuWZNBUNfLQOoBAbYiZW7AHXur+qjHcgqBBowvi7q7hn9rBbSgxXY1lzWyCtwcE/HL3iJfCZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TETDxPIL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TETDxPIL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so29979645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775551; x=1751380351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uw4x1TQGrA/MBrQhecsgMke6peLxrAZP3r5KIxkbAtg=;
        b=TETDxPILO55Ud+j3nze9oeolKb6BqHKX6phmmNUG7U+lq6UFdqPhhRjsy/SJv0HTI/
         SpVIJ5oIVWSCSSwhMDjtQGGekrRJAEw51PyVu2JFjrgYNbnKOpCqlD3oX2QQDuI3Mtfx
         PIs4qzhBQXH+fBVBMgvbk149rlVz5LDYKEB/n0PIzFkA+O1E0Udy195M2ShyFwLKbrRG
         DEwqPkRVHIjb9sEcF0me9IZpyTGRV/Fb9MeTER0V6APYOELWmxu4lRzqGX8iwaJCddwR
         +kdDiSy+HBixZ+18KJzCc4nU0w9xTwH+kolAH/cxXbdHlM4icORE6aPCDnn5kjH/7e4W
         ruHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775551; x=1751380351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw4x1TQGrA/MBrQhecsgMke6peLxrAZP3r5KIxkbAtg=;
        b=Wvwwybc63LK5MY7npJr1yleDpMHWWi8tLfRrL0IFubB1KcOHp0wHz1pVrTx8ouRyPD
         /iFF61daNiNitN2WXnBQELCdHjt8Y+ZF/blebWh3SmlxlYYL0tgnk17dRRmepRlgTUGg
         YLiQoydqL7htDo6BN5FySVLbY7LttukFfc4I/Km3MZj02zAr7XVZFpcDmAoGTon+fYbK
         plOlEZz2dqtE7dlNDaHrljCtksjctQSwyPvg+f3IByzS//79e6MG5nrEJETctzSD/s/E
         RMCTFA4AlaLpuD8k45g9sVawInJIvIXxwmlefdEtFK9IPDH/Y0u+0d96Gm5WBprGjkFF
         TdQA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+sYXl6bd/h/qowZQOZNSr7XeWqnQdQDjHUeAyVRENuqKYNQNXuf8HVUjKxn/ESqw/oz84kdqLNOd8ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIknOpcBGoxD86YyjH4q8GS3Ll+sRqXbG3uEjBYOFH9QEwXgUi
	LiQSB9CJZ90N46H5LmBuj1BSkTIaZWbEvxwijvUN1LpaUgGCWhixvYRU75zPODmlE+o=
X-Gm-Gg: ASbGnct8xLyFIXCR4krWWkfzmVaiXP6ZwXbH0DTvlakXru+LAEpdzo8Z6SPlnzqpfp3
	JyWEbVcHEInxjMxllMAkYr3M1VDLFQ8S6t47XxVV1JiZU6nKg74TNXb+qNoVUptWo/7CAkrJHlE
	LQYwnwAIIV+mg1LRQp0q19sZGLmxH5OxoGJbMWg+n3T+HgqhPzTPuTfQxiR4SZ1CwmoM1xwF4CT
	Kjh1BlqTVKZbOin59+xa1WvAUvg1/Hcga4U/4sG1mgqNeWf6K0rVpnKPpdGveCZOV5jD9qOeXJo
	GH3aCvIjSbYaKHuNPeGD+vVYzNyIxLDOG+SSW/rPRQpokgM1swQ1BA6fmz2vJFSGTdk=
X-Google-Smtp-Source: AGHT+IGnv9OAm6kU3yC9OQdJrsGHg+VSoZWXLELg2p5G3m4MaLGEgPnmo4tXgJNKP087uSEZKo6VwQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr147580495e9.21.1750775550906;
        Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:20 +0200
Subject: [PATCH 3/5] pwrseq: add defines for return values of the match()
 callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-pwrseq-match-defines-v1-3-a59d90a951f1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J8hhxEPGTDWzHxMDIGZhdqk+RbnXtaJ73h/HNS5w2Tg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6545ElYvrc1gET2OFrM9gsPHxKk7OK16+E
 9Xxp5PPJKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 cldDEAC9QFYvQdgFCGmN1OsF83q9dP6J3ttzdmws4vnanU/xhmtw5AvNBLkGJnyf4wiuUnhY9mS
 LsUBGrVxyeZlPf3WACN8cUMUqb3hhQY55Qszvh7fRvs0I2OF/OCai/HLPvzX0v92HIYJ+iSR6We
 3MpJmzSDBWEXsEG8Hhz0bNys37m9+IL+PlWbQ68d0LfokWAUpfXTwBUa4+jwQMKVJcrGCyTnu8r
 hpHAEEwMRHRMsWt2i/ifysJANuqldhaThp6Rny0pK0Ymwa28RP445JPMWqGK43wjhO/e6y3RX21
 ZvM9Qs4uP/EEzMDEVzFGfRYfq4GpNP63Q9efcGYe/tohWCydW2dBOYVD1ZZ2tVu4bauoHpamPyB
 64HT0qbLoZA1CIUYyXpwY+q3zUwaHeJcKlK8EdM3R+PJnSjXb1x2BB2V/CqC+01JQ8nJG/CFzR0
 pop1bz38H32jBaud5py5CTPMwkztfda0zwstBFJuW+YyZk74gs2wRroCbE4hVJKtbSvZShBpC61
 d1+S20Sp7XJphn2nm8HNpOIm6T8WlSdpgwfNHJyKY5p2obqwPJhvS/tNbKKVkGNE/MO/Nov3kkG
 XmEonDNdAVE+6z+Z7zXH4Y6rLyOJ0MjOygcURMP+OB+XJvBdzjJcX/JgdMYzQ7ehCkr0JWgeXgq
 +V4Rib0enUeuJFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of using 0 and 1 as magic numbers, let's add proper defines
whose names tell the reader what the meaning behind them is.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/core.c | 6 +++---
 include/linux/pwrseq/provider.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 0ffc259c6bb6c8333ba1fc5e6ab43e42ba0d3524..190564e55988557940206b059fef52981bd49e5b 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -628,7 +628,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 		return 0;
 
 	ret = pwrseq->match(pwrseq, match_data->dev);
-	if (ret <= 0)
+	if (ret == PWRSEQ_NO_MATCH || ret < 0)
 		return ret;
 
 	/* We got the matching device, let's find the right target. */
@@ -651,7 +651,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 
 	match_data->desc->pwrseq = pwrseq_device_get(pwrseq);
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 }
 
 /**
@@ -684,7 +684,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 			       pwrseq_match_device);
 	if (ret < 0)
 		return ERR_PTR(ret);
-	if (ret == 0)
+	if (ret == PWRSEQ_NO_MATCH)
 		/* No device matched. */
 		return ERR_PTR(-EPROBE_DEFER);
 
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index cbc3607cbfcfeb5acbc94908a1eb4a861159dc41..33b3d2c2e39decafac6c6fca9254ad4329d90e94 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -13,6 +13,9 @@ struct pwrseq_device;
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
 typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
 
+#define PWRSEQ_NO_MATCH 0
+#define PWRSEQ_MATCH_OK 1
+
 /**
  * struct pwrseq_unit_data - Configuration of a single power sequencing
  *                           unit.

-- 
2.48.1

