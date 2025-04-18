Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903520C037
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969688; cv=none; b=Z8RqUABNow285V+3n+D9CD4q6Q8WhcLlFw9blOIg3BUUoiS0PHyjPKOD1btDNEiUTmnSIVHKDbJHc/PlNNCzCLre+8JxFtSXVbamRfRsIc9rxAcvsiLkpOYwBAM2UOVb7aD14nm4GOYoHtbv+6KSN0lmbE8XocIaX7aJONwFUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969688; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rIhT7X99jPsrgIWzQjgDcqgvwngX4Hdmj8tbdzeU0UYBOSOcAxYWTiNJrLrBx3UpplL8ptDEg3KTvdcTguzLlGwIkAZJCIEDOr/79x/GaiKnHb9wkS4TrXFjlJBWiS0BDBNRKo/+e/FIVsH02MJRJSGIUK8oAAJb7Qfv9fkd3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFzhZGyl; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFzhZGyl"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c559b3eb0bso103287085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969685; x=1745574485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=lFzhZGylILjRNXJDrfc9DNNmlInCa6GpKYCK2i4ro2zK7j5eOOrU+QDMblgjJQXfnj
         +4+m0lfvlpYwhbISgFhDCciHTyMOJ85UArbkS7tFOvS4KM/Zozte1w9q6nq9QbXXtuVu
         sbSHZye5B8jFKFkrRzlHLnQGJBNwNB6AFg8GFBS2R//DcnWdeqYIrEwqNrRkTNte7mGL
         gQSpHX9N/21dI3Pv5MEUUfiEISxH8WiOsC2SER3AM6Z0nHqTtn4dQ/uEjrwkC0LKiecE
         1pTTXWZFkzxuePjX9tGwDDzePbP4JIk1OcpXgUMhLetil8XfcnZEfkvzfd/dQzPdmEa5
         c9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969685; x=1745574485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=Ez1YWr5t1lS7jS9QgsK5EkqObX79wqznHWAe5TNLjJhYRq2KGOR+TAcHy33nSk2R1u
         vNihZmA9CoXyGOIC0LicgJNPDI47B58mf3C4Hjy45qP74mXCM8OniH1uOXDpJ4zJeav9
         UXwu22o7L5nMLDz/1YD7Bv0vtLSHIBm/DvontLCf9bwvEABqhxmS7fq/K1IhHNw/YEJX
         tlZIUwtbD5/WP+bmAntOsOo2oetwNPHNQmlg3Xtln7H7S6gu/CHfFf2jiiv8IlHlAwPh
         /pHudecl6nFMPUZF0dnFuqqpGppUYlH/2dBIZssr48n/M7HRLKPF6TDPYbvnbb3MKKgT
         bkbA==
X-Forwarded-Encrypted: i=1; AJvYcCXV2OPmKsWhScsSgE/b6RKmsvEc/bQMfNUmLzFKPiaHCZdW6xamyHAdFpx5Ryn2t1f0RgM/Zl6kBEOefd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xSiXvKztSVZRFCSeT2oghWBFhEwAwJztK7WWs0znD4hIC+/+
	GqUg2nHvADrVhOtiWWS9cP06W27N8aEW5DkPVIe7XRgW1s7FEYt4
X-Gm-Gg: ASbGncsEuvdn//xeX2d+bSdcrKPOja3l/EQ2/mJjg5ZT/1alyymC83ByVa/KY+gRv7k
	4EdUgQy/qHq2goECSwQ/rTOaDD4Z1yDGU756aidImKNJBx7fiHXUT2SoDydyigCsuzEj++x2wJX
	/1p1/JE2uI50cxBLZrzlNCemUTtDukb4hE125VAJbLLSwR+9ki7RAYhue5SUIxnmeWSnvaPiwpc
	WEjwvqK5E7HGI0rK0GX49QVcrpjinGUcVlkM1eNXzZXe+8cY7Nftqg2zRbzzqV/3AS/ytYv/pNv
	o0lJS6p/UsWwR2c0kF+Epyevz5hQiMb3
X-Google-Smtp-Source: AGHT+IGhhQYwXXU6Niw3QT+LbIjsoJKoG3bvb2d2USnFJuJeJ8zyigLaEU37PAkVyAOQqtgjlTyK2Q==
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr316707685a.18.1744969685553;
        Fri, 18 Apr 2025 02:48:05 -0700 (PDT)
Received: from ubuntu ([105.112.229.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b775c1sm89372785a.97.2025.04.18.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:48:05 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v11 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Fri, 18 Apr 2025 09:47:54 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744966511.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744966511.git.abrahamadekunle50@gmail.com>
References: <cover.1744966511.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5def2467f42b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,14 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
+
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

