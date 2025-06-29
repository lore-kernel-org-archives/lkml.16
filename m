Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A556242900
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233509; cv=none; b=JAQqdrIsde/Pse9rE5QWAMcmh4PfFza6epXofsRd7z58B4SdLK7ruf+w82gonI6w+WPNn/nojADn6h+ssOX+Hbf75E7ZoHUAOCFD+XDONHFmW1QQHanGY6cmu/KOoeRqCwY1WmJF/xz7looDoy7IAcgNczUUVxmK29gIm7nT04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233509; c=relaxed/simple;
	bh=VRa2MsmaJdr/14P5DkDEck3hvc0gsQ2yKcWjIECRYOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWoFNwbzKTFZTui/ui5ITyzDhfBNr9MNkOfCC9tpcLdtwbrXShHphaL1T2+T0284Y5ScbJo8JO+wGSPICKqB3gwRqmhDCHM489rJqSG+WTU6tQnN1XmRxsC0dh5Hq3d7eF2Xou4wPJFSYc/GxPTG4vXFbmLtgdSam0uGsnvxyRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=g13Ckl3y; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="g13Ckl3y"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 907073FE1F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233506;
	bh=JxsSezFVcVddszGhnOOW8/cd5yQH/kkJ8Bo6svEZqIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=g13Ckl3yXk/yG1GIG/l5vtMT800ZmLndClnzpB10hdCp3DJLctwjT2yRDHga7UYcd
	 D5YhjcTd8IcLYXUJNfSnL/j7IlJI+y66+AuRSi90HFQfflYAAFPt9xG/ZIZFSsg5Ig
	 Z3G7n0P+oLuPYLYvRawqz3k4pzX+aLqqHThDknpxmMkLWjsH3BtQtWMl29ZGVI7iWo
	 TTIV9lw7LRWvizLMVCtzv5EDaZ3jT6FwR1cWhLW2muJ9QdCV3QUECuVnIJ+nLJdat1
	 lxHgervzeRIxZGMLpPPCYQ1c0BIdJvgisBeoHBxgURj3SjXDG+7dzguLlspGz9bdYF
	 D69YTFuMsVLGQ==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169cso1338067a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233506; x=1751838306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxsSezFVcVddszGhnOOW8/cd5yQH/kkJ8Bo6svEZqIk=;
        b=tV9sdaDmqH8cGTyGwbjwfpmUbqNjaXKENPedVllZY1XBxLQB/Q7yLGS9ctCdDUmDB+
         tR3fG5dR6wqSoYZHhJon+j3+0KAvma1n9nmmplt+SIzHZHsyLCHMr455n3Xu56cLX7Il
         Tx1v2WJ/beH/jwZMqUqgtBfyh8CuTABE9EiZJPAGOwcxpGiqMYtdLMvec1KIV2cBEcVh
         WrLby+Gh0ftM1IFgE+50qmt/uDxkokr2+C7P5pYzHAZLKz2kYwm3A/zJI78S6Lp2N4is
         6JuV+WbZzidFN40FkIMtCC+m0jYygtApFYiiGdHGRLJQN2V9I4o9NbHR3cNuSDvCLc8s
         zj8w==
X-Forwarded-Encrypted: i=1; AJvYcCUvsXczQTagg/2o+7l2rzJBe4aVgtB7YMLno0PBaZxN5gqDuZl06f36OzPmPDfp1XNBfPprByX6QbOtzSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqLBo6wHO+oETmB3iUMoLgA6MRMI73N0vQJlkni4pF04RSEqc
	qQy90ktexH/VTWc8kUj6KJp8BYZ4uSjsJ9A9ZhXzuyj2Vhwo0n5P+YpuiDD8Z6vPO+FD00DjnJB
	DnnZtKUcX5QiPTjv0qcWPfXv4LHfQUcsiLaqU/sWAYrUNyRXOcZLh6c/dPQdyudQldur5760SLt
	eva6EW+g==
X-Gm-Gg: ASbGncsxFpUFGsQGE3HqET942Ygu4t83lDU+A/sP9ngA2E6he3RpGk2EgRE0hdZ20ei
	l1xRpK+5Hv4og4OsjKpLfd+d4dORcbLaJEBUHhJoho0oP9MCAnTX2tOz3igiD99UCKG4exUC94B
	P4vq7xC0pznBnEgYLCCr4kvzZelQLfIc+4WYDT7+aTu2oelhj+4DcWFRI39bkfvpsxkZO72WEjs
	Nhw5XsUydT4Ilf1aHcSLmjce328hxKA7hQ0kUxiaJascNCR20mzzrlEd9ecz3Up7xMSdWsmhWiz
	Z5Ohy1XSLWOJEvu+ESOw70iQaE/lsIMAZm+O2Mn6jZbT74ReXQ==
X-Received: by 2002:a50:d6c4:0:b0:60e:f46:326d with SMTP id 4fb4d7f45d1cf-60e0f46379fmr524115a12.33.1751233506004;
        Sun, 29 Jun 2025 14:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeG0HXUZS+VZqUBDBm8csLUlE85Zu71t9cWNi9cmpg397iu6ZGZalKE0CjWDY0LX20CtiqaA==
X-Received: by 2002:a50:d6c4:0:b0:60e:f46:326d with SMTP id 4fb4d7f45d1cf-60e0f46379fmr524095a12.33.1751233505618;
        Sun, 29 Jun 2025 14:45:05 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm4712037a12.19.2025.06.29.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:45:05 -0700 (PDT)
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
	David Rheinsberg <david@readahead.eu>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: [RESEND PATCH net-next 3/6] af_unix: introduce and use __scm_replace_pid() helper
Date: Sun, 29 Jun 2025 23:44:40 +0200
Message-ID: <20250629214449.14462-4-aleksandr.mikhalitsyn@canonical.com>
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
 include/net/scm.h | 10 ++++++++++
 net/core/scm.c    | 11 ++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index 84c4707e78a5..856eb3a380f6 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -88,6 +88,16 @@ static __inline__ void scm_destroy(struct scm_cookie *scm)
 		__scm_destroy(scm);
 }
 
+static __inline__ int __scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
+{
+	/* drop all previous references */
+	scm_destroy_cred(scm);
+
+	scm->pid = get_pid(pid);
+	scm->creds.pid = pid_vnr(pid);
+	return 0;
+}
+
 static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
 			       struct scm_cookie *scm, bool forcecreds)
 {
diff --git a/net/core/scm.c b/net/core/scm.c
index 0225bd94170f..0e71d5a249a1 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -189,15 +189,20 @@ int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
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
+				err = __scm_replace_pid(p, pid);
+				/* Release what we get from find_get_pid() as
+				 * __scm_replace_pid() takes all necessary refcounts.
+				 */
+				put_pid(pid);
+				if (err)
+					goto error;
 			}
 
 			err = -EINVAL;
-- 
2.43.0

