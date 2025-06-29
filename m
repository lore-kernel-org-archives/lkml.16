Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA793242922
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233241; cv=none; b=KA/4yvuY2LjAMMLol6vP85qJ2IB0KndMLFQhimBEbX5tvLW/CQnY5kBCCgizC3Q6pT37EeftTQRa/CmGTu9HVvITD+YwuBTqXO+Knk+2BYw5kDEdxPIBkO1tUp1LxIC5hpydtjMjqlggXH0CSSD5a33nQskyqSM3xP3HdjDxlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233241; c=relaxed/simple;
	bh=kvcbJF2gqpLsLCd/IovZeBo7QSbHZvsPm2YuBtmttAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2erM2Y64J12Kt5aumMFR/Hb6Tyb+Gg9KgYWItXEp+x10KebfRZ6V5LaG9itdbXMmLWUol36+NJhVmhc57DIrq8weNXfdJJdvvssojR4zsDnZ+xxatEzAC3ciP+W1dyWr3oTpiv4mjWYn7iBL2vwvBXz91ahGHjGyACuccBvgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=s8WwqN9F; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="s8WwqN9F"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 335853F927
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233229;
	bh=QTemUsWeLJmmZyto6KQ3VZl2RnE1/5oF2xDkIiQpRdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=s8WwqN9FsQ1FgQFFS7aNKC28NI7vtepesJ6uenQefnCq3Ep1GqDaoafhQML0hSgYu
	 baUboDNOXaByfSQwAkQKs449wgoFvw6NWPM/q/8eJHlw4kk9obJW9A6Dd9TYkCqiAX
	 ij9KptStYH2IzZC8euOzRFJSA4++FUYKTD2JIlwodyv6c8yoSCGsYddVWaeH0DdFJC
	 KFUtPuV8VmmPkYLSvQuRFNiidI1NPN+DlKzi/6lob+0QNd0uDZVT8U9//izEpPuW2w
	 fcCfOm+RQZ1GHr8yp/YiRLgMT94ZHIRtk2OruVZ/AlptyfjytInxSyZwHmt2LNjZvi
	 ReaE+26H+3dxw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-adb33457610so147444966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233229; x=1751838029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTemUsWeLJmmZyto6KQ3VZl2RnE1/5oF2xDkIiQpRdI=;
        b=ZaEnJB4bmgucXMYI5/EmfK2CEba1LBDQgnHY9jzY+crXP+7s1UWUZ0vntdHh6DXd4O
         OUymyc9DgcAN3mIoLTcaQUjvfwFnLc/i4uj1dbMHe9tVVXnf+8agqE7+R/+XNEbHe6qf
         3Hp1u4X+qqyU+B/Mq/sx/M6M8z5NURfU5idwpHqno5zj9W17s/fEL7Qtqv1kP6doIbhn
         nlIbXumI4UlI88/RDRkynYCK0IYotMyxTPIwKT8va3URhr+fY5ngCUIKsj9+4O3WLj2H
         BRPU/5p9aS+AA9aw4WSMvtmxe0sWFucpO7K/6T0sc7CzXHp6B3DDBEnmkdM71Nca3KC4
         C6bw==
X-Forwarded-Encrypted: i=1; AJvYcCWPKmInEdPBvyHZu+Qu+I6lJGSfeGAkslWWCNYcS2YyfIVcaghwOoMFdIJv5PJ9X4L58BwgwIU9FrKcPLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjFQkbgwMSETKCzG2LEHcFJCxYWYjEkwUrUGhbj/7GEyQCMhIu
	1d4Jp5YPPNcIGS4S8H+ojWOAvEdG8ecxsz9pMhmFtXYHD7rSEiGYAfSCrQVdKflFILCGOgBZXB1
	/RE52xZtMEkWn7P9HXfk7fn9gc3tjsOMbz9pGaHmObheHC8UV+JIhxnMOWBdiwfyC8NC94XWbjr
	68FXzyPw==
X-Gm-Gg: ASbGncuka01FhG3Q1D+zaswWwuIFPHIOceloG2cIUQE8g7scY4Xj/jRRMAy2zCb4jJ1
	oqWM4Ts9s/DltTqNxga9S2NEsVnjp5EzM5R086xCiwXIvzLFa3/DY+zOtLPA70F6UnOMrid2rMj
	2l0OHoSS132rE6GR8lWpS41muiuUuG6WAP8+BpLAqXPWrTIWuZOS9Mv2UWnBwkUT0HJIK3DD/mv
	IVKcXQb5VXlw6FqSEMR3ttEmgea/qwWPWCdj1Ejmhq73/J7TpZlhZ9N+wBjMDz5DjxN2Bk5JCgq
	WklF89BbGmuCUQzibPTegFf3KBWZpnzA2S6pV1BFcvHgI71scw==
X-Received: by 2002:a17:907:1b29:b0:ade:3bec:ea40 with SMTP id a640c23a62f3a-ae34fd2bc54mr932856666b.10.1751233228551;
        Sun, 29 Jun 2025 14:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTGWAqr2cYFXliuX8B24KQBUcbldsB6HuCJVhDhy2pn5wpEbt2R5iLuguahv9SroXd+9vqmA==
X-Received: by 2002:a17:907:1b29:b0:ade:3bec:ea40 with SMTP id a640c23a62f3a-ae34fd2bc54mr932855766b.10.1751233228149;
        Sun, 29 Jun 2025 14:40:28 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a754sm557263366b.62.2025.06.29.14.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:40:27 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@amazon.com
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
Subject: [PATCH net-next 2/6] af_unix: introduce unix_skb_to_scm helper
Date: Sun, 29 Jun 2025 23:39:54 +0200
Message-ID: <20250629214004.13100-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of open-coding let's consolidate this logic in a separate
helper. This will simplify further changes.

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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 net/unix/af_unix.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 6072d89ce2e7..5efe6e44abdf 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1955,6 +1955,12 @@ static int unix_scm_to_skb(struct scm_cookie *scm, struct sk_buff *skb, bool sen
 	return err;
 }
 
+static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
+{
+	scm_set_cred(scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).gid);
+	unix_set_secdata(scm, skb);
+}
+
 /* unix_maybe_add_creds() adds current task uid/gid and struct pid to skb if needed.
  *
  * Some apps rely on write() giving SCM_CREDENTIALS
@@ -2561,8 +2567,7 @@ int __unix_dgram_recvmsg(struct sock *sk, struct msghdr *msg, size_t size,
 
 	memset(&scm, 0, sizeof(scm));
 
-	scm_set_cred(&scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).gid);
-	unix_set_secdata(&scm, skb);
+	unix_skb_to_scm(skb, &scm);
 
 	if (!(flags & MSG_PEEK)) {
 		if (UNIXCB(skb).fp)
@@ -2947,8 +2952,7 @@ static int unix_stream_read_generic(struct unix_stream_read_state *state,
 				break;
 		} else if (unix_may_passcred(sk)) {
 			/* Copy credentials */
-			scm_set_cred(&scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).gid);
-			unix_set_secdata(&scm, skb);
+			unix_skb_to_scm(skb, &scm);
 			check_creds = true;
 		}
 
-- 
2.43.0

