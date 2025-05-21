Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D516F288;
	Wed, 21 May 2025 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864143; cv=none; b=umg9/FbwMtJ2QBvRk/a49ZRNxf9wpQt7kdO5OF9TNCyluE+LrRJD/4hygY3kh5Xj7ZHzsP/kd1nXWsIYJTZPPXig8Jz5SPJ3wrh+ENgjkshvUE8PlkXFwQaes3eU4HLpKRbtmQAGyuvy5E+OupcgiubnGZA9TLRP8uScSwXPz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864143; c=relaxed/simple;
	bh=v6oyws5czAbNgfpmZs07oRxCWMBQkASJkZzDQDtqUhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dof+eTY6XOoItwrPk0Pl161kGCGwri/CRHAqwNmIikiHJjuio5Lm5Ub9V1tuYhjt0EANEKePv06SlYB/clHMG7WC0dFTZDPdBasUOtzL5yjmxSjERN7lZtyycndoR9x3vMvkvpY5BnwjlOoxc+u5WGg2m2cou7GwRJ86LCNdUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=au0RUgf/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="au0RUgf/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acae7e7587dso1064803066b.2;
        Wed, 21 May 2025 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747864140; x=1748468940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7XZXU0VEJ18cU2BxFX9o9WteQEjbnzJPBFFWBFf2cs=;
        b=au0RUgf/F6OTb6R6s8IXnJpgzfXRMdTP1GCt0/ZBVumH53GRThSQKnuW8NfuB3AAfB
         nfVHUMj6sTuCacnFtwn6Cz7Hg3bDn3Iaqd1Ooeln5OZR83oCuY3r0sjMdeFY1l4Hbl9Z
         ThtmuBuP3ruSrFKpsDRS0tTF8cTyOXBnrtx6it+06IKtBlSSp4XQYX//DZAuRWx/ZGEi
         us+IoWEQtl7/vN5qrvaZsIeiuqaVmV5RD9w39mAK69Rbv/gwgE9tXWO3XahzPSOBSFyG
         OMpEZOm8pme4bctrqj4s9uM62g7waLxBa21XFhzSVZhTQkZGvn53acya2DyWAM1AoPAM
         GAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864140; x=1748468940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7XZXU0VEJ18cU2BxFX9o9WteQEjbnzJPBFFWBFf2cs=;
        b=nwv/J+fXcXL/7+YgS0LhdpWpGx8gLOAGpsUckTjyZU3NL2rLPY1c0aESu9nHJ4MA03
         SbziRkl8v0iAWvEx2iQAm1NwEufVdbCEIEzd3mFhSQN53keb9FhWj4PYLsAeWhz4dh8j
         qmiZObGBkDvAJoi5LxOqSukKUM3BgeF8NXvpgXM7UfkZz7f59VEG7irg4i9Z5nT4yEDR
         I8EWr/wHWSJJ9BA4h7LrDlXhrut7UfEoPdKQdvvhn379ZjMnmpgQQDlpVmTNJ8oSgA6L
         KqM2bng2c/jq0Q8MzFNSKF3BtVOXjBXFzzFfQcGReHhvojLN5INjUCedsNErJSpUxebT
         G+dg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4qzt+ESy0qnbOMEkcmzyG2aVPptIU6q0/kwtcFSQfcwDOZH8S8/lmg4a36TozbPTbgKgFP1YdKYdsWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0L3FFgpPcD20uZxqeCX7UNwTKAunElKcrKVALEDl01WFlRMTf
	nB3MR7J4IZtAj3gf5oVPY9RghLit6xuu02diBPn7NMrkIOIIxRZR/n8=
X-Gm-Gg: ASbGnctA4twIPWt2DJU2Ntcfc07iGx9qSATNSZUVtW/VO67tdBjk3iniaw8u/I2nU02
	neDumjr1qLNV5bNOqQNKPTfCywINUBPo6L6aOiYpnHmkN9mQ+oBUiEqmmd1ybYMRPKXVIaa+uXT
	fkjgP7JwxnDyzat0+EaqRucQFSAc5FKPbBj2f36PFW4wfZzaV+3fRg77q6phGst34WuxvqNy5VV
	DdBwR7Omzz5Q70pKZwlHA2cVAQKPcHFDR0cen9eHUdU72ByO8nV9EigRvA9bVjejgWVScZIyIwz
	NKH/+92nd6Iuf0SsdFXjHERj6++3/Czd7E7IIoZkCQxueTrU98LkDSUHRCozbZ7Afzl0k22/yDn
	y
X-Google-Smtp-Source: AGHT+IEGpGKyn2SjbG73jckuIvkuAriIecmkA7h43Y5pgW3r7LcfmeLczUiVBIZTzZhCpPXrY3HTfw==
X-Received: by 2002:a17:907:d06:b0:ad2:1a60:f83b with SMTP id a640c23a62f3a-ad52d443a2amr2108668666b.11.1747864140348;
        Wed, 21 May 2025 14:49:00 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:157f:5941:a21f:c1c7:6140:7de5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cc5dbsm957451666b.169.2025.05.21.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 14:48:59 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/1] usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING macro
Date: Wed, 21 May 2025 23:48:51 +0200
Message-Id: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"VOLAGE" should become "VOLTAGE"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/usb/typec/tipd/tps6598x.h | 2 +-
 drivers/usb/typec/tipd/trace.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 9b23e9017..cecb8d11d 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -27,7 +27,7 @@
 #define TPS_STATUS_OVERCURRENT		BIT(16)
 #define TPS_STATUS_GOTO_MIN_ACTIVE	BIT(26)
 #define TPS_STATUS_BIST			BIT(27)
-#define TPS_STATUS_HIGH_VOLAGE_WARNING	BIT(28)
+#define TPS_STATUS_HIGH_VOLTAGE_WARNING	BIT(28)
 #define TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING BIT(29)
 
 #define TPS_STATUS_CONN_STATE_MASK		GENMASK(3, 1)
diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trace.h
index 0669cca12..bea383f2d 100644
--- a/drivers/usb/typec/tipd/trace.h
+++ b/drivers/usb/typec/tipd/trace.h
@@ -153,7 +153,7 @@
 		      { TPS_STATUS_OVERCURRENT,		"OVERCURRENT" }, \
 		      { TPS_STATUS_GOTO_MIN_ACTIVE,	"GOTO_MIN_ACTIVE" }, \
 		      { TPS_STATUS_BIST,		"BIST" }, \
-		      { TPS_STATUS_HIGH_VOLAGE_WARNING,	"HIGH_VOLAGE_WARNING" }, \
+		      { TPS_STATUS_HIGH_VOLTAGE_WARNING,	"HIGH_VOLTAGE_WARNING" }, \
 		      { TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING, "HIGH_LOW_VOLTAGE_WARNING" })
 
 #define show_tps25750_status_flags(flags) \
-- 
2.39.5

