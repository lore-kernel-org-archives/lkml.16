Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E8156C62
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526792; cv=none; b=ZRT2XUBJyNGOO1OhaaFqIG1CLC1+0PGPPvuhUFsWuvdl4JmUYYd0vxpSVXpSW2CxfZoqUWZ0HvzUN+9vzmHToy8ZqjzBe2D7486Aoo1u4/5wgyCy0ue1rolrp/DTwHG20qNMLIfDGQHMuU68KgmB6qKSWukqvNDWMbSDdEjUkmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526792; c=relaxed/simple;
	bh=2a7Yq/IafeBn556VJLu7R9aQB6OEhtnDGpHvtGWGV34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7+jZryOdZsCo7a7fxLEyFVn9Pcafu97ZFlh9WtAaoUEu2ERdjVw78EouNkTqnF5onQaMc9NDZL9+QWCsT3vh8zApNB+hMKn4MBT3rh4+JYcOC69UHaB0DOfIOBRwDBzGgTv5Uwagdw8O4cCsOzi/cC81Td/I0N/4jWT8Vd2PZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jX8lxCeo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX8lxCeo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so101635e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526789; x=1744131589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGAzQ9IQ4Ej9MxMTWMc7YU+f5UPPEhRpwIFJo9nKtig=;
        b=jX8lxCeoeeqfDgjP6lxSfHJpyXN+L7Zo9sAdFEOTviTqPEHojDAkYX3yZd3YSKjH5T
         RIoRJoe2wTALp5Mw4FAtn5Aalb5VFCWNPafqS8A8BRCIGRH2gr1QNv2WhF7qGHUdYOD7
         VB5jIL2yT2l8QQn/iz+QnFaQb9mJQ6Iw0Md3UcG1wXL+izBynMZvnQVZOSaNl6IODG0A
         QmK3gR89cRt1SP4hqDVHGLotkFpKgseZSMcAZwt57F0aKU4DNWV3chhSsD6Jdeh6Dx0F
         BbBtptzqrO9CLMHXHWZqKCCgdUTPzrm5j6qbSvLzb8RXPA5bY953/hnrSnV3ltWs7l2x
         MD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526789; x=1744131589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGAzQ9IQ4Ej9MxMTWMc7YU+f5UPPEhRpwIFJo9nKtig=;
        b=pMs8OXbb18Bg3HfQL1yJy4Q5DcTVELDXLCnSAnDEUH0+AkU5Fs4KDNNXwZV0u5kosX
         qneDUFd+YowzdjfZfVxXcI0Pe3WE7zHiJ05oldKN0REuIwLZ1VbCGqMEy3/F3FMr0KlV
         v4DK2wZ4UZ4cA/eP9F42zgYbh1XPYfpEy5/dM6PQpOUKVQkD6NjIVvhoTVYy5o0wSUOE
         9iOrIjuNP7JMpYpIm/5McAWjW3QruhvePSQrICovOT7+edAYH0SSOoAQQiPxq+UKYCcQ
         nY3mSsgbGXTjW3b6w6Y/RUnEoaKVNeSuY0fjlW77hjyisGlTYxGb09xUBBUNG8mHOcdM
         OSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPFpgtu5+hyeeTlTmAq8cHnrnNFNWMIwowjdoJeKeX+mDt7p8b1mkg5aR+E002a3IhqBwIP3A9DgDVPII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lL33XA3RGGOXM8ShnqT7mxEERg0hCApiHipaLNLJaFu9vT2P
	1wM9N24mC9AAAQ1NeQnTZCMKApmZFDy7yZgDs8aaMu6Q/XDpmoHC
X-Gm-Gg: ASbGncsOHIuYBy7hHv3iOUmO79L9B4/q2SGKwMRkAYYcF47b2sS6Yf1R9VCst6JOwvb
	nyY3WDUSgiINnQEfkjaPqTKYQYtssftNnwsonne0tjxnbGtJddTkkxyfZ44P7MNKyTYRkabGqVW
	V4RBWSHNZB6bVbyM39GO/TcL/DBdL6QSDsR0I3qW9ETUpXmVNxKgyrGSE3xsSkPam0doRKxuRZW
	3Rwgjq66YvxMAG6nvMIHSHobn8ZSolVs0zClL8KtfqXwJZYtBvwstL2l9EHtgsOXffsfPL8bV57
	0VLHEdvIGXGsRClkIjwZR/JF/NIMZqmAgtNB7ek=
X-Google-Smtp-Source: AGHT+IGzf3Z1L7pCxeVxuHn5zFAkKaMAMWjFBEvMnHZWUpVMiIx2hwoHxnj5cfKm0Lqk03HzQUpiWQ==
X-Received: by 2002:a05:600c:1c88:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43eb05d13c0mr7427455e9.14.1743526789356;
        Tue, 01 Apr 2025 09:59:49 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:48 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Clean up patches for rtl8723bs driver
Date: Tue,  1 Apr 2025 19:59:32 +0300
Message-ID: <cover.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is version 2 of the patch series that cleaned up the rtl8723bs
module.

Changes in v2:
	- Dropped [PATCH 2/5]: Dropped the patch as requested and resubmit the patch
	individually.
	- Record more changes related to [PATCH 5/5]: add a new patch to
	cover for changes related to this patch
	- Redo [PATCH 4/5]: Remove all comments containing code so as to
	adhere to the Linux kernel coding style
Patch 1, 3 and 5 remain unchanged from v1.
	

Erick Karanja (5):
  staging: rtl8723bs: use preferred comparison order
  staging: rtl8723bs: add spaces between ternary and binary operators
  staging: rtl8723bs: Rename variables
  staging: rtl8723bs: fix check lines should not end with a '('
  staging: rtl8723bs: no space before tabs

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 1868 ++++++++---------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   55 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |    4 +-
 3 files changed, 902 insertions(+), 1025 deletions(-)

-- 
2.43.0

