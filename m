Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A1D18EB0;
	Sat,  5 Apr 2025 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833016; cv=none; b=FTjCUVhufsaBuWol2+NEBGSu8VC78WrSbCTDEXAVzS6FTPp0vbhSWZKYJ8Fd7jjnoQn+HZEQQQbpfdkOASqnxG3+OKNq4inzXlALZ08gjdb4TcswyKtCmqJJbgeS9P4P8Uu93m5AHdo9/oSsy8MaO5xmpINQOQaaoun+giM6iJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833016; c=relaxed/simple;
	bh=bo/KXiEjIA/Jw0Q24hjagPlbmm7eInVvvsfeNlJRgNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBrs8oOdqhlCtawjAUXzGD8FnskM2p5veZ/5GhC1CpBK1Nm9UDGU+lroUihLOSnbp2/XrG6jrlAQSIVyu+37hZ8rkwYS2GVAxQjAv1Wuv9KvDP1Slps9gWgdDz6u3yriZufLFYUeTS38o1Uh06v7wFoYkE2cH5IOmSuJuEYFL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RheKCZhm; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RheKCZhm"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fea0363284so1566363b6e.1;
        Fri, 04 Apr 2025 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833014; x=1744437814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRO81KAlWVAUMNmlMPrVLR3d+OGjp9Qz/jso9myHPaY=;
        b=RheKCZhmL1gvb2Q6dHUF/4eiNd4Wtw2ES0UKCkQXnfP5pK7zpwuFgB5ckAFhEbA5yp
         luYVLClnD5ER8AWZ/pe4805VoSMAEY2KEEZXHyGdDHmlH9ezsnKMDLKKxw1WOIZt8PbP
         jM5Z+kiS10ISBR7eRWTBIWD/GF/GZC4y/Jd3/2Bt88gqyi2RMGVk8wKpATsRTaelGg9T
         eYYlynN7lp+p2xJybo8sklI8u59tG1kHTMLPJlOavNqOlNTux0+5Qat5nJykWKKumkzO
         Roz8vnGQ/8bflP5FYrE+13sz5vg1csMZhR2tmz+8/S/otmYVi/myiJEeAOSDsgi1deaE
         X3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833014; x=1744437814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRO81KAlWVAUMNmlMPrVLR3d+OGjp9Qz/jso9myHPaY=;
        b=OKzOJEQ2T+eHR10bxTsQbcjAzhW/dsJN2fDwSY4riclIoJeLttkhAM/NJScoxMREu/
         pZAmHXK3SmUbOmaW1j5H7dW3XuqAvgoF1KmJAsYPMwIfQLaN6gpC57plMKIBGzxE0mFS
         0FJcdMcNmBBhqytFT8Tu6qelB1bIX6lGONQIBTGiSMUtowLFPS6V6Ag/s55VYXlGGOLb
         t/Dg8m6A57MsoZPv7B4llotpSzIJWj/tOPBL1qDpuDM0KTUBvY2cDgu4C2DFPgSRJc76
         ERmBsepoQbFUijaV1bDbMxklzuebPcLHjXctvviPr753BpjR4EquVn7lCavn0okoBv19
         LI7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/oZ/uOl/U92E5sSzRkt565IDRbgE9QXivKCMhRXEJyWjbrOsgvDBe+3FdQuN6mUC+w1yYW8F7g1e/BLgy2xw=@vger.kernel.org, AJvYcCVWcjctrpQlsdkVOVMBSkMIUUey5WA5XoZT/uwivwN8p4wjz7lFVm/ksLgI4UFZC89lp/WvrgNn1OIZT5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjPl0UDBmtM2hv0S3ms+FtNrwqGRt7kKez8cl4UZh0UU4FQNm
	Z3A6QwoywxLGXfryvPzIG0nyzOxVVT8y1QQa4Rn91wykOJFT+F3S
X-Gm-Gg: ASbGncvduRthnQ/EwSVjCpJGZ2fdHEQeU2skChUryquA3uRLyY9eReKoxyYcLGUU1ec
	lymUG6V2CHMfzKT6qxOdPikv62H2VMjy0yeB9KYXe1aXcf5E3bcXsRode+jcxqpjPjHk/4HSSD2
	WTjZexKk1mBGXv5oc/0SgbWRgg5+3gAarKONfNIKSIZ7p/XmRP4Y1a+6lgmqZFaJZ2zGZk2gMn7
	cI/vUOj61xbkjQL5uMW5w9jocFWWOevFfKc0OOXDPpo8zJxnxcWpPEnXlK2OdILMWhsk1AJnZMK
	5v3UP3tPiSiF5ImKfnt0hicEhPIr5381CIy+1v3Shh6u34MwIm3MnaZNyCur6nOxMqIsMRby7+c
	WKlaLwQi/8oN1jdUy
X-Google-Smtp-Source: AGHT+IGmLCehceYuxYnDZ8h/6oqAfC1whuCNoJZaNCcyzQLynV+wCAvXVR0Q9D/33wJuDcE0mzaGpg==
X-Received: by 2002:aca:2b16:0:b0:3f8:93c5:6d9a with SMTP id 5614622812f47-40045602addmr2712809b6e.15.1743833014243;
        Fri, 04 Apr 2025 23:03:34 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-40040080a15sm926565b6e.34.2025.04.04.23.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:03:33 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: Liam.Howlett@oracle.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	wedsonaf@gmail.com,
	brauner@kernel.org,
	andrewjballance@gmail.com,
	dingxiangfei2009@gmail.com,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 1/2] maple_tree: add __mtree_insert_range function
Date: Sat,  5 Apr 2025 01:01:53 -0500
Message-ID: <20250405060154.1550858-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405060154.1550858-1-andrewjballance@gmail.com>
References: <20250405060154.1550858-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adds the __mtree_insert_range which is identical to mtree_insert_range
but does not aquire ma_lock.
This function is needed for the rust bindings for maple trees because
the locking is handled on the rust side.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 include/linux/maple_tree.h |  2 ++
 lib/maple_tree.c           | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index cbbcd18d4186..b849d57e627e 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -329,6 +329,8 @@ int mtree_insert(struct maple_tree *mt, unsigned long index,
 		void *entry, gfp_t gfp);
 int mtree_insert_range(struct maple_tree *mt, unsigned long first,
 		unsigned long last, void *entry, gfp_t gfp);
+int __mtree_insert_range(struct maple_tree *mt, unsigned long first,
+		unsigned long last, void *entry, gfp_t gfp);
 int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
 		void *entry, unsigned long size, unsigned long min,
 		unsigned long max, gfp_t gfp);
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index f7153ade1be5..e0db5d3b5254 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -6387,6 +6387,43 @@ int mtree_insert_range(struct maple_tree *mt, unsigned long first,
 	return ret;
 }
 EXPORT_SYMBOL(mtree_insert_range);
+/**
+ * __mtree_insert_range() - Insert an entry at a given range if there is no value. without locking
+ * @mt: The maple tree
+ * @first: The start of the range
+ * @last: The end of the range
+ * @entry: The entry to store
+ * @gfp: The GFP_FLAGS to use for allocations.
+ *
+ * Return: 0 on success, -EEXISTS if the range is occupied, -EINVAL on invalid
+ * request, -ENOMEM if memory could not be allocated.
+ * Note that the user needs to manually lock the  tree.
+ */
+int __mtree_insert_range(struct maple_tree *mt, unsigned long first,
+		unsigned long last, void *entry, gfp_t gfp)
+{
+	MA_STATE(ms, mt, first, last);
+	int ret = 0;
+
+	if (WARN_ON_ONCE(xa_is_advanced(entry)))
+		return -EINVAL;
+
+	if (first > last)
+		return -EINVAL;
+
+retry:
+	mas_insert(&ms, entry);
+	if (mas_nomem(&ms, gfp))
+		goto retry;
+
+	if (mas_is_err(&ms))
+		ret = xa_err(ms.node);
+
+	mas_destroy(&ms);
+	return ret;
+
+}
+EXPORT_SYMBOL(__mtree_insert_range);
 
 /**
  * mtree_insert() - Insert an entry at a given index if there is no value.
-- 
2.49.0

