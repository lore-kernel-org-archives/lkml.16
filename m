Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4D28B3F7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874776; cv=none; b=hvyaSKX36oQXJAiMBYsBUlnK7VFDg63OEopTPHcMRfNtMflt0RPzaS5HxEAAq1Sxo2Fq6FgNa8tTFITpFCJtPpt2q2YK+tBpQWoCKZnjRCdQsjJFc6QymPHxdVtrR3RnsYfEEYpQbJW3sfxXsFkQ2iohYucprIvc0egahSo5nWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874776; c=relaxed/simple;
	bh=5vJJUBovy8K7rL9Oyv5L/Fa9kWnajAx3UcNQ7CguJVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2xxaXj3bv5CacDvxQrP1N1NIbT/DdDPByr4gYy0fMDp7TOC/cdbfhrgLE6orZW3yLyBMOIq8MHhkhXVSUlaC3sBPEZZVBU2NdwW9JsgggIBaCjI6IiSmG2+oEtrppdFXQpP4CYbwd7s4PVjyx160Y56Lq3jtGky3TOQqxd2DTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MeI9NKkz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MeI9NKkz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234d3261631so20579315ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751874774; x=1752479574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1m7P1VU0i3cPcaersIDOM72Fu+4w7qvEd5CJzI2VBc=;
        b=MeI9NKkzQ85abpHvttkTT3+AEqmjgbwPPfQyj5lUaEEsFdAGntXURTz+SaaueUrlec
         mJCHYZrxmBI+clAdfnTYGI59QsO2r4VuN88GLQmKm4Hyj5drlbTJlSWVYScKz4K6phan
         is3ftLRd4A+a0TRMSGt8XFxxslFoGBARVPU+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874774; x=1752479574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1m7P1VU0i3cPcaersIDOM72Fu+4w7qvEd5CJzI2VBc=;
        b=ipX13YYj04FgbTpw/g7pc64LxJQlBnEQUuH1gWwJ9F/1j3z6dN5Eun5Ws6SzgV8Cwr
         2cBnVQAN0YiqLXEe2s1vq/sFvorNBg3TOzbFOlsLAOnu2pV4ZottJ18B2fLwdGcA2jmn
         uU2BY/9Uky8m1qxNZpGjq9KjL7qCTozjzkqfXO5yJbIp2Hp5jyJCbK5Z0RZSn66olvSZ
         1NusMEa2NMoDlyJTnH2fOu2pe2iPQaiktDziTLTQaIlp663ZKas5j72oe6ZrNjqB4hHn
         J+w07BrX32ByX99T4U7ZKxl/hWeM2mW+oH1rHenaWBDFC0TyYi0821ooGFxyMfqIF8ky
         fJVw==
X-Gm-Message-State: AOJu0YyY1Zwjpi7LCswZKkAnJ5gBleChpFeGclFbGv7S5lOQXJ8akwv2
	k3cdP23LpCp1q6RiR3VguMgUbzjAk9E2eT83oKQauoos13a99H2LP+U/G2hAIPHo5w==
X-Gm-Gg: ASbGncvUIG+cJgISQ4hIuBJAUG87yzK+a4qxm5Zjy0CgRx34fi1Y89selldHf7via3V
	PC5WOjgpY5N1Q+fO0ceO05fO5P00bFK7TQiH5L6y1i4J2Wc0tKx0UNkYysaPMg/R4ZpjDclMnVE
	mW7g7++813U3pqDxIeLi5hedfz8mlMxyHxZb7nTIc9epk8HkxqV6Ew4KO1lt4JavJfZMP4XazTx
	P7G+vs1x4BVC73JWxrO7GRVVLChEDDpheby8C3iZdJm2cAUv7AB8lP9NRXpQf5ExiUE2QCet5M9
	tx8pUO4LKSBgZS1Xk6z292S5RPtm00OtLiPFNBPaBSHYjvRGR9CM+OSUhuwe6l2jCJRe6jJZ/+G
	CieEs0p9LhUTh
X-Google-Smtp-Source: AGHT+IFq5kxGcezB9g/nGKvS06GWXiPQAtrU2RzvqlzV63+xKk3jaH2lqWa1Qjto/3ckZk45rCf/4A==
X-Received: by 2002:a17:903:1248:b0:234:d1f2:da31 with SMTP id d9443c01a7336-23c90f3707fmr127735575ad.2.1751874774464;
        Mon, 07 Jul 2025 00:52:54 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5470:7382:9666:68b0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4e102sm11910023a91.3.2025.07.07.00.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:52:53 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] mailmap: add entry for Senozhatsky
Date: Mon,  7 Jul 2025 16:52:13 +0900
Message-ID: <20250707075243.858895-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate and map all addresses to a single one.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index c1f4381f9685..8c5b2fafaf1f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -694,6 +694,10 @@ Sedat Dilek <sedat.dilek@gmail.com> <sedat.dilek@credativ.de>
 Senthilkumar N L <quic_snlakshm@quicinc.com> <snlakshm@codeaurora.org>
 Serge Hallyn <sergeh@kernel.org> <serge.hallyn@canonical.com>
 Serge Hallyn <sergeh@kernel.org> <serue@us.ibm.com>
+Sergey Senozhatsky <senozhatsky@chromium.org> <sergey.senozhatsky.work@gmail.com>
+Sergey Senozhatsky <senozhatsky@chromium.org> <sergey.senozhatsky@gmail.com>
+Sergey Senozhatsky <senozhatsky@chromium.org> <sergey.senozhatsky@mail.by>
+Sergey Senozhatsky <senozhatsky@chromium.org> <senozhatsky@google.com>
 Seth Forshee <sforshee@kernel.org> <seth.forshee@canonical.com>
 Shakeel Butt <shakeel.butt@linux.dev> <shakeelb@google.com>
 Shannon Nelson <sln@onemain.com> <shannon.nelson@amd.com>
-- 
2.50.0.727.gbf7dc18ff4-goog

