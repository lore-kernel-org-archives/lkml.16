Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3CE1A9B32
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002598; cv=none; b=SIi0FSXIy/JdE1BCvCZDN2UrdqtSkuaFL/gBKz7rX59jRssnsISs3QSpkBfjLq3CUvF10Nr/CNLWlvPvpaYFwuc0wy8v9+qYdWhUY0Tg74szH7MrVCp5fN2LoGTiL4iE0T85hpaIpy8HtzjDyDdW6u+ZsG8IuUjLtn3sGaI4jdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002598; c=relaxed/simple;
	bh=hoK6kVOl90R9ZDB6MrJ7GFKqUrExq0t/KrPdz5I4iNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htCr5/S9fir/x30qlaH2r0fO4ZYGBY0ferWYZ3KEUhf2fZNzDJPjo+qW12a4dTFz4Wx+LhJBmRoNYxg52N8QarS8vNTY001E1bayvPIjc/rXR9ZthbN1xBGWq7SMg7qlp2NhedKeP5Chk4efLVSifgSOV3WmTlY7C8vLkphIYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6sDGPx2; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6sDGPx2"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ebb2d8dac4so1731084b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002596; x=1739607396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=034aISQuP2pj9Ag8Kzle6unMeO4J8N/HAuZ/EK4mAcY=;
        b=k6sDGPx2BTM6huhRTHY7rL/9pyVWw3wtHPS3p7mHlV2ZWM5iqimSUgopG12iX0n894
         uRmXPmTsNEvfWtVfB5GnBWYmRLxkHHxhYWr2eswpDHUSKcx9pFWGJk+OVVhmtD1rsWBY
         2lJ5ABZZqhJ7sQDVq55o5h3Mf/4rLvXasGNxiR5nOUFKPNZAuoDgZupLY5rGFjY249CK
         oNWugjp6uOaFXhA5rNpUfLfPVvLxxc9AMMgRqg4bsJove5NSOivCzaInJCPNmJDgkUHB
         U9KGcZCrnsli5QBvE3VXPMdqH88SnxuIBpf41ZWUgEFC7grGUqszkERTAb/PG1+H7iFU
         Qlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002596; x=1739607396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=034aISQuP2pj9Ag8Kzle6unMeO4J8N/HAuZ/EK4mAcY=;
        b=BrVmKSGPa4JYD6z/JFSMkEPFB9PV/DhRzc4dwuSdpAhVFaW1f4KrgIvBBfWa13mGdN
         kZ9+nZ3uQawE2jxAL1SDxZN67qMg+L5trx04yrH2w+JnKQzeFd+lpkuc/nrGHOf5Xd18
         qptAxtVvbZC2zSaTmAY8k/QDxAe7jbILiSbhyCK9mB8xMm3WNOP1aIN8mW97NEDHGYOo
         +t2DFca2JKwuymCjxJGeyDyQXZknnLlpM3McITofknVkIRA0ARcLnEh4647fz7d5Akvk
         i5S7E5PEX9Ai1XOSJwmvJxXtYVKw4gXSEryM9v4IVdWowHcrkbt6ZnyxSkZZFqCOHTue
         /MnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0G9RA6rCKfbIerHJBASgXoPdHVgwCqJRBUbK1nkGtDvN438NQq/MV1PvnSNZhhZp5HktxEpsaW4xDhdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYeSZyX1RCbkZeIREOBfFrQm4prVtTD+fC31haJ692eIZLSyj
	1T1+v/8W1e1j4/pxxADNLNySpgpQCjNlYkRUt1Ue02cLZ0iE9Ng9
X-Gm-Gg: ASbGncvfgGebtvn6kAzl/KgOddaOWmPQco5AoFsIB2xdj34bmvUVhq+I2G8y1Ozb5pg
	XghvvnP4Btu9YFjyYI9rCmrjxLqRTPS0mNs9qD/gAP3leUtCYv1QJucpfyV9u99glBZ4SEOqWWB
	HCIHcmG4LfzfDfMZtyKnoSeJqJE2sO/nHAJ97sFkkBGK8UaRc3JIFrt8bqN4tfAmQy8wXaqFOc1
	EyReUzR93dgRrJzv9LpCyMul/ywc7ytSdec9NXIbAlU2w22Np1HGH/3Lui2eMJVSUM40WnKoe98
	w04c2apSqU3Rh/JBvTxguLbQwwyIdjfGd5ISWewznUoQ+zLepe5UCAeY0/xBuWLESKpHoH3awNO
	b
X-Google-Smtp-Source: AGHT+IGkgJRWdGhjMT5V05IN9A23cZqkeUrU/gnxlMZkF2B/AXcpktdMTkpzlL+zdsxALdZu/NGRWw==
X-Received: by 2002:a05:6808:23c3:b0:3db:1cd1:cadd with SMTP id 5614622812f47-3f3922bb3c5mr3941813b6e.18.1739002595998;
        Sat, 08 Feb 2025 00:16:35 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389fd5d48sm1185571b6e.42.2025.02.08.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:35 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: format comments
Date: Sat,  8 Feb 2025 00:15:54 -0800
Message-ID: <b58a9f5b579e17f70681f8419b54d7d9864d1730.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739001527.git.onlyian4981@gmail.com>
References: <cover.1739001527.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6384; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=hoK6kVOl90R9ZDB6MrJ7GFKqUrExq0t/KrPdz5I4iNM=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK4ChSQoc+I4fuI0bz7+uSSvavF50RYe1oHR
 BIpY5Ph1i6JAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D/pTEADAbvj1/lSpFJtJvhO6JgeQ+MTqqa2JVUeFEqjm+o7tP3mIvAjRypxk48ycEofEts/rAaE
 2gLnC1G/yQfxE6ck/lZDimR/KZeU2zsJNtd1HVSZCTaJFVFZYo0mxKy5WyV0NzOcfOrJtTnJTDd
 gznyyhCxi2kF5O60V7YMYnalmNu1DyjJnKtiBk+li/kMlfWc+FNE8CP0azWZGfeSTtePeUqzVfs
 0+1gT7ItnDaJki3XqwddBDUEQyvMPkebZKQ5EfT9w1y/ED7l7rLCtDqiCXjftPYiAW1oVclbHEu
 T9K81BfKqhFR1xDmhlRn9S6UddHiepQGk8vXvfsc8tN76YE3IZ3lSusPmZrw5eWadvEt75wsPwj
 dwPY3H6TZdR/YCiAoaYLImDuAnwmfp1QnhqX3CiRA3ek75GgGXuKqhHMrD41Rj2LrBZA9Hx9rQD
 J7zYTWhkf30nLo7Shp3QwCIO1qpCDZb7SfX8Bl5az1aoMvgGOaV+47FRpjrnutnxr3BPh8fDxXy
 7WQseiFNmrqe5+0/rkr+xPcsBIj5pJD4QrB4ALk+9a5D4cxjN+dEjDyY+9i/ljDXD5BDyQudBGo
 E6OXMUY57D7zIoN3Kx/xiti24hYY8YgXMwpe5sL1UwzrzSCrkq6aXxU/ywxXjSJzPRUnUoL23Be VeBmTiVGY2DDb6w==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Some comments were not formatted correctly. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 1e9eff01b1aa..3281751436fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -30,10 +30,10 @@ const char *security_type_str(u8 value)
 /* WEP related ===== */
 
 /*
-	Need to consider the fragment  situation
-*/
+ *	Need to consider the fragment  situation
+ */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{								/*  exclude ICV */
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -342,23 +342,23 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	}
 };
 
- /*
-**********************************************************************
-* Routine: Phase 1 -- generate P1K, given TA, TK, IV32
-*
-* Inputs:
-*     tk[]      = temporal key                         [128 bits]
-*     ta[]      = transmitter's MAC address            [ 48 bits]
-*     iv32      = upper 32 bits of IV                  [ 32 bits]
-* Output:
-*     p1k[]     = Phase 1 key                          [ 80 bits]
-*
-* Note:
-*     This function only needs to be called every 2**16 packets,
-*     although in theory it could be called every packet.
-*
-**********************************************************************
-*/
+/*
+ **********************************************************************
+ * Routine: Phase 1 -- generate P1K, given TA, TK, IV32
+ *
+ * Inputs:
+ *     tk[]      = temporal key                         [128 bits]
+ *     ta[]      = transmitter's MAC address            [ 48 bits]
+ *     iv32      = upper 32 bits of IV                  [ 32 bits]
+ * Output:
+ *     p1k[]     = Phase 1 key                          [ 80 bits]
+ *
+ * Note:
+ *     This function only needs to be called every 2**16 packets,
+ *     although in theory it could be called every packet.
+ *
+ **********************************************************************
+ */
 static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 {
 	signed int  i;
@@ -374,39 +374,38 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 	/* size on the 80-bit block P1K[], using the 128-bit key TK[] */
 	for (i = 0; i < PHASE1_LOOP_CNT; i++) {
 		/* Each add operation here is mod 2**16 */
-		p1k[0] += _S_(p1k[4] ^ TK16((i&1)+0));
-		p1k[1] += _S_(p1k[0] ^ TK16((i&1)+2));
-		p1k[2] += _S_(p1k[1] ^ TK16((i&1)+4));
-		p1k[3] += _S_(p1k[2] ^ TK16((i&1)+6));
-		p1k[4] += _S_(p1k[3] ^ TK16((i&1)+0));
+		p1k[0] += _S_(p1k[4] ^ TK16((i & 1) + 0));
+		p1k[1] += _S_(p1k[0] ^ TK16((i & 1) + 2));
+		p1k[2] += _S_(p1k[1] ^ TK16((i & 1) + 4));
+		p1k[3] += _S_(p1k[2] ^ TK16((i & 1) + 6));
+		p1k[4] += _S_(p1k[3] ^ TK16((i & 1) + 0));
 		p1k[4] +=  (unsigned short)i;          /* avoid "slide attacks" */
 	}
 }
 
-
 /*
-**********************************************************************
-* Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
-*
-* Inputs:
-*     tk[]      = Temporal key                         [128 bits]
-*     p1k[]     = Phase 1 output key                   [ 80 bits]
-*     iv16      = low 16 bits of IV counter            [ 16 bits]
-* Output:
-*     rc4key[]  = the key used to encrypt the packet   [128 bits]
-*
-* Note:
-*     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
-*     across all packets using the same key TK value. Then, for a
-*     given value of TK[], this TKIP48 construction guarantees that
-*     the final RC4KEY value is unique across all packets.
-*
-* Suggested implementation optimization: if PPK[] is "overlaid"
-*     appropriately on RC4KEY[], there is no need for the final
-*     for loop below that copies the PPK[] result into RC4KEY[].
-*
-**********************************************************************
-*/
+ **********************************************************************
+ * Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
+ *
+ * Inputs:
+ *     tk[]      = Temporal key                         [128 bits]
+ *     p1k[]     = Phase 1 output key                   [ 80 bits]
+ *     iv16      = low 16 bits of IV counter            [ 16 bits]
+ * Output:
+ *     rc4key[]  = the key used to encrypt the packet   [128 bits]
+ *
+ * Note:
+ *     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
+ *     across all packets using the same key TK value. Then, for a
+ *     given value of TK[], this TKIP48 construction guarantees that
+ *     the final RC4KEY value is unique across all packets.
+ *
+ * Suggested implementation optimization: if PPK[] is "overlaid"
+ *     appropriately on RC4KEY[], there is no need for the final
+ *     for loop below that copies the PPK[] result into RC4KEY[].
+ *
+ **********************************************************************
+ */
 static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 {
 	signed int  i;
@@ -1456,7 +1455,7 @@ static void gf_mulx(u8 *pad)
 		pad[AES_BLOCK_SIZE - 1] ^= 0x87;
 }
 
-/**
+/*
  * omac1_aes_128_vector - One-Key CBC MAC (OMAC1) hash with AES-128
  * @key: 128-bit key for the hash operation
  * @num_elem: Number of elements in the data vector
@@ -1530,7 +1529,7 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 	return 0;
 }
 
-/**
+/*
  * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
  * @key: 128-bit key for the hash operation
  * @data: Data buffer for which a MAC is determined
@@ -1541,7 +1540,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
  * This is a mode for using block cipher (AES in this case) for authentication.
  * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
  * (SP) 800-38B.
- * modify for CONFIG_IEEE80211W */
+ * modify for CONFIG_IEEE80211W
+ */
 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 {
 	return omac1_aes_128_vector(key, 1, &data, &data_len, mac);
-- 
2.45.3

