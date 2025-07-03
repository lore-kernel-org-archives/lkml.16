Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A152BF3CA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581445; cv=none; b=hife9Yfd35cZOLgOcNvLUurz40g1V05Gc5hr+Ns8oWmzrPbjO5fs+ItfLOhXKjbTO51Vrl0NoYgQMl4AKlF1KVFPOJZH5wtHF16uNOsiu2+jhDJ3in/NbbDb3xWr7H1nDTR5qftecp+a3YM8mPlntfVt+Agonlz8ilC+xx9ts1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581445; c=relaxed/simple;
	bh=76jAgqwnRdt0PkgsmBh+2CH7T1W71cnmvzvOLXA8MWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bopAlHY4EqLJwC7n2IqQbYl7vwm6WYPaBEDT/Xa9ROT4V2IrHHt6RmXfJWr6ptrss2CjNRZS85a8Fn2Uo/E7XbDg/QweVGYgZW/aeDF5BNl6uEVclmvyJHXVaycZ9y8LEEy+ftkt8rucNKBJhRXhncd8y257/5I3Ws3/N+PjQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a0pjaQ1z; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a0pjaQ1z"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2EE0C3F91A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581434;
	bh=VswAsDFL0zNUvK6Slvz23luzH3RQ+gAmm3nQvl/AzzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=a0pjaQ1zO/IF1H9x2gMbPfmVLk3L/6SWDuNgDaxjwfOntOMKXNc7Yj0rOXNE+GFYY
	 z0eo9KxHBK453Ve6BBZrS+sNV7Z9FvhKfpF460VSlyAMMsJ3g5u/NEVfPb1LLMSmqn
	 5vwehTQrem1Kxb83UZWXy4TpY5V+LSvLzYAwfPfZ+ARXafEyanUwWmDJ92C7FpQFy0
	 Q+ofCX6izNPeyozhLbC86oHyX2dzABUnnDqiCHsZDFZ7+g7UlVQyqTvWLNyE8woBll
	 qys9dfpBRwtSJHeQLGdAvvG4NhqE6IeMqx20UH0ka3gTv23Y0aKaj3mIUBCJTo2J9M
	 HLD2YlXbl/t8Q==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-606ee65164fso259897a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581431; x=1752186231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VswAsDFL0zNUvK6Slvz23luzH3RQ+gAmm3nQvl/AzzM=;
        b=ZLuZexKMYcC30tNqn1oUNhyU3feP/gb7+WY6B9Xn+GgMFWXns6htyqAk2tsqUqhpb9
         JEJlc3G95gu1hY5t4DiEf8w9atNBvsSFyDeAIEY41C5gyzuHOlnS8yLedvpyQY2OAyTm
         LeL8VEX7zMp0joqPr6ZcBeWeMh04pDgdK8mGdth5U2Zek4S+0OBvVXhVwN2dayXGee2m
         nmeQO8cd3XrpWDphbFiMZHUTK4prQ8bTst8RwN3+wll32m4GBdUuZ7zukpDJsfXzQii5
         5oA783WuJpFP3fiuSa9LZndslnhwhP8fCQ87m3/I1pQH3rk6buFwqDv0BLbgb6UhlNva
         jnIA==
X-Forwarded-Encrypted: i=1; AJvYcCW3X9hVOPqKEiQXiTefagjd88he4j4Ngn+KuxPfVitc1cJsPQIvULN75B/PhiVnpYWyNLUMG2ogUBW0UTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgH7OuEqdrAOuaAbtKbmdwiTEsyduUUmqinzn9EJZMGuG4NEl
	fD7XmVfnvsY+gGc7DEMAEKSaqfgoOobupJEN/KIpH9T54lRrQuZft7D48HIS4t1xeEdsN44O37X
	4aFA8rBGWMwxd/+Z/O+QJSllJfvz9fMJQSTdxkE/KpO8QrJHlbZLMxp7wgmKwhmDuHEuL0u9Vcb
	5UFKlBgA==
X-Gm-Gg: ASbGnct36UEAoVy3bWbafs/SBwrL6I1nMwApqJ7QwLRk/Oh2z+RKoe1waL1ZidfGeXU
	2ZuHo2s49D3slyCpmGNTnq8XuvdraDW41MhaFgh9MAQ4hRLW2KF+BBhVZr5l1ili9LIfi68pe0C
	51SMo917hDr4r/OvgQmztuK4SSev8U2LDVKp4bf2kOhXd1KxDURd/P0NO4/Rf5YCuumlzS0jLGr
	LL9VppgNQQX8LHNWSj274ldhR7ZcSB/VBIi8JAD17fH/IY6+CQdWvArPhI1fQYoGAevk+0Amj5b
	rfghZibMRE9ECtzuFoTp34s7ntNSM5sPdw3cexqTSFHMFcdvyw==
X-Received: by 2002:a05:6402:3588:b0:60c:6a48:8047 with SMTP id 4fb4d7f45d1cf-60fd322483dmr239241a12.11.1751581431514;
        Thu, 03 Jul 2025 15:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFPhWZ0KYGjmFv+0GQApSZDavL8SiqBWwO+aZo2jCUxgX0FmWRVcBX+bYx4jduoymluOqpJA==
X-Received: by 2002:a05:6402:3588:b0:60c:6a48:8047 with SMTP id 4fb4d7f45d1cf-60fd322483dmr239220a12.11.1751581431164;
        Thu, 03 Jul 2025 15:23:51 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:50 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@google.com
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [PATCH net-next v3 6/7] af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
Date: Fri,  4 Jul 2025 00:23:10 +0200
Message-ID: <20250703222314.309967-7-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now everything is ready to pass PIDFD_STALE to pidfd_prepare().
This will allow opening pidfd for reaped tasks.

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
---
 net/core/scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/scm.c b/net/core/scm.c
index 358a4e04d46c..072d5742440a 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -23,6 +23,7 @@
 #include <linux/security.h>
 #include <linux/pid_namespace.h>
 #include <linux/pid.h>
+#include <uapi/linux/pidfd.h>
 #include <linux/pidfs.h>
 #include <linux/nsproxy.h>
 #include <linux/slab.h>
@@ -482,7 +483,7 @@ static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
 	if (!scm->pid)
 		return;
 
-	pidfd = pidfd_prepare(scm->pid, 0, &pidfd_file);
+	pidfd = pidfd_prepare(scm->pid, PIDFD_STALE, &pidfd_file);
 
 	if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
 		if (pidfd_file) {
-- 
2.43.0

