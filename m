Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76420C46F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991119; cv=none; b=gnbQBQOqyLJ5GQEBZtPhaQMwlYSxVgLz5jqcLuT0tyZrFtnRZAqJoVx7E5rwH8EXBFc2Z+OkfuTxQw27beIN7Phi1qw4I1MXcxHYbpJn0WwYfcKaBLx8W3+CkellQq1c/ddTJwnjVpibnfUzLkniQQw2nQRfooY7kXSrezr1nMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991119; c=relaxed/simple;
	bh=zCpM8u32JjhOs6PMJ9xZWAk2We8vLNbjqa3BjVGQbNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECRGvbR/OdUnnAhIuwkmd3m62DPHReJiW2AoJyJP2ajg5LxD72QQhDKnTHxKm3IhJfHpNgyOdstz/8d7PuYKqcPC4N27wxcVW8jxk09JhiPE4rg7La7pLMZPeAY/nerHNCxY6LYixXaNBC1Tkk5PwuHVco2QQdorwVvywKLBq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJdGw2X0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJdGw2X0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so7616083a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749991116; x=1750595916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1lyYH5dgz4O9nxSSDkMzO4nLPBm8AKyF96f85wOh8w=;
        b=fJdGw2X0ilw3Sz0ylnwdpRpVKQsg3MaG6TirbXzJCsUDyr6lUNAOmaoetE+AIQ8ZiJ
         +fJDsw3rrD+qRHOAwCfRzRCueWT8kH/O3PINxFGbKrwGcTwGeHCylgAklX5180dSmckT
         H4YBbh16DRt3QVuOB6y1NFMBIr4Tk1mKfrEPEng47/NZHCYgThUANueFyPQukUhUT6qP
         J8RSwNiMUeaIlZGGxh6saIqkUpnXqm6jR0C9lcGLyjngJN/+mgHIm24L1LzVt8RNQNMC
         D68cP15QIxrIGNFF9DH2MVJBx8tEMwlV8vyz777273HzglcDzwg+VXu3WTfoUwTGPS32
         91tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749991116; x=1750595916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1lyYH5dgz4O9nxSSDkMzO4nLPBm8AKyF96f85wOh8w=;
        b=nMBuJ/T7eI9HsXszUWKF/kBiNPTndHF3FKHPzkdQOdiuU8+8td1MhnE5LggiPMcUyf
         hpWTQeCkZj05vV5bZJL7EWVO7C7BH7GpI16ezFHHybgqYnm/1L6wzhidsF2F/fRX0kul
         nOx59VaHKD6T7dvE3MQwmu33FyRm+Ywt86SzuBfGmalSpVD9I5/CH2soC8q+WJBbECEk
         cRXTrNd43sE3F0uCGg0hdQf612ffKXuqF4tWHMSujs+oa3hDvb1w0y/H1LsFg/W371C7
         hv8Nzd4mBaN+PccbITXdSoZXyXFuAwMQYsZqxLt3ZRKxnPqCgMOha7JciALTdA8zs71c
         5G6g==
X-Forwarded-Encrypted: i=1; AJvYcCVtDSkAmbWtfTCxmNGZYmvoYb1E/nVRzBW2NH1sZt02y43Wog1+/yt98XHxD3ajGIEe30SFxcDbLjiFm4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+9j/ZvYUn7cal+HB0LJEBfYI2r1Dg1Ecojgqbe+dJMNke895u
	GuOlrIxwJEFHolWeGZNR6zSPkerfUbmx7FtwhmFs4VNiI95iy3o7nPpv
X-Gm-Gg: ASbGncsmUvyMmAW4zUXYhHpSsfu/C56CsYYdE2m3MQZC78SBX703ZEDYasri0i9BNol
	6M4CFPZRuEQj/S4AQvTQ2Afbj7tcv+sP7VSrKOhUPpqQCXjwu80wUbzf2+3Grx1y8fGBPysX5Kg
	bl/FT9EouZUD4vQ2n4pkB3TwFs8TZMtvzf2MIf4cbuE8CQPqAjOF7uJfUFUDG9a7FShJ+F+SZQv
	P7A+vtm94ZWEROdwofgKU2Infknjr+P6JePCFlYRic+afEPD1qgHzo1SoAqhW/7PAfe2wta/CTz
	HckI0uy1qfPBmsqorC96GbEZdyLkGjZMHdX7d9yeaVQLNyvWRHJkYTMYgak5/o6PskaiUT8uPNX
	43L8=
X-Google-Smtp-Source: AGHT+IGWiIs6KS4FG0Jk7Jef925QLqUG8UW94EXbeHSg0NO748ouelzY1GlkJxSwF5z99yEJnTzHxw==
X-Received: by 2002:a05:6402:d0b:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-608d097b3d4mr5018070a12.28.1749991115480;
        Sun, 15 Jun 2025 05:38:35 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892e523sm479239466b.146.2025.06.15.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:38:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove return from void function
Date: Sun, 15 Jun 2025 14:37:58 +0200
Message-ID: <20250615123758.41869-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove exit label and return statement from a void function.
After the exit label no cleanup is done, so it is safe to remove it
and return early in the only place where the label is used.
This simplifies the code and clears a checkpatch warning.

WARNING: void function return statements are not generally useful

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0248dff8f2aa..3cbfc305ede3 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1112,7 +1112,7 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
 		pdbgpriv->dbg_suspend_error_cnt++;
-		goto exit;
+		return;
 	}
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
 
@@ -1134,10 +1134,6 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
 		   jiffies_to_msecs(jiffies - start_time));
-
-exit:
-
-	return;
 }
 
 static int rtw_resume_process_normal(struct adapter *padapter)
-- 
2.49.0

