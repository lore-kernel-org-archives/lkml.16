Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660C18C91F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660534; cv=none; b=AShWBtXkbfvmXRmxr2tM3W5VhVft9D+E2BunHYj5ye1+NRcEHV5XdQQ1wNGz6wUzitw/nUE5ncUon7cup2oMXWj5tvNZP+Iwcz2URKr8r/10w45vsUg2nLYupiwQss9LxkffUAnOL39IsXDTOR9S09P4EFQikAfv8cVdd/80U7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660534; c=relaxed/simple;
	bh=Nv0rYP6IGqsq13b+hvJr3Ld1oMy6sVANAyed5w1+V3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUCj68gAQAvlsoIyMYvhEx0QmT9KVOryN/ixDOR6HB6Xc1N0i5f9d0co0RIZBXnpCVfGWCR7jDlJvAX6NTaudzkHgmv1qA8Np2SAlJsJM0yCbk8oKof23TN7T1xKrckMVEF/eadRSlv/CMEApyUd3OkZRtTNI+85U8b7mxDsGYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CknSa5wL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CknSa5wL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22d95f0dda4so48787725ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745660532; x=1746265332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ3DTZIDBKyUTpC89W+rkrQQ38tOpW2Rf19IbsFWFyw=;
        b=CknSa5wL/25rjRl34fVdds8E0t6MW0rOsSetnPQZniku54SZSGusqvSX+eDqmlBLOG
         X0iX2ss/kBrMmbpWViXJY0j69g4D5udfEcO1EXgKneq704mZqV01tulEcbop/7W2wXT3
         uAzi6A6AvnOSM7DOk2LvpFp8sL/XESpBrasLDZ8dYC1ZgsowR7I+5fR/MefdNoJ2BtxV
         5bJ4zTTK/FE1uFNvDroQ5PrJNK8bpjEab9LOYF1VEA+B79vcKkyYAhzKeqctQejawWQ8
         zSlhTDQBsEcg1TgXITv/gOvWDErgImR/PbYanBWadm7in2DBK+eb0wvizElp14C2It97
         jzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745660532; x=1746265332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ3DTZIDBKyUTpC89W+rkrQQ38tOpW2Rf19IbsFWFyw=;
        b=GIoE4GTEC9p+PE8D9/ntYU8GarWpaCk9D8754XdrbdyYSB2Q6DgN6e7/IOO73rWroj
         He4xfmVfcbQvvGeGk8/zoTz8S3S6zNNviqbGfV11BfaeS3bKYq4T2I29bgUkz5JBvT2L
         C5y27pUkSTCBFCi8TJtFYkOm7nXhVNvA+vmSj4LdkhXs0/hRGEidE9Hs0qzIMKhZPaVg
         lOMN9f2wpooStG6ekMjcztEdMeQpjsyZ816p/sT1awo/n+bT8tEKnDQWRTN4b646/7sa
         DqY/vZtIm8HyWEM2GjpQWyxB4TZ3IpoHZrzw0kCh1zUee5pUfGvdSLKsiEcq1oTsAT5i
         rPCg==
X-Forwarded-Encrypted: i=1; AJvYcCWS1pan+nOIdaKoCD6FUESsw6abQb7UbUTtiH86wyM3vvu0ERqQRpkc828R4qL00H3uHcKuZNs0GFn/e7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QZKJnicUV7BWEWYhZGRhbUHmJPb5IJGqEHyJNsDaNgKbEa3V
	h0j752tyPgXYWHLCsnVRw2eZrNy+8AGVj00fO5GBgn+8I6KoBcGo
X-Gm-Gg: ASbGnctHdZkGaBXM0g1J5mym7LG8cgy0N+z41DFzaST7AoeivvZ4h/60yp54LuF2ygk
	qqHNSbMI92qXiljDQdKHY/+VeYZkLu3UJt2umkxrkUNINdusE3kamD08yypGy4kRG6Dca+TyKD6
	fbcSLngbaZprOQjcX4eZh+tB2sO/4wEZbsSW2786HhaDRBG+P+NB0wDhuJsWzQ/RL1WllN5Lje4
	o0SLxBkU8YWn6vScYVbRf6OcribtssiTJ5mnHkhqu/Es9H9DFExTz40OdYJXKqLgNlLpXEsZFeZ
	enLnpgfsPdT3ggxRM6D+GS7Mg7P28il9z+jYCUrW5Cv4ukM1MAWxQvr/B5sx3lMm
X-Google-Smtp-Source: AGHT+IGO+1eyJtJ2d8jWLaBlSuplGgg+UQXEcNY99QeUtdj+GjRBjplxauCwihmyYWjE4smmygvL0Q==
X-Received: by 2002:a17:902:ce84:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22dbf62168amr83880595ad.41.1745660532401;
        Sat, 26 Apr 2025 02:42:12 -0700 (PDT)
Received: from localhost.localdomain ([122.182.179.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e74dfsm46369825ad.124.2025.04.26.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 02:42:11 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: abbotti@mev.co.uk
Cc: hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] staging: comedi: das16 : fixed a struct warning in code
Date: Sat, 26 Apr 2025 09:41:45 +0000
Message-ID: <20250426094145.13564-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed a warning messages for a struct
Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/comedi/drivers/das16.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index f5ca6c0d4d0c..73717f75d60f 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -956,8 +956,8 @@ static const struct comedi_lrange *das16_ai_range(struct comedi_device *dev,
 
 	/* get any user-defined input range */
 	if (pg_type == das16_pg_none && (min || max)) {
-		struct comedi_lrange *lrange;
-		struct comedi_krange *krange;
+		const struct comedi_lrange *lrange;
+		const struct comedi_krange *krange;
 
 		/* allocate single-range range table */
 		lrange = comedi_alloc_spriv(s,
@@ -990,8 +990,8 @@ static const struct comedi_lrange *das16_ao_range(struct comedi_device *dev,
 
 	/* get any user-defined output range */
 	if (min || max) {
-		struct comedi_lrange *lrange;
-		struct comedi_krange *krange;
+		const struct comedi_lrange *lrange;
+		const struct comedi_krange *krange;
 
 		/* allocate single-range range table */
 		lrange = comedi_alloc_spriv(s,
-- 
2.43.0

