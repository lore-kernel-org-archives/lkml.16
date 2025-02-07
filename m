Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4101DDC0B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919786; cv=none; b=eiGxTlJWINcML8loEuCluv+OsRvbv5Qg8LkYPeLred8hAfJ6FTIqeFzlk4zLJ1l0ZPlv6D6iIMaRNEyjzrJODEItcFnMPpRvndW4CyGF5rHzQKgzpCKcm213jozTS4y4RYeE49o1641FsLlCfLGy13LixWcDS8YCt1DX8xSxgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919786; c=relaxed/simple;
	bh=8QyhjSt+PXmG79JqqMzYxvWUPvnaR1/TlhVoEt5+boM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+kqMSc3DvDvByra5Ue273e5IwMcr+N0tQ67SrJvcn6EL8DO0tMqrlbc8keZCGSSwHeWcPjfzmd6IJ+gHE3XY8GTfxdWVLVTOzJdK67u+IU0PGmrafjftxjkDdeZ7bfDxoO4eBcZ7Or0nPhNIsQOynFDn44pQnuBHEsknMLGxmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rEfuvVzJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEfuvVzJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc627eba6so675630f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919783; x=1739524583; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvLbUtxX6Is1AqBp8WxV0jhxtX114UxVQqr6c6sxU+8=;
        b=rEfuvVzJaugBmbO1ALFHHOKtedha/I3DKWGnXzXrsyODjKqCWZlu28q9j8b4cyUpc9
         b0leMaD7xx/qHCTYdURVKfF4E7/UtBJd4/eAC4UFFT9vbl2CrVu74q/Ks1iYUSHp4KZk
         5XJJ0iKczoiohEHsDJnavZJKLIeCtJLZQQ1kRsxyreaysn3zoGMI5w5eQUzhB1d3Jfmp
         +27hrAO18exGrdY0nIdnERfjHfTMCO1tfEKm7VKRkEzE58e1tl1RR5vlwQZZ4jMQiohN
         xvOMQKX1KNigz25GtoQA74Pa3Tcro+vQvL9fZiSs5eli9585J/eTw067p6Ebxpm3Tfhw
         Pq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919783; x=1739524583;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvLbUtxX6Is1AqBp8WxV0jhxtX114UxVQqr6c6sxU+8=;
        b=oTjmaKAPPcNqcBaaVz02Gdhr96fDIdM+dgzs0Bqq7OMURofRj2QUWi0M4L4R5BwIs4
         CN10aHxct/9erYUQhdIGrMWM5OnZzCPckUxfVu+qVKXKVmNpQ82ee6ermibGXh+k0aI1
         DjRfhP6MQnAn71fkOKRl+BpDjnbEnjNhLdX+AFVkLC0whjQ2ChqH4ISCluuYgP2nDQJ+
         L1n3RtyVUsgQLOWpg+yAYQQwLK9XyenFBOplcG67nACdZ43cEySRR4wqrS9YVCx7m8c6
         ZSizCq6x4mLgDTjV1M6F2WwNRxpU10S1IAVrhidsWjtSX2Y4sHoZZUCOy+gZ8gOWL87K
         zk8g==
X-Forwarded-Encrypted: i=1; AJvYcCVw3FKYvhjfqNVWvnuMX2vTrvC1Ye5PlqEPHAWyoVBcPT7jCVWwp7aXdgjvjpgr3iK8JggCcP344aoGS30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++oD6ElzTOBevyb/rezVpkVULS5RGqR72gRxja+Gr0gcetx7f
	0dpPEmJHSz5V9+6+DuGklH7DVOq509n9AXlt/e+idspGqfhbnCqVLjgm+PSSJog=
X-Gm-Gg: ASbGnctu0CVCWI70BcfFgmmHewOE7D+XFSZIGhkz+lWJw0ipi2LJ+bdygx1XztP89A2
	IXL/otL+yARao9589NcSDBxSOoTjMuJ/abRqc52DuMRlj613aXCopiK8+lrDLuV6666/8mQ4R5u
	uKPR3TZKBDSWj1ftJHJjcDiBUipnw2VL29DR5xlX1+C7mydztCR5VsB8zp6ON2yTRAOXEy03Jhm
	ML4G3w4hi5nnZM7sDCnjAHI6nlvbkJzBttC+WXnd33MCj1RbxlMhTw32hd/4EdGtjbBcZFAEFHy
	xsYmW1wS/W7Jqw8qXWv9
X-Google-Smtp-Source: AGHT+IHzf8MzMXdkrcAtuah1r8BuF90slZNj+eI0Wnjcj38CkfEtHceBBNaIgCqFjXafoOn3pJtT+w==
X-Received: by 2002:a5d:64c3:0:b0:38d:c58f:4cfd with SMTP id ffacd0b85a97d-38dc8914130mr1679493f8f.0.1738919783039;
        Fri, 07 Feb 2025 01:16:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd5c87csm4012010f8f.52.2025.02.07.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:16:22 -0800 (PST)
Date: Fri, 7 Feb 2025 12:16:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Selvin Xavier <selvin.xavier@broadcom.com>
Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] RDMA/bnxt_re: Fix buffer overflow in debugfs code
Message-ID: <a6b081ab-55fe-4d0c-8f69-c5e5a59e9141@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add some bounds checking to prevent memory corruption in
bnxt_re_cc_config_set().  This is debugfs code so the bug can only be
triggered by root.

Fixes: 656dff55da19 ("RDMA/bnxt_re: Congestion control settings using debugfs hook")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/bnxt_re/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/hw/bnxt_re/debugfs.c b/drivers/infiniband/hw/bnxt_re/debugfs.c
index f4dd2fb51867..d7354e7753fe 100644
--- a/drivers/infiniband/hw/bnxt_re/debugfs.c
+++ b/drivers/infiniband/hw/bnxt_re/debugfs.c
@@ -285,6 +285,9 @@ static ssize_t bnxt_re_cc_config_set(struct file *filp, const char __user *buffe
 	u32 val;
 	int rc;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	if (copy_from_user(buf, buffer, count))
 		return -EFAULT;
 
-- 
2.47.2

