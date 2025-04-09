Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E91DDC2A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178352; cv=none; b=Bjw8cpYzcr8YpSDD4ku/HxyADoP3of9f9xE8IeuXHwUk9bWbHRdv7cMw6hpw4cRRagAFoNIclSSELBoG8wNA6yTii6dRrNfjFVwoEI8otnmIn5PdHp5nHF7oWqCSigV+RNnaAwAcQzdv6hN6oqhTrwnRAekVXCNJUABp+wIr3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178352; c=relaxed/simple;
	bh=crlTt5LU1J49vfYmzoVPDTcSILX4v7GG6DqyuW6vonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUwzjZI1CjAJsWGSpnpnBsqBSKklfDGjeKzR6C0tLfG3kR4nLQRs8xSz9L0fSlT6pJdUFYSpN2KPmuBOmOcpCUO+3nQ7MSYyqTmNgETuAqX9vjy00QeE335gpCk2HAOYG/xz6MnhA7rF6jg1AjC13qFjV5Ip6F3uSeBaWzfAdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SoQnUKU2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SoQnUKU2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso6057728a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178350; x=1744783150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=469FFknBTj9ufpYfSZ5FRLvMehCRuA2KGyvdskryrK8=;
        b=SoQnUKU2a57l6cirxHWg3H1sxIX1mvDuM9//XOKCb8hDcb6murDU7pi/x4SbD1m5I/
         0SjhzxlTHIUfZU6pQOMfylW8dFVqIV84RolUlb8+b2sWkG30SynNSwZru7i3mjhUVrel
         c5Ta1+BopGZ4xcl/8JNv6N4UqdQRh6FLZOZPB84BdrbUZmbpSjSmq126J57+4n4dFkZN
         PdJovHQ1im/KOOCOTOC/bmSv862tVpKEifILKIpDS6b+MBKe2zhej1ToBQ0G6xZ1//uc
         KbtF58bxen6CCm7QTfJdJmocxQtlgkS4JP37PEaV/umZ5RvuGHai8+tkNQpnf4YcJJL3
         Xe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178350; x=1744783150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=469FFknBTj9ufpYfSZ5FRLvMehCRuA2KGyvdskryrK8=;
        b=RC3ynnUemMn20p/brGkSuOdPXIj22JaOaScgBMIrV33kBz3RDCIA/1ucVxUpXLm9SY
         v0CfZDsTu5cXHo5yov/klMiS7GPg6QbAbqXJyQx5SK5V+zocb5MM0aaSy4AYPyGoWKyr
         EzZxW2Uer+SF8bo0xW/Kfps//wlTlRE5/rvtTUqUBFsO3RZV4Kcy3aTVxIClONa+3tv2
         u+e16RiDD1U6oWtuW7dK7fAeEZrQ9mcVOHOzId1lu6yZMY7kVCfYl9tzxzm2fpyk/hA5
         TTYKq3IHEa/jhdKAoMraIBtgbALjT0ee4I1mDU1IHC7v/iO6/JEW8Cgrg2vn+qlmUU1N
         IVKw==
X-Forwarded-Encrypted: i=1; AJvYcCWTjTPvtRzvyIXEv4TQSVWh+rLhIyOOkEfcuiyHOTWJYaQJ5rUHFySpUfXmAIiv/nwSe92SxBKK+Qo7fnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNkxboCLQi7RYFh5cKxP1fMUl7psa/Dv9i0AAbS58eUh2PnLs
	3Ig0+Ek6MTQcy+cO7CZ3/pM1llotu6cuPFRfICRlOoEgWt/cB06cr4MkF7SDBxQbWaXy6SrrpKU
	=
X-Gm-Gg: ASbGncuRU1Mc7iFReisZYavcpsp2vhuQiYzslaqY8Y80sOKIi2nUv8awF4Q5sEIYPPH
	ls3rND9AcTd8f+d3YVzRGVUvJBbILSdabui9CAAf5MCuI8hf+WvqOHw6v0ow0PcN07JlAv1ayaB
	Q+2h8hMIMV5V7BGznTSHJwawMM4lGkpTs7dwvrG372DeVdg8Avl1dsJniteUq8g0eaU6b8BzSYp
	RVXgX0MXu8wgJM8xDr6x/SWqe8ri4k850e9eQNBTCrHC9QCgBHbvOAqUROmgPKHtCYusTvDIwN4
	4wfc1TFDk7ih86RspnoOkBmlPhCn9IWocp5pK7mGFJu3wFQ/NObreNSNbwz1fOpkxzR7gU9vCSF
	3zeKFww==
X-Google-Smtp-Source: AGHT+IGgVQ40tGIrqgt8p23D+8Gt/EeKU6rvZEXcJhU00ZZEv/+dWc3pppXF+JFOK+wLiH6VGvN95Q==
X-Received: by 2002:a17:90b:5744:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-306dbbc26ecmr3028343a91.17.1744178349856;
        Tue, 08 Apr 2025 22:59:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df07caafsm497471a91.11.2025.04.08.22.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 03/21] staging: gpib: Using struct gpib_open_dev_ioctl
Date: Wed,  9 Apr 2025 05:58:45 +0000
Message-ID: <20250409055903.321438-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_open_dev_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 02ead46453a7..a0a9a07dab5d 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1212,7 +1212,7 @@ static int cleanup_open_devices(struct gpib_file_private *file_priv, struct gpib
 
 static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
 {
-	open_dev_ioctl_t open_dev_cmd;
+	struct gpib_open_dev_ioctl open_dev_cmd;
 	int retval;
 	struct gpib_file_private *file_priv = filep->private_data;
 	int i;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 15c924efe5bc..cfd1afb36e4f 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -25,12 +25,12 @@ struct gpib_read_write_ioctl {
 	int handle;
 };
 
-typedef struct {
+struct gpib_open_dev_ioctl {
 	unsigned int handle;
 	unsigned int pad;
 	int sad;
 	unsigned is_board : 1;
-} open_dev_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -124,7 +124,7 @@ enum gpib_ioctl {
 	IBRD = _IOWR(GPIB_CODE, 100, struct gpib_read_write_ioctl),
 	IBWRT = _IOWR(GPIB_CODE, 101, struct gpib_read_write_ioctl),
 	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
-	IBOPENDEV = _IOWR(GPIB_CODE, 3, open_dev_ioctl_t),
+	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, close_dev_ioctl_t),
 	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
 	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
-- 
2.43.0

