Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A691DA612
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853595; cv=none; b=p/R6/Ej/Tou6BSDi1fvd4+/TP9t0Yp2u7EFwIHz1R6XEoESKrQF2/j5L0nrrwsOzOfnn3Ml/ckhYMP4Ijdr8E7TLv+t+gEmjdpJaweYxzjIEXsok6VE6cjdQS+CK6wJXwXhAYIfKX1UnUEw3Stxcg7r8qETO155hMLbOn859WKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853595; c=relaxed/simple;
	bh=HDQGG1Q34BlSkCWW84cNeWYaQgfA3isd36S41ZwwwX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4wHXhSyVvGS5pAKKTFjxwn/+PClUtmFlx1LW50vRbr7MdEYSSc68Vq3IMsVwtt0GdxSkqQ6Hw6JqE50ZU4mdqO5+WfoI3dUlmDJGuqIsbz3ZrSCKa2NM7PZDtJtTuzgPbwOtATL0ccnWSfJLBj6CMSO3ksylsj+WB/pZb3n+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=hkUrl3Li; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="hkUrl3Li"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-226185948ffso2893815ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744853593; x=1745458393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9lrbIvu6zRRiCj4HgSRrtBo19PyxJ2njnhqzeLily8=;
        b=hkUrl3LiEJHREHfPNkhc2sQgCARPtZWI8yljzopy2FWFpAPbqq4sKtNwsLZe5pvUE3
         9IT5cOffJqq0SXyWpZlcz1TX5BHxwDA0KtUXi24A2/sgRUsc2a+NGQYFDyb8aKySkiy7
         vILEHcsZod/awwSFn7Z8ixz0BG4KkSowIUvmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744853593; x=1745458393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9lrbIvu6zRRiCj4HgSRrtBo19PyxJ2njnhqzeLily8=;
        b=vgBuS6zc4YlHxhzMN0GokXDugQq1v2QHzP647noiGqE43xA53MLOnpb+UVZySeZIXY
         M4riQc3efqwVyc0ZClTyrDJX3Ij5pv7Jg2fm+10hFzk5vhuv8sTQ4ECqxmE+Mjow8ys3
         fIs58sG1+cORcTiG49xX9yydXfEbxDE4hcEGfjvsaC2/OUCeswyhm/+RtU5Pz6pn8lji
         6jrRkr5ecpuqxG1NkX85OpJW+8ufzCMnyQg2/VKfQtQezNkm9OZrAYpG+5bv7uFhRrjc
         hONd9TiAsmOt4u6oF3LT74gWW0cuaLOuWYkgnqKTVCl7bZNqtzQhsKGcH2/HorlXO7bo
         F/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW2xQaGrw3WOCKwsILpgU9PnNzNZJfD+kkUmohvyF6SFI3aq4cNvK/gXezDVCnwZBenCZU01WQaf+HWLrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznLTH2mWiAe7D4/8O3az/DGJg5VpTn5UnjGJ/0+JF5zxCILeqE
	jB409kC8Eb5pNKoE5jGCcBgn2PFWDxQ4BtCs0qd8ZAalPYxe6wqoQV3rkT19hwo=
X-Gm-Gg: ASbGncvXZOoDeKNBDR6GFtWNYI/zURe7+oNk0ecD/MPLdnl6s6v2SyZ7bLJQHBRaH6a
	t2mcNnOvKRWn5HWrRfQl2BBvogG9GiggWYkvZWpiIH8Uto3gin2EU4XwUcC57C6WkODRMJNdx9L
	kX2Ip0pLD6xFCTlzVtTrn38SQC+BUUILJjWvjro0Typjy80nr/0VAPQBKuCDrbVeNbk3tLeaPxs
	zI1G/xdtPRNc7RM6HLRRG7WWlzbAC+LGnxbrOjOlRLTEgPVFWRqfbNmiCngypmew0IMiKVIpE5w
	wojIyxHHQ8t6Zc1sbfj13zB5ZzeM2iUO0AAMvyGnOHn97DMf
X-Google-Smtp-Source: AGHT+IGIfvnYetCCtpkkTem0fvDPcVdKvorATj17pj9pyflpstgaWD/lkjveVAKVWM6ThAFzVxniww==
X-Received: by 2002:a17:902:d4ce:b0:220:c63b:d93c with SMTP id d9443c01a7336-22c3598533cmr61830925ad.44.1744853593562;
        Wed, 16 Apr 2025 18:33:13 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11c7sm21349505ad.37.2025.04.16.18.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:33:13 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xiao Liang <shaw.leon@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2 3/4] selftests: net: Allow custom net ns paths
Date: Thu, 17 Apr 2025 01:32:41 +0000
Message-ID: <20250417013301.39228-4-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417013301.39228-1-jdamato@fastly.com>
References: <20250417013301.39228-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend NetNSEnter to allow custom paths in order to support, for
example, /proc/self/ns/net.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 tools/testing/selftests/net/lib/py/netns.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/netns.py b/tools/testing/selftests/net/lib/py/netns.py
index 8e9317044eef..8d5c26317cb0 100644
--- a/tools/testing/selftests/net/lib/py/netns.py
+++ b/tools/testing/selftests/net/lib/py/netns.py
@@ -35,8 +35,8 @@ class NetNS:
 
 
 class NetNSEnter:
-    def __init__(self, ns_name):
-        self.ns_path = f"/run/netns/{ns_name}"
+    def __init__(self, ns_name, ns_path="/run/netns/"):
+        self.ns_path = f"{ns_path}{ns_name}"
 
     def __enter__(self):
         self.saved = open("/proc/thread-self/ns/net")
-- 
2.43.0

