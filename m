Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379271DF98B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178355; cv=none; b=ozldFfVQtYeg2mDJcrPd5dDWDtqtn6JCYnc27m/ajOMmkq7mohFM5t5JJLhOcrfc+uVqG9qYXjpZPy4KnzwDydbmoLBCik2AF0wIc5Ahjuldd4YaT0COHr/b1Qn0CZTzJPBqObPXmh8vmEzCJ9B78KDIwTDtfqHpymZBCYgSwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178355; c=relaxed/simple;
	bh=GCAMB7IyTb297JpowGEBrQLbjSUPow2wpDfCSxuGjf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAAOvEqJcXLMKxbw/UWebziCki2ndIQaaNvToggZNcz+DgbIzLltqPY34bMLZUqFDDtmaeUb5/VVxKQbmlBA9J3mL/8Q6Y3GTcD1W5ltG7xEmUIL8aTSRaA8bXcBPUUWt9/HzOGfJV/DkHWzpqg9Mlh/6K5Ahi4udD/o/knZklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=D/7tAaUS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="D/7tAaUS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2241053582dso81683625ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178353; x=1744783153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v/NOtquRdRwOPT8OcPE89pweXS9CADmxhep3BQdI6I=;
        b=D/7tAaUSjNAqp8QxAosHGe1BzYpSucNQjkmXw1Om1b6HYy/luad0MEeMSn0ZkwfC8Z
         NuqVcpPXzSqGrrtoMh9deRhtOTCCZUzadPyS1ttmKls1T5wLbDC5DCRQDzYFGnarjS9B
         LmB0Q0Jb902NL6GxxTM9okJe3Im0HvCZwq6FPski9/8EWGACc7cPlzbFuc9j8Lw2L6ot
         NXOkTRRyUeeHpdreFadEPwLfl/tYip3a+P0x/Xo/NnFuECGhyllSIsLOnMr4zJWVpQrg
         OmmVjlCi6Im8/iFEc9dyOr+53vvQmwrqN84S5mDgW3Hekyuy2yhA2XqWEbYacJxJXdKY
         Vz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178353; x=1744783153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v/NOtquRdRwOPT8OcPE89pweXS9CADmxhep3BQdI6I=;
        b=XZp6SbgDKqOVjg1Z7Sr4I5tfdfJYfaqgaLmHYm0LQZwM6VE8zlezAF7333VzgrBas1
         zZgG3UoIYaWOUfYaCx0Zs8+3jMKrpoMRPuarNyfCkCUznVKRD2dp/79aKu5pPIppAdpD
         m0RPxR2Wj9O3Aa+XWdutJOZ3jBvuQUBsY/K006EdhJhQw5EE0tGhj4qYxQDORUI1xDJV
         zL+fLvmT+UG4OfREy9Vuy8+AU2RNzCFVuQgDgiok1+B+DWkoPjyNciHJ0CzuG78V/OlK
         huTe/O8eT4O42g/VT6AvveokElWZs5ATJFvLIjfdvQwe0Ie6mwzkRFOl6vl9SBINcvjH
         Tp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT5imDza3GeA59xAPRTlfdCgfRStg6wzEGR2WLjakx1PZrMrEFM2qG7fu6CkQPyKL9vXhpZvvnSBmHqLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQtZDZzQfePtnD0hZkpDFUZi1KXdQk0Yy9/g7BnqXH9yHUbM0
	7ziz5CBFOU2zbhGz1QMUWvbSTJOk9XJ7EzJ49uROisP4SwauYoilNer9SPtKLg==
X-Gm-Gg: ASbGncubEuinHo1G8CUYAn+I9Y96VWNd7hv8XxVEH3GaNXGa6MEveiNDOKuVbSnhuJH
	P11/AH8Ga7E5lz2L15ZiokyTpkWo293xbcX9oeDbG7iDv88eIIE8VtAWr097aRFiwMZlMDcaFc/
	rfd6WvAX1GObYMydwK9//C6pcORvh6YDUTWxqKEmnd71z8ddxK798K8tzwzkQoRY/AWuoQCoA0n
	fqHYBp3WR2e5iQVkjGW7Qn/JRJbQQg2VEdAS6gaJAvpWvTDknXD4F2doKclDqejl0tK68nkHZVG
	Q7wKIC/9gKcJXY/3Vz1rcqIJhkCRo7SeVstXHYUOyHTjfK99H0s5d602DgGtM8iP9Ybz2urBWUN
	mlY93wA==
X-Google-Smtp-Source: AGHT+IGyQSwzezThuhQv4lKEAvpv0AlE+n8nH1TjmcTKbI2mn0DR+loA/oAzlkmtKflBXNhFmW9+Fw==
X-Received: by 2002:a17:903:2292:b0:215:7421:262 with SMTP id d9443c01a7336-22ac3f6e7e9mr18111295ad.12.1744178353406;
        Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8af2dsm3477515ad.69.2025.04.08.22.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 06/21] staging: gpib: Using struct gpib_eos_ioctl
Date: Wed,  9 Apr 2025 05:58:48 +0000
Message-ID: <20250409055903.321438-7-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_eos_ioctl' to remove typedef.

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
index 9f7becb09e60..bbf8a60978d1 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1508,7 +1508,7 @@ static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_pr
 
 static int eos_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	eos_ioctl_t eos_cmd;
+	struct gpib_eos_ioctl eos_cmd;
 	int retval;
 
 	retval = copy_from_user(&eos_cmd, (void __user *)arg, sizeof(eos_cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 9be3262271c5..3f32eceaca93 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -42,10 +42,10 @@ struct gpib_serial_poll_ioctl {
 	uint8_t status_byte;
 };
 
-typedef struct {
+struct gpib_eos_ioctl {
 	int eos;
 	int eos_flags;
-} eos_ioctl_t;
+};
 
 typedef struct {
 	int handle;
@@ -138,7 +138,7 @@ enum gpib_ioctl {
 	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
-	IBEOS = _IOW(GPIB_CODE, 19, eos_ioctl_t),
+	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
-- 
2.43.0

