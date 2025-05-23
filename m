Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266C128382
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016542; cv=none; b=lGENzakH8D2iEIEEKyN+RdZl2RDheGcW90s3Nv0ap11kLNYhIUQadduXpZE+M/hwopXZNSYWrsE/Hng0TTTOwi8G/QDIiM08nMO4kRw/cqrR2CwCmbdc4615+39k/ycj6TrVP69i3PsVPfUlgPM1W8/2fqoNVuT0vj3+YKK7YD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016542; c=relaxed/simple;
	bh=1Q3TcfmNzRDazBSppcZtg7wDQJTfh9folbD7FJfXyzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aXbG4IVZqn+VYk6/Gc08GwGd9LyUNuvHE3d7ddQi04fNMNfznKXu2dg2eGJjPyIbBUZllbsI9cNznTAjUT4/lD8wLI2LpRvfJfHsSxDo3KcXz/9RIDkXvohI4szJTQbD4KGlMRP/G0AxeX0aT9GecjAmRFvZAxEEHpHdCol/hFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJdeUy+l; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJdeUy+l"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so134868a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016539; x=1748621339; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8YOV9dsCJJ+cVkHK0vlh5ONGz8WQtP2+w3lfUiN9I0=;
        b=uJdeUy+lkeOx0//0MgcfC+3ktiME00Ljnnyfk4ED/+3ojkrLf/FytHrDPaff4ScKbX
         7lqVvTydhfNUfN8KzqcUDXjnFr4mTk98KaFL/lnpn6N0W4L67b9Mngoe1JROVRwp03mW
         yEDcZnAkqN2Wx53sZ7ULosQh6csRG0G0hNz7S1MvYACpJ3Arvw+msTbJZvl8nAoLdsS7
         tl1rr2sKr4sfVw06pAsvNH6esasjWyUqL0DQTqITkX+DDzpDTC3zxmpjyy7KinycOEGk
         2DSAaDyXll4sL7dDXhcfqomQoP6fK16/Nh1h7rynLEg/zJFeG3PpQpu6TKZzNe0y5wOy
         m3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016539; x=1748621339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8YOV9dsCJJ+cVkHK0vlh5ONGz8WQtP2+w3lfUiN9I0=;
        b=EAv5FX/anlKUsjjeYQ123jQkoRNek8Ex/eCZxl3IDrHlq1UAuVLrVnDV8wAOqx1vFm
         HkcEkWEb7dqcl6DkvWhIc88cvKfWu8zzt6O2uD3KvsWNVFl+u7Ukz659NZNgLckqScSA
         7BPoX76sNWTubQJviDHn/x1Gxc0qCSmEUF+xEgrx1Qsb3CibqjGeIH1MSZ6s3JALkvkG
         2lheozJPkg4FKPwY3X1sjQ7XeytwumLuk4f8ZrisrQPTj2Mp/WPhZn2RNyP7YioJERZ8
         btC7csOW5N4w4jsBbz9JrduEZO3XwpaHSYZQy/7EK2MrwqcHeO3HWsiwn/KSyEpyAps3
         liQw==
X-Forwarded-Encrypted: i=1; AJvYcCV39r3nKd6VOWOEXhwByPa5jkJrS6i2cWGYFguAsZ+CnQVuSNzr+UKZvNu5p2n2NwDlmNPkTMgML62YC1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/m3v9zDPOHmaD/xoNKGYpS8eZSsANXtwBvoacYCmY+huVFmY
	OjnyogkwqTSB/7dhyy1OvWrwIxkzwxmg1LXNQfeC58uqa/tYTdRjxdAVIky/tCFKY3N/2FfpkZH
	oXoLp
X-Gm-Gg: ASbGncsH0ZTwQjl/ihPwuFWmhe1MT8IRo4D5EIYR3P/bjvubqyHoEqwuFRuzXZcySUb
	HgWPUNE+Coz8jAzE+HcmgZn106uC7l3THSrCtuTgozh8nNlqsHp3Ki8jhhUobw8HzVC6ZeTxorP
	CJwpzGlkIF6Z0ACCZ6v917ROaILNXDaneqp4r85/DcTy2Rylh1csAnudHWgiDyhmVq5L8nLOjit
	wTqWGcAkoWyz924IP4d9Il8uI+smIzVjCuKNF2OHjls2TowWoNVE/X3LsDhWWCsZZK55Or0VqJS
	03HfTOiglgVywdxzOVA/yit+N3D9knfakJPUg0jbGIJSfMdvXdZkaUDV
X-Google-Smtp-Source: AGHT+IEChUpJRqifxtoHLs2XridRWAwu3U5O6UAsOP+uK971N/P8KY8xSeu1T4wchwPDHayN25tBWg==
X-Received: by 2002:a05:6000:1845:b0:3a3:6ae4:660c with SMTP id ffacd0b85a97d-3a4c153f70fmr4239821f8f.22.1748016528875;
        Fri, 23 May 2025 09:08:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a360b0b766sm26836366f8f.56.2025.05.23.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:08:48 -0700 (PDT)
Date: Fri, 23 May 2025 19:08:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ext4: remove unnecessary duplicate check in ext4_map_blocks()
Message-ID: <aDCdjUhpzxB64vkD@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The previous lines ensure that EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF is
set so remove this duplicate check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ext4/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index be9a4cba35fd..014021019b22 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -757,8 +757,7 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
 				orig_mlen == map->m_len)
 			goto found;
 
-		if (flags & EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF)
-			map->m_len = orig_mlen;
+		map->m_len = orig_mlen;
 	}
 	/*
 	 * In the query cache no-wait mode, nothing we can do more if we
-- 
2.47.2

