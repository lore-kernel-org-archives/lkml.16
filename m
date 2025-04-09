Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DC25D536
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190065; cv=none; b=BQHjqIf0uyzuz+eZFETzqtMggbzijAeaS9xjDKFGg9mCa74Fx5EFqgxo9825ii31uyWOY6ce0V3slDddJmGiRK1YD8vPeexFPpBwdtzuRI5QwJ/sD0x1NU31pv9ct5lHz6GB1xN73dSmSGv3fMBprea5CrShe6HchwgCnfLT7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190065; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bxazwhYbDnkBDrLgyOg7ssXKR9fXjnpg15Yqug91jkjC2PxL+OJmZJJnHa4SqB+hSI9Q+H5pBI8bUpWiD7czxFJ/jurXPhEv+VFTA8Mbum0d82qNjZSDj9zx/kbX+kLuNrZnRyC9ELnbgR1JQ8jfXqwLTCjYetkvXsxs6yjFRc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ResvGiNr; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ResvGiNr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476af5479feso63990721cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190063; x=1744794863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=ResvGiNrhe20jPMU1rxx6BS3XQnSrPre9RNMRKfM6QSBgmwmIpD8WuEapdYnPLGGib
         R9O17e8WO4dtBA1v+1f5C6PHaSmzrruMG+Mf0FbHRUe6RXWIweY2pfUotzMD6CaBglBX
         7b4CMKKEt/1XONXvkufC7U/2hfywwEl/yoOSUVsMbzOFi02xT0qWtCtYTq+b1OzJTf5+
         KEPGAp9v6NrLKl25tOlqi3nl06hqP/lPz9laZ4ctjBBAANyH458Ua+3ORyGehCuJvKoP
         f2quG5apCtsMU9pbjNleKV6nOxBeBN/ja7aT9agKd9dtOTFvvD/uZRjmIdGIApsUkhVs
         ZSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190063; x=1744794863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=NJtB7Z0K4mt2f6gk/pqnaoRIq2cSZtMDiIngOQSs0RTugJhmEjYqmnXwLkiJkuQKob
         de4XC8uPHY5y3n75Bl1WFq1hicOv/d6Y7FzMirMTKi1yK3Ejk6IP8+qyHoIp8o11SSzn
         8j/JdXOso8W4I3rPXUrmxt4vo2BktHSdWNI/MpELa2bvchnSfJXxhxrdYaqN9MQFMyKs
         BC0oi3zZCF7dPZxw2/cvxyvosdyRMo/7/NVMe7jTK1T97iEFmvOvglbsgLUX/z5PsT4m
         nhwC+l5XkATaY61W1BZO549P2Tqf2CSeLTEJSAhyj3eJe3Se1iJWuVhKHrrj7yapRIyp
         idDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX89LuXQq5njm5AM/NY1h/Giw89xzFfBwUgefmQhMVWJZNWOCzL15Who3+knYRYSD5tWzvLcfPEG9SYy4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqhLK7meQQmAq6QOgoAHrIeYeMvLiNoNqegqUKSrWzDVJV1gA
	vNyfMvq1Z3v7s5NZUZiHlZF5PY/QHCtb512Bxw9rrzsNIKwTjRm4
X-Gm-Gg: ASbGnctb46H2ieOU+DebX0JwJufcU8bUw7/P2ll8gyb0ovFO4xz+6g+CnqIWT+PHDKT
	oQ2m4CNqH74A+BuAcZy6KSDpHIu0jOAshWlriMnrpktnZneI2y0dHjOb6kxwSm+BiXNsNaGG1/O
	5Ava3thMgrseFWZaqcyKpCxSw4AUKA0aiJxCFvhCS/Et0WXzR9rztW1xvsY1n09LCr2imMmG1Qw
	r2HRUYlaxhM8JA9DNtFBEQcPhuhbKXIYawsfVJcdh6SrHON7jhNxvqc9jqsfAGnvKsoc/n7zYtw
	v85gXlaDSsEukkXROXFttSkHZBFjNQOmh3knCliHBgYn3gSo7iv9WMR3
X-Google-Smtp-Source: AGHT+IGxXACYCWd8q0QSUfwe2C7F/fvpjaUMq7LuvpgmQ5wyXh+jaW1cXxA555291Gn8JmKjg23lmg==
X-Received: by 2002:a05:622a:1a0d:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-47960079a98mr21007151cf.6.1744190062709;
        Wed, 09 Apr 2025 02:14:22 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964eb99cfsm4677911cf.52.2025.04.09.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:22 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v9 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Wed,  9 Apr 2025 09:12:54 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744189500.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744189500.git.abrahamadekunle50@gmail.com>
References: <cover.1744189500.git.abrahamadekunle50@gmail.com>
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

