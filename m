Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9916C850
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988074; cv=none; b=DlTNC8rf9JbzL7TDXOqAYuePRpL4viK9m92xrAyaiz0lUkK0SOPFNsoS0qFsX7i54L9vo6g/v3/OEkLbs/8IqhGZarZ021FsTC90VclJgLDXiPbaFFEk7bRYsazm8bfxsb6bIxYl4O99ntKyNIsHwfxsJTduW2QejObmu4tjfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988074; c=relaxed/simple;
	bh=fgaREE9e6jz5S5ZRiFkiZ2u/DNlIlA4sG+vDOPb2x/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLGuyIvJunIYEKk2X/SzAguQiEtz3Z3ZnjevKqrQZjLA4uxXe22cQgA08MvMJzf+Ob8eivyG4E8jdE3g0ztjL9jutfQnsMkPz6rMP6NBP+zOVIf3lqWuY5sh73CgvMBvs1rS3Mlncp5/ES5a/lDDujvSULFF5vlrTfxSiCDWrNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=FA1apH12; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="FA1apH12"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f5660c2fdso24451085ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 20:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738988072; x=1739592872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=FA1apH12R37ESE1KN4zVVlpFFt82VLgU7O/JZqnzAet/W+UmpDj2MZ3aEYtaNYaf1h
         euPLeo0uoXbubqP4IYbSauBCz1r90fQIFDlDre7Ul/7gG90pD6C+uRTtGJFdb1/zsINk
         M8hPVxquLjUEsWk3FRQZ/rA0aaiR/RCgIBCiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988072; x=1739592872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h50Y3zF4tCkc/2EOdw4zLXgmcTIrGB/eNO65/LtZobs=;
        b=daIEOEf94FoEVKKIk010KToj4lZo0wEyy+tvK6Eq2PumzrdD3x7HSHrdmJurvYu7D4
         58LNVKHtLF1UvnuSkDv6Kq5Kmv+FJNPPajITrchMaGbFRnJZuQ6zwzSRu79DfOG7geg0
         HNiSsdWabifiZyRjBtnCRZV7YxDoDBnv5HaNwHonXChL7TJF3W/qftSVfq17QuOa0RqS
         wiJEe+7BTq/65Ycy8kOjsAhP2AQUBZBXCe8yRm8No3gx9u0TbiB8rSdtFCym0Ds5ZYEV
         iQ71y6kLZaM28PN+xjpk28eoXnJXUFsxu/ZsGmkw0TN5vQjLLs+Natw/lorLltf0YA0l
         WTgA==
X-Forwarded-Encrypted: i=1; AJvYcCVrXmy0GMWcJKcMmQiQ5xZm0fDyYwRx0DQtmtvkR5WHLO8ZeuRRt4Wk7lQ3MA/oUcEY5+uCayM6OwBLU9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jSHiuQiCrF092BPAkzO0jFeV3IqveB5NbywUOolDhEtzo4Mt
	BRfRSor5ileye7Xi5dp47tEQQqNISGa4KAdB/0Qkerp/C2UWFheiIsQNHi1pUVk=
X-Gm-Gg: ASbGncvOKTBrKt8AweRjoe5DfEUsbeHgosD/2K6fttO6LWE9xrnHGv6jylp1Lq7B64M
	C3EkjPeSq3kPGwJ4FXQsfYfOhje40aOmQYvuP7Yfs0JtVP3pgIC+5bMDqwpQiVTj9he9TlPsGE+
	xpk+oN3zh3R1cB0xLQnfR5DIodyNP2DcoqEyhGg0ktBRF/EanrZutdQu7vMbxwhssPJlWjKH2l7
	gzEaVGrztgrFaJNRTNZDONz5BbMObP/Gntf0yAf9Fru2+2WCdyZjw2FbyOZ9inK1RPup3FCrsOF
	xcZFIsgp7meivENjK487Ah0=
X-Google-Smtp-Source: AGHT+IFibipGLR5Jyf9zTmTf+G8WqPE/WDRNuZpNVsIuJ6CUOWboJI4UQgEjzXJ5C+bf4G/4+P5jHw==
X-Received: by 2002:a17:902:e88e:b0:21f:55e:ed71 with SMTP id d9443c01a7336-21f4e6a0100mr87242125ad.5.1738988071853;
        Fri, 07 Feb 2025 20:14:31 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce0bsm38567715ad.21.2025.02.07.20.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 20:14:31 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org,
	kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v5 1/3] netlink: Add nla_put_empty_nest helper
Date: Sat,  8 Feb 2025 04:12:23 +0000
Message-ID: <20250208041248.111118-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250208041248.111118-1-jdamato@fastly.com>
References: <20250208041248.111118-1-jdamato@fastly.com>
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

