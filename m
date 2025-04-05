Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB4187858
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743891732; cv=none; b=lk1fyU7DQqhAnG/W/zuJowS6UCk2uchoB6ghKBiAjynoHlcPmUxHS1HOTRTI9eedgbJnhYf8MFu2PSbqXOH0C7sSSaJx0q7+0gHSH4lTRO2TPuqCZgnbSVVrF5FzALwBD6OCGs4bRQyW1F49/4LyVzTVy4uHfA4y8PMMXYSR18s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743891732; c=relaxed/simple;
	bh=1J79/UzQQQqgglAwHQAJTS9DXGRi63VF4VRPFCp7sHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfRlUA5GsPPx7wRGncmFO7zK7JL3ySA4qkcEShf5uKALprX1GhoJOZ5N8YJoZ6sEcPfJ5glzAWibL6TqAWP+QCjeXDw8vRRk2ytiiC9mkEPOAAWsGiyY5LLIfWVNU6UP2lk9pK69GdE/LyTkeBEKVRh3A4TOS1nk93tWM2vrOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqiCnYn6; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqiCnYn6"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476b89782c3so35648101cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743891728; x=1744496528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJhX/oN89+OT5FiiKG9iuTErcMM31EEtHlt0ti5ugWE=;
        b=aqiCnYn6T8plTtmCtz1IPEEjPdp0QbklfdEOTfRKE2vYcp4abiopUAG3OIzCrbMEJ3
         Pfi8h68Dq8DNrgYg9fBu4wAk7ipRrJDEnuNmBGmS09yhbpOs59tFlsDuYyz2Ruz3QQ8I
         ikMjX3Wftj+PSeIoHXjPcts9OAhzgsUHGfwU0qz//QnrjKfcbKvFfPwYwhAvoi/Z+MRd
         e8LCBcgxcR77PQnLVuwGh6IfISk0ApR55vZP38T+Mn+yS5eJNCI4nAwu6SB7BrDBtBTv
         JrNHVXHL1M12ONb5c2H2rVrc+5LT1IabEpmEIM8iLBMd5zFHx1pzby9zCtX/i2YyyoBy
         eJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743891728; x=1744496528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJhX/oN89+OT5FiiKG9iuTErcMM31EEtHlt0ti5ugWE=;
        b=DEb3FOw42Y9XSXk81zVLR9C2Kn9AM27rsB3VBTwIhtZdKVLzde5JoxvLUXlY/SbWC/
         G3+NVarorojla+an8eT8wibKt+VoPWlFGc36IPiph2te8bJflPr98WQWVqAYMN54yT2l
         I83wxpCOxtEvmNmvB02K9cV4T+Z9SBi09VD5oTs6HCKWjzSt+lTeWRkP0eswr+JPD4XR
         KNMLMfmGHsPNIj5r4OB9k6OhquKcBjA46ej8HvOUbzQ2zeHh3JbYn+zJmRGsFACXA4Xs
         X7Tvthr/m73uSBBH17hPIMH7xqvW0ehR2uG59Zrt/9fEW2VE8Eyi5wBFZZqy3DMQjQFU
         K3ww==
X-Forwarded-Encrypted: i=1; AJvYcCXcGHqEDzK1iziLRzFJeUJP9/gW2GSXQH7Ed/z1W6f6pbX8MVV4GryGrk6N8HimfIg1scnlKRpzzQVkU4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzG5ZQ97K6SOkuCRFNjYWQOQMyTJpO/pjN1N/cGoGZDwDkWw5u
	VD6U9hKWikCwbEad1ooFpanERf2FSVpJfaoNH4wxyyAWgUAPDbth
X-Gm-Gg: ASbGnctPuDWiswC/wo+1veIhESMwxxeibrf83V3frDKUPMHkml4r0dA//2YM7facttE
	/cu1+wmriANSe8dzBpGoFF40lCsJWL/GZcqVjgx5fhJF3g6qch/IfTktuz5mfisFOf5u+QlNReK
	d8JgeUWbLBwcdgl8xJL8xtPwv5gTfGmCYQsD1A9bvRsVXgew4wlxbyUZguGUTcGD1grvRhy2maa
	wE3kq0IMoWmJJGeKDig911s33JUiHqnC61xSs7VonjlFDg37ZnhkMQV0WkJN2aSLdl7tZr8iaUY
	m3NzL/J8QOcDChQN44vD26y6EnrzvXX3nzGxGvlS94Z4NLk4/LBmIdh+qJWr8uEcJiJT0CWbQTy
	XC+uTKF3lgi7LKxabfM48Rf4=
X-Google-Smtp-Source: AGHT+IEAkm2CGrA07UUYNs+3Oj8DORY9RfX77/eDcgtvcFKRCKL7rHAHXMHx1ciFwFeqAJQjKxleng==
X-Received: by 2002:ac8:5993:0:b0:477:6ec9:169a with SMTP id d75a77b69052e-4792490f798mr107257191cf.1.1743891728613;
        Sat, 05 Apr 2025 15:22:08 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0713f6sm40603311cf.21.2025.04.05.15.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 15:22:08 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Remove trailing whitespace
Date: Sat,  5 Apr 2025 17:02:40 -0400
Message-ID: <20250405210240.584821-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Fix indent level of diff.
Changes in v4:
	- Remove suggested tag because it was incorrectly used.
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

