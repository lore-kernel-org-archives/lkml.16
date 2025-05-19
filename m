Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0481F09A7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622132; cv=none; b=JWyds+zMTD2ijoBAGVtdBDBo3dP1P2j/WXVLI33Iw2on12mxBqbPIOOALLIdPFqp7BOWxBJDUXcPvkB3dXrXUOEjOSAhYrhmQJS1P6CyP9aPsoZEzj0ulI+b1aePwNNI8CNMqfRjSdABhv990oqCXa/tEs7K2Iof4CDglznd1+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622132; c=relaxed/simple;
	bh=+fLzCD1RoUrUeV193X0CN0MPAFz9uajW9owZKfgSTYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4JLSeLKcdVYZHHAV38I6SYJTnZCpmeY+bB8bZlYxTw74/9htYrlg5tW/1dvK0qMkS20qOF5lFINK8zmeTC36LSXWqzz+A6WQ4AAVo47yy6YA8Zjyc8aGpKwTiQzBquRTvEmCBxFe2fm0nxFyeWWtayBExM4hs66zIb2bImQuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c0YgX5rK; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c0YgX5rK"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a091d290so2427556b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622130; x=1748226930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsib5kCQHhRTpjaf9L/1KcIsuAgRVw/2/Ukd6+B+UoU=;
        b=c0YgX5rKmwq33rnuPYK6ZxMBYswLZHFh4/l3+XZMwZNAkr7n9MrnTFjr19kx2kaW7Z
         Ji+ka646sC8VLF6Nzic96WWm1BeIQzTIu2dy0CPOcP++sG5LnUaqsYrMqltkBC8m/8Ex
         u/cu3uUcgZ9B6ADwUMUOF7ksGmgGFir7bhQynTCJ+yLZ4b5a+p7lbQcR+3Ra0WT3mqB8
         h4IcH8a8rI4aIOhcxs8Sc92je8MFgbuhCFFB33Xl7OqCGTxuvwwYoygWXWIvklJJ1ADY
         rY/BNdjCmCmvLVo4AKAXyOqoVYhmbwTYHDE6/2L+AlmmXzGhlsoMDhvaOwC1lzjYxFaH
         I19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622130; x=1748226930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsib5kCQHhRTpjaf9L/1KcIsuAgRVw/2/Ukd6+B+UoU=;
        b=RAxR7J8kBguMiFR3xHTotByqmtAS8BLHZ6ukLpPZ7171QJOAIZi3XjWNwQRpTQJsJG
         9opS2g80fwfnoTS0udcOvY0I1n1YRHTKjuc0cYnp8DqdMX/9Q3ksipJofXf8xLb3WZVi
         bqZUvN9+n0TFlOt7gkOEPlaKjBU2rgzHOOyJi9twiZloNP5bNCwSgr9WgbB2Zz3OdFCj
         2y1PsRPzbayDs1ufDFopNysDEvvS+5KxagWvFCzKCJnUeOclXuCalirp7YVYnTIyMvv9
         vbyLYolZq9kqjNFrP0E/0Cygz9BD+AAdoY2+eoiv+aJf6S0Lxi79jV7F/Glycl3rGd4u
         Cp7g==
X-Forwarded-Encrypted: i=1; AJvYcCULDtt85BstAj/YY4FBVCEHhzhCZ9JWDMQxcWP8c0Zr+yAzhgsmUU65ee3qHSY8dMo3lE32YI+uzGp5ZJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8cZr277kw7PwuCLJ0WTdzcBJPi55YX4E/p+nEjY8T6U9bVwSV
	M9ANHYLXt+lCe9HKgMMlKDxk7KTrC6sxdltHpiyTHrzmpfdH836OEv1/R0Xpawm+DznVEZfqYzF
	xL06UyC2A7Y8sgNvecupQD+AGSg==
X-Google-Smtp-Source: AGHT+IHYtSlpqkjG9aEm65HFlOMqCYP8ZVIHIn0ysadn3DoH/Dao7wFtqE4cnWV8BuGlnEjplUE25OvnhoAFtu3l/Q==
X-Received: from pfbei22.prod.google.com ([2002:a05:6a00:80d6:b0:736:415f:3d45])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:91e0:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-742a97ad507mr16514775b3a.7.1747622130537;
 Sun, 18 May 2025 19:35:30 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:14 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-7-almasrymina@google.com>
Subject: [PATCH net-next v1 6/9] net: devmem: ksft: add exit_wait to make rx
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

---
 tools/testing/selftests/drivers/net/hw/devmem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 850381e14d9e..39b5241463aa 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -30,7 +30,7 @@ def check_rx(cfg, ipver) -> None:
     port = rand_port()
     listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.addr_v['6']} -p {port}"
 
-    with bkg(listen_cmd) as ncdevmem:
+    with bkg(listen_cmd, exit_wait=True) as ncdevmem:
         wait_port_listen(port)
         cmd(f"echo -e \"hello\\nworld\"| {socat}", host=cfg.remote, shell=True)
 
-- 
2.49.0.1101.gccaa498523-goog

