Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EA22A1C0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835585; cv=none; b=uQ5H+XT5QClQtf+NL2kzCD43zW6t+80xBLcZMmazi3CdPGUxA6p2U1FXr6R6n/ABUnhCjEoZ+4uUtiU0Uygp6XuWpEswiK5I9nyzaGqFwi236Fv2/LVRW2J7oexjTBZ9Ux7pBGhgChY3uMbY1v0Dg2GDPH73CXYr+DMBPbYUT5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835585; c=relaxed/simple;
	bh=cw1A6jtt80+KbkkY9ijIicjSa7d11WKaGvNKS0omn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McWMC4ptGhALlcB5j9q0/eVL2JJa2/JVwsPndXD4bxG5m3GJUeB3u10F+XkVJl7w20wRT7L6ZQuIAybuClLVwEARhdx4G5dtBSlo9UKpJtZjtoosA0XXfWk4nSttR6IS5o4kg2d2tg5BjwUwIILp6ixCTyRJ7eb+g0VYtDmV3ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=KOp3wxPN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="KOp3wxPN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c1138ae5so8722b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744835582; x=1745440382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwX2GbOz6orBrrrw7U3jbq8G5nZrTXmOs7TQ+cC4VuQ=;
        b=KOp3wxPNK1vVLc/nkROwqsVSmyvf+TQMGwoy4Kqq9C+IZ90eGLsGSsse34FHs5gxFR
         AOrqjmeDU1oBH0qhK57BsvmEYXhWzOZ45y/RbGK36/FcragRmY0DL7ezuSn82YZYvMKu
         8vLCwFMzauH9md3f4xlwQ6byKD0v1ciXpw70wMP4Zno1jYd+M8QonnCOq9uPwo1MNwY1
         95CB4iwW5Hbx0ncsOeSPq1IdzwfMUYSpYacKbukl9wEknMPZZChLKUCOLWsXAbo8MjSK
         +BuZ6JryXn4aRjiNiaeDy2IBrhgWD9GRKKqCcn3ZD3gYSqtTF5QVkt0X8cC9px8RK9YY
         dNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835582; x=1745440382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwX2GbOz6orBrrrw7U3jbq8G5nZrTXmOs7TQ+cC4VuQ=;
        b=kJ6MNPxi3I8AMqJEb43g43TOv8suGG94Q+YcFEedBI1vThlyKm/QBSZUneZrNvdyMp
         AOTfuGXhITTVRAGtpThtwajwwGe6Ko6F/5zcdAsWpWEHy5uZukmjnLs4n9mVPhOoUO/E
         8KxyHZEtfYOTf2x/ASdxptbbEXBqrkqbtix8QX2HzZeK4o9QXfEvvTs6V2iol/cZp6uG
         FNT8ltjI+EhsSNp9/tHJZO4792AHL4C9p03IrsuwfEdw2S7LsNTd0lhQB304EOrK0zcS
         InlNyv1xa+fnER/NI9phSBC016b3zglv2z1bRvTHudhlUDMKTb+wp6dP54O1RlSXOkBJ
         wlTw==
X-Forwarded-Encrypted: i=1; AJvYcCVXMvxXPrE/rV0B+spgAKJOqxs8GpbZ/jiDGV6PhyRSpmJ9QOQkYb7+LmoPxIHx9yhMMaVXISVY6eq9Sqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2IaVLaj6cWxQwRqvO45U+s6OljXUy0x5S7D7FgshIDEWnPNp
	46/HyGVax0FWw54wQbGXf4bX6N8nuavYFNOpF0J1eIIgr2QaXddvqIkROrMqNsqxnPTcN1qReeU
	=
X-Gm-Gg: ASbGncvOyWMI02ZB6QPix4Zlh3dP+1fBsnSfCf/5FLq32r0LSyRIGUajRJsq4LLA1Uz
	W1YTpiuox+aPf/vmm6AsB34QvM9e2Ta66D/fdxs6975khDJPt0t+GEtB8Z+Ec8uu/9XfQ0YAQcY
	Y/ovIyHk1cRJ8tNR/nEFA5MkF1u1BLkuhTDj2hnryyIKt9t/cUaeD2LqaWM6lth3h/Mezr73CK6
	D5eKVF/23QeodL5E7UGu0r/I3x6NYp0FQFdn7x5ZPmoxQjBqaXSgCfAWMnT+4oxiToODOAT6WCF
	RiYCEjwN2LSVq+Y1OrO8EArmWAt6PdAdrnPbbLaPLbteZ0Xj7nPFQQ3N98xnrt+aS+0y4SWOXZm
	F0noxgw==
X-Google-Smtp-Source: AGHT+IGFQ8nMvumHosewIBACUgnMNIgsrPuU6yTSeH34D5zMWZDqWn1T2p7/BJZwudwDulRwOIDkeQ==
X-Received: by 2002:a05:6a00:4501:b0:736:3be3:3d76 with SMTP id d2e1a72fcca58-73c267d3a27mr4635945b3a.17.1744835581982;
        Wed, 16 Apr 2025 13:33:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e520sm11202487b3a.132.2025.04.16.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:33:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/14] staging: gpib: Adhering to Linux Code standards
Date: Wed, 16 Apr 2025 20:32:58 +0000
Message-ID: <20250416203259.7862-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a remaining patch from a series of 14 to clean up the gpib driver to
adhere to Linux code style. The other 13 have been added to the tree but
this one requires a v2.

* Patch 1 - Fixing CamelCase for constants

Michael Rubin (1):
  staging: gpib: uapi: Fix CamelCase and IBA Dup

 drivers/staging/gpib/uapi/gpib_user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

