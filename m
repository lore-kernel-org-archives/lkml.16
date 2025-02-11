Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12EA1F473A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270439; cv=none; b=mfuAOliStpgy+QXTOqT5Sy0lzmBxq7PzoU0Kro9qfd0tB/RRFM3/w0hmhhbfdyK14rwpOXffuyKCo0SEp5q4IWEf2+KktrLS8CdTOuTo11+NqbTN0M9XLaHsfygDRSHGJ95MsP6ktEPgIrlGyv2QTgPOemCmoEnDc7SrqYbbOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270439; c=relaxed/simple;
	bh=6S6BweEmDo/VynxC5DONUMwGqUviGcu+Inb0ObpOghI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvcr0Y9qu+JHNxjF/2cw7I9iU51mrh8YICuGs7sWnUOVAeFYCljouTYeBRO5VTqmWW6FHQ6zkYFzlSddIVtq0pcZ6Gk6dp0SRgZe7X0fTYSMAFjePdEvtsZuapBjDyH4JNgblDwSgNhZ8/ObIaWQwzixkbxJQGACglJDxlsLwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jjM01zlT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jjM01zlT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4395578be70so2820365e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270436; x=1739875236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
        b=jjM01zlTuwQ4d20lMhVgePiT8ShA15/w4waFeBqev9Qs748IeFHv5fcD4Thcfj3ZYQ
         aW68aMuWE4Bk9BUSD8nH/zZesd6RQK9wJ006TzSwko1NPNOXjsoi7bG2ZNDrXQL4AOWo
         hxeZKCL0S40fULosgzL51Uujq5G1p6JQdoJWIhhYc/XMz+vV4mPZLPphxX6XqqFvaNpc
         NB9TP9DSvx64TmAauQvQIwHXhgyRibKlVTyM5mzKGcJUXseHnbRZ2CmTMUSQI1p8iNT6
         QbZ6TAyIHv9NtH25/FjRYBgSwNrEbWemSpSA0bau3rDiU9HCPfTGCferQPwWfGLAIHzY
         OSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270436; x=1739875236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
        b=Ua+RtPI35sCpLjUAObPgdgDijEbTgOT+wM2fQ99q0q+z3Kb1HcRn3Q3a8BeSI7KHP1
         OLKryHnD/8LH5ck6Lec1HA5p62xOXK6Kc9Df1i8m7C2zzV7iIdVvnPxvlsRRhHdxUF6Q
         GwGbTR7r2Dsy6CSwVuP+rwTAAneVf1njnT/dcC4vxNBJY5bUuCC+Rr8vhranKtJlba4r
         56vB5oYDW+nH9WAhQDyfYgc7L7G1X3Xt7ONUJ8CpW0riG5lm+660f7AdEPJhd1BiiXww
         jv9fQ+4KRaLJIIgMtbS5LFU02A2XGn92v8bEqrFBsVz0/CzV6kw7w2/lupJNdSi7cmQI
         lETQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdHTy79+ihKyTWZ6YxKzXq2+iY50Z5LucsK9Segof4Zsx9HQHtocVMjhF9Ppc52vnkMMGS1iqr/0pGwTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFEmVzrjeIVCOcZSKSiCwNeASmSUdo71MTOdvbmznokiCyLk9L
	uxk4I9kchz4c7pbzhc7AI5tljPhVK5guiSwuEYNgzpgjDiRCRJAiuSB4TAAWvm4=
X-Gm-Gg: ASbGncujBJ/oe+btQCw5xg6nRpP/ud0VN/lM+1u1ofIkmvtxuLPbwNo7XnlohaoeYNJ
	s4Bay+Iw4GHGtsBvx+PsF53CUJacy+HdJ7svFzIfC1nk1iIWqqPAfwArANpmXFqr8czwzDSBlI8
	pnw4uo1uEs90R1euLSGoMI+4o0bdAksB3JKAWVLH9jpeA7wEOYea2fZaGD97rl+kUIgwgmgGcHB
	66sb+L1j3O9FdZ4jwNCLPJeSvFOgAH0+t3xIhdC/RIxZsv9Q5yRxZEKdWlKwdZpYyJklA1eE4Y1
	xXnSBX/Z2BNd
X-Google-Smtp-Source: AGHT+IE1hxIA+zty0IDfgAoUxOjIOrc1e6B7eBLp0wuK/35clgp+dxoPGKaDdwuWgNf5QUZVkobIVA==
X-Received: by 2002:a05:600c:4e43:b0:439:33c5:386c with SMTP id 5b1f17b1804b1-43933c538ffmr110046565e9.5.1739270436244;
        Tue, 11 Feb 2025 02:40:36 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/7] coresight: Only check bottom two claim bits
Date: Tue, 11 Feb 2025 10:39:39 +0000
Message-Id: <20250211103945.967495-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of the whole register and == could break the claim mechanism if
any of the other bits are used in the future. The referenced doc "PSCI -
ARM DEN 0022D" also says to only read and clear the bottom two bits.

Use FIELD_GET() to extract only the relevant part.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a669872b4118..7b53165c93af 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,7 +129,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 {
-	return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 05f891ca6b5c..cc7ff1e36ef4 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
+#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
 #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
 
 #define TIMEOUT_US		100
-- 
2.34.1

