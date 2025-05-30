Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1222321D596
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580658; cv=none; b=SiaW1bbt1sy+HJYJ3ANH3uiH/SGzhHmupBHj6QRFYehDdNXU/KTaG3xIBLIgtYt+G+znzSkqvYq4UY7jADlFE87lQF7205RKE6Bc5sYvuzDGGoBSNeDt2FVO5gGvBsY84UTyiOy3FspToFIJTbDwLjM2+ye79q5qN8D0syr0bXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580658; c=relaxed/simple;
	bh=Y+hugblmAxgmRkyn2fxyuMLaQgzvEXZBlnk8Jh/v8UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=uxIPub2mS82pOK7X7USSK59LMJ4eBgsX+KESszeEJoyaeTbjv6WO1lT8xdxYqh7AN2D2C0O18gdN2Cgu8XGnSL7ODW+X3yrbC+RNPKu/FAfr3pkI6d5n9ECskoZeutVQAnfoIQXvW/dNRK/AbFctTe9SaxuWnzrC13q3FbIsdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=HBii2iHP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="HBii2iHP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2c384b2945so1377641a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1748580656; x=1749185456; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/6gL7uu88i7p+1Fmf1z5Sh293hU0sJzRplicMeiOvs=;
        b=HBii2iHPzoj9jJ/IffKhV0roKmT29z+48zVvaXIBgN+JH0g/9B8VdOlUXh0CcHBWgV
         fNbChmEtmX0xPgGFoDX+th4mj21BdMXBc7o11Uyi+Rk30i54khWidHIk5Sg4/C4Kr1xG
         fuCIXBdMx0LmdeSRs1HLQjY67prBjyMOpReJ9PsPO/+UJjyRRowIzbLzb0cYtHLLgf4E
         H2J7MC3Cz4cjzR7Squ3QiLiMjw20Z03sTa7aCO8b5T/3IHoj9YHpE/2ZAd/XtLFi9FOX
         WSQ7ZdKIi7HZN5YALumYb6Kwh8+UIcrxmFazHhR4XP0R41rKbWWgjQshZl2KZ+iK3+zw
         Kacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748580656; x=1749185456;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/6gL7uu88i7p+1Fmf1z5Sh293hU0sJzRplicMeiOvs=;
        b=Jlm0XXkgukU/Mq89FKDCW2DX52k3zKly73poPvG8lqKsFJ3C03RvW18fsX6DfDWW/P
         IaYky9Ol0syyvbuCerBEFpbeF5OTp1j4xKOAVWzLuEwVkzje/VMKXrbb0B+UOkTSDjMd
         5JBBmS40xbCsRtnMMjLKHxVCgw4wXjtIrspqc1ho9bkq31KEHb8r1EnH0x4GvvzdWvpW
         UxFXqhbt8XhfGSKR5oMmgY+hu1pIwusaBVugrM+I1JzqsXnoC8H9MlGEzpHeHQdBNkTA
         9pQalEaGWkDCEpAxHGHArioR9DH9g4qVABxpB073jrxxtaytOOAbAhQgUSowd68Y4/kq
         W0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWubZAr2flTBGs0f43AXILQEbO05mpMuTfLPwpDtX04iN4lSWpQE2xdDbtrrEOB5JsoLSNLj3KVIYZu7uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWD+GuMca6E6Igx4DoMPjtsDr3DNiPZ0cZuGWUWTdFLisL4/Q
	n6STRjzdvn3Y/kCAlvvXERzpotmbyA6ar/4rR7nhVw/IjVmBqXIJc4h3CXpbUxtdrWY=
X-Gm-Gg: ASbGncvyjBn5p2pvP1K1rHnpcadq5LL7w5ugTcZrPxNzun3mnobvH3Z+YpKFpK0BLRA
	EH5JKD9KeyQvL9Yp3t5TqPnjoOxiIWCsln1skMFXt1tsoEYDIHbiEafGb5a1/pq5Ot65bIRUFa8
	KRLqjdh86FGyeXWHIfVmZXfJiUU9H7WMejmw65A5+3OK1eJW5Ai24BBui5H42RCZDdQami5mpTM
	dvSnktA4q+1DxOsSaw8tQWghvrrik7dtrl0jmH+NvBuSBnekEXm0NA7hMjX7ID913S765HXud6q
	qPR93cVJdXneHd6ixfC4EPFLnPsFibDP2eIlMyKCk7uNND/vl6sm
X-Google-Smtp-Source: AGHT+IEvyG17b9tHV2YruoiWIXuiS1hBS4XsYuWorEH+zYiLpcrIZIgqXit2l5cDU5DJsN67WvzC9g==
X-Received: by 2002:a17:90b:17c8:b0:311:c939:c848 with SMTP id 98e67ed59e1d1-3123efae69fmr3575677a91.0.1748580656408;
        Thu, 29 May 2025 21:50:56 -0700 (PDT)
Received: from localhost ([157.82.128.1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3124e2b67ffsm426290a91.5.2025.05.29.21.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:50:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 30 May 2025 13:50:11 +0900
Subject: [PATCH net-next v12 07/10] selftest: tun: Test vnet ioctls without
 device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rss-v12-7-95d8b348de91@daynix.com>
References: <20250530-rss-v12-0-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-0-95d8b348de91@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

Ensure that vnet ioctls result in EBADFD when the underlying device is
deleted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 tools/testing/selftests/net/tun.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1..41747e1728a6 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -12,6 +12,7 @@
 #include <linux/if_tun.h>
 #include <linux/netlink.h>
 #include <linux/rtnetlink.h>
+#include <linux/virtio_net.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
 
@@ -159,4 +160,42 @@ TEST_F(tun, reattach_close_delete) {
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
+FIXTURE(tun_deleted)
+{
+	char ifname[IFNAMSIZ];
+	int fd;
+};
+
+FIXTURE_SETUP(tun_deleted)
+{
+	self->ifname[0] = 0;
+	self->fd = tun_alloc(self->ifname);
+	ASSERT_LE(0, self->fd);
+
+	ASSERT_EQ(0, tun_delete(self->ifname))
+		EXPECT_EQ(0, close(self->fd));
+}
+
+FIXTURE_TEARDOWN(tun_deleted)
+{
+	EXPECT_EQ(0, close(self->fd));
+}
+
+TEST_F(tun_deleted, getvnethdrsz)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETHDRSZ));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnethashtypes)
+{
+	uint32_t hash_types;
+	int ret = ioctl(self->fd, TUNGETVNETHASHTYPES, &hash_types);
+
+	if (ret == -1 && errno == EBADFD)
+		SKIP(return, "TUNGETVNETHASHTYPES not supported");
+
+	EXPECT_FALSE(ret);
+}
+
 TEST_HARNESS_MAIN

-- 
2.49.0

