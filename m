Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A422253EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214461; cv=none; b=hvZIN29QP17OVfhz8dkvERD5haS/Ej1D/OdRRj7gVxr+iDd9BQuXdkYTT67yxyLxneWEDWc2ENAMscAVij7EZMmz34jhvBHEYUjnBpK32RLYTO9DFWbTbXctde8DkV894LUSW7gTfBIFRBaMAlXcrFj3TwTlywHHqIjVd14Nvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214461; c=relaxed/simple;
	bh=KHCva7RS+KUG/JBkXstocwt+pRK+aJOvr2dtVHXWRx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tks0QaAepMUHXRt1oQ2iSaKaSibMn7FtNzLXfGit9uBaeCfSSkpKK8G5qs6f1jftr0VSxsLamF9LdoIevr2m4ekKpSJPWlouLpITCRjKP6stqalniMW8Dj0cwwMfiNiRIizxM5Jd3tZZ3SdlKxYaMtfl0ZsHOp1eE3/cUkPJN4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=qD0gdPGH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="qD0gdPGH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e6880d106so45941355ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747214459; x=1747819259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibOaHY58habuMEQUy1e1j8bMM1DI8FzR+feZU4NgPsg=;
        b=qD0gdPGHF1wm29IJ+9URKTTcK84gpzzq4tUT0ETH1aBrqWwHYQDQvu4JV4Rz+L7lh4
         DA7ZW/JuhYf74w3yzxC5M4aSUhtqRSCbX6QfeU4RxDgFvwlJ0HxG/ciXNBQxVxr54zz6
         ecR55zGfk9+n/tvENbeC2h/7EbZX4X+C16Q/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214459; x=1747819259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibOaHY58habuMEQUy1e1j8bMM1DI8FzR+feZU4NgPsg=;
        b=smu7mIrovGiEgwETeAX9UX2GEOnqIerL5essj8dNSFRpvYUDnmStXQ2wu0bdsOX6g3
         /8caK2Cll1afXV/xklBQ6zoh2IhiTnSjqDMM/tZXj6jICgVuyvSfhH2a/u8fdscKOtbr
         0uRF4GOSxDnZKyssYjg4X7jAA+8UlUgPpHS5Gm3REbbxdGDPpF71m3cwm1v5fBv1iwTr
         hMG4dLsDHOy/IA+I3ylUfYdE4ASQG3YzOQAo21pko8e+Rh5CmQqbKy2eh7a7aP+fXBYR
         YtwtemlPLqUE+Dl/aa4BjehzppZbwW7XYUmqcLfIkfEOagIo014WBQVwXJo8aAv6gH6f
         EM4g==
X-Forwarded-Encrypted: i=1; AJvYcCX0WoFnsUWDxfoJPtKpc4g5TiwnW49UAG6KOaTh4B7XL/H1wyvBer1P4OAfBGYTyv4t7Y8vNB77YNDFmro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnH7y1WJg/8cp3QU7LtY74VWGNJn+gi8qInn+hIjLNqZV9vVf7
	8ixa2ilRqVUp3m3m6OsVPUeY8Izg7RbjfW4ZwRP8DXGKZvkcdCnY5jY2i8ImHfU=
X-Gm-Gg: ASbGncvhON4Bo2P7uuIpCRlJDsDKazqucaXQ/c1urvIXqbJlaXT1wKrVjNv9LhBNbR1
	r5W+HNPFF7CP/mGJfiJZQgrN1x4lESe2mzw4KqFCaEq1CIg/PhKnj8re9gfrTRr6PKc2XmDMgmh
	eFEQ1XAfj4M6hUg7utuqgFnxoqVCTfo+Qk/gNe0dQp0seex2kgAB3h/36a56yQlzjtACLopB63q
	JsDCqyxT62fUdaFJvq9wEEdg6TGczC/mbYrPSPCq/EfVamrADEIjpwt6lNM+gLaevR484XN18tG
	s+YF9bSo7FU5emmNALjnWtVrX3cbtl+X+XB5gy6/4LDD6IXCuKmgJw/0UGJ3ikIWhJU=
X-Google-Smtp-Source: AGHT+IGSWLVb97SerQP51yUp7nrx2ZnEYwBo9CbV8YH53jj0P/avx90b8Y2UNutxqjPaGH7wgrsK6g==
X-Received: by 2002:a17:903:120c:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-231983e5c25mr35466905ad.50.1747214458567;
        Wed, 14 May 2025 02:20:58 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22fc753fe13sm94696225ad.14.2025.05.14.02.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:20:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
Date: Wed, 14 May 2025 11:20:36 +0200
Message-ID: <20250514092037.28970-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH dom0 is useless without XEN_UNPOPULATED_ALLOC, as otherwise it will
very likely balloon out all dom0 memory to map foreign and grant pages.

Enable it by default as part of xen.config.  This also requires enabling
MEMORY_HOTREMOVE and ZONE_DEVICE.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 kernel/configs/xen.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
index 6878b9a49be8..1875a0a5047a 100644
--- a/kernel/configs/xen.config
+++ b/kernel/configs/xen.config
@@ -13,6 +13,8 @@ CONFIG_SCSI=y
 CONFIG_FB=y
 CONFIG_INPUT_MISC=y
 CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTREMOVE=y
+CONFIG_ZONE_DEVICE=y
 CONFIG_TTY=y
 # Technically not required but otherwise produces
 # pretty useless systems starting from allnoconfig
@@ -47,3 +49,4 @@ CONFIG_XEN_GNTDEV=m
 CONFIG_XEN_GRANT_DEV_ALLOC=m
 CONFIG_SWIOTLB_XEN=y
 CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_UNPOPULATED_ALLOC=y
-- 
2.48.1

