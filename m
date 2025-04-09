Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36E1DE4D5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180751; cv=none; b=eHkvqUCWfW0lthjJQJwivV9Y1RIjuUSVoHvOfmwwOJoasn3O3/hL2/4vfcnab9kAyeYb4KWwVnqFvYBtOOHon4INUrFzPzNeN4f0cgZPOH5igeCl1fmMG2nFjVqBkViJJcRc+Ue7REx+v2/9TT8iLTkRCet1i9SH5TjpEoyrVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180751; c=relaxed/simple;
	bh=0BwdTMeB4vj0H+8sONqYDXdTxoDaepL1rVj5QYYR5bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RupgW6EDjI2m2yMaBr0oNI1PWXvKDMoByNzwUIim2lmMZ+aSBMSDWB+BuWaNlOmSBpwTJA+LH66XwNr5iiPyTesH8Ian3Yyn1jJ7SjAgc+MX+u8GEQ9NQYm8xoVG9/seWsosKMkrgGkC4JQ9dUPlbw18HcpiLWkUdoLGPg0crDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FzS0QB5v; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FzS0QB5v"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3035858c687so5117706a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180749; x=1744785549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhBjuzXfhpvMuUsgRC5Vl/rwEcnbNHJJRuuFjc3usdI=;
        b=FzS0QB5vOxCoGhWCpk7V4AbeBSWp4CKtiLgegnU66JiGJYZwQQXJgbdaXKh6lgMn4A
         ls6hdwJPYsB6Mqw8tSdNpMJd8VBLqfY0xQxz/R0lrLl8+AwquPl2uGUgSLvYHcKRzj+1
         evdv5LlaOHbkOSr8Dx48+xwWUXiLj/YUglMumlGvCqT0+QAdhv1x+i5POPFMOkg667SS
         esqoGfBvJCwhrh1xRD3OI5k4b+nHJZcGZXjhzjKwLtndVjykLbRwHzbzgfKrRiNR9sMd
         mNq5e216VxJKQ3s0Zy7bOzxoG1RID3ir9HJ/OgaOyxG2gag6gCN+n7uuHbqx5sE9b7k1
         4SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180749; x=1744785549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhBjuzXfhpvMuUsgRC5Vl/rwEcnbNHJJRuuFjc3usdI=;
        b=Vig1PHPz3CaDfm60fmNqRXC79JIwbNdLdFm40nJGfab0gS8yH3O00HGHsG2glDSEZY
         fjimSTTwzXE6C4tCQRmRNcaJaqVzGpa5OI3rxs0uG7ggbZpy6kK11KVp+13tn9TB183r
         kk0DDd3PwbsbGb9goAsYMAjOKSrZLBpV/1DVmojcpY/RpTJigPbZR1NkLxOAIteyeLp+
         erOBOQE5JxoHiHAqliGcSXvBwfuJvXU11CwoA3aG8WejobXpwZfsSViEIdA6fdFYestF
         IrhOaEMZui0s0p/1ZtnvdP7gr3WjgFuo2Yxjdri3ZC2i7uvNkckIBN4qIs+7D2J+CTFH
         KkyA==
X-Forwarded-Encrypted: i=1; AJvYcCUjLtWAEg/rcabEX18hNMXGpnOYUKM5Y+zWVbEg1WuGcmesi1C6BNk3KAOMGd8wsszc2wG2Q1ynBzJzd40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznd5+50eu26f9ck82q4pTFWdCU/uqndsKYjCu5x+pdWtnDtsfE
	n1RKocJ6rrbCU7cHKN8g6uL6wvgkE+pGzZoJIBlRiEoddvSyDXmPfTbtG8akAFmvnqXtDR1yQj4
	=
X-Gm-Gg: ASbGncuhEIzxidR+EyPTum1lSqI1nKaIHAXcDbT99TIIF/nuw3b2IfzlVtsJTM6dTcu
	B7Dx0khf9JT/axj+Rtvv4HYyRP6g4KQ5lHI4NfeYBChaU5pI/wv4ExPoEefemX/JaRQzsIqomFf
	/rEX+eL84hWizuJbRSePdvq1gy7Yz+4FlMQsvxCV50HAsE4W7BLEUR+3+UruooZsIsSJsB11LaK
	G1C2TU+ox4zl8MVw65+mJx5U4Vp8m5SJS9FHCpk9MMuH5xVWfPjQ1mdBXEUC6qONQEqqdf2rnJf
	1/A3iy428m/cmmnfI6Nu7/9m/qnLpwLIdg+APxydA+86UVrysDe6mqR3Yhp0V8/9dBYHHw0nMo2
	OZAV1oQ==
X-Google-Smtp-Source: AGHT+IGKZUoDFlUs7UnFcJ3yDWk9AFzzYDvUXtNaquHlXmmfZwUllHrwjbCkgfa7EHky/zlOGo4UiQ==
X-Received: by 2002:a17:90b:5190:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-306dbc297c8mr2737134a91.25.1744180748962;
        Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm577781a91.34.2025.04.08.23.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 1/6] staging: gpib: Removing function osInit
Date: Wed,  9 Apr 2025 06:38:59 +0000
Message-ID: <20250409063904.342292-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <osInit>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 333f5c62da9e..43d655ee324a 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -8,7 +8,6 @@
 int ibopen(struct inode *inode, struct file *filep);
 int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
-int osInit(void);
 void osReset(void);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
-- 
2.43.0

