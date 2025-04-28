Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD026A0CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851448; cv=none; b=PaoprXxS+Zwu5c82BW68GVNG4+Wbi5lVxlZs48KmuKzlFCU0isR4BUmiV5TlMrFdcdw/MFsQMkqA20oGFL8pCh0+ix6qH9w21Qv7jKnj32Z1lLxbOixKEMILHlQ56hrbkAWIkRE4oPiHD+fyP+OSqisBXt3F5kSpdQCIgL06Elc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851448; c=relaxed/simple;
	bh=dio7cFYeS5EIRSdf4UlE5gkakll/Trh742cfuksZgkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu2Zfk2ZLqDtD34lZD3ZD+yV3WERysU3s2yJYvrSSat5R5dIIkZ3h/wns4EOxDeZNlLrODUv1/H1SPVtpm4rvLn7FPSKxGMAOoWI4geke/D2d+fbsFqbuFuRUzhBd2f//XhYM9asDLawxINN825pny+eW3vckfBABo8sosskesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=ZRU8mxPe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ZRU8mxPe"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3665612f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745851444; x=1746456244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IT/WHClpJVhijsn7pb0WP8oaOCsopklM2KzHxNlbeXk=;
        b=ZRU8mxPeolkYXhk04OhxmPXMTsOMowXNR3aRt6vak03JLzbJRROEnbgWjnWrUnqElR
         Q/OSdn9pvQ/qa5SN32drG7/G2+D9UXqhcEl4Ll4fHPeaC/8i55AO+sXi9sOE4LeotMMH
         f3l8Ep/yCZPBxxQEwQSabN/gJyZmKd521It3OTRc8U2l/O0sNp2IrRmPl1hfQHqyBD8w
         9JVvZatZppSH9OyeMgsNPuRQD2mlbwf+LR+3SBtYf9ox1ZW8tXOpRlv1tCgAogRmy+MM
         narT8SrNQbYaN9QTbzyI5sRQ6uEYindfDPhcLpQhkXK3NnANPGVj9gX7hSej8pI1/3bo
         auig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851444; x=1746456244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IT/WHClpJVhijsn7pb0WP8oaOCsopklM2KzHxNlbeXk=;
        b=WmD2+hB6t3bETObquxbFbG/V0613VJMxvgQ3aH9J+tObLQib0GVafSO8INySJPCjWN
         Z/ebx0bDEHZ1Zbvl2a9VF6DLyHlTGTkJYOYkSi59VRvctAvBA6c5vpJi/r1xZVCHm2Tg
         P0dhVNkmrU8Rhwf3e6VQ9HKI2ZpRadNmtbbB/kMFNirWUAbevrwxYYsrwWkdV0a/0tEF
         CN8971kXdi7UdNfC28uvcrqi23zE/5gKaY6N3DrMEt3Jdy9cMRPaLlt/VkmIpx9Zbnkv
         GdBbO6uPy6cAFQtTnQslb6yS9231dhJYg3VZNtReM0r3PhoG7c6V/rbGzGHtG2ZsKSvZ
         8VIw==
X-Forwarded-Encrypted: i=1; AJvYcCXag85OnZqkJwiSlUyoIJHocAHNdu5CptsoLZ3A5fPufwWmIKFTvpZDqjqMa24c48pkmeEPlzFXSQIHs40=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBU699zo0eQl5qPFlBw9AJ0xx8gf60c2+e1ansTewJ6ZzyAjDC
	YXO8SqHVRaiPPUJMIbuOjsNGDBURut1Nsu+fmLNB44bP86wx1DygxDwnqGlvnzw=
X-Gm-Gg: ASbGncsVvQSh3FLKzT1XmEU4GCaiqa4uLAGPDVKyLPTRsQ06n9nbI0BdaMUbamRvg17
	Im9kTCY1zdQzx32qdZcnXAealjfErxjSVY5B+FbMjevzUojetqZR+UV6aNJX2d4BgdYUqk7rplO
	6SfbjERMjFYl3OBYi9Lbqf3AjWlNE4Ym+IcPhrYQ9lvrvecSKrFjGp0UZ9eNx4/iz0T2tLR3Fyl
	6e586kUqc6p0S7eqLFuKcPSBm8bh9US8/H0IyIFqlB0S7ZF6uOYehNLFDey5fEK7i+x1NfCr/Ga
	BaLddjCBebPPr/DLWAUrrpCgf0zk4gVkdXXVQxvNkwTKECy7wyWmOixcma4Rly+J4OKxn6wQmGM
	mv+r35aCtDTIOQUf6TMTN8Vk8zH7MHPLkRxBrdzvy
X-Google-Smtp-Source: AGHT+IFgMSS9fO6GoRqqJ1sjLN7BMNzCQObouCbx8bEgaE/+Fh406RgxAWJv8L6yJD7Xp9RF50kr+g==
X-Received: by 2002:a5d:525c:0:b0:39e:f9ca:4359 with SMTP id ffacd0b85a97d-3a0891abf34mr46734f8f.30.1745851443610;
        Mon, 28 Apr 2025 07:44:03 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm11377446f8f.71.2025.04.28.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:44:03 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs: remove unused enum choice NETFS_READ_HOLE_CLEAR
Date: Mon, 28 Apr 2025 16:44:01 +0200
Message-ID: <20250428144401.3211848-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This choice was added by commit 3a11b3a86366 ("netfs: Pass more
information on how to deal with a hole in the cache") but the last
user was removed by commit 86b374d061ee ("netfs: Remove
fs/netfs/io.c").

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/fscache.h | 3 ---
 include/linux/netfs.h   | 1 -
 2 files changed, 4 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 9de27643607f..fea0d9779b55 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -498,9 +498,6 @@ static inline void fscache_end_operation(struct netfs_cache_resources *cres)
  *
  *	NETFS_READ_HOLE_IGNORE - Just try to read (may return a short read).
  *
- *	NETFS_READ_HOLE_CLEAR - Seek for data, clearing the part of the buffer
- *				skipped over, then do as for IGNORE.
- *
  *	NETFS_READ_HOLE_FAIL - Give ENODATA if we encounter a hole.
  */
 static inline
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..d161bbf1f29c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -321,7 +321,6 @@ struct netfs_request_ops {
  */
 enum netfs_read_from_hole {
 	NETFS_READ_HOLE_IGNORE,
-	NETFS_READ_HOLE_CLEAR,
 	NETFS_READ_HOLE_FAIL,
 };
 
-- 
2.47.2

