Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4123BD1F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733655; cv=none; b=REoaMIsEBoMTcVXiyBdHG5Xr39oVYKmV7ORUysHTQxtk2rmDC3w+SioEdPgRqjlnY2aqK+SO2Wdoe2rmFtFF5Tq2gkiR++XupGftWWt+y93EuCXLUzmUrvdgv9BEYIMiOp9Txvj2yZ3wtXhqePU/XADUULx3ttnULo3GqVxdFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733655; c=relaxed/simple;
	bh=z6N1TMabJk8XUstMPq0jYPGGMmny/6BK+fsPOJYZ5CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUNXQi+O6Y+nnPjee8TgMDgDpnmP4VzTvtsVbjib8Z7O6tQzbIZzmFbba//DS904q3FqmaZDAKBcFTXj017fANdz1hjab4Sp7eHdjmu5zN801SVblde5r0A9G71cm5NAAwKw+lckE6R+7fW5FRcmC66WPHenECGGxIjcFGkmcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0auFR2q; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0auFR2q"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55342f0a688so69042e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749733651; x=1750338451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCVYnr2NHXP6YD4R7dCQrJMSmoXGQWCXxHYKeLMW5Bc=;
        b=G0auFR2qLEXdjYxnS9WX54xv/bOdEO9CGe//ke8upTBnp4RpuguQr8m6NPWQXoY+Q8
         vqu6GT3JvXbtSAU/QoBsQo4EGHkHrenpvfUmMW6gHpUFXzSIRTY3xn9Ba34acA7KNv3J
         QMVBdFYHmzsfElzbxkclTK1HvR9f33kVa0eIGMpQhVYHYvrXyvBK7ti5nCWrMiHkqb8+
         8Rh2epcQoRa6/4SJhU8mgVRqJSSv9KqOAyK3upf4EMkrNVyN8mn5hdz/uFwSr3gf6Jd9
         d4iivEP0oCf6x2goGDlVB4PaA12TGR5/uVecESSjouS0UUp2ksSwvQGBhZzct2btTn35
         Tiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733651; x=1750338451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCVYnr2NHXP6YD4R7dCQrJMSmoXGQWCXxHYKeLMW5Bc=;
        b=BCv2eYLNHwJQz7Fq5euoT1yyLbYsO8dpJ3VSFbre+CbzOIBQVEH4plS8cBnktcj6+Y
         r/c8v3sa+8khux55xy9Ck4uhFaJSaj9OWE3TXRkiSK2xWomCjNMqLiO2CeQKTOtSacTr
         UNgqzDzYzJxWrx0U6hSSYS9Q5jnLM5sNiHmB4TTqji31nE+lEMD7k4t1ZkR2T+DLbnh8
         bMmtHCdXiRM+iiN5xjn2Gy9YrgisQyFxqPapI/hkskD2u+uYJAflTU9CcUt2cWKCbyhX
         vzk+LFBgcIsTyk2tyfLozovacPkF6yLS1ovA9SVAJtePVVPGnMnxq8GWbT6zESISSQOO
         VZgg==
X-Forwarded-Encrypted: i=1; AJvYcCXUATdfsaGiDQmqVboTI0BNuSSUGQsT94V9vxUVOkVvX1hC8bzaQpii58obbe5A53dMQgQS8z+qYNeaMfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl03diRktsnYMB2zpAptN+Fr0PPXba4qrqY0czLTvdO+cFLzay
	qYEpfwaRrys4DjezjaWqOXAnMo3m1eSibctij3WtcRlQ6u3Ja9h+mlJxbdyrrbfHxp4=
X-Gm-Gg: ASbGncsClBdIuSTNsmg6ucLPvUNE0wWuVIanR+z58KKULewgKMvANxcF5iod8cdGDQy
	yTdrrIic4MoCy8hHo/GgmwYqYKkRa3IGGxaXP0zzot/6OFfSS5MXtlAevFcQheO6nfMeoAJclpv
	IB1ErAzSkEd/oDH61sfvRupMfw9E0304NNlhBKl63CQMnQ2LWajdiMfTUZgHbrvMIecxtb3QfD3
	WMIEZ76r1aNQeg69gk7rY3K1nn423FFAwK/qzV1BxduwCjRCSQsw4oZX0bbJKfT3MaF7Ct9mDe0
	W6A8DYLQkDFfHxT+4moIXG4GsC1m6kUXQ937vxlc5f4nWDc+Dtn74hqyN0BqGM0mzIkVvD2Y7gQ
	oP0skPUaFAelr6tVUBJKefg==
X-Google-Smtp-Source: AGHT+IG99wDY0vjvv6M/1KtXYegvp4C3S75fNTyHcxKq9q0WZeCKaCu52C6L42UnkRUNGviHQyf8og==
X-Received: by 2002:a05:6512:e93:b0:553:a889:9f0e with SMTP id 2adb3069b0e04-553a889a14dmr244104e87.15.1749733651043;
        Thu, 12 Jun 2025 06:07:31 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac13f0besm110490e87.84.2025.06.12.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:07:30 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: miriam.rachel.korenblit@intel.com
Cc: dan.carpenter@linaro.org,
	arnd@arndb.de,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] wifi: iwlwifi: pcie: ensure RX_QUEUE_CB_SIZE fits bitfield for gcc-8|9
Date: Thu, 12 Jun 2025 15:07:19 +0200
Message-ID: <20250612130719.3878754-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC-8 and GCC-9 emits a hard error when the value passed to
`u32_encode_bits()`. These versions somehow think that
RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) is an out of bounds
constant.  Open code this calculation using FIELD_PREP() to avoid this
compile error.

error: call to '__field_overflow' declared with attribute error: value
doesn't fit into mask

Fixes: b8eee90f0ba5 ("wifi: iwlwifi: cfg: unify num_rbds config")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYssasMnOE36xLH5m7ky4fKxbzN7kX5mEE7icnuu+0hGuQ@mail.gmail.com/
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
index cb36baac14da..1854d071aff2 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
@@ -204,9 +204,10 @@ int iwl_pcie_ctxt_info_init(struct iwl_trans *trans,
 
 	WARN_ON(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) > 12);
 	control_flags = IWL_CTXT_INFO_TFD_FORMAT_LONG;
-	control_flags |=
-		u32_encode_bits(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)),
-				IWL_CTXT_INFO_RB_CB_SIZE);
+	/* This should just be u32_encode_bits() but gcc-8 and gcc-9 fail to build */
+	control_flags |= FIELD_PREP(IWL_CTXT_INFO_RB_CB_SIZE,
+		RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) &
+		FIELD_MAX(IWL_CTXT_INFO_RB_CB_SIZE));
 	control_flags |= u32_encode_bits(rb_size, IWL_CTXT_INFO_RB_SIZE);
 	ctxt_info->control.control_flags = cpu_to_le32(control_flags);
 
-- 
2.47.2

