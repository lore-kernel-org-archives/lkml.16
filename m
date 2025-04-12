Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5584A126BF1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422966; cv=none; b=tO5fpp0yzsuFYPAEOzoVzvJnBIeU+zmVoETcwig554zSMPB84UO7p9nfMxFG9Zlrix4M5+hogBLlZIY8ERLn+yigGTj7PzYPNsFwhsNpfImDWtzPvkDlLblhmzpkFGbX04l9sEP97lYUj52Hej7SUUBdcADNeHT8CHoOoILu5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422966; c=relaxed/simple;
	bh=+ythGA0CGHVjedZ85WxN/1GB0RvAtQxNE3TOqKYrRFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghlqplkXOczU2/eK5iqM37vY/w0WvzwRVXIUwrn1AvuHpMGpk9FviUI5G1nZsnM7tm1XwJ4LX2wFdHHUhmw5wquuONRucCDml7dItyNrDTdJZeDJNArdL2Jn4o+tzeOWN7bI0oBHAT8h4AVBSpEKvkcoR2Cy3FXHuElYfzIx/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVA+2O73; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVA+2O73"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2670914b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744422964; x=1745027764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VBRfLzYcf6boE+QZ0ZNc7aIkKdWQy31eNabp8RFz9I=;
        b=gVA+2O73B8n2uoSlQ2RFidfo1YrPjX7KS4k9w3Hy4GqsrAzgesQC1cmGvWF3QcqAgO
         3fqjaEFC6cN2ldBQ765YqqoMGwsVTt1IU80Et4m9EVsedogZG2JpYYdGeYC5T8j1PXAe
         E0so2G5JS4es5ltz/mj/hrF7v2Fb93mRmLij4oZZUzeZ5gV6WtkQnO/3PJG5z/XSR3o8
         a+4kcNMsVS284gQYtoryHrrmcshMprOvIhuDm1URxJFhzKKdpay9VdkYUhVRltCMi2S+
         KAsWlDm6G5jll2XzgLLM0Jl1vqQVcljxXza8XjelKa2WzWq4kY0mYzsLkEeXuQ9Y83rm
         N39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422964; x=1745027764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VBRfLzYcf6boE+QZ0ZNc7aIkKdWQy31eNabp8RFz9I=;
        b=HILksZu+rvqubrqNDJFILhAwQPyC+30FNzhF+M69vN/RqYllOHa7kSvLFMlLp7LkU4
         uQK+qqN7OgntL7IkPDRSBATu20wpZ/mPdVt7RrDldkWq87j56MlAMNvqn2JjumHqd2nV
         JJ9wqVCZ/zTkjon10NeI3bjxxSs2YGlAA8tgED/2IKR6Rn1HL/5QCODwSWGStLR5+ZFt
         M7TAKad0/dya7GCK1uXHJfHpPJFQoU7IynNaC77qwSJJk8TTRyWyWenJd5g1G7PcerZH
         DFROu/UCvXeV6Eq5ydXB2WHNVod+4YJxOk6KCbssW8YAKjkT4z+ajvo8dled23Tu5QL2
         YznA==
X-Forwarded-Encrypted: i=1; AJvYcCWhd2aDfukJXzquqNyTjFRCek9JBzbdRqGY8sxiNyqviZvmqOvEG9JYIDTLeeoZJ1GZmP3BmF/ijCo5qks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyetcBQOl/tS6FTobioL0phHMBOT648VeLBN484XK4pUH7AxQoA
	A3T7YI6hRkT8/kuBxHUWsPxKeBewU1CBVYZDpONi1t06wLevAq03
X-Gm-Gg: ASbGncsaq+f5QvqYNgi3qjWuYRXwp2i4/R7LK8QqROn30Ru7qYsuHg9fmiWUbawuLKT
	jv4WdyBKhORa1aZP8+uoGsQWRQiujxdLmWZT9eBikBWC0QewxVuTLpG7udhuXc6RninrU3O+YtI
	LC6RsP/gNkFjmCMt/AeLT4nSwsNrX1q31mE3vS8BhU/PCVTMVy4nTM46I2M09UMR1+dvUDxhWpC
	wf6C71p3ZobKZn5BT4uF+ORPuTRqHa179OVhrbDhi6901xsFXol2iGiLo4fzvw4by3aq96F3a7N
	M8HpJ+Nx84Msqs6EFM1dqMKYAqRb+NRvGUxazglufn7z4B1YppuKz2oS+fltsZrvvJawQID3cPi
	KwBXwbi13zdfSIzEPl3AKLAAKJQgDbmztgnEmVQ==
X-Google-Smtp-Source: AGHT+IGw2hrQYzJZLgUGCUjIDQ76vYSyunVOR/5oc7phdVq8oC5Z0dx3i95HXvgj5/felZoYgS7AlQ==
X-Received: by 2002:a05:6a21:6d84:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-20179990742mr6445270637.35.1744422964382;
        Fri, 11 Apr 2025 18:56:04 -0700 (PDT)
Received: from charlie-msi.tail804eb6.ts.net (1-172-66-117.dynamic-ip.hinet.net. [1.172.66.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a321edf6sm5509593a12.65.2025.04.11.18.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:56:04 -0700 (PDT)
From: Po-Ying Chiu <charlie910417@gmail.com>
To: peterz@infradead.org
Cc: dsterba@suse.com,
	wqu@suse.com,
	mhiramat@kernel.org,
	beckerlee3@gmail.com,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Po-Ying Chiu <charlie910417@gmail.com>
Subject: [PATCH] rbtree: Fix typo in header comment
Date: Sat, 12 Apr 2025 09:55:16 +0800
Message-ID: <20250412015516.8924-1-charlie910417@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "drammatically" to "dramatically" in the rbtree.h header comment.
This improves the readability of the header comment.

Signed-off-by: Po-Ying Chiu <charlie910417@gmail.com>
---
 include/linux/rbtree.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 8d2ba3749866..78a7a260c36f 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -7,7 +7,7 @@
   linux/include/linux/rbtree.h
 
   To use rbtrees you'll have to implement your own insert and search cores.
-  This will avoid us to use callbacks and to drop drammatically performances.
+  This will avoid us to use callbacks and to drop dramatically performances.
   I know it's not the cleaner way,  but in C (not in C++) to get
   performances and genericity...
 

base-commit: 2eb959eeecc64fa56e9f89a5fc496da297585cbe
-- 
2.43.0

