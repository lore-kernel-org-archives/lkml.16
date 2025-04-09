Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ACF1E32D7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180757; cv=none; b=kdIddvCEDqCxIBXar8NmQhBM38ViXx3MFv1lGk69eUr/bwvwY7UtrqPzZy37hCngu3hGk5tmCFpBwl0q46mvgxpkhzqkVJeW8PDRW792kx870E7Jji65qPDE5nQtgb8QFo45IMwt4Gm/9H6EmRGX6aH0+aDHHfeS3R0qAumDVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180757; c=relaxed/simple;
	bh=hVp5WFva9rgZVexzBPn+XxH7bJEYj+ZOJVusQwSN3IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9d53VNzGDeI8B9H56mTScWyjwGqN+gYpFRcA1jjR/O3WB0jpXF9W5vgE4LMH7KH23dcvSBELxcB+07Jf8Jo+M9k/EGDLqXrVKm/IGAcNErT68FlQeLDK74dbGMjpTCVOYXqB/xGOMipkAqbxG6rSKCbGhAxBd+hikNif5s1P2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PFVlmK6d; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PFVlmK6d"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so63438545ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180755; x=1744785555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt5oeg1YeiWkj0MO+LI199fGU/IYOFN5i4d+y5e7ahU=;
        b=PFVlmK6d1nsMX1NW8Cg4zaXmcqyW+4gM8rBYPisHu576xXMDTxSGF5U35KrrPpOYqb
         5KSjWLpIJovwDKlXHz1yj/FdvEfdX1QgnYg1OgPsY4ssC3t7smGQWsr8EcLC4Ejg4YtM
         ruBL1a1hv6Vv/7GGAbLeWE0Sb1ZReNxzq87Zk5w5WdYPLJYaSawwb48LFKNo9Yh6zi/n
         mla2dXJqFWaxcfEptyGuDTqpuH/kAYYTs5NIpyWHK0cWediXXCqFyVniK4/5p97TIZmw
         q2VwgMUUCoekVBTD7KX0hByk/KM5T0jbFbgYvKHp6U8mnvhmexbxJyEq46wdY7ApgNPN
         6Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180755; x=1744785555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt5oeg1YeiWkj0MO+LI199fGU/IYOFN5i4d+y5e7ahU=;
        b=EgGeZ2qwuUTgOTUL8OW4a+7D5M7VPANob2VCvaRQ/GTyHJPHrWnVZMmW5kkZX7wIGv
         FrANSsSdk/OsjAr9ZokJy2YiUDsHIE4RqgZTacazSFpbRjoePvQQMt7grwNnkXyWqY1s
         Slyul2RGYRbl0HCQPXHFfqFw6WdZYJIfVIBNKfFJcDeVZlXhRnlamXFm/qihWIxH9vOC
         nLgUXQ4JC8MBgJuwF/ji7LXZUq/u9BFP8euIkx5Y9SGig4HgdYXc51cUjwqVxwOd2lb5
         26iObkaSQH6YgUWPyyn75Wb4BSTh2hs8a0fU3GWdZySaoUWcY8tq1FX7PMesVXAEZkoc
         z2SA==
X-Forwarded-Encrypted: i=1; AJvYcCWeZ0bDeI6ykJZ7+lai4pGZ7MQ/4DiElUj/liBpNgyK5rUGPlAOBwjQi+fYwKzEmdIpn5T2QtxE8EHBKH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKZ4yi5Dj5XoYlIxzS5ttYERDYma0tPv9lH654qW55jCy/XZjm
	H5CuCNLwz0hzjXZ6sQI4E+cdrmEUJ012jbWV+rtOe/pgcyGgGCR3AIAqNoTrZw==
X-Gm-Gg: ASbGncv9ZaJsf9mN2i6fI1OHgSLcMMgp7fUyebXURTFV5h96nOJTt/MKpnACD8EconS
	LJflKMuae7y2Z7K3KE8lKA9fC+0w4oZteDKXdYd3ayxMtOmlR4Vpnv0aEC3NwIkrK44Im3q1IKE
	iTDCLP/WmJgu7xTtV7tFlkpYyPGP2cUq8tiVf5idpCPVVhtV4cLi5piP/CYWaRy0Xynd2/r+j/j
	gZTce15CgecxnAVdIHYv/QIz7nghjMMHXjpQBxhQims76sEPml/5fcUtS5tlGqmEN6pXNSleA9I
	0XlhQfghTJTe/k3Hfsa7eAFaXJdv+aaQ/71Ohiqa1Uws6jCuFp48GxsQNVqWp7mAHD0qH40L+qT
	fLukeWw==
X-Google-Smtp-Source: AGHT+IGnU25bUP5atRZcFC1y9/sAb5cC/bQ9EwUgqsr5SeEgKypjDzpbSo8xQOr2SRDfkZR9JAXTww==
X-Received: by 2002:a17:903:3d0d:b0:224:2717:798d with SMTP id d9443c01a7336-22ac2c2eb98mr27424215ad.50.1744180754853;
        Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cc91ecsm4078515ad.212.2025.04.08.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 6/6] staging: gpib: Removing function ibAPE
Date: Wed,  9 Apr 2025 06:39:04 +0000
Message-ID: <20250409063904.342292-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <ibAPE>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index fce33f5715fb..4c01c436b9a7 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
 int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
 int ibgts(struct gpib_board *board);
-- 
2.43.0

