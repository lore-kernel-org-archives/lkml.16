Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED420299A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508672; cv=none; b=GQYZ2/JUSayvTcLDsjooyYUA+QVADjM6qZn3Rla7VCwadIcD6oXW6ajfkzI1lKQKLZuocmXrsJiHVTbc7jmdXE6Y96Y394AmKE72RoqRfrTjr3x4gGGA+cvAjWHKsixi0H5EfUQ2ahaDZwCq8S+e8N8JmsLfQ59JDY1XkXufv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508672; c=relaxed/simple;
	bh=E0+exfqVjPHy3u7zfUx/DCOqizSWrHwao0vl1kGvu+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtWJ6QVeHaF9VEN9vUaRV2gdlOPFdlK3zT7Vv4vd4Q5IIXnxPZcpOgAwhTG4V4bDvFEulo114i0JJWsDXyzliKxzNOku8eWyAmaKH3TtERqLhhmP+fSp754x77Ridwvd6ZTjihClAIw8Ntb33K48TD/1cR/00Q9LsyGRUujoRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qh09Uo0r; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qh09Uo0r"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1227306f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743508669; x=1744113469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYfumVgNUUGcpEJ27Q8ui1p/c9wt59eDcNpxRKPwCw8=;
        b=Qh09Uo0rikyhA24f6vOfv7CnUvOYVQfcXoQwYw6RPeBUlwxVPWTelLfVu40mZER6/b
         m6KRfqcZgGT+wJwAGv5Z/kPnZt/tzifYbCMmbm/WWseGMDMX1C/RIET6kGAIJy8uK5Nr
         blokd9GCBcsyWmxVlXNSawPnJN/yZ950UJn8zybZsB7UWkBy8uddunPg59QR7rgHkjYN
         ib15Km+qr/5SqjTQZTev4qyfn2XV1cuUOw49oFy+ougj8g3wS2mrTOXbasn+CkZge84i
         EgkwlvheOkMX9oBi4lVAsCFy99/yfJ5zGLsQhx90FtSR8PW6JJwAf2aofGpXT8aTqzKm
         YdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508669; x=1744113469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYfumVgNUUGcpEJ27Q8ui1p/c9wt59eDcNpxRKPwCw8=;
        b=eQYEcMNkLRU+ifJb0yRkvtgx1BD5B9Z8MocJrj624d8020TbdpOotUsdY79dWMdYLz
         07mcSOcnG5hS8+X+4JxyKBBJooplJ5L5b6M0DzXqE6hMU+fPKJ2HapoFtvS2fhRAID7o
         qHhJNOM98wtH2qI52uRShKAB+s7JuPzLev2HZvESowMqhsWFlogYNhngOSoty0B/J8jn
         lwMLU/01aa1nDteyJOUl3BiCzzAq8m6hy+5hbVFRI7PeXHj56t/bBGYzCeNIxMkRiA3r
         7QraGkHtm0HKb7h0xucXNxWVi7WU7tZbRi8fgd5QVgtubMLLOdbgTiKJCzkEgZGdCcx9
         RD4A==
X-Forwarded-Encrypted: i=1; AJvYcCV5iusawezRz6cYhICyjXmrio7cqFaAoj5ybXWCpJMsgk/D46tvCCsS01N6hrt2ugd31L1Z4VE5bLOMHXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzikPEhMyw9VeJsVYZWCMP6oNG17O+FPCrPlmiwLAnJe3qXRm+M
	NstaxoXjV2A6UQCcAEZUxkqcSSTibQ/v5mPPqut6UHyxwzngEGu6jKviSaa0Jhk=
X-Gm-Gg: ASbGncvzHjoO/Jzi3QsXo1TfdmEszmqMmh4tSa5Bt6XyfswubhgTb0tLYfOzniZH6nj
	7S8H3ivI0deO16p2NUQGuFECOul0C3dvclMlotkyVHA4hznSe8ic7qvt1nXhMr++jgwbQJwgKtD
	Dg2BHoJHO3OUsAw2XzmTHLEewP+R9nh7ToaE2UUGlqmsXMflCcf709GTxBqtd+VNEXYNJ37FNh7
	gwpILBjm5+Ma0orih4wHJlDuCAqbnBSZyGT+lEo4jNrwHhIirB5vYL7dcwTB1932PfhJgEAoCxU
	H8k0ZtD19C7KZDu7lx1qKyifgYjv6HG3XmNIG41+KNAd4Co=
X-Google-Smtp-Source: AGHT+IHft1xCvejDy94t7YBv8XrfyqQwOT6qYu3NmUFkGtsxbskgvYLtZMr36q2jppnAQb1Fl+BCKA==
X-Received: by 2002:a05:6000:4027:b0:391:2b11:657 with SMTP id ffacd0b85a97d-39c121186d5mr10146209f8f.38.1743508669030;
        Tue, 01 Apr 2025 04:57:49 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a42a3sm14130150f8f.91.2025.04.01.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:57:48 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH v3 3/3] cgroup: Drop sock_cgroup_classid() dummy implementation
Date: Tue,  1 Apr 2025 13:57:32 +0200
Message-ID: <20250401115736.1046942-4-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401115736.1046942-1-mkoutny@suse.com>
References: <20250401115736.1046942-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The semantic of returning 0 is unclear when !CONFIG_CGROUP_NET_CLASSID.
Since there are no callers of sock_cgroup_classid() with that config
anymore we can undefine the helper at all and enforce all (future)
callers to handle cases when !CONFIG_CGROUP_NET_CLASSID.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 include/linux/cgroup-defs.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 17960a1e858db..28f33b0807c9a 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -866,14 +866,12 @@ static inline u16 sock_cgroup_prioidx(const struct sock_cgroup_data *skcd)
 #endif
 }
 
+#ifdef CONFIG_CGROUP_NET_CLASSID
 static inline u32 sock_cgroup_classid(const struct sock_cgroup_data *skcd)
 {
-#ifdef CONFIG_CGROUP_NET_CLASSID
 	return READ_ONCE(skcd->classid);
-#else
-	return 0;
-#endif
 }
+#endif
 
 static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
 					   u16 prioidx)
@@ -883,13 +881,13 @@ static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
 #endif
 }
 
+#ifdef CONFIG_CGROUP_NET_CLASSID
 static inline void sock_cgroup_set_classid(struct sock_cgroup_data *skcd,
 					   u32 classid)
 {
-#ifdef CONFIG_CGROUP_NET_CLASSID
 	WRITE_ONCE(skcd->classid, classid);
-#endif
 }
+#endif
 
 #else	/* CONFIG_SOCK_CGROUP_DATA */
 
-- 
2.48.1

