Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F63FB1B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750797681; cv=none; b=cZ7JufWrH3pYN862J3CFlPzfHveqnP02w66RtFbHIDb8cfjaq4yf3dksgCO/GUAV1iswY0K8ZRxm3waBgIyOksHBQd1TLbY1MIWCy3xCzYaadYelvZEfj/sCcZn4BUT9dGUifRysBxAzYnWuL37RjFp8S9G3I5nt2cLUnvVl2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750797681; c=relaxed/simple;
	bh=k+9iPVrz6CfZoG58QyvK5uEAxAws5zdb8ym5cHLYUH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqTxV/zWMaVcvoqsLspvcSvD/SoPVV5VrzamjpvSltW+AmMTvMIElSazd1urFxxlNkmiI2vr4+EyROPKk5zzOb0+HDPT4uEu1k6uP15Xt5sXeTDR2bRHHj5hE1lM8Z1s+n4xUvCyfaKOoes1sxUvECni2FVA3Yx54S1Q8LbAMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QD7PKNOi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QD7PKNOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750797678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9wY3aAgcrJnnreOkNCbnB1YfCEDsO/C9hUi3tU5Px0g=;
	b=QD7PKNOigGecKCA03C+/7N3hNHWOfCw3ouCafSN6bSOCOszcKjM63OjqkktjRv0JUUPqPM
	h+rETI6QmOxiUCsKUMbqxX3h1IAtV6LFxv8M4dmLnava2n++x/3ZRB4EzeHduvqDaXsRJ1
	nmooYREzVoxMX4wRy1R1BVa7JMCJzBI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-y385Yh-RNBCOLx2YrF8NNg-1; Tue, 24 Jun 2025 16:41:17 -0400
X-MC-Unique: y385Yh-RNBCOLx2YrF8NNg-1
X-Mimecast-MFC-AGG-ID: y385Yh-RNBCOLx2YrF8NNg_1750797677
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5720eb48so4228456d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750797677; x=1751402477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wY3aAgcrJnnreOkNCbnB1YfCEDsO/C9hUi3tU5Px0g=;
        b=cP6PNdDxq7hX8rSDcCcwv00/ZNKfFVnjGzGh94cAGANMNztwjbPh6Ic+/Ptl5SBWEo
         RJUqWBMjdIN5WnOvkIQS1B29Tm6lydPKiuvdm+J4mc+XUclkYJu/KS4bHE9d/76nh3v9
         FuFyYZsMtuLIrqaFfUYSdZsX5h0IosC01oDdV3jGnIZR//wZOif5VJnnWR16MSmU9yZ2
         ct0leTzb6l93yDH0pU95hdD87gyenWAAF9puSAFkWWYGSzAixdZqa153r3WZ++NDvvla
         toVY0uKpgn5pV7mZTGdu6ykesMc6Z7P5qxXQhEvq+JNG+lsxoa9xENY9gr0Rs205+fZx
         zvsA==
X-Forwarded-Encrypted: i=1; AJvYcCV0isVaH2vJVHc2kYdWfiy1K2h8YHPkqVsbm8DE3squD/MWSlfpCygH2r1ViO6FxJh+6RI58tKu7prkxYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ev1iu02sZDkLITl4QLabUVT+oHBb74i9n7AsKXndlePn/17k
	UgvfZ4N+oq0IJW42V3Pi9vNT3Wk86ltr7YTMN3pRx8L4gXb8RSFFNZtTYQQ43eF+eZiNQeZC0hf
	MU4eA/qzkYaTE17g+UwA1lFcqVGxT6NIkkxjHJJnXG1ThpLup73CFAlze5XH/WWhM1A==
X-Gm-Gg: ASbGncsOZWLzD8Pbgfcwv0Q8LH5s15qDKqz3FOlMI8ZqhZw1DQVjkAr4esjweba8Hct
	7K6F0/zxF3Kzwtdmhi8R8wIGc+5PW1voffqitflcANfkHwoRKLvyYvfurVdCnB+kA4TuTQWz+e5
	U73ug5XOB3ouXh1qYmfRY2oUWWpgpbrmgJJPJDvoV5fQaYzxB2L7uZM0yOnz6z7XNKlQImCKvvr
	7xJtSIcNkSWLzsYMQRUTm35VIEhDEBQotzwSRJGx6gqmN6x2N0y2gV7gA5G+Ekqs8N3xCeRtJ0V
	XL4TDXNbYlXmtK74hQ1FdLu2+lCNUYT6bw==
X-Received: by 2002:a05:6214:554a:b0:6fb:6129:d6f5 with SMTP id 6a1803df08f44-6fd3887da67mr72486296d6.16.1750797676770;
        Tue, 24 Jun 2025 13:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5S9LIIzK9+mA9lXLYWbYKd/trucZBeWJrars1+wS2MF8l6jyFMgEhWMuXKpGrcN17UGrc7Q==
X-Received: by 2002:a05:6214:554a:b0:6fb:6129:d6f5 with SMTP id 6a1803df08f44-6fd3887da67mr72485996d6.16.1750797676378;
        Tue, 24 Jun 2025 13:41:16 -0700 (PDT)
Received: from thinkpad2024.redhat.com ([71.217.37.158])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0957f69bsm60875306d6.96.2025.06.24.13.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:41:15 -0700 (PDT)
From: "John B. Wyatt IV" <jwyatt@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Renninger <trenn@suse.com>
Cc: "John B. Wyatt IV" <jwyatt@redhat.com>,
	linux-pm@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	John Kacur <jkacur@redhat.com>,
	"John B. Wyatt IV" <sageofredondo@gmail.com>,
	"Thorsten Leemhuis" <linux@leemhuis.info>
Subject: [PATCH] cpupower: Improve Python binding's Makefile
Date: Tue, 24 Jun 2025 16:41:04 -0400
Message-ID: <20250624204105.457971-1-jwyatt@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a few build variables to make it easier for distributions to
package the bindings. Allow current variables to be overwritten by
environment variables that are passed to make.

CCing Thorsten Leemhuis <linux@leemhuis.info>.

Signed-off-by: John B. Wyatt IV <jwyatt@redhat.com>
Signed-off-by: John B. Wyatt IV <sageofredondo@gmail.com>
---
 tools/power/cpupower/bindings/python/Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/power/cpupower/bindings/python/Makefile b/tools/power/cpupower/bindings/python/Makefile
index 81db39a03efb..4527cd732b42 100644
--- a/tools/power/cpupower/bindings/python/Makefile
+++ b/tools/power/cpupower/bindings/python/Makefile
@@ -4,20 +4,22 @@
 # This Makefile expects you have already run `make install-lib` in the lib
 # directory for the bindings to be created.
 
-CC := gcc
+CC ?= gcc
+# CFLAGS ?=
+LDFLAGS ?= -lcpupower
 HAVE_SWIG := $(shell if which swig >/dev/null 2>&1; then echo 1; else echo 0; fi)
 HAVE_PYCONFIG := $(shell if which python-config >/dev/null 2>&1; then echo 1; else echo 0; fi)
 
-PY_INCLUDE = $(firstword $(shell python-config --includes))
-INSTALL_DIR = $(shell python3 -c "import site; print(site.getsitepackages()[0])")
+PY_INCLUDE ?= $(firstword $(shell python-config --includes))
+INSTALL_DIR ?= $(shell python3 -c "import site; print(site.getsitepackages()[0])")
 
 all: _raw_pylibcpupower.so
 
 _raw_pylibcpupower.so: raw_pylibcpupower_wrap.o
-	$(CC) -shared -lcpupower raw_pylibcpupower_wrap.o -o _raw_pylibcpupower.so
+	$(CC) -shared $(LDFLAGS) raw_pylibcpupower_wrap.o -o _raw_pylibcpupower.so
 
 raw_pylibcpupower_wrap.o: raw_pylibcpupower_wrap.c
-	$(CC) -fPIC -c raw_pylibcpupower_wrap.c $(PY_INCLUDE)
+	$(CC) $(CFLAGS) $(PY_INCLUDE) -fPIC -c raw_pylibcpupower_wrap.c
 
 raw_pylibcpupower_wrap.c: raw_pylibcpupower.swg
 ifeq ($(HAVE_SWIG),0)
-- 
2.49.0

