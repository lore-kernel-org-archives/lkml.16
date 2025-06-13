Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F061DE3D9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788904; cv=none; b=dMw6SI7zdUV3NVfE+QpnjJyAnjhV+98ly7JqBw1N7RMarzl5FLhO69k+r4ttE5DpzJP8zA4IBNtLUWI4WUYdv3MVCQxVnq48URaC9AlJgSbRi06Sa3iyIChdMNmv2+Wv1cPrGcgxb+kmBfLBaU7UEzcz8N/6SX6SA6+YnmB3/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788904; c=relaxed/simple;
	bh=ajuHnnSRgwwpumvdXLZB+CCnOw6RWfwS4TirYIkFOco=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jKeKzblMYvUrnwmmbuUSnf5bghDhUG31MdjJgMQWWo+47B4M5VhObnLhRK+NTnXLSWUyCo+v+jJ1ypQAFtF5qj1rHesnj/c3Jnjt93wDDvygTol7XYMH0giCH1t5qdh0dLN78lb92ZSnUIXa8jFCgUZYJmWdzPUU2GEq2aXaoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuVENKno; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuVENKno"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c37558eccso1196670a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749788903; x=1750393703; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OMs4el2zdME0U5Bh0u38RmmxtHkZW7DUfeo5MQZot3o=;
        b=LuVENKnonGHeos7U0m4y+eucCFMWSlYbACDFv35ANzZnhpoLQhFOWnqKD2geeJXeab
         Tg+FezyNbOpncNO9xWFFWPab65YbdKvL3VN47FNthJv5aHIqn7OU7LMkr1n7fbg/R00H
         K4lxAD/DmDXbZPhIj4Oj5C3dPof+XqhW8wTHmUH0R6KRPi8N/MoiQ7A/75WSQEyLH7TS
         6ASem8JTYuXlFKj05WIvqg1fxrhzKiCFZbzqel8KFiKFSDBrMG/5oQ5T3HxrWrWkD8J8
         kPoTM4KAHrEt5pAhYJauIMln3H8rhlEzNfV4Ca6mLqs4zCt/mb2yofmIYC6Uf8fyAer+
         tBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749788903; x=1750393703;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMs4el2zdME0U5Bh0u38RmmxtHkZW7DUfeo5MQZot3o=;
        b=La/1yJ3OA2AdSEGU6SAACzKUYy8AYtnUxpHEvnlctw+BB6Yz77HtDSM4bVy6P4GxO8
         xfG+sf9rIFCVhnXNrwFpdKc/sDPGX7U+oRCPmTEwyNgVcEUqSMOWplrUWj+WeFblYxwk
         ML0kTj0pZyqrEGEKnjxagXZn1LqO5MLRQoqruDiWesYJxjpR/IGjeYwyOd0nd/07Zd/x
         LZQPe2W+JPUx9g5JMJPTNvwe57JnCvNm5vQhaIFmGF97R9TFu/+ceRqcXJQyxtY/BorC
         0BoWgK2iy33oxNzAq0AUU29XPC6rdGdpYEZtdIKtyVLV0QhMNlaEaU9/OtY3BlhIfHO8
         OidA==
X-Forwarded-Encrypted: i=1; AJvYcCWJJxeK28bGxyxHzhwIK0HvxmT63lda4GN6lpDvDEZn7lOTRVoO2yY/993xcWBXh897gA+XYH29y5eXvq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMVvW061RYNllYNVI8K2c2pdppIRAkYHDoL/ICtWHW34G7zpk
	ez/dQb/caqutLrINS40YPVjh4NuSaRvR2r04SSGzORei4BeDGj7q3oFJTEmwOPOAEU3tS34b3h8
	3M68RQnHIQpUdk4gEiGaR5/zK1Q==
X-Google-Smtp-Source: AGHT+IEokZ+VFPB53+gBJoGAUqzmEK3QBv1KmzWNzDUXYog11k26C5cCePG3sYOEDR3ejCqBCKhLhSef9kk2MmSKqQ==
X-Received: from pjbta16.prod.google.com ([2002:a17:90b:4ed0:b0:30e:6bb2:6855])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17c4:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-313d9c306aamr2594977a91.11.1749788902651;
 Thu, 12 Jun 2025 21:28:22 -0700 (PDT)
Date: Fri, 13 Jun 2025 04:28:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613042804.3259045-1-almasrymina@google.com>
Subject: [PATCH net-next v1 1/4] net: netmem: fix skb_ensure_writable with
 unreadable skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

skb_ensure_writable actually makes sure that the header of the skb is
writable, and doesn't touch the payload. It doesn't need an
skb_frags_readable check.

Removing this check restores DSCP functionality with unreadable skbs as
it's called from dscp_tg.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 85fc82f72d26..d6420b74ea9c 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6261,9 +6261,6 @@ int skb_ensure_writable(struct sk_buff *skb, unsigned int write_len)
 	if (!pskb_may_pull(skb, write_len))
 		return -ENOMEM;
 
-	if (!skb_frags_readable(skb))
-		return -EFAULT;
-
 	if (!skb_cloned(skb) || skb_clone_writable(skb, write_len))
 		return 0;
 

base-commit: 6d4e01d29d87356924f1521ca6df7a364e948f13
-- 
2.50.0.rc1.591.g9c95f17f64-goog

