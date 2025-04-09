Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E121E32C3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178359; cv=none; b=J6iAchOeaZjkOezdHpL5x5HOoH4z90HLB9pWhdnJx+/my6/rshuLEieZ+zV2/L5eJIyrj20fWYgmDYEShdONtRKIvnUYTc9ajwcNRPehwcbXuVNTA8S0P29LfNia5z1ybDjSTbE5tSJ5rbvoOk+bz+/UFT3SP8VTx2sedk25bqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178359; c=relaxed/simple;
	bh=G//LPV9b621xoonNk0r3Ck2b0Kc5aACTPzI1fI5q8So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atClGnTBI0zXUPuLKFlPwt0MPFZ50SxXloUHgt1qK6Y7NqI2dvuNip/Tc+KzyIlfIVmE9K0uMbDVE1lbyCkAK3jJo2ZgquszIR9Igxg86wbQMTw4n4Jj3jyD3IGOt95dGsm6PV6aBNJnwZxfYbYBtVNNrQws7OQe4yoDYKC4op8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hNUEpXE2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hNUEpXE2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2264aefc45dso81542305ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178357; x=1744783157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P60THtcSeaGNumoR/WgRt7uMK8QmiNv+dXppLkYeWAw=;
        b=hNUEpXE2orXiuRzx5pbXxSmFcrUJHTLc2cK9E+3kYee2z41lw18V8NZDACl9Z13K0U
         RmX87dgb8UfHKBqzi3N2vOmx/Jp1UAdJ7yBsMR/XioTxwli+x177ppOt7iLtOYehCPbh
         v7mgGZjYHcOLHWVMNZGtjzIgnuq9+6rPQudemJmjds7uIP64jiRshOqC7jb83I6AiNid
         l1zmCJiNL9gaBbrMAFCV+ldjLSqal8QvAviD4XfCWQ8PTi7qOBpFnulbxIw19SHOZaF2
         ouZBl9EnM2YpCcSthkhfty3IVT0DgJMMCilKhP3iZP7nB8Ze6Zy1B1YFelbNdceDAaD/
         9sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178357; x=1744783157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P60THtcSeaGNumoR/WgRt7uMK8QmiNv+dXppLkYeWAw=;
        b=lUflRhTL1z3PU/qY/kgkOKb7qwjYQycPpJJj++hg1NH9ZO1YLEGaJyB/qQUuSmlXDi
         yiyzZ1z1Ne+17YMPT6Lj2HFE8rAJAi1aH+k5TozkVSmz3JS25ZR+J368L+YaALRV4jzz
         aKr/S85zVHG2ernXt5QGxLmc2QPnalAE81MuRVKqKVUP6xUecW5W6Z8ZjZzxq0R2OA+H
         bpa9tun5nMZM6+UD96aHongBH/XVCYcVjbTCUGgt6n0aYQQoDGRldHoVYZcV2BwyTI4p
         9Z11HSmox//nMKRIEBFptM2gOj4YI/ee4XOwHO5D7mYZc8C6Za86yiE7QTfQaG2x/2o9
         FjcA==
X-Forwarded-Encrypted: i=1; AJvYcCW5PoFHmuMtBVpr4+ChbqiIERGHT5Iqw2lL8Ws4yX2nMSwtzDwif1MYdDHu9SkdQqIK0EByw13rI+mPOgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9YqHfVk7JEIyTUOgyE+XzSP6X9eBys1Gc+1m/kC+BuAkIXlH
	lmvlyJPXp25birghWJ0rf+yApcJVzQcLWzHyzw/D0OgPlFXIlmzG81hnCXdvqw==
X-Gm-Gg: ASbGncvt2+C+po7auIbEOHf4T3yZNzCLTj/+A5yc7qfoQTCxnXbgxIsyyQx0FOn9jFq
	TA4kincxb/1hrmhfZW+vyy1HTA1/ax8Deyiwktu+0qAavampO6pmD9vcly3VUdx1WNxufezwly7
	zgzHLmqiWZ4LLvjIvVCyk0cLKf14NcuKcTIGQKMIFaH4ZDJb4gHcII7GSznydeIxjeGexuLnF9J
	H4TiSUVqb0Jbdjv0/VPKd7qjJs0G4yO4GXQM/K46YsSN1AS4igCwytY9Rs3MEXgAIZImZgvbCLK
	C0Q9ZVXePs9sb6TR13DsofxixP8OunZ0vlJHDzserTZ4sOno0v0GoF6g+XPhSYcrVKjZj+jhxiP
	nnT2MZA==
X-Google-Smtp-Source: AGHT+IEF/2kPq1wv9EJxYW7WVhtKcroqWFkghJEsnel/AwtMyAxBLF4pJtI9onzFXLY+6m8dyuZG2w==
X-Received: by 2002:a17:903:2310:b0:227:e709:f71 with SMTP id d9443c01a7336-22ac29b41d7mr30253455ad.29.1744178357023;
        Tue, 08 Apr 2025 22:59:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b951sm431735b3a.33.2025.04.08.22.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 09/21] staging: gpib: Using struct gpib_spoll_bytes_ioctl
Date: Wed,  9 Apr 2025 05:58:51 +0000
Message-ID: <20250409055903.321438-10-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_spoll_bytes_ioctl' to remove typedef.

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
index b215521d0ee5..79806cc51749 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1095,7 +1095,7 @@ static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *b
 static int status_bytes_ioctl(struct gpib_board *board, unsigned long arg)
 {
 	struct gpib_status_queue *device;
-	spoll_bytes_ioctl_t cmd;
+	struct gpib_spoll_bytes_ioctl cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index dab170b09764..e3d167edfd69 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -64,11 +64,11 @@ struct gpib_online_ioctl {
 	int online;
 };
 
-typedef struct {
+struct gpib_spoll_bytes_ioctl {
 	unsigned int num_bytes;
 	unsigned int pad;
 	int sad;
-} spoll_bytes_ioctl_t;
+};
 
 typedef struct {
 	unsigned int pad;
@@ -146,7 +146,7 @@ enum gpib_ioctl {
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
-	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, spoll_bytes_ioctl_t),
+	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
 	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, board_info_ioctl_t),
 
-- 
2.43.0

