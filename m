Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28911DE8AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178354; cv=none; b=Wo2Ig0k/YdSK9NT1KxQUEM3Lu0Ud8QTfZPGftzeUvyoCV1MIz3lff4EN6Ce05Kyf0x0XOCRDhEupJGCDEbqMGti2r2qM6Y6ymCyE6qptvAYdtzFVPUJYa3YcHQjATd2H5kFA1b0eZC/iNqO0wMTBkm89cXI4rPN/5CXAD0oky+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178354; c=relaxed/simple;
	bh=rYU9rxDJJ2uDKTInwUMU9me+tIhO5gmqoCpSL5Svm1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNEfqVAgFsuxd6u3gvvCndkvw9DLKMI7D5+cBi/D6Yim266FOOoy4R3n2WZSnhVcXQNveWnc4XPtbzoME2r/iMjwDLzdAtZBAxvaI8DP1yF/8k3uDdIq4/wkVqLRYDdXzauZuqfz0nKk2ESv6f4dk94R8AZcTVQXgtJ2l86Z7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=J2z3VHlZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="J2z3VHlZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b350a22cso5688974b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178351; x=1744783151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mAQ8kl+cTK2tRaTYd6zwbiiWMnl/2y5YjUtdkyYstI=;
        b=J2z3VHlZvby21wVER4ex3bQy/hy52bRJ/UTilupLyeH2nX7eFnQTBH3EOpXwuoHZXN
         DqTIg7W/OWFQbPxTcgiCCDZR5+MOMTVbHV7dzU7qjyoAw2yUXYZh6eYrbr/Cbmv7bKAm
         ylZzb4TU2zFeNXDFoB1hSkNL7GKgupAm3rM8zjT1EGXljGwLsAeEsHDfyn/pIDagoDW0
         wZDAT4A6CzXUP1fn0KpZLXPJNs3wluOueochhP+t0b7Z9GG2160/pHDS4gCEIpzPF49l
         +HWi6nyXE1xLCp+iUezcUIQgx7d0BPzDcjavwYyMk7y6lnqeyimKk+mH8WvUCfteIHM7
         AI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178351; x=1744783151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mAQ8kl+cTK2tRaTYd6zwbiiWMnl/2y5YjUtdkyYstI=;
        b=TMwq5rTQa8w+TdhmVBSgzd6VRHj6RRijK3aj70ypXbD3TmqkFNsJH91QEnvbfefJYM
         w+wq2Ilja9EQQBdvcV1wvxxzXuhCxN+/1BOhxVb6zL8xU6uerK4O6F7kN5Q0NSNk2cgl
         BdkIzL1lA3Z4/nSLrztsu24zGGoQGJwXvSUHiJboJnXeWzXhADhjm+qgG725aewm1fgq
         b29ckKW0hWb8xSjjVc8xYUeyLBqVub3CERO7fhyORJviWH4hG/CkfMQOrJ645qI5hFx7
         3WlAHUhlihlJK8mP4VBjwW5TtlDyt4FgfYrlK0w/aX9G3GMiyNm5W9PkvwET3vwsIOeK
         fsjA==
X-Forwarded-Encrypted: i=1; AJvYcCXB6XWnzw44qL14UKyfsoNmvG8UJM7kVYJy14Acgt5k0glbeijW+GmzRcHzB+FMEk+v4DtukG7KBr6oasc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOabez23NSJBq7wp32dFR5OEx6wIlwRSrU16plF/SQN+KX1td
	cv+1pV1pYQHQKKHHV3TLub9Q+tbPTXoqPZKZtiD23c9TlPheHNuq96qPWhSvEQ==
X-Gm-Gg: ASbGnct7isWliE4nMzAmPS50v2Sx9PNPA1fuWy2Z0pLTELSE52EKaE60r12GjfozO7x
	VbWvBN+ZFJkndbrxA3mf3+BQAxYpyfyD/Ia8huBNYjTlv3k9wiFSEs4YGhurKOxm3i6Cun9RFAY
	FJFNWH+PkNRkG0eSeBm5/D7u3n8+RuCPb0RZFDIlNMvfSgSs9Zmk8iRj1qxqRCq1QDBmcGRUE97
	p3K+/l2kO+F5bzwulvd5NrDQUe06OGw7XXhisOD0DdRQoi6KOLhec011Qa1sKt+Uc0aXXt6CM6w
	j2tHG5FAImT0XB/Q5AnTcoSzKVA3wV1XScaeNEYeRyk5OcjgwR+w6xjujb2mAB2GTSPa0oo7zgj
	tsIwiSA==
X-Google-Smtp-Source: AGHT+IE2RtAw3/qX0PW4HvonMFrMBAZYWdvOPoyJKwwxRUxSdjdRh3JQUX+7LZy+KpAlhCuSeBtkBw==
X-Received: by 2002:a05:6a00:ace:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-73bae495740mr2220686b3a.2.1744178351063;
        Tue, 08 Apr 2025 22:59:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3833asm421408b3a.85.2025.04.08.22.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 04/21] staging: gpib: Using struct gpib_close_dev_ioctl
Date: Wed,  9 Apr 2025 05:58:46 +0000
Message-ID: <20250409055903.321438-5-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_close_dev_ioctl' to remove typedef.

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
index a0a9a07dab5d..4d105db18447 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1262,7 +1262,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
 {
-	close_dev_ioctl_t cmd;
+	struct gpib_close_dev_ioctl cmd;
 	struct gpib_file_private *file_priv = filep->private_data;
 	int retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index cfd1afb36e4f..6ea6114ae78a 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -32,9 +32,9 @@ struct gpib_open_dev_ioctl {
 	unsigned is_board : 1;
 };
 
-typedef struct {
+struct gpib_close_dev_ioctl {
 	unsigned int handle;
-} close_dev_ioctl_t;
+};
 
 typedef struct {
 	unsigned int pad;
@@ -125,7 +125,7 @@ enum gpib_ioctl {
 	IBWRT = _IOWR(GPIB_CODE, 101, struct gpib_read_write_ioctl),
 	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
-	IBCLOSEDEV = _IOW(GPIB_CODE, 4, close_dev_ioctl_t),
+	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
 	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
 
-- 
2.43.0

