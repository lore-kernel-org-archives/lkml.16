Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74361B3922;
	Sat,  8 Feb 2025 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991827; cv=none; b=ASGYs3IBju7N42PU7B2GJ7KOegW+PLV0bJ8JxAr2Wwhg0Fi1Hrr/Ir5V4Jj/0AtQcrlczZl6TsZpYCRxVqT/OaTfdr0fAnHGjLltL9Gl7HqtBjgb1rpFlYQdwr7/+lR24rGZou021ID/y+rtk7gVkDVJyoI57cAxhbdSs7I8VkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991827; c=relaxed/simple;
	bh=lmhfuJDeNTjIlJTma8WvjlJSgiyHo9d5BVUAl3W7jTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4iMIsBuoR+RgJV3xezUUo9GhAgewHNFrZLW6QOcQF5WFWfMtqQWAD4tbTGA/RMKYPB6kQdZaSRa7EJYgtruK3YTFfDelGkasBZHa1Prmp9QSK4J/o3Rumj+Hgv+xdJQtAWv2u5//5iqdbzZTgVLvAlyT14Ldy8ontERI4rDTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMqPv5RO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMqPv5RO"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5b4d615362so1062259276.2;
        Fri, 07 Feb 2025 21:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991825; x=1739596625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYmtWyIkQq37U/LlTeUKDeWLlebq2kAcdgNlDr4ssg8=;
        b=HMqPv5RO+4os7J+Pe4dkWJ2vpJzoAEc3WFXlF86Ph8exhp9R29FDwAvxh+bAAgahek
         Wsp1omazxFSGr+nmlxR7Zc5MbSvOJlpIgLeZSK+nHcA1WFo+jpVhc0lVGajaegsp1FvU
         RuvfL/cUnwELo1zJ9jQWShynpDuxc5sfMcrVuyrTcWsl4PW53y8+whESCCRu06lbCmHm
         SJFtOZ5XxhCGOeosuCG6e1muNUbvOvXOTRBUKjUD9KIBGBsvq7TGZvN3xfVIkVrE89JS
         QI8+3hr6IBUbsNbdx4XdXcjJch+n2Nubl3c7C4+2hbjgED0Vx63pK/WTRJF9oTIs5sCb
         w1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991825; x=1739596625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYmtWyIkQq37U/LlTeUKDeWLlebq2kAcdgNlDr4ssg8=;
        b=VBF6utCih21prv8MSl8sC8gH40OcAWEWfToAoTKGmL7B22hIZbJwGdrzvGoSLZ8it9
         aSco3IW2BKGZWs1djUru00+egi4xYKJG+QP4mn68PnD1Umor8jD+vrn6sLzm+y61F8DC
         shechbjWn288syi/1NzgCr5vx9wYI4o6m36yXsPuuRE2VCg6NHABH4/CE6VgGjnvwMgV
         4g9kSki34oNd8u0kJbXoGtru36O3MR2kJkm41xoz2vd7+7vP7bXra9CXa6xifSFhIWyW
         rZ9wDXuuewjRsY71GpedrMk23HAx1zkwugamxIdUhfjj2YYPSaHq34fdmrvIqG2CVPFc
         4qvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx45lBDTr+8LrrqEBqIcxV/Al9sBuCQZ4iZLn3/ci7MkXsez9g0fDiTuDqiIN+p4fhI6wT0gAtDxHOyIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+GlAKh4Q+TIPHVsmz5Ph+DAVvPOGS7iJmOxG0cfbreEWFZcG
	WLoqd6jd8lv9Tepvtv/HgFWh9npJWBITYtqsag3n2qjugnGLqOtB
X-Gm-Gg: ASbGncuTkAIkQfffctu8E5NesIyzTloNDceXJqGgQpsLqYbxLADIJfAz1ik9R3e+Jmg
	MDIYik84h9Ve/YwYeUnYEYoFGXtBCAcRpjBYivh747d0Ke54G5I/Sx6ZmfZC1Y5SNglxentaavX
	9FcHMnlMyGl3Agt4Tu9XEKcDj0JgQAVizl4MfX5Gj82iODHHdeEETi05PKTOGWTE3dhx0EIs/XT
	PhoF88lX2J+Sm83zYVhCNABYocEKyWZiB66bsoOMKxEh/hQ7cMuapgw3O0MgZkdHPhLW7jnu/LQ
	jfKgG8BaA/zjYetx6OxPpqk=
X-Google-Smtp-Source: AGHT+IGW8in8FCTBqeP8WWUMYlcfcijAg3QlJOLFHVjT+rc0fmVMVb9cuBPAeBQ0yHB8aQAZTDz82g==
X-Received: by 2002:a05:6902:1ac5:b0:e5b:3af0:d4bc with SMTP id 3f1490d57ef6-e5b462564dbmr4605343276.37.1738991824923;
        Fri, 07 Feb 2025 21:17:04 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:17:04 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 06/10] platform/x86: alienware-wmi-wmax: Add support for the "custom" thermal profile
Date: Sat,  8 Feb 2025 00:16:10 -0500
Message-ID: <20250208051614.10644-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208051614.10644-1-kuurtb@gmail.com>
References: <20250208051614.10644-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All models with the "AWCC" WMAX device support a "custom" thermal
profile. In some models this profile signals user-space that the user
wants to manually control the fans, which are always unlocked. In other
models it actually unlocks manual fan control.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index e8fe16da036a..0d31156f43bb 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -30,8 +30,6 @@
 #define AWCC_METHOD_THERMAL_CONTROL		0x15
 #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
 
-#define AWCC_THERMAL_MODE_GMODE			0xAB
-
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
 #define AWCC_FAILURE_CODE_2			0xFFFFFFFE
 #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
@@ -174,6 +172,11 @@ enum AWCC_THERMAL_TABLES {
 	AWCC_THERMAL_TABLE_USTT			= 0xA,
 };
 
+enum AWCC_SPECIAL_THERMAL_CODES {
+	AWCC_SPECIAL_PROFILE_CUSTOM		= 0x00,
+	AWCC_SPECIAL_PROFILE_GMODE		= 0xAB,
+};
+
 enum awcc_thermal_profile {
 	AWCC_PROFILE_USTT_BALANCED,
 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
@@ -576,9 +579,15 @@ static int awcc_platform_profile_get(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (out_data == AWCC_THERMAL_MODE_GMODE) {
+	switch (out_data) {
+	case AWCC_SPECIAL_PROFILE_CUSTOM:
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		return 0;
+	case AWCC_SPECIAL_PROFILE_GMODE:
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		return 0;
+	default:
+		break;
 	}
 
 	if (!is_awcc_thermal_profile_id(out_data))
@@ -666,9 +675,15 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
+	/* Every model supports the "custom" profile */
+	priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =
+		AWCC_SPECIAL_PROFILE_CUSTOM;
+
+	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+
 	if (awcc->gmode) {
 		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			AWCC_THERMAL_MODE_GMODE;
+			AWCC_SPECIAL_PROFILE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 	}
-- 
2.48.1

