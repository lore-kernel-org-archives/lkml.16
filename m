Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83020298A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178368; cv=none; b=UNYFWcD5d439YU75KxYJScYRvgErv2wYoI9GR+gfcNsW3rzpR4CqSsOTjNSYEy3HKdJQHfEpq3XOl56g0MpfTPnARnyWKVJIaE/0YqL927/eQyixe2aoYef4AwslKoyKkaEm8yNf2rh9bi5eGjzBsltkPBqbpod1B4YT9WjUer0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178368; c=relaxed/simple;
	bh=ccn7QRhDw+EYEW/P1wa8yWPi9uhOx/Hha/iN87ywVSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aai9FMc1c1y1f5UMQ7UiGpUkuyLWxDyVJgY8kGSoIfCBl8gph8h0udsALQjh7S1qgzozWzJ1p+fL9WoxWNJ7kFzYUV1voxw+LsVsGycKsmQrUbgxUM2DktGKCElXTNwHs8nvFWhHTy2Zb1JwZenvayWvpCnokA+LTLBRQ3ihgyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZsjdCE7O; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZsjdCE7O"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso61096355ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178366; x=1744783166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6aph6kY1Q0JnGg/8+NqO1BgZ3KPQfNwkBZFJNtVp08=;
        b=ZsjdCE7OLV9Ta1+do2r9iU/2KlTCy0/rzC5/tJF6h2xSBG9Pz3uVJrJ4SBk6zKTYuE
         fJrimjwS8aOV/FOy7KqJIV9cShxJESVBOB/eONNV+tUPV90dx60hw9jJZ21pO6L6o9xg
         i1YBLEL7AWsmNgetoh3B8N8oHZvUIl+zhpDrHNq3X+9R62vW0clVP8jto5Ccl3Z3LVcX
         7qQkxkkFdBZ9qpRBhs/c37jggnA/2Qqk6DRQlp5yKJIHPBuCGdR8DkRpyGEX7nuV2jKu
         1agrRN9Z9JitGy8v/PKMuchp/WdsqSUc/hVEiQypd8SAqSsE2fkOgd7bBSygC2wVFbUF
         sV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178366; x=1744783166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6aph6kY1Q0JnGg/8+NqO1BgZ3KPQfNwkBZFJNtVp08=;
        b=AMXGd3dcYELsqFugKjI2AK+ysHoVF6AauzEPG3UKO0cIiqt2rQ993a0ybnFKUh8qTd
         cesgqc4IGLn3B2rusKQc0Csds0E5HHJMTS9v/iV9iQgf+Tyg98nAte2aqKqzrjXHArpg
         w158jYi7Fqu4IJwkLdZoU2/gwG9GZFmjLkDr3dDrYZbyDezMVGU7AgVqidAPDu1dKxOJ
         CiAPf9BI7eE03clQfMO7K/rrN8MYQQslWa1vcH3nFeSaULu0k/airitSMtdlCLXyiNf4
         6eP3hGOyTpu0GfFtAHmTV8xMF+aS0EJVgS9/5ce8CHB4dExSyqDr6G21SO6Lg+oRdsB0
         mFxg==
X-Forwarded-Encrypted: i=1; AJvYcCWdIuhKZ6e9pWrEhQBttsMoauVIV3sw+1zJAhdkjQPEiNl7znVpQNvk0O2fT1If9vivYeelC9GP+89/Vog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQIxC2E/wEBT1Be3o0RC/XgVWHw97TYX49kVzwIG9dTHarnRc
	eZcXooZiibH0ETRwijEAp+B4wm6+3I4gKCCfY0gdMAfFP/TIE37UUVtsfTzhsw==
X-Gm-Gg: ASbGncvbwwjwfAzS8RQ/xx0zZ8hQrf7Ci7CoQjBB25jeH0iEuicNCF4wwKoRt+VdqTH
	IJ/4w0cWWB4WVR8BFqMkL0vHwVVvDgKD7sgymyL3Y6QgCIJpawdgJH+IhFLSB4UpWobSggGtwAE
	hTF5xsgT3bQRX7ri6JLuYMV/BsJV73j8WN947b3L5ki1OJjvDYgNf5lwr3CUhYAdtFjqHKeFUwX
	qVGX5n62ADWgqEbjPOwKC7cnLGUpTHPO4wJ7Nq72pmHhNCtsSwk89zmFZMGccYSWGKERKV63LnH
	ktS2zaJNYe0cnCIsvDr1TzHmTBZY5FnE1fgmItS2KWpFNRyW40uhXKGDl7Vu4OrJa/CNmcJNz6w
	jDhXvHsKd+2JW43y7
X-Google-Smtp-Source: AGHT+IGGch8yL1pVWBFhHfO0hEOL9qHn2F0AElXSWwJ2Ijm2w1ytVe0bvHcbM1ZTM3Yu+6dAMy4qwg==
X-Received: by 2002:a17:902:fc4f:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22ac3fee048mr21606935ad.39.1744178366661;
        Tue, 08 Apr 2025 22:59:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccafa4sm3372725ad.235.2025.04.08.22.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 17/21] staging: gpib: event_ioctl_t now short
Date: Wed,  9 Apr 2025 05:58:59 +0000
Message-ID: <20250409055903.321438-18-matchstick@neverthere.org>
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

Using Linux code style to replace typedef event_ioctl_t with type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 446827701399..72a9b660f124 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1951,7 +1951,7 @@ int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, sho
 
 static int event_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	event_ioctl_t user_event;
+	short user_event;
 	int retval;
 	short event;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index eea169a0ba40..e9baa6724fb4 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short event_ioctl_t;
 typedef int rsc_ioctl_t;
 typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
-	IBEVENT = _IOR(GPIB_CODE, 33, event_ioctl_t),
+	IBEVENT = _IOR(GPIB_CODE, 33, short),
 	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
 	IBLOC = _IO(GPIB_CODE, 36),
-- 
2.43.0

