Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD72066F7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622135; cv=none; b=JkKrNB867Z1aSkViRuASDpR6Q/M5oeqw9QD2qe8bkSQUeYn8igdLLodwHV2sTMSMWYMoGgWgtUcgY6HsdPMSvVSa+wGATtXky4VptBq8lefuVgbfA/b5BDRRZCDQ+vvHMsH1YjfqfjDGV3MgnIgPVRJ+SIjNNUTah/HUoi1hurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622135; c=relaxed/simple;
	bh=DyWWH7L0CCILd4odcqjjQy5VKvNZph+DcgjHacONU08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GuLw27afcp0NehEy+sgR0D5WLgX4QFJFF/4CPz1zsxMVxQAlzqKXUWGKQg0mfmMCWYBT+ToZPp8SAmvxIdos8rkiCZ0+NBzj4tX42loW6fpQIp8KWR6Abr4PqKDNEv84MFZm71iKSfwcQadK8IRfQgBMwt0pnVx+Cn6gbVteSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w1tnfZ6W; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w1tnfZ6W"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e278dd1aso2146776a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622134; x=1748226934; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GOoqGQ98UOim4ci2kcnS9BvhTjdsuvqj0JQE1ld7C3U=;
        b=w1tnfZ6WgTx53clXqSvj7QMR0DLvEhPE2G7VuwAtpgmFjbGkLDugrlqKsjUAILCZAl
         8i41tZZ6HvgB0+mrmae0F4wrwhtlCVhHtkrARP8fh9BWELm+vzeul+7mGrW5qbLEIAoN
         FR6tTTCPoPbMwERimgwEIDj8Rs9Fe1BVSANb15fk3MzNsMjZNQwnkcBesxuKKjB2AFF2
         XS+TUb5oMGZyfBCo0XPUrdzZI+GNI4SJEnArVv3coI5MR658VGmPM1BE26R2ELSbd8sg
         lcnhTU9rav0yW7ShVNIieQ2f3l4Ssz2qHdTkTGGm3caK5bVR/3Du+FUmS/7JTBW/audF
         wgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622134; x=1748226934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOoqGQ98UOim4ci2kcnS9BvhTjdsuvqj0JQE1ld7C3U=;
        b=k0Xidika/GDnjhvTJ1/gFZ5LUcKSzxsKVyVbdUb9e2vwx/5TSavGeWzNdsQsw8Mdjz
         Pj5AHTSWZZ1ytikqzSyu8PO7nSFz9gRze0DwP7LLMdUQosCxRCFDnVXjgdrOm4ay19J8
         SVyCMMe/otp/EJaaMFK1Lh16q4T7ELGuCJv7CbblnxoD0U3V76f7pdtAD42eVVfALdYg
         5iFmU/frM6FxxG8TrrbnIewHE7v7BMqy+WePomUXXuDQwIFF/MApwI6is7dKjEaO9nny
         LE0wFodTm792NpxWcQPsU8UkFT2Iv8YjkiTavyND/a9dPM6zWVEzzw9TUHun3MxUS2Fp
         DX9w==
X-Forwarded-Encrypted: i=1; AJvYcCUa32uYqP+QJj6OsjYw6l6H3voqdcTnVVh8f83NG/cPIuA6Pem7mN52fyQvzFlLmxl/ReiGyXSymyZdUKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rC/XEWb5xwknTNw5r1+s+qBFMA1GRi7mNL3Ql7ZgUqNDipl/
	zckNVatojwX6oxzDia3cKBBFuwsHLMC4z/1jrAYlVhY6r1JIJjjy4dFgr6RM3wg6tx3Ahqsfguj
	tvi6gcdzrsJtecZIIztZtGuIHuQ==
X-Google-Smtp-Source: AGHT+IE6aX84b0eaIo0V77IgI3eQ+VzhrvTcrSqQdZ5DqYv5fJgf6icKRjS5aZdtIH3xwKERF3FKSLCy29p3I18ZnA==
X-Received: from pga23.prod.google.com ([2002:a05:6a02:4f97:b0:af2:4edb:7793])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:439e:b0:1fd:ecfa:b6d7 with SMTP id adf61e73a8af0-216219b13c4mr18758690637.28.1747622134057;
 Sun, 18 May 2025 19:35:34 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:16 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-9-almasrymina@google.com>
Subject: [PATCH net-next v1 8/9] net: devmem: ksft: upgrade rx test to send 1K data
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

---
 tools/testing/selftests/drivers/net/hw/devmem.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 40fe5b525d51..10ffd8a8f72b 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -38,16 +38,17 @@ def check_rx(cfg, ipver) -> None:
     if fs_5_tuple:
         socat += f",bind={remote_addr}:{port}"
 
-    listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {addr} -p {port}"
+    listen_cmd = f"{cfg.bin_local} -l -f {cfg.ifname} -s {addr} -p {port} -v 7"
 
     if fs_5_tuple:
         listen_cmd += f" -c {remote_addr}"
 
     with bkg(listen_cmd, exit_wait=True) as ncdevmem:
         wait_port_listen(port)
-        cmd(f"echo -e \"hello\\nworld\"| {socat}", host=cfg.remote, shell=True)
+        cmd(f"yes $(echo -e \x01\x02\x03\x04\x05\x06) | \
+            head -c 1K | {socat}", host=cfg.remote, shell=True)
 
-    ksft_eq(ncdevmem.stdout.strip(), "hello\nworld")
+    ksft_eq(ncdevmem.ret, 0)
 
 
 def check_tx(cfg, ipver) -> None:
-- 
2.49.0.1101.gccaa498523-goog

