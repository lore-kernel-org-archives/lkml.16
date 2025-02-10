Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0F25A2AC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216361; cv=none; b=P55hFnqqMNmKHgMLOzLqer+v2/lSfNXpuD4MvCIoUbJJl+16JHOa9vKojJxwN/g2hQmH8y3zrVCZlLe48zIsziIv7MiAHy0cHX7TpJH1+5Of6ffNvVn7LpMPuQIrLl+YHbTNYGN0OT5rS9nDmHq2LFyj3z4QvT5WNMS1dVnNhvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216361; c=relaxed/simple;
	bh=fgaREE9e6jz5S5ZRiFkiZ2u/DNlIlA4sG+vDOPb2x/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnk++U9hItsw6uw6g+foO9e0KeG5teQHKqJbFeug1Zjfl+wZ18zr++EVeSU8g56UjQzg//C4Z5iuHzHSZ7zqSlFwSsL4VxATkTZ9iN72iClXPpyy1VV7eUUV5TDE4I1G2MQnGPZFEG7dhFBwbW5KS3Twusg2z2+q1Cqtie8Xr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=rtVg7KYe; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="rtVg7KYe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa286ea7e8so5013232a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739216359; x=1739821159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=rtVg7KYeG6rlcqUBkPEtBW/Hkz8LFtyUXm+/jr7RXNJaNf2S8Z4U7thMKtaKvEa+vE
         sms/VEMM7c/BDF8ZiOlNXz7myFov6JRtK91TXeAdBbRSAvB5OWlxYsgSr+g4o8HlhWE+
         tVGjgxtour9kR1tRYtJcid2wI/Me9ZVV74kNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216359; x=1739821159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=kOeu+imaRGjwtXk0xhbj5yGeiWgV/Gk5QnQMybjhDLw6QLuZ6nuFLA/yiL+FbL6S70
         MYkWPI6R5s6iNd4yrSU6kpge16P/lJY0SdGwxGvddPbOUHPiXFQ1C55tm59s0OcP47R2
         ob8+GZG/xRvdJiaibdKHb08oFymh9tjmBk/b5G+SI3S6NgvFPYPXZMbnYw4lDeNzN7v1
         kcLZq3M+NYuAHFMXnqVXiIVa7tGDUzxMP2ICISweg7bN/2m0LRRZExwCWNN6vyI6Qz7c
         1RtZgabhd8HVVuWYbwMMSxNg+UkmXXZ6haBnfLyahyi/QOwRJoY3HXVsJT9rMPl2yDmW
         vP3w==
X-Forwarded-Encrypted: i=1; AJvYcCUTH+WCAUvMdMGjr7RHNJNsokNdbN75XVH1RBFXCg8oDsnt8LPi5Iue6JAPpxwNKY0p60Rdm8GF99zSLME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCIyniG225QyEQmIU83elcrpMFjyMLJDJb0oxpML8U7C33rd+
	f/x8G+jtSOUIBDCLUa4m3NfmPyMAh12mWN2QBssNYlHPioqq6sZ4oKRJhKBK1Pc=
X-Gm-Gg: ASbGncuOAUv2qzGgS76HckwBfmQeLPV0x82+PyWz8bytRagd9eTGGVD6B7o1oDWfVd3
	zjzrTSqFGL9HcxIQFxojDDS9UlQVRkLcafeaQSMCwGNceci6Q4Iio64nxnEWTeipbaiKsG75d0P
	FNLo8yUrFVz+jehVjUmu3TfGwbwTAWQcFLVaRUVaRHQAXeOXneCUwCoYPx5nmLm2t1VqhdXT3zl
	8Cdq04eARyfhr/QB00TncTTA64OA74j0SGdPUDXd9YnK/aDnNgY7KtqJt8nYnxksXRpLKqz5lBp
	4w354X6YxKyi+XCiL0u0Y80=
X-Google-Smtp-Source: AGHT+IFzgpeSIAhDART2sLKxOwBNGJpSGGSROdPFQrtdZ9UrtHaaMReBtMO/Cwsrjd+WaeJliy55wg==
X-Received: by 2002:a17:90b:3c4f:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2fa243ebda5mr24811691a91.33.1739216358980;
        Mon, 10 Feb 2025 11:39:18 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa2ecbca6dsm4226510a91.0.2025.02.10.11.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:39:18 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: stfomichev@gmail.com,
	horms@kernel.org,
	kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v6 1/3] netlink: Add nla_put_empty_nest helper
Date: Mon, 10 Feb 2025 19:38:39 +0000
Message-ID: <20250210193903.16235-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210193903.16235-1-jdamato@fastly.com>
References: <20250210193903.16235-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creating empty nests is helpful when the exact attributes to be exposed
in the future are not known. Encapsulate the logic in a helper.

Signed-off-by: Joe Damato <jdamato@fastly.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 v4:
   - new in v4

 include/net/netlink.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/net/netlink.h b/include/net/netlink.h
index e015ffbed819..29e0db940382 100644
--- a/include/net/netlink.h
+++ b/include/net/netlink.h
@@ -118,6 +118,7 @@
  *   nla_nest_start(skb, type)		start a nested attribute
  *   nla_nest_end(skb, nla)		finalize a nested attribute
  *   nla_nest_cancel(skb, nla)		cancel nested attribute construction
+ *   nla_put_empty_nest(skb, type)	create an empty nest
  *
  * Attribute Length Calculations:
  *   nla_attr_size(payload)		length of attribute w/o padding
@@ -2240,6 +2241,20 @@ static inline void nla_nest_cancel(struct sk_buff *skb, struct nlattr *start)
 	nlmsg_trim(skb, start);
 }
 
+/**
+ * nla_put_empty_nest - Create an empty nest
+ * @skb: socket buffer the message is stored in
+ * @attrtype: attribute type of the container
+ *
+ * This function is a helper for creating empty nests.
+ *
+ * Returns: 0 when successful or -EMSGSIZE on failure.
+ */
+static inline int nla_put_empty_nest(struct sk_buff *skb, int attrtype)
+{
+	return nla_nest_start(skb, attrtype) ? 0 : -EMSGSIZE;
+}
+
 /**
  * __nla_validate_nested - Validate a stream of nested attributes
  * @start: container attribute
-- 
2.43.0

