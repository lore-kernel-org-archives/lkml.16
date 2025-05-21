Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C541372;
	Wed, 21 May 2025 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844223; cv=none; b=ZJOzs5fx7KE5AFe13+zsgV9dv5X0k0mm0vJzmeLby+V12beZtu2jkXKo0KLAatfVoXLlujdti4WUOn87UtJaCFQQufF26wlYwX85Fa+aP6y6Nt7e2/eQ3WrE3Ftn+OsJCRl1ntZZmF1JMcYDWuNmHzuXgOjAEVptIXNszpNVfZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844223; c=relaxed/simple;
	bh=2dtOAUddtSvsu415GWAbHa+laloC6JCGcRZlcSsx8fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/ReQdNhFIFymBEXvbMOlNGcvm1bP65JY85IZMJEf7ecS2N8QW9/BXsOJ4yASQm0mZJio3c7uXLU9hAyqECUCiAB6x+7Xl6qKXpIPoEaIH8ETdaqyc0QEOpCIgJG3cygrjQfFIpm5PY2Ow2rCbeXbxIBJpxWVrVx3lEP3AH8P8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRc3HZPQ; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRc3HZPQ"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3fe83c8cbdbso2554709b6e.3;
        Wed, 21 May 2025 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747844221; x=1748449021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S82yr5lePzBSesD0K5DFXc8OPBPiv5saKdlDUFM2LMo=;
        b=CRc3HZPQIG27tuXuuX2DcLWOKQW3aiVp410Xfifh9m7foAdNs1+HDaMPs/rOI8ORzF
         ETi36i3OoEWqg3I6RxbIur4GVE5N3Mmscn7Is4Ur9BrNhbkPU8hAgM6b08GmWop8mCiI
         rxs1HWhOhMxKbWXAvBUUBB6QJScE7Yb+0UnDLgfVw4/KBrQW6iws6nNNicyvWX4J7IYv
         WXUAzBzvy821zYM44zjrifE8O7Hhg9xj/mefIeJE40eTXRNWPqekfmKerS3MLR/KjNJk
         +EDBPa8xoI6kEan/W+EXMgNasMmecd+5CS5Vzv1ExiGxsjKtq2Ng87l4rzkHu/sIy+Ks
         HJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844221; x=1748449021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S82yr5lePzBSesD0K5DFXc8OPBPiv5saKdlDUFM2LMo=;
        b=lZZkhljN8CQeCx78/Ozp52/X3MqWa3MVvuW0pSDhk6NrCfwXhd4cw93fKVyUg0Mvh4
         1DNuIUo9DcBTRov6ndtQTClLOyiUqkfbDlQ5Ms/sT1afIUaCWWHi5F6gUKxUaLKegSbc
         aYjG3rbnt1KpJp7p+jaTcmwxcQjqdFWewwYV1BfyMgO3O3bfcl5bRNsCbURJZM3ixa18
         eIPkBsV9d5WEyN8c+xFRK7a9L2fta4C+DcRNoNvtgP19yqt7X3pLbvx7OZpMT3A8CIdU
         z1OD2aPjuJQYuuQHm9UvR0U4j+BnAWNtqFFGtMeXhEXth9Jfv+QS8IZiDQM3AzeP5zes
         Pweg==
X-Forwarded-Encrypted: i=1; AJvYcCXsoXw4Y0a9nbMxeH6l/u0CqyToMYXBA7PIIk7+VMVMaapDf7R1Sm4uAvuhDtEvbhK1oWm8rMarztELN069LjD/Crn1@vger.kernel.org
X-Gm-Message-State: AOJu0YzrB2Y565thiUL55nSwHtPGhhC3Wv63kh1VwH6hk6A1/q0j2aiw
	qMXMSeR6W6WEtzi65tcPN3CkH9g4JiykAXJCGz4ch+MEqBOLOna/B1rLJfChBw==
X-Gm-Gg: ASbGnctCXdpzhTEQPGQJYQHC8JhQSyx9ozD2ynZeXs2NaRCcqXWb3rXLuKfi4T8N56N
	+JZVAQ79N1zVRA2UMGrGJ+cJJj2lmVnGj+LRWRSXv1yK+euIKWo+MJNLdFIKOCbcJ+qQ4YlduDQ
	GtmPt3LrSIJkRO1UE5USWzdA0pCDVSvK/SgCY5rofQs7Lp3vDTPIS4vQjw/jAwRiXiC24sCdxzR
	tX7foMwWQtiaq3RLFr1wBoyqZCsRq28qR0QICRefNzrsXsEsDpoQ4zehgWhtduN6HFysFsnzu8Q
	tzRMnmqMUuqwQk4rTsyNXXy9t1f3h5Fi1NzkkY4mgDTVlZ+sWN+WI8QQoxgWfg+24jiF2kq/EqZ
	d+iHvvsLffsaFm+P27A==
X-Google-Smtp-Source: AGHT+IFmzQsQ0bpXXAkiXBa+TSHO8qNIF6q/Ml7bs/9rjpm0CwHDGg5gOnsSjELLHCAw9jmGLfBG0g==
X-Received: by 2002:a05:6808:624b:b0:3f6:8c64:8bc8 with SMTP id 5614622812f47-404da82c656mr9629207b6e.38.1747844220776;
        Wed, 21 May 2025 09:17:00 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d9809bccsm2180129b6e.29.2025.05.21.09.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:17:00 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH 2/2] platform/x86: dell_rbu: Stop overwriting data buffer
Date: Wed, 21 May 2025 11:16:39 -0500
Message-ID: <20250521161639.47357-3-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250521161639.47357-1-stuart.w.hayes@gmail.com>
References: <20250521161639.47357-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dell_rbu driver will use memset to clear the data held by each packet
when it is no longer needed (when the driver is unloaded, the packet size
is changed, etc).

The amount of memory that is cleared is (currently) the normal packet
size.  However, the last packet in the list may be smaller.  Fix this to
only clear the memory actually used by each packet, to prevent it from
writing past the end of data buffer.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 6a602a80160a..bedf03fa4f41 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -322,7 +322,7 @@ static void packet_empty_list(void)
 		 * zero out the RBU packet memory before freeing
 		 * to make sure there are no stale RBU packets left in memory
 		 */
-		memset(newpacket->data, 0, rbu_data.packetsize);
+		memset(newpacket->data, 0, newpacket->length);
 		set_memory_wb((unsigned long)newpacket->data,
 			1 << newpacket->ordernum);
 		free_pages((unsigned long) newpacket->data,
-- 
2.47.1

