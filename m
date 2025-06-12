Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E841E2858
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708988; cv=none; b=lLJjLo9/jpXgYy4jnurKDDj0EoRSH8P+1i2hpAYI/RJyNwxq+LyCfzlYp7GxkF2MOqkQvEEXnGvw0MDn5/GV78GsE6vArVQ01iULWakYDjygk9Rt7K9GJP5ddw3VIs7kJbncUcsWwdCGFsjcTFKH9ZcLE5UIFRjrPwcrNdf4w50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708988; c=relaxed/simple;
	bh=kmYwNOfZYNiauWbtvqa6oli6QU+Z8hXUpPbkLQJ/9v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqKY3noIYYQokn5BvSujr+4qqXi5mtrIfYyNYHZ2801f6I4WxYaNc/E5A0MhRRQwNoCbLSlR7wngRg1jtdPRRFnFZZaKK3qCjQRtBqzbYCpmP5Dvisto5yvR7jnMhB2lkUU9vg3LU5xKvE9dfLL7jJ4X0KcgKc8TbfmuJVPqEgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TqpJ+qCH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TqpJ+qCH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so6149015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749708985; x=1750313785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScgjUpaPfHbqDIMCPtaXg6Ano9ZrKG6mzFmgIhysYwY=;
        b=TqpJ+qCHviRY/tAqZshG/4rp+CJpoRGKhsj3BRsqsVg9lrTcxCBybe6kLmwoVTaNef
         tQ1fNhrl6Jeda6epcjOn4O9bFlQAJZ/f/TNak1QJ7la4ibpiKoUDmCYhbnwXyi2M/8Um
         n5ZazGKmE/7kfZ2EsYOFX+dUQcZAmStc1NPG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708985; x=1750313785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScgjUpaPfHbqDIMCPtaXg6Ano9ZrKG6mzFmgIhysYwY=;
        b=GNkcwgKTKMwBfo00FGKIfLhaxi6oVo6vwIZLaJHCoxjc9SKDHEZqQ5ZElGJGn0+2qY
         UUweqwV6lbsnHWjdVQIPFa5y8fLJPgYC/ScaCeDLf5mg2lnZ0MwWsSURzn6dSiyAGpPV
         q+WWhjU3+nXt5XgyK1tC4fPiuetQP5TRmMvrDCcSmvNmHxXf4FvUb7Q2TcMK0WUG1orW
         jdgEATA6vPHVvxYVTGUU1I/0ScPisxrQEbCiX9oEA2Vcy34/z3ODnaQ/sNW53JAXOFXb
         IdqOhw5y/Dsy5ozR1GQddooFAQrqP6HjXBiG1gMWMv2rwVLnyUx2A4frVF/8yPEidS1N
         0xnw==
X-Forwarded-Encrypted: i=1; AJvYcCUiCBu61rvn9oJqIhSBYV3n8h8deM4FJRBuMQy90qJpTPolIfG1KKUAvc61NZ/68IdpeHoCguWPkAGBH0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxejfiYtpU/tmSuaeFb6QSvpvDAcAlhCD2R7fMKxQQjg5OOh7SN
	nipJE31jY44xesu3nbzsh2ZSGTC/VDYkTJQJcdqQNeWTSUfv01ag7i8sh91C480R6HbNepPBiR4
	AEuu60zg=
X-Gm-Gg: ASbGnctxs95lKaAXUdKqP6d9sBtHXNYvbO8mCr8ii9hcglSBCdVi3eJQK5ybEyFlnio
	FB1ZpgI+LuVdv7K4o9Cc7b6nizI9aoUdq8pzcQVML+qSsg5aaIr4FBdncG2rhK9APer7HaKxJZN
	SMK0pL9qVGcMNevzH3EWAxqqYFhq88cXAj9as9GSID2r1t6XxOTb9mizWKpSgs47n9au6oCqiQJ
	XnZSwNl8ltw/56D8104m/pLMifLj3xJA6vOCjpBDoKVTG6nojJmpRvR868eRSyFWFLiza01AlZ2
	HrEo4kXjPbQkvUdXMgQqJiFRAv0jF0iGKTVzYXnIGe1djoTuYDLSiUdbcWkiU5/0faLhaUt0jiG
	X9mZM9TxhLbFgwg==
X-Google-Smtp-Source: AGHT+IGm81iQMqozoNbGvUNa7Ii3Oga/QDuCjWZCS5lp+cWSAZ4nkHJS8aNtWeIEjp0Xmo8H09kLdA==
X-Received: by 2002:a05:600c:37c5:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-4532d2bd72dmr12505585e9.2.1749708985332;
        Wed, 11 Jun 2025 23:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:b34c:fa23:a49e:c18c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe840a3sm53716255e9.0.2025.06.11.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:16:24 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [RFC PATCH] wifi: ath11k: Prevent sending WMI commands to firmware during firmware crash
Date: Thu, 12 Jun 2025 08:16:15 +0200
Message-ID: <20250612061619.22094-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the ATH11K_FLAG_CRASH_FLUSH and ATH11K_FLAG_RECOVERY flags when the
host driver receives the firmware crash notification from MHI. This
prevents sending WMI commands to the firmware during recovery.
We want to prevent the laptop from freezing or becoming extremely slow when
its firmware repeatedly crashes while attempting to connect to a known Wi-Fi
network. This often happens with routers that intermittently fail to reconnect
until the access point is reset. While this solution doesn't fix the underlying
router issue, it would allow the laptop to select a different Wi-Fi network and
significant performance degradation during the recovery process.

[75795.712161] ath11k_pci 0000:02:00.0: firmware crashed: MHI_CB_EE_RDDM
[75797.738073] ath11k_pci 0000:02:00.0: wmi command 262145 timeout
[75797.738090] ath11k_pci 0000:02:00.0: Failed to send WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID
[75797.738101] ath11k_pci 0000:02:00.0: failed to set vdev 0 OBSS PD parameters: -11
[75800.746321] ath11k_pci 0000:02:00.0: wmi command 20488 timeout
[75800.746344] ath11k_pci 0000:02:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[75800.746358] ath11k_pci 0000:02:00.0: failed to set vdev 0 dtim policy: -11
[75803.754345] ath11k_pci 0000:02:00.0: wmi command 237571 timeout
[75803.754360] ath11k_pci 0000:02:00.0: failed to send WMI_11D_SCAN_STOP_CMDID: -11
[75803.754371] ath11k_pci 0000:02:00.0: failed to stopt 11d scan vdev 0 ret: -11
[75806.762259] ath11k_pci 0000:02:00.0: wmi command 28684 timeout
[75806.762281] ath11k_pci 0000:02:00.0: Failed to send WMI_BSS_COLOR_CHANGE_ENABLE_CMDID
[75806.762294] ath11k_pci 0000:02:00.0: failed to enable bss color change on vdev 0: -11
[75809.770916] ath11k_pci 0000:02:00.0: wmi command 172035 timeout
[75809.770930] ath11k_pci 0000:02:00.0: Failed to send WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID
[75809.770938] ath11k_pci 0000:02:00.0: failed to set bss color collision on vdev 0: -11
[75809.770966] wlp2s0: associated
[75809.771051] wlp2s0: deauthenticating from a0:95:7f:45:e8:47 by local choice (Reason: 3=DEAUTH_LEAVING)
[75809.782908] ieee80211 phy0: Hardware restart was requested
[75809.782932] ath11k_pci 0000:02:00.0: failed to lookup peer a0:95:7f:45:e8:47 on vdev 0
[75812.842136] ath11k_pci 0000:02:00.0: wmi command 20488 timeout
[75812.842153] ath11k_pci 0000:02:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[75812.842164] ath11k_pci 0000:02:00.0: Failed to set CTS prot for VDEV: 0
[75815.850227] ath11k_pci 0000:02:00.0: wmi command 20488 timeout

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

---

 drivers/net/wireless/ath/ath11k/mhi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index acd76e9392d31..af7ff4fc794de 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -286,8 +286,11 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 			break;
 		}
 
-		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
+		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))) {
+			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			queue_work(ab->workqueue_aux, &ab->reset_work);
+		}
 
 		break;
 	default:
-- 
2.43.0

base-commit: 0f70f5b08a47a3bc1a252e5f451a137cde7c98ce
