Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091F1AAA1E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850745; cv=none; b=IfcrwzcZM6E6qQaHcBESO6pkGLhnRjXik3uUMg1fC7/DR2r3Zfpb3N9c8TbjazBgaAcmKSa5F8OLhXkvf2Il8i15Vr2fkmY+V4RJWOMB6pYloqZr7wPSczysNvlp09lmd1MJm5F8SjANdXB9HpW7RNBEOav1Rd64q/tmmbyzimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850745; c=relaxed/simple;
	bh=e6iBIvRrCjrG+kwjv+jVID8U1/VKrlrNPYZnjI/EnAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFsY1N5POCixIZZUp7EP1RyuGz9ZqLVth4acfm4zXTpBqDUiO0xYAvP+hIlfmE734C+5U6a8GUzHvsZb+qaSwEqFryR2QOWd7vfHhZLgcZY6NlEgWmdvLjizWR/16HC7TAlUgqcWZgUUiTBnp8eppwrMJx1PBZ70ftkeLnnLdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fp275xqJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fp275xqJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44015705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745850741; x=1746455541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rJxcvfxmf0ceZVyKY/5V8iu1OWkb06zWKdp+678T0=;
        b=fp275xqJmiHqYebqMNKPKdd8Bgveo8V+2j1U7fBWpn2hsYF4jDBikL74pna+t4P6Pc
         Uh5myhoffjYqfQlaTRxvH5IykBIm53jQvBUhQ6nOCtYtWnPr+7UKK1TSDrV1PostIlql
         /LRV/Hzj7YfwOtfXUmaPfTPiuW0m3KDU3q1CZO0yJEo2iyM6X48+IPy5jN4dMO8ycolL
         2lO63DMjyzWi03kaTFI7elmeCgczQzh48unbU1kmrgjuVNxI3ruP41m6DKmQ0tyEU7rT
         Bhn81106cX25msMT/AX3XNEBJZSXzWzI7sXcw8DvQGWvKg5kGpHkC1GsV0SZmYJQ6HDQ
         zJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850741; x=1746455541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7rJxcvfxmf0ceZVyKY/5V8iu1OWkb06zWKdp+678T0=;
        b=WcctHEM4IzDs0wKglsCPMx8ZuHJTPUsXtvBLLGDVv1Nctrd5g35LQgdcvOXb95M6+R
         BJkYwII4l3TqdnrNqO3JKICfgOdP1Of7z5v/7lE0JZoJcV9GLhsZguMiS7CrmoV9U9+7
         JzCGNFUTPeIY4ZhA5GVLSm+QHZ1am4cJW1gpT6LC23lxgrse2vsBXgru586bKGHpNfxL
         ovavmuEaOt73b9rF2JxQJVqiNrAnGpdQlSdhcRYmaj0S+SIh5bvP7vtCRzzH1VrTy/A+
         y9nCtUZ31Ppar7N/PjAm4J8MDLHBxIpuVwYHVyUBZlJr313Aq3BO7NS6jcGXVzLimpDp
         cNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIqLxu+pgKEvvAIhGtghqI54tZxouhbL4Zgm5EjpTtgbl5K/IbQkAfxKliKrxzV/BZ//ui4G7TDZet0RI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfupL29Tiszu70+T7ir8kxUN+5SsNPbtAEFi6dkG/RbY1q/haD
	SDYWlpE6W0ZidVWsBkIb7C1ykcXfp/kmt9TVztL9HUCj2rSVYHrmSiLTTepKy8GAwZebfKH+cW9
	J
X-Gm-Gg: ASbGncv7v3vAQgcPvoCcrGe815+ZL0VUWC/MbTfZHgYI2D1h2lAMbG8649CUUaopSUO
	meaO3oTfBEXtA+A73CAOPdHi/EBTgSXB3yfNszT++SwhtTeMKhgyuaBlUIcGPnZxQ+04HaBoyN5
	fSQlz1dI+iGWTjOQB+EJu1OAmOGFniU1+E3+cRZnfnlp31+TTAitNkmHzXGHPB7TpfaSnbzRzKH
	A3TEHCo6GpLMr97AcAsXQCWF2Rnn9uTl5pLkxlnTub4/caGu4Z6S7JtWDMdtkFV4DCQ/75NbDc0
	U+EE6EsfoyUL57C/FAZsuBsf0/Ng9d3Jd2b+ktGTVfobZgaVlSjWqgd30jDjxILbg9/xAggNIQJ
	0LwaZCToVFFx6GyaJyH3F+9vJZA15+jryH4V7YSWT
X-Google-Smtp-Source: AGHT+IHX0Lwtyuyo7ZtJiFuwKOdWkGwo/2whSkrPojV25UvEACyMAzULzUcwL5zkTjBa6aKQPVsEZg==
X-Received: by 2002:a05:600c:154f:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-440a65ba6camr112281055e9.2.1745850741045;
        Mon, 28 Apr 2025 07:32:21 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538747esm125073855e9.35.2025.04.28.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:32:20 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs: remove unused source NETFS_INVALID_WRITE
Date: Mon, 28 Apr 2025 16:32:18 +0200
Message-ID: <20250428143218.3206453-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enum choice was added by commit 16af134ca4b7 ("netfs: Extend the
netfs_io_*request structs to handle writes") and its only user was
later removed by commit c245868524cc ("netfs: Remove the old writeback
code").

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/write_collect.c     | 2 --
 include/linux/netfs.h        | 1 -
 include/trace/events/netfs.h | 3 +--
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index 3fca59e6475d..17f4e4bcc789 100644
--- a/fs/netfs/write_collect.c
+++ b/fs/netfs/write_collect.c
@@ -495,8 +495,6 @@ void netfs_write_subrequest_terminated(void *_op, ssize_t transferred_or_error,
 	case NETFS_WRITE_TO_CACHE:
 		netfs_stat(&netfs_n_wh_write_done);
 		break;
-	case NETFS_INVALID_WRITE:
-		break;
 	default:
 		BUG();
 	}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..e9a155265758 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -48,7 +48,6 @@ enum netfs_io_source {
 	NETFS_INVALID_READ,
 	NETFS_UPLOAD_TO_SERVER,
 	NETFS_WRITE_TO_CACHE,
-	NETFS_INVALID_WRITE,
 } __mode(byte);
 
 typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index f880835f7695..59ecae3ad0fb 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -77,8 +77,7 @@
 	EM(NETFS_READ_FROM_CACHE,		"READ")		\
 	EM(NETFS_INVALID_READ,			"INVL")		\
 	EM(NETFS_UPLOAD_TO_SERVER,		"UPLD")		\
-	EM(NETFS_WRITE_TO_CACHE,		"WRIT")		\
-	E_(NETFS_INVALID_WRITE,			"INVL")
+	E_(NETFS_WRITE_TO_CACHE,		"WRIT")
 
 #define netfs_sreq_traces					\
 	EM(netfs_sreq_trace_add_donations,	"+DON ")	\
-- 
2.47.2

