Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2252269CFA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855351; cv=none; b=d97OP1sgI/ya00BIu2ZIUrSMA075csTRZBNrPZKqBDmxM3FU/jQmhYedwon0JyC2pheLAoem8Q81ENExvOKXnnp0hmCsdHcPVuN4fYxlFwjJ197WL5IUI2jDNTeNZ94N0rgFCC+DJsNIaUKI1F3ZfYXay3vmJ05n1K6O5wMJzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855351; c=relaxed/simple;
	bh=2fCtoy8N5vMIzLwNkzR/CRd1nKqcPpVMe2v8ApgF6iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KADQCMQLeTeeTNIc3yIFww0xWOFy+bnXrfoq9tJUeO6XU/4AxmbeIi1aJGUazPBxKxWAGZsU0JSNft7WKudmTcOYckoXy7aWj66GrM1TOxnW3UhW7JOJ9e7Pk9cNRHyOEqfysnANeqddpUTey1PV6LH+xq1NqiciGA1/vAelRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Exr+E6jH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Exr+E6jH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso32204685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745855348; x=1746460148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vJ9uNP0iHMrM/+SmPX2MMhjWP/P76u1o3hYif15/zE=;
        b=Exr+E6jH+kktc7HKxE044DAlbL7qjAY3C1eIG/GBx32n+9RN2SR98crj2jy5JNWY6o
         9Gih44pA9qX+a2Se0bDCTAsTEr1bcNAm1g/TfcZbwgvR7T1ukcGb731fdkeyQMq60lhC
         6Wa+vDInay/Q9WKtzvqaNVQb78VfYSrVTL9y6Vp+ppccr4J3yUN26fCflQFzXMwN5Xgd
         1gosIDlpXvsA7qewAp7ibYTLytEuavZgyGbhhQFu036jIcC2gJ7nNvST2vh7MFLyXv1g
         9WKJ0vMYfFQoG4k5LSwu0Bo/HnDtv8OIzwV8QzXQLb86o3ZegC2s9L+3LRYFibT1YNcC
         CktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855348; x=1746460148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vJ9uNP0iHMrM/+SmPX2MMhjWP/P76u1o3hYif15/zE=;
        b=AlJ3qfuBEU6tsLJK0fJb6GcwCkGFjE5Ofav+p+6TXpomRBAOwtwhQOQFmX7mnn/ZJV
         wsM/81/uV6wQ5OVlHrV6gzR8WnrzKamhIxX6LtwXP4rM/0W5G7plLXa4hkzSiQdMYynB
         k2qbCNfdSDYsY9T5ZWEccxvUr2sqOe1TPSbxizjeht+SgdCQsL+HZ4BjP7ByTWd6paTC
         +UNJpCLUr3XBwBbIFJBZwli0GzX37IKUnfvJsyykWknqBeUqcNHG0OgAMPNy0xSd4Mwr
         bo1Un5SOZ7ZpOFx6tZEDB/CW0wVLYgO4NOQxg4Pmgx5FdAqI0FUW+aU/y4QXv5elqIlc
         P4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsIYtUct4WYm5p66qveebK2iuo9w/S5sVsslw2h+i4ug+m47ZYWi2LdjGJCdeq0e9aCtc+Yhyw7217mOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkA3kAF7YR504oM9V1D5IqoO8p6Raq4EwueJ/B8sTbeU52STu/
	1Ru3rhuJLK8B+f9f177HSnh60HftpMOJ4ilnj2kS4BosUP2PXX5eFBmBqJH1IqPrpm1KNuimzPS
	/
X-Gm-Gg: ASbGncsY2FImk0Ux/6S8C+lQ83VMybcT0uQhL4VTJwkhjO7VgwM0kV9jZMrSWctnXYS
	EDhbyt/aWoYPxOpaopzoEIBRx3D+NocmJ8vCH7zeVQx59exTR5kCeYPd1iOahCEvr+FAFL6ZmJi
	CPW3RJjjBmV0cvRTnKQR+u9n+aaEh9au9JE8naDLnZ+JTgRCWGMAnWnHlOqDFwuiHFdhyX8D+B5
	iz3PrADxqxxzVqvv3DXnkhIXTCpfoOB+Kse16EmCYH8A5fc16WgG1GUakYEUFFSBTasvbpY+6Cy
	rvPE/SH5gcdH9Qfskk0tHjOvmhYH5SBKH9nU4B9O0N0vlqfOGNHcxpknCqq2R+A24PT8JYWFUw4
	9YKlzrS/V2755pXNDy/MozHd1tdhFO55+Oq2blt0CJDLFYk0v4Ek=
X-Google-Smtp-Source: AGHT+IG3m2YlpsVhZrJPpTZ5RnkrWV2u/Rr1pKPBf+x2egBpEMrhE8xwuaWfBSBsZxNTPwlfY1+yxQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-440a65b6fdamr113966875e9.2.1745855347909;
        Mon, 28 Apr 2025 08:49:07 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm162134575e9.7.2025.04.28.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:49:07 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 4/4] fs/netfs: declare field `proc_link` only if CONFIG_PROC_FS=y
Date: Mon, 28 Apr 2025 17:48:59 +0200
Message-ID: <20250428154859.3228933-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428154859.3228933-1-max.kellermann@ionos.com>
References: <20250428154859.3228933-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is only used for the "proc" filesystem.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/netfs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 547b1aa70d2a..73b2a04aa801 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -231,7 +231,9 @@ struct netfs_io_request {
 	struct kiocb		*iocb;		/* AIO completion vector */
 	struct netfs_cache_resources cache_resources;
 	struct netfs_io_request	*copy_to_cache;	/* Request to write just-read data to the cache */
+#ifdef CONFIG_PROC_FS
 	struct list_head	proc_link;	/* Link in netfs_iorequests */
+#endif
 	struct netfs_io_stream	io_streams[2];	/* Streams of parallel I/O operations */
 #define NR_IO_STREAMS 2 //wreq->nr_io_streams
 	struct netfs_group	*group;		/* Writeback group being written back */
-- 
2.47.2

