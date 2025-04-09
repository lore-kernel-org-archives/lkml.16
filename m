Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0627933F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222210; cv=none; b=pEcFJwSzpGRd2SU4frfruDReFgYEtTS+13FHE3YK88qaE+NW0Tq+r8ZzeYi15TZjmH8cNcLFhgS7mi1D5aMQhLY8bF/C3vVcJV2vwB5QrKAbOX4u5jHfa9TLIlHFobtM7goRBageeBOj66bNP6IFD5lFBJ90KQpm+8lb8fYC/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222210; c=relaxed/simple;
	bh=3aL+YmiC+SS2Eb9QJHfwgiTSyIEZCDR+E6UJpe0GC8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAniyhcQLF+gAfwipf2lQkE+blzpdKA4iAYpoeOEv/Wzj3UHPoP3dzS1ucUZhBY9SDaZGsbtDSu9lDXUc9BdYqoOQjB67zk4y8qDp/homSqAOXhgWRLuV6VeUtjk2kPLhcKbhdTBiZMz7KNyckZozKYyIalX1V335fdRo2T1uVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FYhggb02; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FYhggb02"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c3e7b390so6917905b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222208; x=1744827008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=FYhggb02TtWHiNTLRzUjvLSKyaCd7cLHMML9pouLKOZ8YKNieWvSdszbfALORpHTsT
         XZm8XOqPAn80wFEMAezXSvvWk8iBV6W+EXcg7DDnn4jnDP/yUCVEKznno8ZxGO2A+hqX
         GXf8/WmvrS2Fw1DNAydAM483R+HPKx1XoWgSpKUJSkSLQx6JQvczXtDhozAVTAim6YeY
         c3slEab+eZnQXxxoYaci/y+uAk8X3JQaDYyK/yTSBigUQdv1wGqsoNbkVJX3GmBSyFK9
         8+mGigOQ805qo3FYyg6cb8T33ZCgNOLuSIkIsOfu1nTeYbFyPGQWHna0mhLkF2xg5pN8
         SAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222208; x=1744827008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=Tls5vOIjT/bQFJAbCtw4mEDL9ok4HneUIDktWStvl5I4yX7GIhNXIZddnWaaKu2eTb
         HsfSHbsvAYFwqTJpL0OvIoXvbwtw6SJGEKen9WOGJtJOoLuC8Jqcn/ssESeuWKlGPRuq
         l2Z9OfuwdNsGyW35KsugPjmR4VoYfxgDUxtBBVu3u54OJ3NzjkNxIBgxCQiyf7DEaa7e
         mxJ7hGNTzacOV5ucy3EgHk5zTtt+cluMtbYc3Fbpg1x2dAT9ArI1eBP9ypu7Jx75PxUK
         cP7sWgROGi1u9QLcfMy0cvfAiP9EEocaRK3q2Q57mRs8qD+gSxmZgJPSEjqNQYeEkoG4
         7r+w==
X-Forwarded-Encrypted: i=1; AJvYcCWfrCd1VX9rpZpaBWLmViVfZNZgsNIZyt8pBTRf/mpZkok0ASuJTwknid5ZtPrhvFntZ4+vwKBribm+1Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnITKJJSouA0KUpzLo1PXlrB3MPYvCo+2KwcMzD9jtbWLT2oM
	apMKUQhGOB3j8SDpk8qJyiNO2/Wmx5ViHPW/SqgTVrYeN8zW/HDVMUmUfLe5EQ==
X-Gm-Gg: ASbGncsYiiPCcarudcczX8U2M9/lw1DjVfiHOQUEjKPVZbtxVtUu9v3pf+PzxQwesr0
	cPygyXbtV9reXs7bOwqDezb4xhmBzWMzlAbGRoctZNs9A/nbAEmTWyPaHsPr/BkIASnwbg8NcSa
	gFIciMuqSyzTKto7BJUcf+EaazaLls+MhuFB+p+W1iRouJxK7n2BQIi80VA10pwrJ/SMcTxK0Yg
	BBCLnN6L7CQtq0egJ1D3af2WXT4eNgBuzyOJzx6736nvaL6iZRJ3u2v/pQWpMCFreneyflLZomH
	if5FtXSA3RW7m58JooTErPgRyaAPUTNVHYyjwN75Ktitik1ciFKOq/yREt+JOiPGupt+JwO1wW7
	MKSPWhw==
X-Google-Smtp-Source: AGHT+IGzVtKhuBPRRIe1GJNwyRU4ZmtCGrNGkZk4BG/oYcqnZ8WrYNJ47cvuylIe9m/P46TDSnZGog==
X-Received: by 2002:a05:6a00:2292:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bae490ff7mr4786676b3a.3.1744222207657;
        Wed, 09 Apr 2025 11:10:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322116bsm1540144a12.63.2025.04.09.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/23] staging: gpib: gpib_ioctl: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:40 +0000
Message-ID: <20250409180953.398686-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e903ec1fe274..2d2a268d8573 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -39,7 +39,7 @@ struct gpib_close_dev_ioctl {
 struct gpib_serial_poll_ioctl {
 	unsigned int pad;
 	int sad;
-	uint8_t status_byte;
+	__u8 status_byte;
 };
 
 struct gpib_eos_ioctl {
@@ -87,7 +87,7 @@ struct gpib_select_pci_ioctl {
 };
 
 struct gpib_ppoll_config_ioctl {
-	uint8_t config;
+	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
 };
@@ -109,7 +109,7 @@ struct gpib_select_device_path_ioctl {
 
 // update status byte and request service
 struct gpib_request_service2 {
-	uint8_t status_byte;
+	__u8 status_byte;
 	int new_reason_for_service;
 };
 
@@ -121,7 +121,7 @@ enum gpib_ioctl {
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
-	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
+	IBRPP = _IOWR(GPIB_CODE, 6, __u8),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
 	IBSRE = _IOW(GPIB_CODE, 10, int),
@@ -133,7 +133,7 @@ enum gpib_ioctl {
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
+	IBRSV = _IOW(GPIB_CODE, 20, __u8),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-- 
2.43.0

