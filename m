Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A324C66F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748491037; cv=none; b=L5Hp5pCwzfFGl1WiQ/hhk+5aox5txuW5vaqJRg4l7o+hwxyiyTfOkVKqZsv10+ayxrR21Ie9NK9VNu/0ugkXuQXnPVs1oKnXYAk+jHTVIdaxqXP4Z4lxI8eUHAOOLzN8AoUHsgMwl0Q6Zj64Jfk0FjYEMQmVmPNox+F/CGzoDWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748491037; c=relaxed/simple;
	bh=qeSeweZV4uyYGTBRpljsHzDiuUT9QNThQucSYH9GwD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3O5XwDgOX9DlIMfy8CRNoTNpfQYhVsgx8d9GODLGqTHEnAQQttNizFLzRsvTmqzfZMwXAiG2UprSZgmvDuwqruEjLcc9Rb1mYlE6hGLfPNn+qNviW0/1jaG8a/bvwJX8TQLYafV2Roiotjnp3pvyVVM/mhIZnuMJAviXaTyJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/OkPjk0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/OkPjk0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234c5b57557so5167305ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748491035; x=1749095835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujQ501UPaq8iguu/+DN99t0pQZyaz+0Ycpf8UljFkFE=;
        b=B/OkPjk0DGFJrnckvysxsmdVZI9uw+Axc+26ONkueUiFNLW66ULZWD4p4K/JfsNvi2
         HEX5D3+oNGtuxJ8k7kVnN7m6mzcrtbXRA0YQx1oJeUPfMt5ctOZUmCPadfM+1Ud6zHsM
         StHNvowleWCipNU/aUcZO2hRJHs/dkArpunv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748491035; x=1749095835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujQ501UPaq8iguu/+DN99t0pQZyaz+0Ycpf8UljFkFE=;
        b=ccyxiDqACKJrf67470NwlezEvuFToi+6WuLn2kCBWZC0tX55PlOTyHYMKAhTyOAAVX
         cnyUl81/fV6s17WSiranL+pbgdh88OBktOyOzUqVqMpZzsom/1OBwK83SIXBLIYJ3+/L
         GPwaSM9wcXxqStC3UwnOzQ52WilQD185KILVxqcjzyWoQqBciLaJCT/IC5h+3Bd6yAh6
         heC10dLrUYiv0Odr3zH03sqW+4i33IwtXjiJREJx2qZFkDXv/TiJ8kizOGdT7iHKuXyE
         tZjBJLxJ4zrhQ/GqgqXxvYccNtC9qF81pTxLhlp7tphJjRsXkYZ/0yJ9ef44lUBazP/h
         KW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPBidVFdzFf8+kuWo67/Bpvl/8VteMaJuJ7b0ZpwbEpotj9TDG+rmYeDAT7DYuKRbyD5s7asVeRBz+/h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSBrIda5OZeFUpza/GupXudSPPNvu6Ueed6Zc4Ta3QsyHA+I6
	ga14hDSX5J4D4Fczf9qscbN9Dk41Ff2uZR8EgtgNxOtWMR5vemDMG17PXW4uFiC34g==
X-Gm-Gg: ASbGncu2Ppvf3pmDEEQibGO3v5by1zwx88W40D+gEdRhK1IoSXGupdPKT6xMXAfov2T
	1ZCZWi6jo8Ghg7LADyBgctdBbqNUvmTD+p8XdOQ/0MzTLn2ej/mnwAFVoRzQQnTjcRrSzayy+0I
	LPmU8JIjORWvTwFdlF7ArRHefm/SuWoMx8P6hPxT+n0OKNtwG1CThImcVy1x2fTVBFokxviwoWZ
	2Ds1qntQ4bxGi7DFkbcpjhuTGXB9j6qGN2TWQwBW8PiOx0x+fgVMRTfb51XjL89TP2loT4lDO1t
	eIRDEswtlcAXcBZRc4zx7k4g85dhVAkVJNiAc1M9qEPPF7if0wdVDko+dNxZwPxyfdMzu3RTfEf
	t1xp3FnTzoMI=
X-Google-Smtp-Source: AGHT+IGIABTdusK3hOipL/Wbdz4EXI+YD5CIdyPMuRvBzLsXeRqHjKpFqiBUS36SMFASd9Lh/nCNxw==
X-Received: by 2002:a17:902:d2d1:b0:22f:a932:5374 with SMTP id d9443c01a7336-23414fc9852mr336996785ad.48.1748491034584;
        Wed, 28 May 2025 20:57:14 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c024:f903:4009:8c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5179sm3488735ad.190.2025.05.28.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:57:14 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Date: Thu, 29 May 2025 12:56:43 +0900
Message-ID: <20250529035708.3136232-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k_hal_srng_deinit() frees rdp and wrp which are used
by srng lists.  Mark srng lists as not-initialized.  This
makes sense, for instance, when device fails to resume
and the driver calls ath11k_hal_srng_deinit() from
ath11k_core_reconfigure_on_crash().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v2: fixed subject line and updated commit message

 drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c..cab11a35f911 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
 void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
 	struct ath11k_hal *hal = &ab->hal;
+	int i;
+
+	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
+		ab->hal.srng_list[i].initialized = 0;
 
 	ath11k_hal_unregister_srng_key(ab);
 	ath11k_hal_free_cont_rdp(ab);
-- 
2.49.0.1204.g71687c7c1d-goog

