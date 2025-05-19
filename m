Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14820E021
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622137; cv=none; b=C+I77xc4BnxvepDvwXNasfo7r4qIcAASxyJERWXtbRU0FfjVPyBNGkOyTHyrodsIHqGBFo+oZk/aWIeST07XQytT25usbXPJsZmUm7KJnUU2xEW9TYCJrXP+rRieUQ7CaNrehtqKgTzYdHUmuFlmdvZS2QXQhYzlPaB13DeqQn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622137; c=relaxed/simple;
	bh=RrPVhAa66e66GaEwz0wQ3D7hCOWXRdfrdXeUxMO+Rog=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aZ77LL+KA9jk7rBWpEv1GYi6rL9SV1N2QmJaemG+JsxE+PJTGkLxg0esDJ3j93u4CVdnUr59T/rbuOKmBo+IQ2IQb/YQMuEfGeVGIv2lIwcA0el5/VDVzUONA/myCLRPqGRnot0jw5xnOyiNKDZdy9G5inncd+7Pw5TUIcSD4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jOtww293; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jOtww293"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e38174e5so3695042a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622136; x=1748226936; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Glndt75G+OVXAAyKARdAz9i34uW2k/8nkArkfG9jRQ=;
        b=jOtww293+X4rPff3K+J+q384ObwJNJgnL/qR4Q9WceIWatjjwLzQgQ7OoYsVp0WuCE
         lAl015nCIDBlurAnfmQUXgPHJZWdKiOnvNJDLsKP3sN8Cm1czlNv84q6DI2Sij/TJM0b
         Wbu7lagmNycOly8IjaaortIcrBS9ksZaMvBqqpdCdxwzphzqmyouBO6IqsmIAYQPQXH1
         7kNo81BSkkeV0+2cuV0iTqIc4L5YZ7Tg2jxmKHoZTA56H0L1ALGk4Qxfqi4eoyIm61tS
         KvvcwsBrDFUNNyAukG98iUmOn5sMThLRbDx5FvZx5Ny/88oy9bbrh0YY2JfKrOXY3IAN
         lRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622136; x=1748226936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Glndt75G+OVXAAyKARdAz9i34uW2k/8nkArkfG9jRQ=;
        b=h0oFV1YABX+suxNA6lfuiBcvK22vDFA/JCWKkJOgna8Bn71Fu0HYI/EeILjO6kc90E
         uHs9vd6uIKAG4ev5lRzqD3yYliwPa4OtPvo2dU+M2Gz3NVRv9JEPTfilIMjuwo1KlH6V
         0U1ZOGPMETgbZN7R21nXaBeRZrlMfBuRgjQYINbwV0jbxzC2NQ9Yhr2nqAP/j2HUOp7V
         kW7CqSz6E9WhW7Z+jwtMdJrj2EwJ58dLHXVctT1Ej5X4qnXsucQPU2eFsJW971cAMWV8
         vTv02zZnW9gu5cN+rWciy5cSxROBcpyqsaxJEEdLGBYX3D8f8MODpcUKHA2/clcM3v8D
         vRcw==
X-Forwarded-Encrypted: i=1; AJvYcCUIf5NI3AI4oXpMW3QqFYxVCt4qCI/Le4vAQdmnQo7cPwKsF9qxepDYgQwE6vl1hQpKn+QnR4i/3ZOx+oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxijewR0E1xDTsgWrFG7WkLdsGKfIAsFZ+oXG62UcIOq378Emld
	Qpyu0Wpcc9oIIP3rle/AlXqnbW6XW0qvIDGQd16fxfXcIhZ19W6JnQzwaQ9W/Jq16miaeArc6mT
	vUrEh/i66kripZLk2CYQJ5K2MGQ==
X-Google-Smtp-Source: AGHT+IFwRhrMNWbY27xjgLky+xuDZgpoiQb6iEc1dBa6/1lAvXmfz8U9WnJ0DFLv/7SmNdMeydFBL9ineFFXIDYMvg==
X-Received: from plrj13.prod.google.com ([2002:a17:903:28d:b0:223:fab5:e761])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id d9443c01a7336-231d438b420mr163717575ad.9.1747622135688;
 Sun, 18 May 2025 19:35:35 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:17 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-10-almasrymina@google.com>
Subject: [PATCH net-next v1 9/9] net: devmem: ncdevmem: remove unused variable
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"

This variable is unused and can be removed.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index ca723722a810..a86e4ce5e65d 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -526,7 +526,6 @@ static struct netdev_queue_id *create_queues(void)
 static int do_server(struct memory_buffer *mem)
 {
 	char ctrl_data[sizeof(int) * 20000];
-	struct netdev_queue_id *queues;
 	size_t non_page_aligned_frags = 0;
 	struct sockaddr_in6 client_addr;
 	struct sockaddr_in6 server_sin;
-- 
2.49.0.1101.gccaa498523-goog

