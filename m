Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C921F8743
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178367; cv=none; b=L6chrJyB01cF4oOp5VIPtmOYRKFEHmQPUJNZ8M6H7DzGj4QzHrY6ThhQnHA2jsutnHwgLsiHmu2wI+Ob9hFp1AC5kx1X+wOKcZ/IZmtONjmcgwq9mk2N6Meoh0WxZgAEA5czgUtAlDBEaK9E+mre5eh2t+igO1g+qui25FN3b8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178367; c=relaxed/simple;
	bh=7fDnNZyWVelA2uVBKDQ3RFhfWQv6oGCEmBupTouNOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyjx0l9zbWV3BEqa+TXfNhD79h4MWdiY1qlciEhkjTrJHjqVBZuEd86fwT6M44BM/otLru3ccP/vFs8S/Gv6OPHcDNLFhkiCnES70fJ0u5+J80vlxbC3y4b6VRqpXk0qb+8+jpKSrLNrjQx2SjV6QnZjzJevn5V23oO98ajhf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lUjpOFEH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lUjpOFEH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso4237005a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178365; x=1744783165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxE4gWwYLPsvJrRpHDQz1czRhA/+OUvd2xG6gTlogF0=;
        b=lUjpOFEHssXrV0I89T6XBSMrSl2XP82r9ByQaGUF5iiLQ7/bwnSBcgFiHmnL9mXXzD
         mk0Uvitx3GBNCd6AQGmGxrZqwgan00anQE1xjCYR2SBXnCdX1T18TWs2EA53ztx1/Ye/
         eRejMSWSe6N4UQ165ptkbx2EMRT+IY5mFzE6jYAk9wCqFoAlbZn7vPlE5uw7deSKKoYP
         qhxB8rzE3wnsIBFz5z+Bo3wlm8Vd1LmY+K6uwcO7+hUzFtlkpHbnd7wO3FhU35IX7Tpm
         91wOrpmkKcZZYE7w4H9XZm1YjqF2WbOn0tUFrJyMpJPDVxEiO5uSgL8p3AArbQiY6SpX
         LXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178365; x=1744783165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxE4gWwYLPsvJrRpHDQz1czRhA/+OUvd2xG6gTlogF0=;
        b=T4l7icbgdl2Hn5kB40USvkdc4tgcTkBJGQJUI7HCnt0cGXJ87/YkMVskcMeKmIlDdr
         urCGeVT54gxRiuWkyxlnvSWegqfl1eeYwaXZCDCbAEHrE8tlIX75DkAHrG+gF0KfPLIt
         uMTNKs+I3Deq9c6zBB90ggKcKkkVHU1SQNMtkJuazSgR/hLizIs8hMC1wohXdnf9Zfts
         jr4DVBukJX9r03FBvDzAZ5iTm2gIgty2FPqt4oeAacee/zGcxq77uthDg955+mXCZDP9
         Gbx5eYiA0bmuItK3LD6UgL+IrJ0FQLkIL3L3E1QMRokC7C2I3oObXgUxP+GzwKyJTbHI
         t/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx5jYlRXh/EkOxSrQDkaGhoVZ/sn2D8P2M85BIzQpNUHQ1Xfc3bWN/mgRoMm5TSEAlnxHlIzTrPCO6LWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9NZfaRNqx7uBeJfuQ2FYgun2RgR9EfKmT4bmT3Am2Bezstxh
	LDQUICXK2cuD3D5yTGeBmXM69T1/yR7a9Mb2IJ0uRG1bMShNkTL+Q1XU+ba7KA==
X-Gm-Gg: ASbGncu82hnq6U76m07RD8nW5ZJfHZTSJhEKfCzShSmZaLB/ognHPYwTF1mP0nBFEFw
	SqNBGRZBpodOj+ztQ1dAhhrOP4CPMmPKo4D4ywK+oY754bhZ2IrrfSZP7gpOIOaREb9doi5w99Y
	6awIiefUAyvfXH//Wndg2IoN2n4uH4si2KGg9dQkxovd+5azr2inUOB6qlSbWF8OcFyd3e+jYYL
	o4FVdPDSKmooLLOUucSCOrakinwqS9yfoGggqQlc48vkRaZ+3U/2Fc9kSdw2B7bCHAAmkne/15l
	S5Bx3pUWzEYxShU/BH2XKhjgBIAckZyhjMUp5x8JPhQkNxosc/PDKr+AU0ENPOsar98ZodjXF7Q
	fQfdQkw==
X-Google-Smtp-Source: AGHT+IEaAD7oH8MI6x/a+Fqozx/FFggtmkkKHuw2dYqZ2L3Em4TjIRajw7UDOLoU6kxqquxnH2IbkQ==
X-Received: by 2002:a17:902:c40e:b0:220:c34c:5760 with SMTP id d9443c01a7336-22ac2c36606mr22391615ad.51.1744178365469;
        Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b158sm3476475ad.84.2025.04.08.22.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 16/21] staging: gpib: Using struct gpib_request_service2
Date: Wed,  9 Apr 2025 05:58:58 +0000
Message-ID: <20250409055903.321438-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_request_service2' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 4 ++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 71c379c22be0..446827701399 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1532,11 +1532,11 @@ static int request_service_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int request_service2_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	request_service2_t request_service2_cmd;
+	struct gpib_request_service2 request_service2_cmd;
 	int retval;
 
 	retval = copy_from_user(&request_service2_cmd, (void __user *)arg,
-				sizeof(request_service2_t));
+				sizeof(struct gpib_request_service2));
 	if (retval)
 		return -EFAULT;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 473b09d4efaa..eea169a0ba40 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -114,10 +114,10 @@ typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
 // update status byte and request service
-typedef struct {
+struct gpib_request_service2 {
 	uint8_t status_byte;
 	int new_reason_for_service;
-} request_service2_t;
+};
 
 /* Standard functions. */
 enum gpib_ioctl {
@@ -163,7 +163,7 @@ enum gpib_ioctl {
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
-	IBRSV2 = _IOW(GPIB_CODE, 45, request_service2_t)
+	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
 };
 
 #endif	/* _GPIB_IOCTL_H */
-- 
2.43.0

