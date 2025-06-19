Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681EA221F2D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361280; cv=none; b=V+2vxyaXmfzUbEW/rcrqmj5sK66tNb7qpnwoIbLNsVRX6omQ6jqEay3i5Ln8t8RQQhU/E33srIP3S7gGiio6jICAxpiIqeYvW0+C3zK3UV1/f20uD7s9NZrYwkoSFiS0TMjqXahYg0VVKi0RtaSVkVdn94U/5YZRTJp/+HiGrgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361280; c=relaxed/simple;
	bh=K4VZVi3xDLWT0DEl3LNGUBjrD17+mi5NFECXhkIiWrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtsCWwM3pY1lfr83RC5sfzBxcG5Hd87v43wYkN6VlDIwJMyoUr18qPNtiMuJLPGRP8IU9Dylbmn7qLbMVKC0WeQjgLk930s/6bZvwcHyu8/DYAOdZ/vlPNu8b5orp1NSpshGPSe2uw8JkMU3pF0xD9QhiMTolU2N8lLNz6Q24Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=N0R2zRDu; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="N0R2zRDu"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-735a5c85281so220101a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750361277; x=1750966077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd50J9nYsG0TeiIeJPqTSZq8OKqwb6u/EH2G1EHnbLs=;
        b=N0R2zRDuoRfzgfUiO1AcWFzICfQ3al3GoC94JDFHhiABvJd5154MlbhJm9MDthWHGU
         WiSAJGST5UQXcWz+uDSOquTk3dscvMlcMsMrgsMj/MS1xmir6HPpvlE0eoarK4ALIt66
         jUQV8oDZkm2ThMXGcQJTY6EIw5rrZcLP0wVu1kDOku1p4miBTc41fbHQLI3XzMUhxG7J
         lvHoM0S4QjRz8CjJ9xxnDuLdu+3eNtczDXBMkSGNKsQDY1W/hLLLgX9fg3l7tM4QDyyW
         UXkPVeevwhCItJZNCfxPX/Y7zZOVH3WgczUz7MORJJKvxEqy7Jy6S4ynv76c53SBqYeF
         6rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361277; x=1750966077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd50J9nYsG0TeiIeJPqTSZq8OKqwb6u/EH2G1EHnbLs=;
        b=koQk7yllFPJ6C/WnSK8M+Tg/CJzLPmPLRFgp5fJ0HhMCe7jB9dBMZS8Sq3I3yg/m4r
         ujUvk8sWf5ooEruuV14BBSF2Pfx3GzU5jLsXfOlUbd7tGOI+2mYEjACkR/B3CmG/gbYX
         9YZnc2mA6qhQs2cMBgEV4Vhcu+M/VY02Dyb2IsRHetD7qv/ve6nlgfYbY9i51hJXV4F0
         zIKBb1v65mhi+1770BQklhzGq7n0BhjRsBhVv1Dq9ioijnwFnTawgAy5xSbJerSB3a7K
         6u9TxFgG3kOV68FsIHDbipFf/Qvul8mtXWG+2wj7TP1/7xob0A3HHonDaZrnyi7jd1UM
         59zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUirH4k9OHAcTBdv1knWlN8n7KJ32797wChcHHtYI/uWJDi5Q6WroWQ0eousZp7UK0Vsz07WOKuBB7oP9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gjpew3p5ii+5zRsktybFfHsxVnYIzuvbmr1urp5QbBBavJp9
	7aXj3+b0y/7is9/8n6DkhQXHxYMEDAOeAe15zBlGv8m6nuXg8RwkEeK6GVoSzlv4XLiQuIeSGIu
	2xswhqCxkF92hVuJ9gwTxRwDqM/r9eGjnCFRW
X-Gm-Gg: ASbGncspISsSuWSj0UWcGkjkXajs4f/vp29HQ9Resolpm0fcsJUxeQnqKBsOkFqC/Rk
	t2o0xEhHVRxi9PaNY86KbklzYjaHnKR03fQ1YGm0r0anbIa4PEUt8Ot9BCPVFS7LzWk+vFt/NBy
	sVrwHMD8ypyeEK5ZD4TYzj4UkXegffiE9+uDu6e4jmmtdSaSZJws6p2lcRU+YAdrQqkkr1o/vSk
	dZX7eLDhtEj5gN7jj9ouygkJ8vmSt14PYhBH6tJ7nNtes5efR/zYsWIIGp5kB09/4nl/miqfddE
	3qq/Bv9YuiKKo9TnwIZVOj05P63/TcOU1ec1llMxtwuYin45isuz7F4=
X-Google-Smtp-Source: AGHT+IFJTkxUOsR6hHqwhzCVU/31oTbq4J6u3JvNzvDfBfkf4G2km3lw6QOOl6Hu+u0klImFrFzJNZ4BngML
X-Received: by 2002:a05:6871:205:b0:2ea:9842:68e2 with SMTP id 586e51a60fabf-2eeee56f4e5mr63594fac.10.1750361277182;
        Thu, 19 Jun 2025 12:27:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2ee8a78e987sm17874fac.32.2025.06.19.12.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:27:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 34E5034031F;
	Thu, 19 Jun 2025 13:27:56 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 32ED7E4410B; Thu, 19 Jun 2025 13:27:56 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Mark Harmstone <maharmstone@fb.com>,
	linux-btrfs@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/4] btrfs/ioctl: don't skip accounting in early ENOTTY return
Date: Thu, 19 Jun 2025 13:27:45 -0600
Message-ID: <20250619192748.3602122-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619192748.3602122-1-csander@purestorage.com>
References: <20250619192748.3602122-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs_uring_encoded_read() returns early with -ENOTTY if the uring_cmd
is issued with IO_URING_F_COMPAT but the kernel doesn't support compat
syscalls. However, this early return bypasses the syscall accounting.
goto out_acct instead to ensure the syscall is counted.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Fixes: 34310c442e17 ("btrfs: add io_uring command for encoded reads (ENCODED_READ ioctl)")
---
 fs/btrfs/ioctl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 913acef3f0a9..ff15160e2581 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -4827,11 +4827,12 @@ static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue
 
 	if (issue_flags & IO_URING_F_COMPAT) {
 #if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
 		copy_end = offsetofend(struct btrfs_ioctl_encoded_io_args_32, flags);
 #else
-		return -ENOTTY;
+		ret = -ENOTTY;
+		goto out_acct;
 #endif
 	} else {
 		copy_end = copy_end_kernel;
 	}
 
-- 
2.45.2

