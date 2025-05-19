Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0501E9B08
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622129; cv=none; b=DnSAjOkzPyItZIDWoRPpo5L8EDh3WV5CYj1mz2+79bZSWSC3jzqZKZ0bjqwA8SzuJzsZS1fxoFaxstrIR2Pvlj7wMDq7Wal/IklRKxsLMrq0ZU4S3g6glxt6Ru9ez4SlOd5uA59eKvYZRHkP8E09WzSO2gxScOYrMSCl/1CCyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622129; c=relaxed/simple;
	bh=mv1hnc/JYcrsYiWob27N35tjryacdBHMn0uTMgSU2F0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a0ie6U+wLUm+KTIXKiebZAcKV3jGIesXHOL7yyANsarnh/hts+EUc3bpl6VXcmAj/tbBJgvxGYeIdXhqgey/5QP7hUElvE3FpzUAwqCEi3vz2QPI0ZZ0Sy1SK2SvSSYQYIViLZZL15pFp9BlP5UQSnsRF1du5iJ96OJQD6MCKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=01LmC/qz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="01LmC/qz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73e0094706bso5299227b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622127; x=1748226927; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgbVYH77FpbHQz0jo3ZInucxDqpVyDPyOGojAswcD18=;
        b=01LmC/qzQmgA0OPRbG75nu8kKZGDpPtmUhKpXWEFmgwKD3fXToyX2vAor/wc4pHEdz
         ux/u6NPwi4sXacRQL1a4Fc8Qxi9xMu4S1gcTBXvV60h4mo5BVpg1jchWNaByWaRo37OV
         6rdWwPKPdDp13xgYq7dOQrsc5sDizzNG1Uo7rEmVQwIIZQtufHwKaHFW8Gbs5KcYBSB1
         5695azyZoOfPl+qaensLQMqjm/gprTWik7XwQn89A6MSrQvUtgIDVAN25urC9qZ+h5z9
         jeNqCOxv6TgkGytsJi5SFuPSEQq4jKckAJA7IWDie8tH17EuCluG7Tk48Xfqk+m0ikGG
         //dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622127; x=1748226927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgbVYH77FpbHQz0jo3ZInucxDqpVyDPyOGojAswcD18=;
        b=wNdfJgHz6EX0Is90QVeWj/0ebDwMFvBYAL4aM21U2BDXup/1KbHRNY8hJY36FMq5JS
         d9j3/gEcVsrTyyUSgPlucua0sJeoKYIRzmxENGfE2GCBIeEZQHY4Y67Dh8W4Brg6MFJg
         WtIZeSQrqJymxHmQ1LZcNlOz+dghTxLGo//HatioZA4bn3bzKHK0JZlrCKVaBjDpGHZt
         ooDGxX9W/3emZG7UZ6tj4sudkE3BNl/cH8odgyxUSstLllg8wxAuSpLxOWBc2D90TxVO
         /sY8FcjFWt/WuGNRZdpAwhMStoQ7R/K2rZ3+9scE4I3+NLFT0glSbz2gzzF00Cab9+kv
         DHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8qg1q6l4gfROHHI+YDtyEMGmOo3G9ppD+QmqrEw9aZVvFIgWhHUhPMAdQqM6L6D2UqmhxyhDjKEFuRC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3jcoS/n/RfLRdpAjJEIPWhH1UCdWge7clFl2KXj9Ek6TWYm+
	U7ME++8xUtIxfwmExxTzJc8H9kUAbEqrDEodReZSUWs852ojfqA8VKx0IroND/9i8gPZzbvvz1Z
	JSiaydktZ4X7yR4KiaZVrSeU66g==
X-Google-Smtp-Source: AGHT+IGYP7gHTQY4VrMBV4Jvp7SIjOwTc4ULH4X27OGkctqn0OJKaDn02AnHC71nkqQCZpE94dyzsqSq6kKMXBhrJg==
X-Received: from pfes20.prod.google.com ([2002:aa7:8d54:0:b0:742:a60b:3336])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:9ddd:0:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-742b3a6dbc0mr10282223b3a.20.1747622127291;
 Sun, 18 May 2025 19:35:27 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:12 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-5-almasrymina@google.com>
Subject: [PATCH net-next v1 4/9] net: devmem: ksft: remove ksft_disruptive
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

As far as I can tell the ksft_disruptive here is unnecessary. These
tests are largerly independent, and when one test fails, it's nice to
know the results from all the other test cases.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 tools/testing/selftests/drivers/net/hw/devmem.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 7fc686cf47a2..f5d7809400ea 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -6,7 +6,6 @@ from lib.py import ksft_run, ksft_exit
 from lib.py import ksft_eq, KsftSkipEx
 from lib.py import NetDrvEpEnv
 from lib.py import bkg, cmd, rand_port, wait_port_listen
-from lib.py import ksft_disruptive
 
 
 def require_devmem(cfg):
@@ -19,7 +18,6 @@ def require_devmem(cfg):
         raise KsftSkipEx("Test requires devmem support")
 
 
-@ksft_disruptive
 def check_rx(cfg) -> None:
     cfg.require_ipver("6")
     require_devmem(cfg)
@@ -34,7 +32,6 @@ def check_rx(cfg) -> None:
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
-@ksft_disruptive
 def check_tx(cfg) -> None:
     cfg.require_ipver("6")
     require_devmem(cfg)
-- 
2.49.0.1101.gccaa498523-goog

