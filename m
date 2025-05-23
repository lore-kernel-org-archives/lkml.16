Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75321FF47
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041539; cv=none; b=Bn5ODum4aUtUiR8OX4E9PQw7Ng7gEWBk/KYM7CCVyYdLtwtNsgBUIca0KHfQ+R4IUaRhfHRoC7WFumW6CxCOK3zXBT9cebolBsHNG+5zyn13muuwGAFX7xqgKCGQK5nZUGsxJY2ArpTJS1C1MjYq1Q9y65rpQUcOM9HRLYb30M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041539; c=relaxed/simple;
	bh=SIJBs96ZP3TjrQVbKdqlUnzxUYhpJqa8IzMH0N3Au9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fM/lUJKpy343p+s4nYNedzTGw5yF/Kvr0PZPF7HEU6/iMNM2peY/tOINlxB/upLAXuo7dsT1GxPxCkdBhMOjPS9yc9+2Sc2Ow8EFw9g1hMis6V1ljES4web9lFsO6ZdJC5XE8Ocytg+b/VIYF2vBiFsJ13kvq2t8104tIOf62yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Ak0UH5a; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Ak0UH5a"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-745e89b0c32so704604b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041537; x=1748646337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq3MiSoN85Fd7+UjYw33GE3Gx+T8lZk2tdUUfBjVWzU=;
        b=2Ak0UH5aep5LFN+ctDLa5d3tgrBGVz55INoZ1p9FPO7DINx2MjVpqiClKGvFr07m3X
         sK6zNas/j/JZwlUzElyWqz977wGiVqJZy7B7wG/g35ntFojcacHEk5qWo1TqX7I8Mn48
         squUp6r0HLI28vaE9rsl2CWfskxiy6SgHtyUdvGQ0Y6LFGkEgoUY3igESaki6OBG5Mzd
         pujJOKAnRn6KDkNUrjGglgmAWi1wQCupWNhzZbRc5qceOcTH4WXf/T3R1DSGBLKsFWrL
         ipp+8gFZfIM5i5rUamkWnoavpuP8SbigsEMXGz57NZV8rodprywfr4GitH1DwXojtPmF
         7BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041537; x=1748646337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq3MiSoN85Fd7+UjYw33GE3Gx+T8lZk2tdUUfBjVWzU=;
        b=XOfQiXQtEmzd1YD3gskYcN7XzSDLjdnBIEvrxx6twy9tGVw2Z+CDScxoX+0sVJVV+D
         LTx9q6Ttd9Li5msFPFiA1TCCCCbAo179IkIwM13ZXZQK468EMb3BjvttdWZ5N7WlOUfD
         eIPtMh4e25rLrE9ejv3p7N+yS/OiENraBPHzTC53AEJmcOZNCtL3oUkfeK3tlwMEQV6x
         H6DjMY3pIoMR+4kaj0ADZp8TK0yAPPK6EZsmA8RUMGndUCgmOp85gvnp4uZB50j92k6q
         nxbUqA1TNX23SJoQ3IsDNhQ5lBTrkKgoPdHf1D5twczj96Mby+4t1eU35nlZosXQGc86
         1uoA==
X-Forwarded-Encrypted: i=1; AJvYcCWo9SKy+dy3THZiEdVzJoze85bhFlbvJnnsZIP617RA+pNr3zVKG6sfMMwFn2Xu9vbcv0nVZev8DAhhncU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxR1e4FJZpiznvF8hCZJPLJmu/8CPKiLp76v++tFETYFpYO+PA
	nYG6ihklb7IZyMsQ6yDirGOzYlz70+bWBRKrNOmetnOHgajDgNwmZYKIBlNW+Kqt11GNcbX43Gq
	sA9ROH7lidIoOLZqogYgBbShgKA==
X-Google-Smtp-Source: AGHT+IG51r7w5vVd7tKoIq/pEiL9OrbNLMGxS3kuiPEdD1pFnzFqPLxgz+6QVaSF58OZ1dsgx5z5OO52eQLnZEtFAw==
X-Received: from pfht14.prod.google.com ([2002:a62:ea0e:0:b0:73b:bbec:17e9])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c6cb:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2188c24060bmr1641078637.13.1748041537083;
 Fri, 23 May 2025 16:05:37 -0700 (PDT)
Date: Fri, 23 May 2025 23:05:21 +0000
In-Reply-To: <20250523230524.1107879-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523230524.1107879-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523230524.1107879-6-almasrymina@google.com>
Subject: [PATCH net-next v2 5/8] net: devmem: ksft: add exit_wait to make rx
 test pass
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

This exit_wait seems necessary to make the rx side test pass for me.
I think this is just missed from the original test add patch. Add it now.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---
 tools/testing/selftests/drivers/net/hw/devmem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 9b3e2c78f457..6effb9e33fd8 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -26,7 +26,7 @@ def check_rx(cfg) -> None:
     port = rand_port()
     listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.addr} -p {port}"
 
-    with bkg(listen_cmd) as ncdevmem:
+    with bkg(listen_cmd, exit_wait=True) as ncdevmem:
         wait_port_listen(port)
         cmd(f"echo -e \"hello\\nworld\"| socat -u - TCP{cfg.addr_ipver}:{cfg.addr}:{port}", host=cfg.remote, shell=True)
 
-- 
2.49.0.1151.ga128411c76-goog

