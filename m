Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D782BF3E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581420; cv=none; b=eElIE/cW4pphtGyQGrcbb3vXEDj0t1Ut0oi8dXcDay/GvZkTx6ME8GVY4F3Fn6eMpysR08IEk0hLIDhxncPhYNWxt59hIBRP2Z4AP1AnQkf9YjbsMCjo62ik1MdmbGBvfZfFRdUbvnHWn/WYmR8vmUtApnAek9SK47v/6pasF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581420; c=relaxed/simple;
	bh=bHvpc94HXYih2FMFgeA+sRP/r2c8MhvpzQoiO5z8z9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsAY1J2brIUYT3wepZIzF6ILEb4tuRTalLNinnTAq11a5sLAuvtS+MIYrNeETxQ7jnxm09mXPNnURAkA7hDOpj9YBtbPPjKLjWPHJWYlt8kmdYThQ959eoRj8ZBqIeF2+QgPvYL6rbJVA+LtBi5L4lHO+iY+cz17qnZCEMASCbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wa3hAirJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wa3hAirJ"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A766F3F919
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581416;
	bh=isC54dUAY8UhtPmgzK1RBnnEBnnC6mxj6C9AzalU9ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wa3hAirJ53gNQa8GMigVmLo7QYVtXHD0WVOOWggFAxccEPHiFL1DHwE+xyTe2rnMp
	 mHp3qLWh8Y4JK6iXB69UsDKBRb7moXR/sE4NX/lUd2ohEu6nPrCf5u1xmi4O5uyIjh
	 FipZbnurLhos6LTrV2XGNxAsKXNyntlGE/q5kp/oxb8GeideelVKwSPndRblwWG0Ea
	 BzOiDTqwv/OqL5Ad5bC9KS2fNYHzVf5fo9p1B3qdOLgluwNU2ARAlUI8zWH/XPzndW
	 O2kZa/Vxr65MB+GpLd4IWJ5PdV2F9BxClXwaTIZl3Ia+Sv8/N/vvRHfuY/9q7z6073
	 uwNMuFEXqN/JQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae066127959so29201866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581416; x=1752186216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isC54dUAY8UhtPmgzK1RBnnEBnnC6mxj6C9AzalU9ag=;
        b=h7zuWj/J4qCFFfBkXV5mlRB+towbrEangVJOlH8jTy5hADq5M858hAJIbrldFJDys0
         aqpmr7FQ6MCV3AlfUCGo3LlzmVGtE5ZybHF46cHRWdzie6kdYCdHaMMA6R46V9h+SYAr
         mSNeoqNRGfCoVtKj5HS7ivM67KgLhfeGUF2n9NXrPggmPQ3vCZ5szcrPmmED18tuy42+
         t0eAENtTMw0Dz2k+npgt8NGDUAqLN+XIdQTNzvOFUTswuMCEprf9wQ3BOiC1aMiI64rP
         8vgjq1ApeONUtVgbYRur+XM4u7OAsUZuXTQUfMD7rwFVqMb64PVJjZiTaNEWd8N4rWfa
         N4ew==
X-Forwarded-Encrypted: i=1; AJvYcCW/yoXfufzHMCn29tRgLXyRgtZ+Vd206eGzS1Lyjn+KaZaFUJQXmaIck7OtRXfSagy0vzwjx+kAFDVqajw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/XsY3HmFdxqiFmp8CuiaI/Ak12pdaETargrPt8hRkxQzpVPN
	pZdNjcFh+yjAGwmeRmx/4D0bR+//pb0ma7SRHaF6O/0R0Fr4cJsVS61RVNhVqMa4nKfi2Md4Qlh
	iFVp67cX+vU7X66i8dL58+7Y3n3/2SDmMVpGYnyH4cKr+ABeTxvBsEBUJ3vERoNr+DmfSu6yjkt
	sbJoPSbA==
X-Gm-Gg: ASbGncuG+kubF7K+GzldKWFOuXnqqxATBOPZYsOCBWwgAutwJz6vOEgHOWbV+UCoZHp
	6YEa8gPf4XZ5JwDaJWjMLxpAHlPde5sXLxnvzXHEhfX+4+MoEvBMRc0PZFR16HfXmLZtgWmhZB6
	c8y2G5v8zDilTWME6h8M4ZHYecEqeYhc65CLBWlo9nQJwjFDjkRBh+lnm+jKuq/qdYW1zn0oyrN
	00J9QcmIFBxrJa0GCINuIZvA7U8ExcGMhdOYkOlEw2Zu7HwcFooviFCXvUMmr0eIxS3sgZfp9PO
	0HhCm/CG5F4at6XKjIFxuIP2CLo+6u/Pw69dfb5yyu5RZEgLXw==
X-Received: by 2002:a50:d690:0:b0:602:ddbe:480f with SMTP id 4fb4d7f45d1cf-60fd2f9d71amr169526a12.9.1751581416182;
        Thu, 03 Jul 2025 15:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGikx8qQxNwagCh+XgkCJ/7+ysM2PBsMOnRMyCiFbXNruisPLa18BsRHMovC3NS4od+dFHc9w==
X-Received: by 2002:a50:d690:0:b0:602:ddbe:480f with SMTP id 4fb4d7f45d1cf-60fd2f9d71amr169501a12.9.1751581415803;
        Thu, 03 Jul 2025 15:23:35 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:35 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/7] af_unix: introduce unix_skb_to_scm helper
Date: Fri,  4 Jul 2025 00:23:06 +0200
Message-ID: <20250703222314.309967-3-aleksandr.mikhalitsyn@canonical.com>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
---
 net/unix/af_unix.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index fba50ceab42b..df2174d9904d 100644
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
 /**
  * unix_maybe_add_creds() - Adds current task uid/gid and struct pid to skb if needed.
  * @skb: skb to attach creds to.
@@ -2565,8 +2571,7 @@ int __unix_dgram_recvmsg(struct sock *sk, struct msghdr *msg, size_t size,
 
 	memset(&scm, 0, sizeof(scm));
 
-	scm_set_cred(&scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).gid);
-	unix_set_secdata(&scm, skb);
+	unix_skb_to_scm(skb, &scm);
 
 	if (!(flags & MSG_PEEK)) {
 		if (UNIXCB(skb).fp)
@@ -2951,8 +2956,7 @@ static int unix_stream_read_generic(struct unix_stream_read_state *state,
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

