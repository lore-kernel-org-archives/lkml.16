Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD67250C01
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696500; cv=none; b=Higl14feHvKdg8GoRarcRO3ZYloeoMrQzXhwiYInPY5T8MKsOOm6fuXZ1d0D4EpPGSKezblE7eWMMXnWGAdg5LBBrbrAuR50oGfdfq04UyYUnvigvV6NGJY+RGmKlxCamfQNOXNzmGk0UXUvOSK/l/uzqz/juEy94mqVmsZnVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696500; c=relaxed/simple;
	bh=DN7U8mBQ3KxCx2LUgVoVH4NWHDyRYu1mUUrwADcH0k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZbLwldXasC/xTzjnOT1v10fy5Ono+fffNLqsw5O8fn3jo6+iLS7Jl1tCx/cIJeeA9LY6KGTUGox9Upgp4bxlJ4Zkyg4cv/LfZRK3STTdrX8K876Nr4xTVNieDiYOMKMqqcH/bO9wKZxURzY4K9X0HWXu9Z9TdEvdpeiJpd14PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1HnsLKc; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1HnsLKc"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4768f90bf36so9661281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696497; x=1744301297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/MgfBE7o+Sm47E+9o3UDDhTB4eKhyMw3wWOZcmEcjg=;
        b=f1HnsLKcOAh3RB7/ZGHFgLMLAVx+1Hft3atE+8OjIMjmd7eQQ5g87mhmU4i91Z3waG
         gNI8QFZMW8tIdTYFOSMsTfHTmnDPjZevVUPDxLP17CGXkep/mug6EY5yzk4Vwcdg0ojy
         6ep/Va8YmYVIzuIenurpzoQsiBSSQ+Xt3HGSBt8OejjcomlYFajQupJnFWTxtZJIZw4q
         6QnRc21zP+4U4GRinBhYKsWhlWQ7twyMJROOo1/aZG+L4RaR4F3tGPyhh7WsOY2fEb72
         GGbFZO6D/LdYzyFmz7N7xMYpCWOUjsmucERnqz/Eot2AO6XwKnZgfN1GzXRZJghUsiVj
         ui+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696497; x=1744301297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/MgfBE7o+Sm47E+9o3UDDhTB4eKhyMw3wWOZcmEcjg=;
        b=fPh8S3Dwy3U//8A2nR2wepLvggHNX+LVOvEBeFjgtwkIPrtOBlCRBQ+4CssjaodblS
         9yNiyl7n5BMleBBPR0wKSEfbFYZfl5b6LDmhNp4sNBIpbLLLYUqkyfcLTK9tiopuXm4c
         DhKgGcRQcwOWbO/27iRjS24C1M5CFpxXlFjE52d0gpyl7KNkxwESjAIRpVo6+2r5lBA2
         Piacue8+uKRQ8HnHfoxAJV4+OJnLr//0QELyv/fbO3X8B3LVIDQD6qZPMaRxm1bURvpK
         gmosCjixzYG5H81You+hfXRwnDAWIAbOu5sMDomXTj+Rc5NCY2Xdzuvzvt4RYA4l/vpD
         nmOg==
X-Forwarded-Encrypted: i=1; AJvYcCUBi+0efVBqtfC7kWrjGWRfu6a6WrJb4+jeFeu0pMWow5BjQx54Fp1mUMPwZsbBxB2O4IahQuByFo0Nyrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyioXDGvzx2UwYD+YAlzV6qbDuqQzJZFWHFInnjFTdtHqEviKve
	vAR9TydvnOsfjz4D4hXS45jjQCcqCezi95XzBphdtdouzL3L0hgz
X-Gm-Gg: ASbGncsm9D1dL7Ni4/svJ0x0eeoWUs0V9dVcFjpgtGfsAWt8xDRQdoQpcYo45Ts8HHP
	r3mMhmxags+vPY4O8OtSPLG6Q6Pk7va/nbqUMrDMeMXaCY6jH6BG93Mf/1DZYIHKA38G7Rb1h88
	c3cxZi9Obk+Sn+6H0vfpzVfIxI6kufYZMnbTLwR5YDUOTzMIR6aXYFuFbeRdztWCMgLdfkZlwo+
	6nymdfFmdena3DpMGw4e8NEFklJ585ANpOlV++aFd/EwrwZcqSoRqSQI5PizG9aT871qDZw4Rsh
	6wNB9pE0hHY5uuDHBmPP7XdI6Zygtco0UYtAZTzgeSWhlx40hg4Y470/1RHgXht6xRIfYQ==
X-Google-Smtp-Source: AGHT+IFZ+IuzJ8BGX7R59Il5tW3rZYJY6Ng+w7G7b9crbrU4kvgRRuGEj5Z5nWl5cweVAYlksPC8pg==
X-Received: by 2002:a05:622a:24a:b0:476:79d2:af57 with SMTP id d75a77b69052e-479192d1ed1mr39606881cf.22.1743696496976;
        Thu, 03 Apr 2025 09:08:16 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e738063sm94289385a.9.2025.04.03.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:08:16 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Remove trailing whitespace
Date: Thu,  3 Apr 2025 12:08:07 -0400
Message-ID: <20250403160807.100057-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Fix indent level of diff.
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

