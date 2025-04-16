Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEAD2AE66
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761737; cv=none; b=huObGO1xWeCO65kWlGX7bDRiMZ2btO8Fzzb0o2DbUjBT5xn87ePDI2HxW4X+m6cegfxg2TQWClL8p8aB3wJSCMR826L9Lq9YeUoCJdTkqrD79hSH1EwfuUf4VmEhHVT4x96s0tX8xHHudYLcKEAN9MWHzjb6SAGMmXFoZiKER3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761737; c=relaxed/simple;
	bh=X73kg4tdW06GAOX2zu95FNoOmd3sHwKiCictodfiuao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EOKC4uuzdOgC9KZZS/v5yA0q/KwelhBIKxWzDwVVE2S03eEe5Xv9t3Gd1BY9BxZpIl4mKJ5EWoC8JHN6eUSHBLQxlTmJ6XmPKa9Hv88UT4smhV4FosG1cvpUKnpER69dfJAIClv/B6BezC12XoIMB209AXZxG91e/S815nA/QU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iip1LbTe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iip1LbTe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8172041b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761735; x=1745366535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=Iip1LbTelo/dFDgaCB7aH39IJa2T0r6QRpjefrchYJ2GLfppOm6HEMBe/MCpIQBe7t
         sgs7w01FbVfctXxeqzUhERu4j5c/EzQl2TTMIMQ0C0ddjZj/mtVZrO+ICFyDhPyDUWjT
         fNT1AxGGmQtyzC6AGcMUt87HtO004pxKLkcFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761735; x=1745366535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=eXaYVLgbUHC2ZdZn6FpXKrX3xklOoxdtVvXBoQykUHclYw6/QD3pcIU8d5JiS/eq8R
         vPfRLbeGgbqg5L5lxEbd0J/6kSXmk2PYAxXCvb7ELgr5JBAJchs5b3eHSWEjvVmhxPgs
         aQT68t35m/XnKdKKAfejyF7tDlxnEfFHUW/el9uj+pkDzF1zM87we3hXMlp2TcghLOKq
         SYIYa3GAhjI+FJ8QBZx8FEjzbLeD3+XwiooBCf1Uexf6Q27zgNLfIHungOxJIpiI1HKe
         2xF5WQCV+bDn+7HDgbx+kAboxW0kJwlbGYRajd8+I6Wn4eAx1lrS8ZFrbs481XOVNh74
         1YxQ==
X-Gm-Message-State: AOJu0YxSgH3UgtIfaLi1i9LjKst9RWHMwVBqi80ATDHQewCMB4EUL5ne
	wMEGzuKljWXiLVHnroGcUSZ7RlxsIfsLboYvXbjoyCYrjsys4S36bc42HnYP9KPHeQZBheRDPTE
	=
X-Gm-Gg: ASbGncscBrwYoo59LEoLTpIDzQbf61BDQkUdMSI/t7mHYYnr8YQ4i7pzF/dkPRIAYIS
	MEHefwkyE3q7u5SdHm7eq9GPRXus57LiSCoEZjus/C5/hqieTniEiy8S7/evWWa2oyw4a0VfBZK
	HFB41BA/fncmrkyzLkimee+sQYoYXfOltTZkN5C+KXSNQ3VQy7WVV2pFSnyIoYcCfz/vy5CIBnu
	ePw75nDoQ+vpPgimU+hhgy2Nv3x4457PhXszfB0jWRLKeNDNWcpyETBP5O5Z9gGFJpWWzdA6oCk
	jy5arEOkagk/IeqzKHjdCQSc+fhyd0CQrIzkQ98Z3KTfwJhWRfM1U5vbBzjCc/y8GDwTEzI8c77
	6SA==
X-Google-Smtp-Source: AGHT+IHkUQNhj55ArcxMsqdZ9goNzK1iX/oCF1gdLXwsnONXGZV+o45RA+2MeBctZXHEWSSuaXlJnA==
X-Received: by 2002:a05:6a00:2e29:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-73c1f90d688mr1947843b3a.7.1744761735002;
        Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21c3216sm9157830b3a.49.2025.04.15.17.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:14 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to work
Date: Tue, 15 Apr 2025 17:02:02 -0700
Message-ID: <20250416000208.3568635-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DP altmode driver fails the configure stage because the status VDO
that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
them so that the configure succeeds. This has the nice side effect of
properly reflecting the pin assignment and configuration of the DP
altmode in sysfs.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6ee182101bc9..2cbe29f08064 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	}
 
 	/* Status VDO. */
-	dp_data.status = DP_STATUS_ENABLED;
+	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
 	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
 		dp_data.status |= DP_STATUS_IRQ_HPD;
 	if (port->mux_flags & USB_PD_MUX_HPD_LVL)
-- 
https://chromeos.dev

