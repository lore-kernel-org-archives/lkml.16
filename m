Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB624503F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359255; cv=none; b=fORFDY3mZuXsbozDfD0Em6bud018wv8bKwMeKmlq2f1fWrRb/4Hs7mOss6odlk6p8x+uCxmQrlGp+4JIh9Caru43eROoE/qRyOVqerxCExSwEFbGTzNrm4LgS+3zy4OcUUKGQWs4/szCZZmXf9OK80oxCdrJuIeLWBhb20/N63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359255; c=relaxed/simple;
	bh=bHvpc94HXYih2FMFgeA+sRP/r2c8MhvpzQoiO5z8z9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTVlDxvGGTQ9Hwwc9//rswzapqeejI2ChiwDL1dbUqGovMXFKrVp0kx3j2oOOfDKxNhrlIGpdhowBD9Yz+bNee7ercIGqX+pP+IFXhJfaZXg5JfMfUmPzDFKKaY0/UW8CKPhnfW8RGDSRFie/I0H4pASe9P/ujm0MAUczTnMPok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wWZNUGIS; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wWZNUGIS"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0B4723FE1F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359252;
	bh=isC54dUAY8UhtPmgzK1RBnnEBnnC6mxj6C9AzalU9ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wWZNUGISf4jsOi2Acc3X4GzxRtSG0z9AAMFMpPMa3QLem2UGzFlRjBneH4c2YFbwA
	 fSUAImIzSPltHKC7EbrxONYFMvqYeCO6D+BE7APOxkZF9htRDYbCYqKQd56pKM04GK
	 DwdR+8lJqIqzOFQgf313XxIbzqUgBvSG3+SHr+Rcd89ekJGH+5jRQ0ymbs7E/T85Pk
	 aGPDhXb21mOXYDgQi9iMEVwrc9uR3ImLLyrlgMOffLkY0zftde3rQrGVFjDRq5c7df
	 cRcULDkCDpK0xeFRE9W7aYIHnQdvcdyE+CLLP9k/31liZwI0sWtJrSCqf8BD/fLgnT
	 VsLZctgOxTHdw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae37a8f000bso151933366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359251; x=1751964051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isC54dUAY8UhtPmgzK1RBnnEBnnC6mxj6C9AzalU9ag=;
        b=BaRrsTcr1VW4YynhLFtJCIHac4KTpOIyvnyKJS5MVg+o1/eP0+2AIkMhq/05noc89N
         MkZNsTpyfI0wxU2/CvUrgioo7lrupt77BWpwyGNKy1BhZQOR9Gm5M9EoDygvjnOOFf1g
         sz0eE70vszSxivGxoySCgaif3mD3AV7V3lHrdnkt+2cUNi44f/AH8dLAVQxhD1YSx+po
         1zR7mtnDTF0RhRhHJL0dHgly3oCD+JNOJQXRSNGnRp87m64aeqPdXeK/4ilWLIHULrIG
         aW1E/6b4rHWmaRQxQxBf6zaDTbbGLPjchNp4nvfnVyrl9DKHbWeZuJfCtYWYWdnat0Gt
         OELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS80c2kesQIB0VN6Tg9yZUqZUiOMi04KP3sGBGjYxR9nEpnGhR5Y1WaD1LaNEaz7vCnPhqwAXLWINnKq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJl28kolRryuodiArnwnl0cb9maWfkzxxwhK/rvOPSpq+5Gine
	5OwMNrPSb0SDFFdgtlQa6TyMiYZDOU1zXtChhJ5QmGLNsGc6MnH7dhSJY/tSp4NfjljD+VMnJVi
	C4/AKpjlgIh9R8AZM3nMW90SGpnbskLqX/qJdcTWo8Vfsf8y6Nj2L5HpXTZHwls14MMKSPlU7bf
	Y85ymfCQ==
X-Gm-Gg: ASbGncubEbrCEhJ2BQA1Ivj4d8vni6L3v1V0gDeUsP8gYi64/o8D+EdfIzUdTa2/agx
	/wyzpEY5jGpOf5cgoHZQrr7/26BiyUKigTC24U4UqxAR+0xXb5Bwem0jsfsMCWzWraRM+VNqPa1
	DB5h8VpmfV9NHVyhrrkS6u9Evp74/XGzabNpzURc4gYVeQziYUtE9i/+BIec9vzB3cLkZADmvZb
	bvH1YLoro6qbowzlNfGWDAVo9W/UEQt8cqjK/EX8wTqhJowckJiWsUZaOxoKloTmhxZujeX8JGO
	FnuYTwzt1OYodEwJZvFi42drrxx6hF0httkFBCvk5g2ZXIcDwg==
X-Received: by 2002:a17:907:1c0e:b0:ae3:8c9b:bd64 with SMTP id a640c23a62f3a-ae38c9bc02cmr913626966b.29.1751359251430;
        Tue, 01 Jul 2025 01:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9IOjQfHIhysscWrtfEdQ+J9BlfvEQTu1lLk5fVoZ7wydBDYyGcWaFaf5++ub1XyOVdcY+6g==
X-Received: by 2002:a17:907:1c0e:b0:ae3:8c9b:bd64 with SMTP id a640c23a62f3a-ae38c9bc02cmr913624666b.29.1751359250996;
        Tue, 01 Jul 2025 01:40:50 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:40:50 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/6] af_unix: introduce unix_skb_to_scm helper
Date: Tue,  1 Jul 2025 10:39:13 +0200
Message-ID: <20250701083922.97928-5-aleksandr.mikhalitsyn@canonical.com>
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

