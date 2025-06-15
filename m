Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEC2AEED
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750018093; cv=none; b=o0TbK/sc2smnSMpXG/I5WrUhcYQamAtxz2EeIfyWL00/2sYO8IDMDvg61dxxDoCb777Zl14wrNQ/kkwayBSgJeY1gwKjhemWw/HKiy/5AFT7Lo7IQ5v3oZYBHCGRMu9vp5x6XKgt7YxdbHeAG4eYi11Rfk1G8BfqrNLSl6nkrYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750018093; c=relaxed/simple;
	bh=uMOPMEFm6zkUEwkTzRTS07bcGtVy0E9xLhozA2iAlG8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ik71vtOEaS+IjH9QL5E/LAxO68u6jsBfHTIRm9YBhThgXOpC+CEhYQpU+bsTKYCHV+/40VsaNZVxk98cmr1pOS9TiwcHh3Zl6lFyLKKzSq0CZw41o8xOhDoYd3upfm2n25pX3B+u5lPfnUo6hCOFzzNyptc83XjNNo5LVDrH0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r00YtgYa; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r00YtgYa"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115383fcecso2450117a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750018091; x=1750622891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/A+Xw7FOtOaP2Wv05uKtCUa//XsXy8YvXBf7/4De0I4=;
        b=r00YtgYa/O4OWV7QmEG2L+PU9WgnC8BmKVurGH9XYUkx5YP4q72NZk3n/mqbRBW+yN
         Fvlzf4CjBSuPeFx9M40vZNmfYT5pQ7mvDTBSjfcekIIBZxZfAH5GKPAOjNOn0mvcKnGk
         ErNYzN/jAH0sYOLD6Ob0Pt3UGLS/73PKWWaItIytvXeQ2bXfrgs/plCG4VsJDmZ2qLTH
         Tkt1tsYgniYym/y80WswPSgv8rXoZgX3fZ0ov54c/gQCAhkmVIPXrZK1QT6xhe6SYwrU
         YFTwOXeG05k7payRYEJKTtTKeQFmtGo+FcmWTaL9OFS2Yp+iWqwFxlYXcd1delysI1Zh
         Zjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750018091; x=1750622891;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/A+Xw7FOtOaP2Wv05uKtCUa//XsXy8YvXBf7/4De0I4=;
        b=rcdZ1wtVyGUMyBh4Fob0luV/NXnNqnbm0Qvm9rYXhndMsxFUKtCWP+xkaASC0jMcT4
         iLqEnyVyO8f9Mpht2jWjcK4fGO0VGT3wWsxF2bDmvkyymkgUSgPBMw5+MzhxPbjvbtKj
         69IZCawYwf5qF8xHquOCBuNWcUL16UmsX65CiEmnZNP0F33wOLZoMnwJHl5IU8VpaaDY
         LhS8Ul+MVHSux2+cQ+5mORIhA4lZ5pP4dXIMWmJf7ku2NCYwMwKHUWzm2m+Hejvz/L7Q
         WFyyH+jsZFs/FzWSvkMZivDzqZjuitZcJw0pO0vQ08W1Bg8oJjAXhNo1K2WUKbki9AB5
         vr/A==
X-Forwarded-Encrypted: i=1; AJvYcCWcAp00/pdikf2l2u2xHtLJ05gO0t0Kfehj8m4KgcwxLH+7rdUs6LE/mY2xPZlUhug9r6Vu5yKohURPIuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlK3aG3V8OC9UMXN2kb2z/TOXV7FuXubq/bGAGm9TFLXGLlT2
	/+xws/fcrU1XHZdVo3dkMlMicEruw+0nGeIuX8nG5PO8FcegEIm2vfcEpzN+4p8gSTOA5NDZ+Up
	DWfdAbLfoxGB2HTN9RQEymb9gOA==
X-Google-Smtp-Source: AGHT+IF23fHiZFDqsUkUJTe5Jy6SuSLB12ZzYWCujHdrS7T08CwiXfZM3+F+UZSGHgkckhnF3DgNgir4mq+nA4nJCA==
X-Received: from pgg12.prod.google.com ([2002:a05:6a02:4d8c:b0:b1f:dd75:de2a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:258e:b0:21f:a6c9:34d with SMTP id adf61e73a8af0-21fbd473bcemr10025937637.1.1750018091208;
 Sun, 15 Jun 2025 13:08:11 -0700 (PDT)
Date: Sun, 15 Jun 2025 20:07:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615200733.520113-1-almasrymina@google.com>
Subject: [PATCH net v1] net: netmem: fix skb_ensure_writable with unreadable skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, willemb@google.com, sdf@fomichev.me, 
	asml.silence@gmail.com
Content-Type: text/plain; charset="UTF-8"

skb_ensure_writable should succeed when it's trying to write to the
header of the unreadable skbs, so it doesn't need an unconditional
skb_frags_readable check. The preceding pskb_may_pull() call will
succeed if write_len is within the head and fail if we're trying to
write to the unreadable payload, so we don't need an additional check.

Removing this check restores DSCP functionality with unreadable skbs as
it's called from dscp_tg.

Cc: willemb@google.com
Cc: sdf@fomichev.me
Cc: asml.silence@gmail.com
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
 

base-commit: 5466491c9e3309ed5c7adbb8fad6e93fcc9a8fe9
-- 
2.50.0.rc1.591.g9c95f17f64-goog

