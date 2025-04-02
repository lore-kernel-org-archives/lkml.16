Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A95D1F2377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636602; cv=none; b=PVbo35HUcLAe2xtRlLX1ne8wAjMHTtmW6fAWfNmWgjt0oh0KpQ43PFQVbm2uivlrKP1zvhrrm+suPC83IL5nQm5RiW4zuzZv/k+AvSOnXd3iUfG+jPIUy3qZDJg4mK2X1coNleB9DGq/5iffjUs7nItTjyjtDiKgIQ9K4/LrZ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636602; c=relaxed/simple;
	bh=/p3GIfjBtSs6Jt5ZSdOfm26UGztzabxyhdkdEPZeYz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+k/x/XLKnhUcYgKhgcF/UfSwL7JKh2pfj5gZZfKe3LOMzW5007CXGtHKPwQceZmg/Tn7QHFE+Ktfcf0uxVAp9IH1HX2a+KamdivYbu01yvfb234dE9K2a/K8MWmQV8qLg1pivDAnyGbStylpaZhzJaiF7ZVSVBVGryb9WT/KsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFQM3dP8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFQM3dP8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so599917a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636599; x=1744241399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqNFWX1UH0kH8sSrQRW2FqXiCXFNIsTAW5BBc5AbyOA=;
        b=ZFQM3dP8QOXgpYPkvm5fbGtiklGy5JerHEvOYhQiuo4u6mWbIkb8IL/MxYvSamej9v
         ji3g65R4/7nu9HKW4zgMyIkct84WKqkJnE68tDy6y11QI0cYyC3inu1eIZB4mU1S6Inz
         BQZarAKx1caTGaypZsm70n7BU9haP7GViR7JdQOUtwJkTCo1Z5b2dZAeuKmms9PXxmoc
         Tm7yBt9dcs3UXANK8W6lMMiVGaSLj6X3hfnCqoL/z3j0OM736YB4S2cujk65ZvjESVuY
         dn900VoQG6TQBZ2RtdWvp1STCOC/hXjc1iOwWGPxfDqyoux7aLXV/jqlVhbxEMKH/T8d
         AVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636599; x=1744241399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqNFWX1UH0kH8sSrQRW2FqXiCXFNIsTAW5BBc5AbyOA=;
        b=DFPKWc5dVoPq+RRXe4n6jSZL+TniH5deOxCSQ7x+5blXObqFa+KNkLjdlqVVADGOeB
         d3hNFsWCiGeS9+ThxoYPSIHrYg2XEnJRcx4is2huT17JGxxLmQGnOhF/YLgW4fE0Mp41
         eEaW4hzZ0UCbbXF0qawoN9K4euOAchd9iaQ+K1fOQJwwoG1DElbCCpLuI0KqpvehQohr
         3IzrpZ9/1P7I4xdRZAFd/Lzd8Rfx/NlyRJFGfewSe7gs/cofxiOeK+nV6H9Nl/HaGDQY
         b8lbkPixCw6ltSjBXIOtYOkthES8+rPPd+Uzs9gzIVVIL8lhEpba7Pby7dExwOLpztX3
         kdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+EN657cwea1Ai/UxD16LQHFyYkJ7kRLZBNA3my9IY3wqdY/OOdR8phKim+FMzSU24+6QMEPhKBlsUp/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3de0OQCaMi6t0JgrboPv2M6NeyH54YQtTe4mcsJYOt5zL12Zp
	Qj/NPwTkPD1OHGH8qn8ayKfhqRIleq7b9KEzp/sIZWWMo1dmbhRP
X-Gm-Gg: ASbGncuO278+mHFNNoLEl4t0yo2dqg4g+HEzeU5hCFlHLgthI/mbH9OsGAhTpu2p/FP
	cbQNBY7v6VIHxiFegS2fbFaS9VZ62Flu6yXEspLd+UHeWlfWhezjOB8j3Hy8VXmith7RM00RSHo
	leXZ1WmVLjCrrt1MH5UHj+oOq9QXVP3i2aAATTLaNYbe3aHDWNBbC5APWgt66S1klJ3gttbxi+e
	uXdUEBi3XRVwMIwiidlT+9fB5LLBw8H6f0x0ZGclp1GZruG3JCQj+zyWzZYq9SCCaUdLHcUOHDj
	XU834Fj71T0dQOELSPpr7a+3tLr/7XteEWNeM9aPKKmkNF+CYA==
X-Google-Smtp-Source: AGHT+IGnGiWfIliwaSi1pT4yLiMseYWcPqwybsOXNa3OlZgExmwoffsmlGWGrfS88T8BpXHktrYihw==
X-Received: by 2002:a05:6402:4404:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5f08716b758mr317234a12.11.1743636598971;
        Wed, 02 Apr 2025 16:29:58 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a5204sm109593a12.66.2025.04.02.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:29:58 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
Date: Thu,  3 Apr 2025 00:29:00 +0100
Message-Id: <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743635480.git.abrahamadekunle50@gmail.com>
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 drivers/staging/media/av7110/sp8870.c                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..0abac820299a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	 * if it founds something different than string, letting it
 	 * to fall back to the old code.
 	 */
-	if (cur && cur->type != ACPI_TYPE_STRING) {
+	if (cur->type != ACPI_TYPE_STRING) {
 		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
 		ACPI_FREE(obj);
 		return -EINVAL;
diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..8c5fa5ed5340 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 	}
 
 	if (debug) {
-		if (valid) {
+		{
 			if (trials > 1) {
 				pr_info("%s(): firmware lockup!!!\n", __func__);
 				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
-- 
2.34.1

