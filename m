Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF42566E2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855350; cv=none; b=NooST4lbQ3gs7SftlkAisykfoK4lgutWBDHOjltyUiNnGrO3NiKXk0l4Fu0Zj56n7u988sROByf813flhQKS8w8uIcn1WBkEZCDpXyYt5td1xcfdq6vkALi+6uPBHAYdMBDBlrEr6IzAwllOxGpy9iKP7MD0fGfApoIU04On8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855350; c=relaxed/simple;
	bh=Ny1j6DYTxz+coZnLVhbzxwxWBOdq76xDh59nX9JdPTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5E2euNXL0qln6h+NTroW+vYoBwNGHQ4S9XF6emEQDecrZ2wqPq5QRivtUu25P3oIEuJpdNNKaSEUuGhDQXcqGzQhxWF/GcMDCfiqds2ksiUvb0XGaEDJwLn652CfW6sOTKB0iN+ZPnUsyrRH9VK0hwXt7EIQDuHjgtdYkOTVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=HU9FY4gt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="HU9FY4gt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44769915e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745855346; x=1746460146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUqhWlRvKGSGvfb1cK2QZb/99Wnrk6laqKXGIS6Bi7s=;
        b=HU9FY4gt/zGviP6JVtAk5p/9daY92oci4cH4qaK4d75moYS5bZvizcyCPVsv6jc/V/
         59slWMij56TfYC0Jo5cnzJLDzqnBUmihu16ag8Oj08vCOSQtDB7qy5zVwEf2qqHgsij0
         SFnRoVPWTwq5AgD2HrNkrLz/xxE+m5g1QEgFkY6Tqyd+7SFDW71cIIZoDpUJf6hqxYwY
         v6OQzIeuYKkG5EmnttGies1dsH9mjX2JcR0HBgvjOsT+62zYflYk/olVn/y4DtYMxNLS
         tpbKWscYMMWnCqcenlJ4x8s/ww6MDnf1jGhhfxya9Dd2sqTUaz6YGNnCijl/md/ZF3j0
         nmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855346; x=1746460146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUqhWlRvKGSGvfb1cK2QZb/99Wnrk6laqKXGIS6Bi7s=;
        b=UTIiq4ajfoD0UwkR9oz60600k/AQt2u4+XlcMFpYWToqCc1Um0hGUAffD317xhSqRx
         e4HYBfNSgNTiZI8bi1nJEpMZgxwtSumwFjPYxdgjv/5aXQBSegkJoc2rVwCge7UN5+5i
         8BIqvtsLadlHELSkWzpF4RnW2dlIWEL6rCjtClht8ZI6vyFQvFY//dcNu5xhuN8+xekp
         2xljGS3lTeAfjS/7gcsiTV5g1o5NS+8aJiVt7EdRVM7mYBdo59g+TpFbW0DxfmqCFVID
         sC6OVEO8aLBeYuy9vxTP9hCiIkUxTCdtUnZ1hLyRxh3SJ01y+vIwi3qtsDvy0PN4E9nZ
         iEtg==
X-Forwarded-Encrypted: i=1; AJvYcCVqj2wxepLT1DQklbL+AobmnzXKsL5UF3GtxjaxTnTNZeooEEuYC4kee9yhpaMFTh2RDGPVYfji9WoopR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWovF2gAakFKp0rbpoLYYDfH6c7RfHNG13Z7z70JitSCIURwJn
	ll/kgZJJns+6P/3F8uSON5EYMQWr2xjU1CcqRlwdoRuyJ27tbEBHOGV0Q1Nsbag=
X-Gm-Gg: ASbGncuIGOKfxMaAc4jLaZXZR5ewA9D556HnxxqWUKS51r02Z6paBVlu3dgGX8QBWW7
	inibgNynecnkLb+s8otVY3f+KFM2X49OBqOKjZ9Ye2ggyQxhhglfhbPWFVH0Xy4suX+gNXhnu4u
	5C+cCMuw2nPJfb4tjXiC45kHslDs4SnKgBLpVAOdbCzyISuSLm69u7n3+yYdZLKw9dGBpFoytPk
	bKnjYwmzRLf3DD4K/Nh2xdQ9STVO55oW7CKbMj1z7TYDiqqBCdBW6uDH7PzxU5MIFCIKom/Un9y
	ZA+EgqyMAZ5zdRjQsegW1rDwWMyHDsvINz0DhzAzoGw5Buk1HIcf/4OU+qtMkrBHZ2vtiRzMD6I
	61ywr4NBoNnm2rZyIbemYvR8fnDAIiyLcq9Ct+iEd
X-Google-Smtp-Source: AGHT+IFx3lfzXyB5QBVLgQ212hUk8cNSewTLuoqiV1cbMnDp+a3qXEj0E1a2pkMzXBCVBE7A+bQsEw==
X-Received: by 2002:a05:600c:1e25:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-440a66100f6mr95419355e9.19.1745855346503;
        Mon, 28 Apr 2025 08:49:06 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm162134575e9.7.2025.04.28.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:49:06 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 2/4] fs/netfs: reorderd struct fields to eliminate holes
Date: Mon, 28 Apr 2025 17:48:57 +0200
Message-ID: <20250428154859.3228933-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428154859.3228933-1-max.kellermann@ionos.com>
References: <20250428154859.3228933-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This shrinks `struct netfs_io_stream` from 104 to 96 bytes and `struct
netfs_io_request` from 600 to 576 bytes.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/netfs.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index da0d36615bef..f0436bac5b59 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -146,8 +146,8 @@ struct netfs_io_stream {
 	struct netfs_io_subrequest *front;	/* Op being collected */
 	unsigned long long	collected_to;	/* Position we've collected results to */
 	size_t			transferred;	/* The amount transferred from this stream */
-	enum netfs_io_source	source;		/* Where to read from/write to */
 	unsigned short		error;		/* Aggregate error for the stream */
+	enum netfs_io_source	source;		/* Where to read from/write to */
 	unsigned char		stream_nr;	/* Index of stream in parent table */
 	bool			avail;		/* T if stream is available */
 	bool			active;		/* T if stream is active */
@@ -243,19 +243,9 @@ struct netfs_io_request {
 	void			*netfs_priv;	/* Private data for the netfs */
 	void			*netfs_priv2;	/* Private data for the netfs */
 	struct bio_vec		*direct_bv;	/* DIO buffer list (when handling iovec-iter) */
-	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
-	unsigned int		debug_id;
-	unsigned int		rsize;		/* Maximum read size (0 for none) */
-	unsigned int		wsize;		/* Maximum write size (0 for none) */
-	atomic_t		subreq_counter;	/* Next subreq->debug_index */
-	unsigned int		nr_group_rel;	/* Number of refs to release on ->group */
-	spinlock_t		lock;		/* Lock for queuing subreqs */
 	unsigned long long	submitted;	/* Amount submitted for I/O so far */
 	unsigned long long	len;		/* Length of the request */
 	size_t			transferred;	/* Amount to be indicated as transferred */
-	short			error;		/* 0 or error that occurred */
-	enum netfs_io_origin	origin;		/* Origin of the request */
-	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
 	unsigned long long	i_size;		/* Size of the file */
 	unsigned long long	start;		/* Start position */
 	atomic64_t		issued_to;	/* Write issuer folio cursor */
@@ -263,7 +253,17 @@ struct netfs_io_request {
 	unsigned long long	cleaned_to;	/* Position we've cleaned folios to */
 	unsigned long long	abandon_to;	/* Position to abandon folios to */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
+	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
+	unsigned int		debug_id;
+	unsigned int		rsize;		/* Maximum read size (0 for none) */
+	unsigned int		wsize;		/* Maximum write size (0 for none) */
+	atomic_t		subreq_counter;	/* Next subreq->debug_index */
+	unsigned int		nr_group_rel;	/* Number of refs to release on ->group */
+	spinlock_t		lock;		/* Lock for queuing subreqs */
+	short			error;		/* 0 or error that occurred */
 	unsigned char		front_folio_order; /* Order (size) of front folio */
+	enum netfs_io_origin	origin;		/* Origin of the request */
+	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
 	refcount_t		ref;
 	unsigned long		flags;
 #define NETFS_RREQ_OFFLOAD_COLLECTION	0	/* Offload collection to workqueue */
-- 
2.47.2

