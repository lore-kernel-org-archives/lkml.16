Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D5A259CBB
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264860; cv=none; b=EFoYKQykuyhlaBzu7ZJiViU5041zAUTcGHiRbevbRFMS9gfVEP7Vy0MFCNRclekzMlz5B1HPmXt4Q69MH66GSMs8DCwHJao9JMTUl7zIiEDxEbt0NKcESojdS/MfOJo1qoLUJnXkKyuzDAva0NzxON1ZhkffYh3WHCkSrw3lh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264860; c=relaxed/simple;
	bh=9kLsFVdVHZC1/N9aRdTRVFrJ42xC1c+3yhppaJpMsio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dArNPfMz3iN6RmZDRPi72DjPL5FW8V5LTm77HgrV93yTlkQSIi0KCC0KtyFpiArMUGq5a4PaTg3GlvMsnEPSielNHfE7+nsBvAYIX0IQ0l1awYV/6sAcdR8rhqZhfP0QmgwB5bnLtw1RAulR7u8QUVTlAmoNSHs6zdGkp/YR078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VzmvQCE2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VzmvQCE2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1503979f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749264856; x=1749869656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blYZX9SALP3mKTtW5/j2PauIX7nPWCX8bAWtr1pxWl0=;
        b=VzmvQCE2peWp2L63NLmLKZMio1jAlZ9G1z+X6Ob6JvrVNq+IU9Cwqg2jED1w1JOvJB
         2aqLmrdFnNG3+k66uqjzG3kqbCE0xCPSl8ajEWvMmrcNMpTLYLoAQhmNIKeNrQl7i0sC
         0C54h12js4MVJElzAmPFzokO5BUswssMjV9Ih6n6ryBNVFMhocVlDa9ngIim5LAfatx2
         oiw7KyBob3rFqQ0HBCH0hne2LwiEngoKJiKnjnHyPRVmUozo05Fnz20p8Eb1Qx4cw9BZ
         eE03TyKPnAIu2PMBxkFdufbHwlvRXFUrj4U+/gQtQ4zG5p6FILCNtjiATM6yR/F+5Jcj
         Tssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264856; x=1749869656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blYZX9SALP3mKTtW5/j2PauIX7nPWCX8bAWtr1pxWl0=;
        b=leGxwP+LPFlPFww3nCMxmsQAKIrenKOoITu9pdplr6GQTmb5gkbiFzMNGT8RH739wN
         Jeolh96lHQnmPE+DGgwCa2ubN2+A7U3FJRMR/DKrT3MyCYa95qXc8s4zrLxibxt7tm3Z
         ZFupcHFClxMee7Ys4Gwc9h0KGj68/HQNxgTEIQCsZdzKI911PKNKOEDqatcWxuhFEION
         TillC5NwptTjx7RPj963kEZ8ggNg4JFEafcuAjWB9Yw7SYQdTy4zghwZfqWoxhq+vx7z
         xXtIJqtBNlEoY0St4SlG+LWTVHop9xFP6pBWHK6BvGjJ+ZqYOSA8GQ7BTV/YcEq45cqV
         Ff0Q==
X-Gm-Message-State: AOJu0Yx+VP7yQ7e0XHsW3MuH6RaAIvy1QotK9kbppa8DUku0zMNspBPD
	0jQlD84xcKvAi/TSxxSfAFIJ5f1TcyY+5+9lniHN6brRV1bnqpeEh08SuHossmrwg2s=
X-Gm-Gg: ASbGncspnq5E1ZKBb/LV3UjV/kbEqFfB0BJuj9eF+/ExqPg4jLPAo3fefmFxdH+S+gT
	SZbxdGtlzICmIZO6ZEdZ8B+dbYU65uCwWC1RmfUdg0UJfIZU9brVs9JQAPKINlmUNfvH0+bV57D
	e5/SvoUALj3GcNm424yiBnNLONmpCEZ5Fu98fRnp9mXhYzHGqjcZfoTslMDJMHP/PQ97TPp1YSp
	kilX6wK+npAg59m3085hGBvi1uOCj9dz8arDzakbzYGcO50LUxIkhqxTcqeX6AAa/g6kkicVXXl
	cyECRH49npw8MdA7xqBYAFlYja34G15s88+C6tuc0IX9H3hA
X-Google-Smtp-Source: AGHT+IHJ8LwIhaZRKIgzpbwHMvqzg7hdB3xBlwSSNm2xX/hnuxNAGse4PY3D/NNj8BudY/DwljmTRg==
X-Received: by 2002:a5d:584c:0:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a531cec750mr4573998f8f.53.1749264855737;
        Fri, 06 Jun 2025 19:54:15 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:80f:b600:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6429475sm2005465e0c.45.2025.06.06.19.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 19:54:15 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 06 Jun 2025 23:53:45 -0300
Subject: [PATCH 3/7] drivers: tty: Check CON_SUSPENDED instead of
 CON_ENABLED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-printk-cleanup-part2-v1-3-f427c743dda0@suse.com>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
In-Reply-To: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749264832; l=849;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=9kLsFVdVHZC1/N9aRdTRVFrJ42xC1c+3yhppaJpMsio=;
 b=V7C9sb6tGmba5WbbzCCzgvis2cX9AK+EeOcGSXwItak8TkY+K+TnnSUrBrbGp4mQBLXbhFXa1
 b5sMv8+wDMXDBlakfIx+M5fO23Lt7wo09cled0jB6DCtxtxEcDyqWTt
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

All consoles found on for_each_console are registered, meaning that all of
them are CON_ENABLED. The code tries to find an active console, so check if the
console is not suspended instead.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/tty_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index ca9b7d7bad2b6807b29d3768bb655528ea162816..42f81573d8dfc668b38cd0b1c14962a7370cd954 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3570,7 +3570,7 @@ static ssize_t show_cons_active(struct device *dev,
 			continue;
 		if (!(c->flags & CON_NBCON) && !c->write)
 			continue;
-		if ((c->flags & CON_ENABLED) == 0)
+		if (c->flags & CON_SUSPENDED)
 			continue;
 		cs[i++] = c;
 		if (i >= ARRAY_SIZE(cs))

-- 
2.49.0

