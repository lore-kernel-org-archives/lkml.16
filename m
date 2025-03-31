Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75942185B1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452924; cv=none; b=AqSH8TXZhhqsWqzn1Ev6LNdoANZ/KBFQfd98vFqauzqfAkBrAhF2BIzwAopuxZIVDSbydx50nAVF27QrDAf92U+ImfDyzgjmes/yke/1G2xa0ol4y38in1lC78iGCmNTnB5BaoMv8iC1ng7iYZ8C7H95UWfacJWTTAd2idEAIq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452924; c=relaxed/simple;
	bh=DVP7/Noh+Zlsys4rcKuTeVlg/gW3KwdUYBVehN1s+gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebBXNV/x4L6qO9bWoC2HFxSMRSIdj4zwtxlkCoBNF/d8DTdIspUqR/JCn6ChG0NkDZ4JqLWBHFBBYHSniHHsRFaWSDG+rWrkntAd58iRSI9vVzYI6sK+4nk6G7Wwbtuni+IcEfzfklmnPmYQoLHLQEhgKK4pEcjGLXq+yRkaPOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG19Tzpy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG19Tzpy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22435603572so90547265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743452922; x=1744057722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=;
        b=BG19TzpyCdBAPBvnj8d74ktJY9mnKYE5a+qMWRo2rxOYzWho3HgC3lSIIH02ndOCbW
         eT4/i+3gTE502YHqH35I9anwgQeW2DKeetesmHDMGvdMYC0evDpdIoIkPlEEEDzGsjuH
         q3dyUAzosAalqy34F6v+VHULh0Uje0wUq0gAWoQRPWmsb3htYH5L9WgsJ6+nkpffNOn3
         9zgreNOOHulAwgPZPRh4/h52hxkBlitlGHgHljZeR50V8iyaupQLTdhN/pT0jqXqZg55
         OdKeaOeMHd9OrA8BmhShh7NaFLH+BSOmIWbx3bSWaryyqIlge6Ma/ShjlfNfzzcxAFIB
         z5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452922; x=1744057722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=;
        b=R3DH3F+iWoiCiIK+XzJvn7tNM3sok3pb4qAlVFGLbWGVMIunsfzRue5b6MM7y+ZEmc
         q0hOkBuRfOM3WKUxy/RpH9Ub2N+AToSfG0J9Dyl9zgIOHNsvjd+slkGRdOKqQPR4cgb6
         45ycFXiIU1zSB/45SoqGONcnqd8P9nZb+2sgIcR2zR38GN+MTxntOkdQMKXueaGPSrgZ
         uTzsQoO0lMh7F1lgAQhGWQ4gCY+o2yjPq25lnCHaQzGSYoQ74hgeL1BSQ6XqyJ7ldiCv
         bhI5myRWZTnE4wuwqeRNE/Cfb96WpM6+pV/V6vZtKxP9suyFR6yzDRzstk+n9wZYEv/Z
         FFIw==
X-Gm-Message-State: AOJu0Yx0yr5Oc4IxSR00QNI74HZIZGvKPoHgEamu6xMUfBGBAMvOsP04
	jjJv603HZ9gcVoJHkLIzbn0sB6dctA1qEJvt8VzleX6xeNO6duFb9KhE5Q==
X-Gm-Gg: ASbGncthm5hiiRrvwIfpFHowHUIIB/iAHSUk+xIucBZJvRO323Y9nkJv6aEmm7gX7yE
	AEcUQCd5S3y+zQmHeL64iWyFZ9EylxDJ+b56+9JpkVWb9KluTBVI42ZTP1BER0700MBNf3IDoF8
	v9U1fNLYabkv9C0Dq11edvliyMnDqfS7sXRu+who/cvtHPN06Gqq/4wZnXl86d4j/vyAdv2kuxi
	qfHpvVK35qwP5uG9+cTfdKiy7VE3Iz3n4ai5wFf2SgGvGHkQgm3g3F/s3iqvXDoUtruOArwTLwG
	u3zmvQEGRxDUt76KyNsBqwtjj+6Mtxru0KspREkMpONYdv64jwml9BKnyM3yXj3KSWCXjLsCEpA
	xMuOkybKsuveUdKYOgFEjOBzSfMyZ/1Mmz/mk
X-Google-Smtp-Source: AGHT+IEGF4zk0YdJdoj5BbEmITQJ8odofyWpDDRi96ONj6TH5gv+h49FEWrdlv3sUO5nktnM1vTngw==
X-Received: by 2002:a05:6a00:2e05:b0:736:ab21:6f37 with SMTP id d2e1a72fcca58-7397fffbe45mr14387009b3a.0.1743452921675;
        Mon, 31 Mar 2025 13:28:41 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:f74d:571b:c2a4:d872])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710ace02sm7424843b3a.150.2025.03.31.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:28:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs-tools: apportion atomic write's total delay to its operations
Date: Mon, 31 Mar 2025 13:28:35 -0700
Message-ID: <20250331202835.4057396-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

To utilize the delay option of atomic write more useful, need to
apportion it to each operation of it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 57a931d..292dcb3 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -769,24 +769,30 @@ static void do_write_with_advice(int argc, char **argv,
 		}
 	}
 
+	total_time = get_current_us();
 	if (atomic_commit || atomic_abort) {
 		int ret;
 
 		if (argc == 8)
-			useconds = atoi(argv[7]) * 1000;
+			useconds = atoi(argv[7]) * 1000 / (count + 2);
+
+		if (useconds)
+			usleep(useconds);
 
 		if (replace)
 			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_REPLACE);
 		else
 			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
 
+		if (useconds)
+			usleep(useconds);
+
 		if (ret < 0) {
 			fputs("setting atomic file mode failed\n", stderr);
 			exit(1);
 		}
 	}
 
-	total_time = get_current_us();
 	for (i = 0; i < count; i++) {
 		uint64_t ret;
 
@@ -804,10 +810,10 @@ static void do_write_with_advice(int argc, char **argv,
 		if (ret != buf_size)
 			break;
 		written += ret;
-	}
 
-	if (useconds)
-		usleep(useconds);
+		if (useconds)
+			usleep(useconds);
+	}
 
 	if (atomic_commit) {
 		int ret;
-- 
2.49.0.472.ge94155a9ec-goog

