Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735861E5718
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178362; cv=none; b=bqCXrbsWWCJOaZ97V5UA0mrlq4qiKcJbsMbiFeIzTJFb+zYYwRL/C7nTV0Uf81HNjsIm1hG15XdWWRbNw19lHfvEfEknfKhxWSF/buoPAdy+K8QSlRaLVDsoHdFuasNkUg6cJw0mMWu+sNmwRJqRhMGx64lUSj3y92qXPSRT/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178362; c=relaxed/simple;
	bh=VhGRDqY449KRQVE2h/g/Djcp/iR0bi4t4g+O7wKSgRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eox7pIwOS0nmG3eTgXF0Hsc7iX53fzkbYdDL3O5An+STNTo6imfxjfSVvkGIZkgLFkwpEQSkC61wRg9AedVZb/yt0H0XfWXC+JHHJU9dyP9Gc1SdSDmWNU4micJchDfMi0EV98sYoB4OzNi3n/xpRTDODzj067UDYV5+ytC3RzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=D5B9dDJz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="D5B9dDJz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301e05b90caso6078143a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178360; x=1744783160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR47q75TB8WlKStVt6RaeaJCRBW1DtpNGupRPZBuw0E=;
        b=D5B9dDJzqaCQOzi7MYRL5p9qO963LyWD7xtJMT/G+6oPRvI5sS1XcS87nrBsfWioZ2
         MOWCd4bpaeGZRO5MInsG7RFB3fJ+57pJVWVXDxa5nn4RGXkkvZC5FP6pPSMp6pW46B1k
         M8QTe5qbmXWmQMkcc4X9Gw9u8ww1QBjnlzTMTawpdpic88JXA4h8LETcHUKawR4iIDRz
         LbE3z/VQKD5yzO/NB+TF85grfBYcfKNTGPTE+QGY45x4Qe0YNsFB+dkhsa2Oelu+y2DY
         +A9Q+oQw2j84TvKvThhU6XEADKVXXw2t4kw8yTPvGDXeoCjCcG7rxhbn5/h6uIeONdZ8
         8Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178360; x=1744783160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR47q75TB8WlKStVt6RaeaJCRBW1DtpNGupRPZBuw0E=;
        b=wJKc/nCx9MTed3Wz3NhLBeSHFn3Tee6Jl2/Ahs0Y6TsK/JLmMpWwPmt8ju7fuZ20Jg
         jy4741CI10C/ZB6pwrKUpPBxcuQP09gf0aQGSAyZdIvJKZcacl4etltmhawVOVmfxN9n
         BzU3kx3WHcDzCo+tfqkcFfd3n3eMnmqojrKCEkxAGG2uKSGthssKVVfHkJ/rats3u5ji
         ZTPBV5l7876EwxwJoT8PKYeeoTErraTIETV12Z6XVMWG6IHkfRLvqUX5oIRGc7REerQk
         qru6rapE6ndiSn7XE7RmfTTnjVj3z68lVmN33uZLz+bN7sJGfT5+J3ra20yeHLncVWEk
         mClw==
X-Forwarded-Encrypted: i=1; AJvYcCVudcyrOpS/TNqEitzz6fPyXm1Z/eMVBCZAqPTqkk2+e650yz6BiONW0IrQeRJ2Qzk4t60K3PCQxGW7t1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqkcarb//99iaNTR+Np+vsYwPZ5i9yEt6TiRTCtlt8Nh9rdACL
	H2wIZseDXF0ek73meWsj38jPOYmFop7kweiFEjwJOVz1DrbePaKMYptPPjCw4w==
X-Gm-Gg: ASbGncuG3SIOxf9kGxA7CIiXYahBta5AJSrrNnU6XD+7KtQn3CV5df5U1FDSk/OLSnv
	rpRPlmDfVx90CXJamDpziCqDJc3u/Ci8oz5XF72jNSzh3ATNPxD9l1jgSoeHUX0DTcbYebyqUr0
	loV8TMnROX95bVNLGaXsAoSVxxOYJXlSPdn0R+oWu3olsKi8uLgjZUKqxLPkUmRoSbV5BK6XdBu
	VVChP0D+nny6wILkpvAsAQfhNIJ87tOG5DguvLy1vM9OjJiOc4CAVbkADvGYA5Lew1AOF5OshEL
	fJDogrQPEpDGiXB8N2anw3iJWeyo5X0AoYFtwouF72pufKLdDjB7Gw3u0mmu6z8hdwA/iGK3lmQ
	8yWszNkxmKwfyfumU
X-Google-Smtp-Source: AGHT+IExEWskvgtiKO9mBzNMlc2ICB2I1FMAJdgV+rMkRicDN2Cj9J8GNUfQCE7IF563bsAAsa7e/A==
X-Received: by 2002:a17:90b:2748:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-306dd529aadmr2409545a91.18.1744178360746;
        Tue, 08 Apr 2025 22:59:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306def4e800sm511348a91.0.2025.04.08.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 12/21] staging: gpib: Using struct gpib_ppoll_config_ioctl`
Date: Wed,  9 Apr 2025 05:58:54 +0000
Message-ID: <20250409055903.321438-13-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_ppoll_config_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 5cf425fdcd89..3939c85fb533 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1692,7 +1692,7 @@ static int timeout_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int ppc_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	ppoll_config_ioctl_t cmd;
+	struct gpib_ppoll_config_ioctl cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 5681a66483a8..df428899ba3f 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -86,11 +86,11 @@ struct gpib_select_pci_ioctl {
 	int pci_slot;
 };
 
-typedef struct {
+struct gpib_ppoll_config_ioctl {
 	uint8_t config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
-}	ppoll_config_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -147,7 +147,7 @@ enum gpib_ioctl {
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
-	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
+	IBPPC = _IOW(GPIB_CODE, 28, struct gpib_ppoll_config_ioctl),
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
-- 
2.43.0

