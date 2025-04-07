Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D921D3DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024017; cv=none; b=eZaCsZI/YsTyFhShh5VVlUq+dKdWnMEoZZPbX5+gJj1ufye/mmMNCfCDockLEcaXy94kpVOq8HYafCtz/+dOXBJzy3dBHSvyvEUYY+B6FVJGT1i74XwyEvbKK/b+Exy4Olies3vaGI099ecdJUElJxmSIBY/Cl8ARdF0HYNzhEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024017; c=relaxed/simple;
	bh=BdLZNj/E8geGY6nVcjPsggWpqHTe6vJEthVvFXxtoEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2F6UW28S8rFlakd1c0g5FcTXBEcNLznoEENuAtEcCSIGlTonaxnk0fxSziJdcccyVBKb3CYw2NmrPwTUpNbmEEptIr1q0F1EeirSEKA5n274Bo49B4N/C01Jhr/AiSB0YPtvtAVjh0VCBZmn28B75CLdPTueIsN1pjvHyx8VwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcMp9UEF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcMp9UEF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4731154a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744024012; x=1744628812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOptbtbOKUdHNzNg9ygqhPthLmzyP2uo7jPEq6N+YNQ=;
        b=FcMp9UEF05ELm90P9AZx0Tts6+aCmTwbMxWxyAQ3MSP++KVbce05ncn+Fp3hxVWMbK
         zOeFOIna36xTASeFNMRgeDU1nWY/x35ikV9fPNqygC0gISjAXP+Sada2FcUUKip3vTnp
         HNnJr/VM6BoFq5eZOAQwMK6n9Z+1rgM5nYaVWc5QZDawUWgWC0c3TrLQZifk0tUtAj0T
         3LL9/nI2JeRYCTmvG73/UdfGpAOAbOFSwwHsHvywibpNtDzYt7xFCN3iql/81Nt7RO6p
         9u3MA3E1+KBI9kQySHBON7aVC/yynoM7VPGEoWPeV0KSTxhWMpknMqzOUui9mR57topj
         sGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024012; x=1744628812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOptbtbOKUdHNzNg9ygqhPthLmzyP2uo7jPEq6N+YNQ=;
        b=qUonCXcz5VQ8OL0RGcOjktcfXHC1a++UrRJp0OrRDWSl/6dKObLlskP/zAyLbycp99
         gusRK4uCH8PMJ0Ldku2chFfhmejLkWuItu4FkKA0d8UbTX2NafoYDqpOTXNoMkl4bBXK
         vtriCNid8li8Ki1MDC43aKweZLpGH3Rxp5CBr6ZBMWAN/bJFQcMYABLrSrxLpVExZI7n
         umINLdUnLZad/H8phPnucnrbRMA4PR+sYpBu+FNlKdwwF3q0NHtSiMCFhxnx5GeMFPTz
         nfIQf3MU0KrygLtLfJEq7NkNUF9dztmVc2zf3MlgSNFnHYZ8iHQ/VHuSQezpdg3eIudD
         1wmw==
X-Forwarded-Encrypted: i=1; AJvYcCVOgTNwMTv/mWKmJSeWphzzJxF0DWreITPogIQ0osoqyXcSD9YDL6osUZLvGo8weiD16pdThp79erbsSG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/x9Y8YoKh5npgY9FtAqtVLzf3Y+zuvBUHOA2CohAmizRe0r+
	ZJpNKazb+CNkIiZKicz9actTS+jJyGNORD1andYzdbSf39OKFAN2
X-Gm-Gg: ASbGncued+dXpLnBNvo2WVE9dCeteTtpaorGr9JasXgCopQKgDCbjmJJCmfYqXADI+e
	NOUtE6k+VYvg4D64gvSXVDQVsJ85SxcLx4fvhQKMJCoePPmvXZGe0knRav3ccU7c4Zo+IWm8R40
	bZM30W01C7Wa5TOrh/Yzv51/PiAPYt2ZoCHTLG4v7WqrdZs7lvAuyFVGFcmD6d4Ie9T9lo+E4mD
	G2Wh7dDcZg4bRWS0tR8QvLsrl2DfA3g0GmH29BTihZCD2FKGet55nM3abw9E60B8ELycr8TQTnS
	sdI11BeJFdXcrNmANWKUd5oaCHPCcAh73zQTbX5QNB1CvLH5/Uv3ye0Yeotj1Q==
X-Google-Smtp-Source: AGHT+IEER9gMFbZAIOso3TAQGWYEqTKd27YcUoJoECCDkKgwZqvn74/cLLH1AbzkTcSTwTfsj0FPkg==
X-Received: by 2002:a17:90b:2d0d:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-306af5f1de3mr14855986a91.0.1744024012042;
        Mon, 07 Apr 2025 04:06:52 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d672sm8783946a91.31.2025.04.07.04.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:06:51 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v3 1/2] erofs: set error to bio if file-backed IO fails
Date: Mon,  7 Apr 2025 19:05:50 +0800
Message-ID: <20250407110551.1538457-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

If a file-backed IO fails before submitting the bio to the lower
filesystem, an error is returned, but the bio->bi_status is not
marked as an error. However, the error information should be passed
to the end_io handler. Otherwise, the IO request will be treated as
successful.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fileio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index bec4b56b3826..4fa0a0121288 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -32,6 +32,8 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 		ret = 0;
 	}
 	if (rq->bio.bi_end_io) {
+		if (ret < 0 && !rq->bio.bi_status)
+			rq->bio.bi_status = errno_to_blk_status(ret);
 		rq->bio.bi_end_io(&rq->bio);
 	} else {
 		bio_for_each_folio_all(fi, &rq->bio) {
-- 
2.43.0

