Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85061EF091
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178367; cv=none; b=qP4xAKRqyfrnfj8YYeJDCRxc1nPT0U2NevI1L70pJS0w/7HBR3qp8J9T3fuF9E7jMsVe/2J4U0TNpJG/NcB9wCNj18oY4hhWWqD9LtSkzN5+h1LDM5p8qMDOEzDjLlFRVk8ULG/EKM/qM4lr/Pjz8cjCCO71rwNCir37Mcd/MM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178367; c=relaxed/simple;
	bh=VInhgwSIIXvZJ1g/htalPQyTH0iq5W6bLI7iHQ9bc7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxVe6H2Bh3y7i6S9GN0F3sUwCiSZSB1bVgxGZyQByMWrF5pItnd+66+wmfvtTzx/G4x8Zdu6RFFIgCc31W5SQpTitASSPwgCZuC+EPMvPTekLACFzqhjPMwok0UYRG5GZVvJGBNol6evcWClIMog/4SZCc/Xld604tOJbTnN+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=miFzhEI5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="miFzhEI5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-226185948ffso66087445ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178364; x=1744783164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U6T7r+NCcsX4bcxp+7IePUhvD/0xAqz8Z5Y+CnNL0s=;
        b=miFzhEI5OT5dFSzl4BlqMwNye/CYAndcADlg++bK2mfXzaM5OHnFCQOIPaCP62KUKA
         Ndk1U/KWct+tDWvZrgRB6u6tte9ThPK7Ld44g3SOL1YsN0kp0kLNlbGSvMqYuccizsBp
         Bb7sGwlIfghDBGYGMzGt96YZZt6z3vCLf+nneZkVfKrqT9+PI/4arhSS0JApWlOkZwn3
         xfKaGc/RggDyNksWPYgBIA7u9FdL+iwXuadNPzleTmvvS6eGsBhRtM1cvZOcgkI3rq4p
         o3NN5jCugyKv1r3LXwSDrk9l+f9moOYGXMRv6zROhmY60eRRN/3SiHgzTu4G19W0dh1k
         md0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178364; x=1744783164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U6T7r+NCcsX4bcxp+7IePUhvD/0xAqz8Z5Y+CnNL0s=;
        b=l1bFGBiVwhhUQFqWtSmUY6feiB38daVy5YLgoFK/U+wS4Dt027j9wRwG7suAZBjLbX
         jJoWF57WUlxQQn3Pjm0PoVLAMPla5GgndlA09qEGQ/n+IF4QZ45ClBDWj9cmwjZxpK+g
         098II/s4D3/CLHLFtlbK/wiOlhsh6GbANh8Xi+8pYFQGCcypxzgDMnYdoks84E6GMIFR
         0BUGWPo7gLTLInAoRX6L9o+pYTaWwv6mzbNqQh5l0fhG6WL5PHaI+kELshd9TEAw6vl9
         ogNXoBy/Wer9HrMlJNGOAZY/j/dfxpaRqxm19lP5Z/rRUkg2n9qDwjyIKotARj6z4rgA
         qRTg==
X-Forwarded-Encrypted: i=1; AJvYcCXNj7bUn5xJVCSGolYtI1+Te/ZY/B4XTKwk3wssDWAVqmm5vZAVZn4MlUnFze7VMz8fyQryWV6NwezsA0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvvOX6NhvLaYIF9w2K2X27ZXE3qH/AS9zT1FOcpHJ712omwFV
	IZz5jIgcy//nRPYWBQPzU/SV85Uiki35CylEy0RkoSNSHgLi4y44qw2dv5YHqw==
X-Gm-Gg: ASbGncuSOYyUv5Mn8QQj0CTO9n4Jcl/I31wPX6C8/3vsZNm1j3Dnq7Q2CwOE+TPhk9q
	hger5RNZs2N+BWyAdUxYQR8qzyvBl/ADgPEjMirkN8LwhDF3Pax8F/rQNX9yTB6bhqoDBDAMAc9
	Ha4eSzhVMc2bxAzuGjQ7JvANExbRg7frG+jzxO5o72EHKOIQmpWEH69BMaEEQ8U5fgfcYthZSAn
	jah2P4SjH+QvBL+1AqiL3NC1KrkxQJ4KyJk12gf/Q41zXvU63jCv8KkdeUynedjaAsfXbxp3xwU
	j9ztbFaXf2u+102Pm25D/82ka6qy8eNPZvq6bCL4gZJzaIgFBQbj25Io/YpFY1hd8ktwmjMBw03
	rEgi1lQ==
X-Google-Smtp-Source: AGHT+IH93XidxFXNNSKdlUql5hI1Si+EXEyliC+5Rxu0PP/O+JUUJzvGhlEACOHeIGCrXW2hJjfzHw==
X-Received: by 2002:a17:902:e80f:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22ac2a1df0bmr28550885ad.38.1744178364315;
        Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b642besm3481435ad.46.2025.04.08.22.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 15/21] staging: gpib: Using gpib_select_device_path_ioctl
Date: Wed,  9 Apr 2025 05:58:57 +0000
Message-ID: <20250409055903.321438-16-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_select_device_path_ioctl' to
remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 7 ++++---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8febd683fe0b..71c379c22be0 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1815,17 +1815,18 @@ static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 
 static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
-	select_device_path_ioctl_t *selection;
+	struct gpib_select_device_path_ioctl *selection;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	selection = vmalloc(sizeof(select_device_path_ioctl_t));
+	selection = vmalloc(sizeof(struct gpib_select_device_path_ioctl));
 	if (!selection)
 		return -ENOMEM;
 
-	retval = copy_from_user(selection, (void __user *)arg, sizeof(select_device_path_ioctl_t));
+	retval = copy_from_user(selection, (void __user *)arg,
+				sizeof(struct gpib_select_device_path_ioctl));
 	if (retval) {
 		vfree(selection);
 		return -EFAULT;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index a0fbc660ab99..473b09d4efaa 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -103,9 +103,9 @@ struct gpib_sad_ioctl {
 };
 
 // select a piece of hardware to attach by its sysfs device path
-typedef struct {
+struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
-} select_device_path_ioctl_t;
+};
 
 typedef short event_ioctl_t;
 typedef int rsc_ioctl_t;
@@ -161,7 +161,7 @@ enum gpib_ioctl {
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
-	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, select_device_path_ioctl_t),
+	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
 	IBRSV2 = _IOW(GPIB_CODE, 45, request_service2_t)
 };
-- 
2.43.0

