Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A32722FE08
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233506; cv=none; b=JjQBBtO/LNE6PRJ9pi+rwiEn6y7lBHyD+rj6MCOpplLTftIa2CRCaTsE+81Sd2/JmH+s3Y5PRnIGnKkzM85Co3oeHm+WI2W4T4/6nt2rdYcyyDRKPkNtTfBJQ72CE2AI2hrC6kaWkBOZLtUmaiFSunOIXo2l5W9VuTJamqPESO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233506; c=relaxed/simple;
	bh=TdHSpDKAJsP8MFQsAqAYBhsn02nXa3EymYXhSGpLXcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzT797/NwOR54IEiUZ4SVh+G7VCqD29HUyw921VTmZhvDS8LDcwTfYYUQ7eW9UsVS33JeAomdQMMeqYjkL/N4oMSw4A9rRnuKScOcBN/H3VysOS4pFLwVjQQCdWtP2Aw057Dk9wyuJhfWbS2aUjOOdyEZJa27SMK5/s1YpDGxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ib8FcY9L; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ib8FcY9L"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BA4BC3FE23
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233503;
	bh=RRIGUpCZvKb+B8PoLoEDlD3ZTey+s+col6Ou5XQorys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ib8FcY9LDB6r8xJmLsqlDQ2VH0mSEV/lkzmkyx3PUrXedfVByrfFjfmuiCw0DpEgH
	 rswxTmi//57Kc4oTpEvJU+hXMHZEiKs/vcbX8q2dQ7HIPNCR5IVbLc/O/Z1O7pH9x8
	 qoGTAm9wXOkOpEGsCnf6L1h+stwg4Lpmxm6TLxquC5jo52cxqoBp+OxjYwZefQ852f
	 YGnfcWVWN1mT6Y2zlKuzqSekGxYgTLDAbu/CzFRbJ+/vqp2uSw8qIUUDYxmRgpV5B7
	 yiBR5UuMVGK4MSK9zxHfjp3Vv9rNyZukSvOGdT6XQ/pO4h7moj9qZq9M3aSwSdFvpu
	 1T8uV+h5P/LmQ==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-607142010bcso990940a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233503; x=1751838303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRIGUpCZvKb+B8PoLoEDlD3ZTey+s+col6Ou5XQorys=;
        b=cdj1VKeLUSYjg7wg7U57zLGP0QOW7qbxyMv7+2isQ+t/H78BahQGadXKzVLQt3JaLz
         /UB+pEzN152CssXwGnRISYkTwBFV/ZzJlgWW2c6II+PlDTZJVan/HhbqvZF7+OzYYn/e
         /b67EJh0G9RiAdSssjhP1glI975ouUKVOkV1rUOVvE/fqO5xSm7J0Ykhxv4CFHkBJBUK
         MvKnZogarFfWP94BM0Enu2JYRpxA1oZG8llCCwXWVLiRHsUGnxUGA3xuFt8/0Mpcdt8v
         3AGFZFsl3fjPIvKQpWgMtUd2oYQ94dhxJRBcsF5FTP1HiWJIFL7QTfPVQf1xKkl2Znnv
         p+fw==
X-Forwarded-Encrypted: i=1; AJvYcCXr6FRU+FZ4NLc8SsrAUgWo7krxt/nwaKWRqQXAcIvi8pSiNDsY6U3cBGLCIKnXqRDZRFiE3kEX4cn3Gi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztUzFraFTjuX2i9IdAMPak3kaValaiJ3yIi9aFFAVCEvVfuw7Q
	Cd9seIqRnfEAGJUr/oMBOQW65CA/RnLqnjd1oIPD89qs09YcW3EUS1M0z1KcfPLF0KjFF0qqoPa
	DkTo44F6AV0aoEf9uv/TLn+SPIisls9go07dETMFm2/xf3ZOjMoRN94Pr/6DRRKqzkHiIrWpLmY
	acYoImaw==
X-Gm-Gg: ASbGncv69PA2P4rZZUw0gY5PuT/PUl5jY/oF+YDxTmGk29gKHrfBjYUir8GuItOSDYg
	fWOFgpcoP5Ukk9uq6LTv0yhid9kFmFVwkFPMOFXpNeZ0eMztVBYDMJCtSONTaN441EKxM+SDmJ9
	g1at0D2vuTbJFQsDpgHIsBKrxyo+IxPIlImOIDh/l93p0Npag4tQ++8/hmgbMwm17GorAu8Hpjg
	37oKa52t1TLKvnSltGOTvLXsRjBzFwRFv91s4afW8xjIgEKsz4H9guRKhO6Lc5AKaWuGkJujTCe
	0nnnk3+9BEWrklkP8fZdVkjUwDKiTN1JKpYKhwM+D4EYCMwliA==
X-Received: by 2002:a05:6402:5192:b0:604:e6fb:e2e1 with SMTP id 4fb4d7f45d1cf-60c88e8ea14mr9052239a12.33.1751233503127;
        Sun, 29 Jun 2025 14:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9xBDB9NgljSr2Dmn9+gkgZzFKRns66Vls9DnddU65DI4e8vmYDTMY48hrh5jBiTpMmnrXjQ==
X-Received: by 2002:a05:6402:5192:b0:604:e6fb:e2e1 with SMTP id 4fb4d7f45d1cf-60c88e8ea14mr9052222a12.33.1751233502705;
        Sun, 29 Jun 2025 14:45:02 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm4712037a12.19.2025.06.29.14.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:45:02 -0700 (PDT)
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
	David Rheinsberg <david@readahead.eu>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: [RESEND PATCH net-next 2/6] af_unix: introduce unix_skb_to_scm helper
Date: Sun, 29 Jun 2025 23:44:39 +0200
Message-ID: <20250629214449.14462-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Kuniyuki Iwashima <kuniyu@google.com>
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

