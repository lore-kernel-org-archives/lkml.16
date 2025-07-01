Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361B26B740
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359273; cv=none; b=QlQm9AXpskv9yO9dyvYj5Lypo/wO7LkfavtA0+s8knXxnzMRIkHkTRiFa2GoHh7Qu2Juyd0erbuqGhkpP2gR/aa8gnDnWmPURc1ez77ndFeuowvZSDu6US6BApRHdOfWeqwWiyYjm6SBQ90mxq5lQIgNtmw15aZ5yc4O1g6jAyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359273; c=relaxed/simple;
	bh=+sMr3wZCfdlUWMneZGOreaseAAkc+23zMJM5ICDMpeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjY1tjM2g+WgSb84Nlv+BnYYLaz8ST4+pVHgkCxDEWuynirjVQpvLD8+En3FVIjuP20bJDoi5R/deiBl7Pq43Wb5d6m9dMMX/gFUD1Hhg8mHDcWsUgTvkQUQFB/IoR9APXqsSbfagWQiPcR2nL0csS3vmZALMcSAGS5Sy+9P+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wGp+weWF; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wGp+weWF"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5DCCB3F91D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359270;
	bh=7R6rS2KkskS84A736qIaYQIuu8ODnigBZBalat5fXfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wGp+weWFWS1rVvecGxPfw27CCBLMJ7awFd9vu9ZiidPrarP/T3jFJ9xeLZ7DBsVRS
	 vGa2UsBui05TeekZjH984b8S1t1pon9JykxCp2xR1vIaBNjEW3YzUKIanyKygUygf/
	 dBXifNP0+MJAwcIv7Lv7FcEFHihZP1NZxv7QMlMcHzB5OyaTGkTs9ARdybykHcx6fE
	 j4Bzn4KakaVoXCQ3OxdXZEqUbkMaMz0CIXSIeQWHqSOMQHamlCRjzxdrZEymPiIEc6
	 kWlfZiO6oYqmwqaZQ4IAeWFiNsBBAewdCflCiErh7SBw6abobtJ1Rxuh6HwzbbvZkD
	 T0WgAg1mch4lQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade6db50b98so267270766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359266; x=1751964066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R6rS2KkskS84A736qIaYQIuu8ODnigBZBalat5fXfs=;
        b=WzPSzn19vhuEKzLgvfT9WCnjcxiFF3OS6xk8sf1LfEfe3zNddQA/G3EHi0lPDyKBHM
         +OlT8OGm96bBtOWvjbPjkqpSzagt3ve+0cM8PjAC8T5im+is2x2bhY+R24kI346SCRQa
         Ty0ebNXRvRNTApK0/+PC8lUF24keuxaK8AbfeM83tNK9foeSGapGF5yvuUJQr/v5ScoQ
         lRzBKHLPouv3vGyjSj62KD7+1+lpJKofHcpW2XERWjBY0WO8BDxrracXwakPe/pysbmX
         Rc1OM20P17krwtga2SyrwHDh8qFys97WIA/G3r2zDuC9JXIojHT+rUQM0SyrzJVR9KY3
         u7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Zz8WMmLoJv5VBwJp9wDcFcvjtbIy7evt4STxisGG9kaJ3LipKbA/e8I6epgiZdOS60YvHhm/CaWoCf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GtOvzzq2Pd9Q/c7mUN473MZCNBht82ApkG6ZU5QUm02KRZ8Y
	8nARR2RgA0oikiAex/XqP57l5U/ocvUsUZuY4GmtipiX6maEOaE2GgVUSAoS/sn9M2ZRIBowvw/
	cJgOPOE3TCjyZbPnC1fWQANAWnx79J0uAR151QtoxwRiAS8vOZ2/RQX28IzH8uQwOQSGjqaIiB7
	Hr7quNXw==
X-Gm-Gg: ASbGncuSAHDDVYs2VkB0JGkz3en5LZ6jiF3G+spwl6AMUyl50RJXYf+iinLk2C4VhNW
	dtFK2TVi2xJFHvdOFYOHOyCHUgABIEW8qzeV+bojSjlg+omtCtiJVXzAMl/BwP1uhnQC7zEJzhE
	+66sx40vpeevsK7AHCWknNoaMcszb1XGTsSSm4ktCtCXw1d4GTt7rCCTghOcRbluCmNdqHSEJpM
	bwxBhC0XwNzo3OHz/xT4g/dVTgGoYohbcMza7XqAm+jxZDneurtHwAeMenodjipPIEV7DHTBxgA
	P/awT+cCqyeYgMkdYehcMt+eXAublZAmCw35M5bkdkCkymy/wg==
X-Received: by 2002:a17:907:1c1d:b0:ad8:9257:5724 with SMTP id a640c23a62f3a-ae34fede1f3mr1555850866b.24.1751359266301;
        Tue, 01 Jul 2025 01:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaxWqS0edeNnSzlYF7Upe9kcBqlFQjGh4bLnX05mhxtBxNtyIBKe65cIfpFwUWnDOoa0N5LQ==
X-Received: by 2002:a17:907:1c1d:b0:ad8:9257:5724 with SMTP id a640c23a62f3a-ae34fede1f3mr1555848466b.24.1751359265842;
        Tue, 01 Jul 2025 01:41:05 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:41:05 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/6] af_unix: introduce and use __scm_replace_pid() helper
Date: Tue,  1 Jul 2025 10:39:15 +0200
Message-ID: <20250701083922.97928-7-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing logic in __scm_send() related to filling an struct scm_cookie
with a proper struct pid reference is already pretty tricky. Let's
simplify it a bit by introducing a new helper. This helper will be
extended in one of the next patches.

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
---
v2:
	- don't do get_pid() in __scm_replace_pid() [ as Kuniyuki suggested ]
	- move __scm_replace_pid() from scm.h to scm.c [ as Kuniyuki suggested ]
---
 net/core/scm.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/net/core/scm.c b/net/core/scm.c
index 0225bd94170f..68441c024dd8 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -145,6 +145,16 @@ void __scm_destroy(struct scm_cookie *scm)
 }
 EXPORT_SYMBOL(__scm_destroy);
 
+static inline int __scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
+{
+	/* drop all previous references */
+	scm_destroy_cred(scm);
+
+	scm->pid = pid;
+	scm->creds.pid = pid_vnr(pid);
+	return 0;
+}
+
 int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
 {
 	const struct proto_ops *ops = READ_ONCE(sock->ops);
@@ -189,15 +199,21 @@ int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
 			if (err)
 				goto error;
 
-			p->creds.pid = creds.pid;
 			if (!p->pid || pid_vnr(p->pid) != creds.pid) {
 				struct pid *pid;
 				err = -ESRCH;
 				pid = find_get_pid(creds.pid);
 				if (!pid)
 					goto error;
-				put_pid(p->pid);
-				p->pid = pid;
+
+				/* pass a struct pid reference from
+				 * find_get_pid() to __scm_replace_pid().
+				 */
+				err = __scm_replace_pid(p, pid);
+				if (err) {
+					put_pid(pid);
+					goto error;
+				}
 			}
 
 			err = -EINVAL;
-- 
2.43.0

