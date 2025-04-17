Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D22080D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849988; cv=none; b=Rmqu06+6V/hyM6QaOZo+GB0Jpo7y/OkML+w5A855ZcPFoopOoeXTWvQR5dCQHfBDzE4Fiq2hBqrJ4xtFsknA9T++lr7SaRxLUk41zM59Mn8sM9EnQUdrI6YGHsZDlN2ZN0N8TGq+B0AtCEo5gDRG15sGSk96qP82RsF/vheeak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849988; c=relaxed/simple;
	bh=7oIHWBBjQ7BlH6IvMzYiszexZSDJnBmjz47kdnIC5NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPmMyYpvqJ9s3/psaTmGfXBreo/1Ks7BMxE+O+ozcrGlsKlpuYbB/yok/FHqlcgHG+1VmVA2HlCeVgviQ34cL7iRurPNghBETVNjl47Tjy8/xW/snqk95gCMLL3T/Lb6OtanZElL96rRowxhN1cKCRzcjYRro+DqXE/bcshyQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FeuFyqdr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FeuFyqdr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-308702998fbso136413a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849986; x=1745454786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=FeuFyqdrI3ZQgm3QrBFLgieyNNi2ZGEoy9i1YrhMPQrRKmHKVcF4Lv39zsyPeWjyWy
         eyOxj+VddBGBHzgaI38L+5euzrCVIQxCo+DpHsCrfo45XuGKRsGFmOwxsPQ4V280G/+W
         Pycm9vCAixKOGzRkyKQ0NpOJmNxgmGKav4m9bsWH5BBsF1TVyreV3HZ8oBvunyr45vNA
         kyYaiTuiBMIykPx7/6QYZvC7JlA7gaxi1zMNlD5BJgSslHjHAUMsTJ9MPqFLDi4zrqxJ
         D6FMukfkDWqJaGdo2vdt7s7O206KvUykRzTddaX5O2TcxElwwqbASQ/LmFgoUqaQH5cD
         m3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849986; x=1745454786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=AdIxsogfBDMT4ve49Z+iIpBvNeqJGMDJka8eqbwLaueobVPKlwV8TDe6Iq3H8/sJf7
         JkfHE3Z01qfaG6KmCATfU3GVpLY8/jtEsgBUOAXkuZma2ZiFQ9AmBswZ8PoU5URBvJ88
         NixQFDbU6F2xM/K+olx9tuAE8UDnwE7ZQ0Gzj80eGlC+fZw2qFXGenJAwY6kPUYEWbKm
         a0URxZapP/HoOUz04zesLY2I/bwlhqFfTrzyIsE6Ecd+HjumAsazJJBcNW4JStrQBovN
         7dNCSuuMu2Yi65cmlYfQIEhl+Yc93LeDIEZi82JJYFS9tjcM6w2okotcYH+U2WdJtns0
         DR3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkcjf891iGr+u67SX5SdMFXpPNW25KWbLwM3dCeEjsKEKyEtKyQCfnHMXBBDAYmmQ2uXjSuWSztl7i2mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzchFluo+vXXXv0VOwTs2bG3puDVtuLR7qiufZhtJlgEbXlFsvz
	A9uENxtO0El6HEvUXntCmn9rujccJUGz5QZg7OOYa2HR42nsvQfjq6Hc2TgO48dHRFh4efi/muU
	=
X-Gm-Gg: ASbGncvnIbiwW62OaU5tovuo5M3AK1aBdAhmvcZ7BmGDWiM84yS2oPYyqGK1Dfd5wxn
	LSzTdwZwG2PREi3gGfp8JJC/7VvGkRAnS3iJnW4kiuHKKzV7lzncrU0ynH0YWnsH/uHg+bU6bc5
	o+GGiSMfosqrOh0EeckMrUe/mpoV2vrGqonSqd94VolRPk66+U/7eOCO1EHeHEOg+dwyK22M1An
	eBTzoTndedRsw2h8CbcRqON0C+UNkVxaVNq/6/FTGVxUyCJPOZzHPTAbaMmqz5cVGysLbth/ipp
	Hl7RgG0M5jANre4f1awyYrCVQQFHgn0gLYB8Cue6ec4f9e7nxWbs4KkKyW7qqnlor/Ras3kTJR+
	vts+52A==
X-Google-Smtp-Source: AGHT+IHAAu3OCGORh5WH1jCPQPqg3DTc9VvsY9VBR4t/IMQrhq5vUJbG3m2+2QvDaJKMxQk3vqB7lg==
X-Received: by 2002:a17:90b:2b50:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30863d1de1cmr5619673a91.3.1744849986388;
        Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcab8dsm20787265ad.190.2025.04.16.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:43 +0000
Message-ID: <20250417003246.84445-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 00f788a59dcc..a3d517efca08 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2373,7 +2373,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0

