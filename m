Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59756221731
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041542; cv=none; b=JrDlhIaA0uzr3a6mDzgaAcDocTtojoRLzaznN6jM1uE0T6dzprjLfJpSG7riof6zthBhLw6iCxOZYWlDr1oHaYY5lVJ6q3prSMkpLWSrv9kiNVQcVt2oF/gfDODmWH3Q5z09CO2Zff7Q7/tkFW+mKvFlSGE879XFzdM9silgbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041542; c=relaxed/simple;
	bh=ldkQQKsDkGAhHJXZx571WMeCR3RMcX+z4Wvjc5zN2jE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TwjhPmUTYWpTH//v6yoNOkGqu0ve1XMQT/HBTJvMyG0N4yLAifDpLsZiO8Nq+J9dIdFa3VrQBU8xq1X6ZmTVfTy0/aUEV56Nbo1imNL9VC/6iRdJ9Ir3jVFrLLTnVaSg8k97MAn5p5G4pQteE/8PuMxYidkxeDWM1pX3rhkUtgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2lWaYOg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2lWaYOg"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23415056f5bso3560695ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041540; x=1748646340; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eFit4se3dsmsa9HWMx2TSuaow40Adh4DQRq38+N1c8s=;
        b=u2lWaYOgHBWCiq0wl9OU39MUFic1B98eONiguqSoOin8Z7JukLMe2piVpvaoOy4Rn/
         0pjxhG5axvb1o2fMVao6JAn/SAXyF8LQk4FgWICu465WNaTn/obZm+UTB9UK5foe2C0F
         HSaM/egLdHwuHAtaHvz6kt5Au2C3TuFQ7jCrS8ozkQ6JT79D1uQIYRjk4dN1LJsi7IAh
         IY69lPbTcmQ4ZfDMqYZOx9iFmHxPeRy4PNsQEhXxbWewgr4RiVkSm2knC8Qrrc0IJjEE
         o6Rl6yi8eR1LtUg2+C2VfhX9ESKxu9OWGbhRxOKe/GqvWfHoIbeytWRglnSsQfzHKoXJ
         MLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041540; x=1748646340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFit4se3dsmsa9HWMx2TSuaow40Adh4DQRq38+N1c8s=;
        b=l5BFcoULR/o/goYVvT0VRNXsjyuHBbEdljbq2sSmRo3RvcCN/TtSs7F7GExNglJBP0
         mP3SVXjHLC3FhB3pBjsfWnR5+f3tUHcM0zAzv9jiH527fppAbg51OOuYtRLMCvdEai+J
         MhvxIPiC5gSQnz+Wo3iAjqZ8SKvVX8lZ5k7zkvlbRLa7iO17u9GUmJ/6abHQLOciHrAW
         MipAW3jAVxdFrQY+UngltWxRtD/Wl9Oe1BlbM3L1yH3EFW/yfoak8HUoJwuP3GW7i4SD
         +4StDNQrYU9lJkBI+jLxZ8tUixPU5q7+NrqxfWfEUFjTo2v6IWJy/cspozRcUiYj91DH
         O+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBOly/Y7bk+NErCLdCPZhIyfAAh54k670ruCrP56cQO6Pi+yWILAfaB+9Y0dMHxhswpTCdb+Pi6DEcegQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2/XbzS5mFLSvziE2GGjOy+7aYABhLLbVhxHWTckC5Fi4lvk6
	6jIGp4wHI8EUxtrukjM6BJ+kuAjxzFxSLu5BCLzzIMbi0op5SJdUbfIKaBnDwW3FJXCzO/p4vyj
	7WsHb74khIW/aRPqkHBVfL/fLqg==
X-Google-Smtp-Source: AGHT+IHVEbxlP+HY5bODAxLKx8PUqiPk9HlkasKey/MBvVDDURED0/am87bZ3OsPQT+WnaEFbk9KFBHAAnfm2vQgGQ==
X-Received: from plbjk15.prod.google.com ([2002:a17:903:330f:b0:233:fdae:780f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d0e:b0:231:7f29:bda0 with SMTP id d9443c01a7336-23414fca909mr16630345ad.52.1748041540566;
 Fri, 23 May 2025 16:05:40 -0700 (PDT)
Date: Fri, 23 May 2025 23:05:23 +0000
In-Reply-To: <20250523230524.1107879-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523230524.1107879-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523230524.1107879-8-almasrymina@google.com>
Subject: [PATCH net-next v2 7/8] net: devmem: ksft: upgrade rx test to send 1K data
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

The current test just sends "hello\nworld" and verifies that is the
string received on the RX side. That is fine, but improve the test a bit
by sending 1K data. The test should be improved further to send more
data, but for now this should be a welcome improvement.

The test will send a repeating pattern of 0x01, 0x02, ... 0x06. The
ncdevmem `-v 7` flag will verify this pattern. ncdevmem will provide
useful debugging info when the test fails, such as the frags received
and verified fine, and which frag exactly failed, what was the expected
byte pattern, and what is the actual byte pattern received. All this
debug information will be useful when the test fails.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---
 tools/testing/selftests/drivers/net/hw/devmem.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 553ebf669a71..0484bda63886 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -24,13 +24,15 @@ def check_rx(cfg) -> None:
     require_devmem(cfg)
 
     port = rand_port()
-    listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.addr} -p {port} -c {cfg.remote_addr}"
+    socat = f"socat -u - TCP{cfg.addr_ipver}:{cfg.addr}:{port},bind={cfg.remote_addr}:{port}"
+    listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.addr} -p {port} -c {cfg.remote_addr} -v 7"
 
     with bkg(listen_cmd, exit_wait=True) as ncdevmem:
         wait_port_listen(port)
-        cmd(f"echo -e \"hello\\nworld\"| socat -u - TCP{cfg.addr_ipver}:{cfg.addr}:{port},bind={cfg.remote_addr}:{port}", host=cfg.remote, shell=True)
+        cmd(f"yes $(echo -e \x01\x02\x03\x04\x05\x06) | \
+            head -c 1K | {socat}", host=cfg.remote, shell=True)
 
-    ksft_eq(ncdevmem.stdout.strip(), "hello\nworld")
+    ksft_eq(ncdevmem.ret, 0)
 
 
 @ksft_disruptive
-- 
2.49.0.1151.ga128411c76-goog

