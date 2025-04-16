Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CB13B7A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796929; cv=none; b=n/HtshX2t/cRZHSY/TCHDqUNd0ej9Ze0zs6F2ksc+05y02bdR21YBQauenMqTGJ9khIk6NKbHfVHft1Ia4zO+4TY6oYPCAE+6RZgkJToXXYBXxyXjQQjc93XSPbGIEL19CfTJurlDudxMQXfzLkjJ6akJeAdOcx6uHSxy2mqaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796929; c=relaxed/simple;
	bh=zie3zQWMYX/bfatuVpQNXBgIGBHJoM36vpK850T7UZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cTmy4Gi9//x25X0l/BT1pssZa4Xg/zHualHJuJgxxWQ3BuDxkIsJH1zVXhsbpNjxV20Zk+R6LitnBdb4vhtrmrJzyERiR31of9ghVdmxuAXmwhOCWq7KlRtnwt9unFBNFJISD9gIYk25SRM58Zs8qN/iwq1DK8eSCEGcrM/t/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tku.edu.tw; spf=pass smtp.mailfrom=gms.tku.edu.tw; dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20230601.gappssmtp.com header.i=@gms-tku-edu-tw.20230601.gappssmtp.com header.b=XPh1HAdv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20230601.gappssmtp.com header.i=@gms-tku-edu-tw.20230601.gappssmtp.com header.b="XPh1HAdv"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso6467295ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gms-tku-edu-tw.20230601.gappssmtp.com; s=20230601; t=1744796923; x=1745401723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcPWKe32VrKv8ERJ7BEIQNO45yX+2Am3YJCim180crY=;
        b=XPh1HAdvCPLtgX4YzpBgV9xbG3tJgpdDgxrehh1afaNvy662uonbuE+YcdmLWO2tqt
         pTXFOe0QbwXR30KZ9J5zw6hYbeNRypgbsrzZ0g7gvPBSvaXTk1gHWRdKqb7J1wHH1Txv
         WKiYG/7BfKn3CDz1PgFV+Trql73p27MaVEvmI/Vitf9OQ/jqv0rjA6d47NDenw0udpOs
         OZWLfA59bDmlGxgzu/dmkCbnbfn6Cri3jhK3ZhoV4ziXwavUB0zqkj2DBiwoSZn+SZk7
         eCXekmOSmmhUXEBJq4pM+h9TdZ/anu93wVdppaRx1kS/yh/3OjiWjhWweoD7YCKo/sbj
         i2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796923; x=1745401723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcPWKe32VrKv8ERJ7BEIQNO45yX+2Am3YJCim180crY=;
        b=CaO9Z/ERRyodMeOvQwjlF8pwUwtX4TnzTpKaop66Zc0mLeSQe6LZafjhPhK9q/hQzC
         9Jqz4xJhUxd23u2fP+3awVvkj7/B1M+mDnxbvkuycWIqMA2SI49whKstOOfWggUkkF5P
         5MhJlDOPS8rT1pJ8sA1J/DbDjSjoegCr6vAWg2FvSJthWQd6wnCmcNFt/0lBx8xGn2OE
         wMgf/5ZhqO9HlZYwF8KVNl3xqWy2GgB20W53tKWpEnSmXdj42eywAY80XQg+jTA+VsGd
         lexXIDqJx7wZJnQItZmFFh++s8mnr8P3iMORPNIfhPEgcCmheNBOb7RPfU9GoZxBcsCb
         6FXA==
X-Gm-Message-State: AOJu0YzE6UNETp4JjuCDF5cIVJA/vxeZjsoG74eH5EDbwUPFvnd4zQ/d
	MT546/70k0DOFa96Pq59mxZnj092olWyqNy36VLRl0WSleixGyZhhY/C4Ngbc4s=
X-Gm-Gg: ASbGnctWv1l7QgoMtW08mUEUYK1exixcS7lJuP6vAL+PRVj6r1HNfthEFd1uQsqt7gC
	kCddpLJF091IIpvtTlvZN43BDJafs4O1/ShEHq18of5Bl8/9UdMZddAN/xpC4UWKtITK8ATyIPB
	Z3aB1LyOa2GLJisE8oHgMA7xGVf2J56YBNZNG5ZblV80Y+EnEoO5dfFsj9xBkJP6B4BXow145O1
	5vZzdPGWx+Uhhf6TkNpF8NP7l+8DnJ5hy6nzSxVQeFgAe3JwBkSPXq3KVcktp/8sU4BoMu09FU8
	f1b5jtdFesUELGNMvNsVQ35Etyf1SdQbdsCCYm8ylIe85J4GbBfz9DVxlJ6v7jeV+g==
X-Google-Smtp-Source: AGHT+IFEuefE4OLotxpkt4JMG77OKXwpoGBSBmCqKPO/GHStPXqUbVfdMuVxirheteI+rKCSMjf/HQ==
X-Received: by 2002:a17:902:d2c7:b0:224:13a4:d61e with SMTP id d9443c01a7336-22c3598fe39mr18448035ad.51.1744796922788;
        Wed, 16 Apr 2025 02:48:42 -0700 (PDT)
Received: from wu-Pro-E500-G6-WS720T.. ([2001:288:7001:2703:9227:4745:995c:f07e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d346sm9813485ad.80.2025.04.16.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:48:42 -0700 (PDT)
From: "Guan-Chun.Wu" <409411716@gms.tku.edu.tw>
To: stefani@seibold.net
Cc: linux-kernel@vger.kernel.org,
	"Guan-Chun.Wu" <409411716@gms.tku.edu.tw>
Subject: [PATCH] kfifo: Fix grammar issues in macro documentation
Date: Wed, 16 Apr 2025 17:47:16 +0800
Message-Id: <20250416094716.67584-1-409411716@gms.tku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct minor grammar issues in macro comments in `kfifo.h`, changing
"numbers of elements" to "number of elements" for clarity and readability.

This change is non-functional and improves comment quality only.

Signed-off-by: Guan-Chun.Wu <409411716@gms.tku.edu.tw>
---
 include/linux/kfifo.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index fd743d4c4..7077afd37 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -589,7 +589,7 @@ __kfifo_uint_must_check_helper( \
  * @buf: pointer to the storage buffer
  * @n: max. number of elements to get
  *
- * This macro gets some data from the fifo and returns the numbers of elements
+ * This macro gets some data from the fifo and returns the number of elements
  * copied.
  *
  * Note that with only one concurrent reader and one concurrent
@@ -616,7 +616,7 @@ __kfifo_uint_must_check_helper( \
  * @n: max. number of elements to get
  * @lock: pointer to the spinlock to use for locking
  *
- * This macro gets the data from the fifo and returns the numbers of elements
+ * This macro gets the data from the fifo and returns the number of elements
  * copied.
  */
 #define	kfifo_out_spinlocked(fifo, buf, n, lock) \
@@ -822,7 +822,7 @@ __kfifo_int_must_check_helper( \
  * @buf: pointer to the storage buffer
  * @n: max. number of elements to get
  *
- * This macro gets the data from the fifo and returns the numbers of elements
+ * This macro gets the data from the fifo and returns the number of elements
  * copied. The data is not removed from the fifo.
  *
  * Note that with only one concurrent reader and one concurrent
@@ -850,7 +850,7 @@ __kfifo_uint_must_check_helper( \
  *
  * This macro obtains the offset (tail) to the available data in the fifo
  * buffer and returns the
- * numbers of elements available. It returns the available count till the end
+ * number of elements available. It returns the available count till the end
  * of data or till the end of the buffer. So that it can be used for linear
  * data processing (like memcpy() of (@fifo->data + @tail) with count
  * returned).
@@ -879,7 +879,7 @@ __kfifo_uint_must_check_helper( \
  * @n: max. number of elements to point at
  *
  * Similarly to kfifo_out_linear(), this macro obtains the pointer to the
- * available data in the fifo buffer and returns the numbers of elements
+ * available data in the fifo buffer and returns the number of elements
  * available. It returns the available count till the end of available data or
  * till the end of the buffer. So that it can be used for linear data
  * processing (like memcpy() of @ptr with count returned).
-- 
2.34.1

