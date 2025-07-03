Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCE2882C5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581431; cv=none; b=skbsHKx9sijRcgTatgW7rKmPZ2CvDp8HgQGZT30JL25aXAFYuUZt/P1m1uNwf+v1yfyZuRgrQgeJUGf7NTYvHmrIRFiInODTT4Ict2QQAEdHQAn6AFFug7mfGmTY54gbrDFttl/84qqspSwo/wJd+DOB/DYVAzo+QXQ9NaBo41Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581431; c=relaxed/simple;
	bh=QD++eQ0mdA3X9osAOwOaccdl8io/UixGrQb/zmCK6Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOUvQPS10itVmWSgBG8cH9YSS3pRpB1PYUR+YPGIlMssZksfr3d6vrn6rW9aMMAqXkEj02dVY9tTo9b/fSkzlPnmK9BvLtfkCmCXOJEYMeRudUQj+Bhqm+6nCPsI6vihEKqFo/PBYERCeF0d7ZuoGiJNZ2GKXunzUzx4h+2sfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dKRP991i; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dKRP991i"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67DCA3F84A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581426;
	bh=5uSoGMqL3ZtB0VgpeBJZUFVBttzjqZO2/y9STyu6+9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=dKRP991iaozc0KwsKK/4QmfrZwgSqdBQJT3fVfIQLrzaFcgWQH43FnaWmuXkeTvt/
	 s6k8TbojTt+XzRl9Xi3llAQdKbwx3Rx/++jN9crWSkg58nwyaz9ioKPlu0uOgCt8Vm
	 lwEl6qqyew0WWjUsMg0XWGT9jhEnTUG+QKFJhxm5gwUO4Y44DO9PK6nl4trdsBBIql
	 vk3uE/jpXBfoUWW7fjYLKhqODA3NyDqwp4d1nO0wx54ZqPzdR4SCiL2ecE7Ofy1rrr
	 5Du1jtkbgh+jIaQajI1YsCbVyqYVi5tpgLFMQsk8BS8K81WZ3MG9k9Qz/gEWf73tZu
	 VeS09JCNMYprw==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb94dbd01fso31501666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581423; x=1752186223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uSoGMqL3ZtB0VgpeBJZUFVBttzjqZO2/y9STyu6+9U=;
        b=UOvmnZFgtOtRrzc7/t96VfC4I8UGOCjvNXYyRf5/kKyOot8bOtUX6J2oPnzBISRH4L
         fcDB123pZJy7qtKOtSCswoLkMK8MzppZ8+Tg5u0eIjvm9D/kLnBMLs9ESJW9Ujw6u17C
         VZKX3+xcdnTY6MMuDZrbdPJrA2NoRKMbfstG3t841yXWFriG/3UsOjfLqQ1v8G3d5YGK
         RdBfXXPNr5JE1nkxyzoN3/gwERIxa68luipqg3JHv5Gv+KNA0dbAPfbpp3YNJBeDQQ5s
         Rb71NCl9czFWJx4ryV4scQVKp3qfxHqd9AAV3sV8I4aWyH4Imu4OjwYssyiNx2r1AOa2
         8wAg==
X-Forwarded-Encrypted: i=1; AJvYcCUnPBK2Et6LHK0gvPjBeCVkJ4+BiundjFmsMaHkkZHulsQMr0zMhx0rCePBgu05Ax/gZM17UZNWtolBfoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLbX1XmPCeAH0vKgDKj+LGVQM/XiGtaApy2wGuGmF16sQrcUV
	JX1eN7judjRV6fqUGJjChy979WH4dZhW1G8SmzIUn2QSF8ivtO5L2LzojaCKRs2g2zwg1fC3R0J
	Zw1tqctJEM66DroSujU6OkwIW2OQEJgaRTkbXNfBs1pPeAELhqrE7B56m3HOg6M4kP/0KTQ7JV3
	x3tViVCA==
X-Gm-Gg: ASbGncsAxOqMI35s/ECM9T3Fsbd7mw6FP+oyFkhKT0LjiLiZIwniqSnvZxxezOLOmVt
	MZHtyO/94F+juMKWb5GGvv8edSu3/2R4HTF0saKOvhRE5ZwgCxXjba+A63uVaf08g+ju891Cmus
	rTgXRIaOZwbug+rovVBqkW2l+UFzH8wed4gTWlrRLaGYWIwbPBU3D4gg2M8pm3tH6K/PWIPJFe9
	yGaNZKpWeFxQs5P1utqU+BIWU5LKPbnl/HdLDHxV6FS1Z2Fk+kfZPTaon5NJI4sgGvT2gRmyEpK
	y8cLHbJN0tJWKJxj6uBSyfnNV/zPVgq2l7sYpKw/DNXh4Sy4fw==
X-Received: by 2002:a17:907:d93:b0:ae3:61e8:c6a8 with SMTP id a640c23a62f3a-ae3fba363a1mr24997866b.0.1751581422798;
        Thu, 03 Jul 2025 15:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBHhw9D3yJgbkNuNyxC4DptnT1/9dBd4TzRzY6hn1dbib2RfP84YGYMXyfTs/CHXFSD4vppg==
X-Received: by 2002:a17:907:d93:b0:ae3:61e8:c6a8 with SMTP id a640c23a62f3a-ae3fba363a1mr24995366b.0.1751581422377;
        Thu, 03 Jul 2025 15:23:42 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:42 -0700 (PDT)
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
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [PATCH net-next v3 4/7] af_unix/scm: fix whitespace errors
Date: Fri,  4 Jul 2025 00:23:08 +0200
Message-ID: <20250703222314.309967-5-aleksandr.mikhalitsyn@canonical.com>
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

Fix whitespace/formatting errors.

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
v3:
	- this commit introduced [ as Kuniyuki suggested ]
---
 include/net/scm.h  | 4 ++--
 net/unix/af_unix.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index 84c4707e78a5..c52519669349 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -69,7 +69,7 @@ static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_co
 static __inline__ void scm_set_cred(struct scm_cookie *scm,
 				    struct pid *pid, kuid_t uid, kgid_t gid)
 {
-	scm->pid  = get_pid(pid);
+	scm->pid = get_pid(pid);
 	scm->creds.pid = pid_vnr(pid);
 	scm->creds.uid = uid;
 	scm->creds.gid = gid;
@@ -78,7 +78,7 @@ static __inline__ void scm_set_cred(struct scm_cookie *scm,
 static __inline__ void scm_destroy_cred(struct scm_cookie *scm)
 {
 	put_pid(scm->pid);
-	scm->pid  = NULL;
+	scm->pid = NULL;
 }
 
 static __inline__ void scm_destroy(struct scm_cookie *scm)
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index df2174d9904d..323e4fc85d4b 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1929,7 +1929,7 @@ static void unix_destruct_scm(struct sk_buff *skb)
 	struct scm_cookie scm;
 
 	memset(&scm, 0, sizeof(scm));
-	scm.pid  = UNIXCB(skb).pid;
+	scm.pid = UNIXCB(skb).pid;
 	if (UNIXCB(skb).fp)
 		unix_detach_fds(&scm, skb);
 
-- 
2.43.0

