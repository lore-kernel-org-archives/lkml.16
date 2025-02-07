Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0E91304BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897781; cv=none; b=Z1O12irLaxQa67GoI0Y28gCYnFHK0xI4Bhak0tYw8u2wRpHFP9+MakOSMlVHafhd/amszfz6a30HgofsOqc1uh5wytWaaAvpiMc6xFQWVU03gP/yvLczEHX6Mpp43UTlk5lc4n/qhanGRl3qzkPyrJ/H3y5BMkk5SDJnxUIsYwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897781; c=relaxed/simple;
	bh=fgaREE9e6jz5S5ZRiFkiZ2u/DNlIlA4sG+vDOPb2x/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlfEOp6c34NlCmIX2LaVGZ8SORPopz0smnld2jyLjuyKTBkpeMRTSerrc+i2qPRTwZ4nit0bHRHewTlap9WAXsB0kKySZoMsOAD1iY5Z1ro9LuspAfiYsOm6BMlHnURN2w1HwBh6x7Nx1RjKFFWPPTBC7IAeofPMVsAlrKyPerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=APga8b4f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="APga8b4f"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f44e7eae4so17158685ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738897779; x=1739502579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=APga8b4fbzgEXKOFmm5MmkAFi0jZh+FJAOrfHHXUAcN9sW+vSWJJNhuGZhh7iTWdu6
         S4+aY5eeemqo1htVA96fbwaalzjjfVaFUKO1D0j4OGTi6iQpIlFSjYRsG+kR28fhLC6r
         fsFhE1X4UOgvx/ydE308PRnrUidf59NaRCCgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897779; x=1739502579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=EPQdOsaU4eSROlXdluFWGuFGNa/yq1G0tF1/CwGXtvSUNIZwVBRPqI6kA2ca7tRyKQ
         z6RYFL8YRYN0WVr6akImE+GCwf1PVGsrGMdgMnMnp3w/AnRr1pq0gna9BjE7KR16s0pb
         euD6HagzGnlRMQvjyK++2S4zxJQa1Fam2OH8U6rRo7CxnNZa1/AEQQSt8e6XaGIEa9Ft
         5OeuIAndzeAYhrvXDJK588HcTCHmPJ7kJbOEN8qzm9aGDIs7/7FOcn+Iyg/zUmlXxwu0
         bCwISX+zFqqW6HdlU8zw4ZExAM//WlXDm2e5zmHj/xJpzSSW559zpJ5WPHkc5xnMnd3v
         i3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWaqsGtUREvkkaf6uf8s73+1PIb0bwTlrkuZb1MBgrTF0XANAc073u3D0stSKYAZ2Zhs18OCMFHoW6/c8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1TllLhTqQN90mK/dqxr2kFexx4lJrHNI8amlqY3xwC4rGHNB
	xD3AiIIt6G2jC60sRVKazP48w9XX3gnwOH3tguA34UCpRSZ8f0mwkTldP1tV8mg=
X-Gm-Gg: ASbGncuHlZUIipLqpl38EJeF0P/JvM5TsHUTo7Ic//YaMoLCFjBDdW1PKbmKl24Oj4Z
	Zo1WZFr3iOpNNQKPzaIr3apvxUTxRtBjNfY/Lejg8xF4NTfuWD81df6twlgqvtr7Rov+H8vmOR+
	cWCP4n5gjJ69/yFJw96oXcmVf3BUzKKYXYZ4Iqsf+gWUMUAQwlBsWymt28+3pvDzi1otTRazKDg
	RXDO92AS7zeUYSXak02Te0bVHUDLRP4Qhc00ecll4RhJz4+kihHGQkOr2qRtf3izvzAb2IfU5Gs
	dZzNUs3pM7W0BFlHbJAS4t8=
X-Google-Smtp-Source: AGHT+IEsXqluB5whpo0nI6jITa0t39sjBeWFPYnCLTBer2jrngUDZ7kId3P8c0MJsNOUiKHKh1jCvQ==
X-Received: by 2002:a17:902:f60d:b0:21a:8dec:e59f with SMTP id d9443c01a7336-21f4e7637d1mr22711705ad.39.1738897779089;
        Thu, 06 Feb 2025 19:09:39 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ab196sm20348955ad.222.2025.02.06.19.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:09:38 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	edumazet@google.com,
	sridhar.samudrala@intel.com,
	Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v4 1/3] netlink: Add nla_put_empty_nest helper
Date: Fri,  7 Feb 2025 03:08:53 +0000
Message-ID: <20250207030916.32751-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207030916.32751-1-jdamato@fastly.com>
References: <20250207030916.32751-1-jdamato@fastly.com>
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

