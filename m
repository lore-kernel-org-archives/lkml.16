Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068F22DF9A
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746963890; cv=none; b=BhUtxlA1ZftactxmAgT4io0C+ysvt4ftrkbICjN7hFnKiUcwFM8ullBGgy0UYvy9h1wdE4Gop2GZTTF6axOnt6XdTrK+EY78creJwvackuD7OtE9FXBJyFgh3e60XKZavGJT41hbSPUAtu8p4XOks35vYjeReF9qXFdHVWce7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746963890; c=relaxed/simple;
	bh=nZNbzRH/a8a2IIoWWk8/rBDAiPPaS18qaGq9pxOm3iE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wn8NXYYTar9BOjCNjildNoFHBnClNGpG6xow+g96YhA7fHOHCmkyG2rpDaHOj+H5rSO2eoivFkd1U+IPIce59g/V4z7wPCDoGRF350pRROM33x5j+IMm2XH5PnXR+o+EpFZuO0zGy6BnnPgS4mPXO0uUje6PohAoIVM9zjCro0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so2022409a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746963888; x=1747568688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7G4Wu0KTwAJdcB+9Dtyf6xEZrbqfOK8YuXDGQQfqDY=;
        b=jdq74iZZpIj4HYuIqDSd/xouwXY7ak/7XLs4hWHZc5aGFl59rUyQMu9nc9oSjuG3aH
         5TlqlZbSpZRmNfSehVYd6KTGnb6l0RH+glwyDuPSx9y9PnYcfuabQQI7gO3b7YVGb4cY
         RFsuteiNgyjZbQcwvTsfOBOEonic5yqLw7B8edm1oxs5jDz5/Hn/v1+9kFpAyOXHBa5w
         vjmbWicBPOsVgPq1uMHYjNsnfNhP4nkrqgANyJQtxnaUW88Hz0jPJwIsZjlEZdcuvIFg
         +dF8L/yQLCUsx/z2h+xcy4YibhAN3LHh8GRba1ofOxNfMjXEUwMJor3aCzI1k05FEhvN
         TsvA==
X-Forwarded-Encrypted: i=1; AJvYcCU5RZsD/SP/07Rk4EjHwQJTRJoYRj4VlYq1cJXLRw2w9azp2eqPKQ4pqY0BkxOhMNOxvUuGz3Xfh7Kicqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2b6J4ws2CgkKPwatRI+PUG7sCAE8pmFdDjkUe2NybvFC2wUbG
	gbfhZmljxJi7QEwWb1JQIsPL8Na3kZw1ed7QLcFLFL/2TD/od8up
X-Gm-Gg: ASbGncuYwAzZNKn4jxL96jWTrRuCzY2SXkyAJlj75snGy9BMNWTn5Dg/m0ChPVn1Anf
	2lnXw6l+hK2v12URrk6CjgfYE1IW3GK173gll4ozga4vhfgx37b8yOa+mk/UEEqEbekJ5PDdrY/
	mcYhsWSKtcqZJ+1jcR9kkWaSJLRYaheTxF1LKjG7sCtPT5X57vuV3TqFiV9sCC8MKeKBK/VYs3M
	b9rgL+MJdsvWG+YThsleAEItd3O+HxW5k5IEtxi56TeSCCj12WLf4xeyvNRBVkrgWfLoMb6Y720
	ee7PeJE/W1R3ehKC+c+6Ee+adQ3i5kk=
X-Google-Smtp-Source: AGHT+IFUn2uHbqLjP/EQgTpHbK7BjACdR7+4Fkw/htqQ9YeBMW79Iz2JpeL7a/ksY1yVFmlJT7HsGw==
X-Received: by 2002:a17:902:d546:b0:22e:4509:cb8a with SMTP id d9443c01a7336-22fc8b41084mr141753445ad.21.1746963888296;
        Sun, 11 May 2025 04:44:48 -0700 (PDT)
Received: from sami-laptop.hub ([115.131.45.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7741515sm45138375ad.95.2025.05.11.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:44:47 -0700 (PDT)
From: Sami Uddin sami.md.ko@gmail.com
To: mst@redhat.com
Cc: jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>
Subject: [PATCH v2] virtio: reject shm region if length is zero
Date: Sun, 11 May 2025 21:14:28 +0930
Message-Id: <20250511114428.2061-1-sami.md.ko@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sami Uddin <sami.md.ko@gmail.com>

Prevent usage of shared memory regions where the length is zero,
as such configurations are not valid and may lead to unexpected behavior.

Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
---
v2:
- Fixed coding style issue: added space after 'if' statement

 include/linux/virtio_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 169c7d367fac..b641b16d42ef 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -329,6 +329,8 @@ static inline
 bool virtio_get_shm_region(struct virtio_device *vdev,
 			   struct virtio_shm_region *region, u8 id)
 {
+	if (region->len == 0)
+		return false;
 	if (!vdev->config->get_shm_region)
 		return false;
 	return vdev->config->get_shm_region(vdev, region, id);
-- 
2.34.1

