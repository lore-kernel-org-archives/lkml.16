Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC11246BC5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460534; cv=none; b=gFIWNs4RbJFbdzk2ZmepgaUtYE+FGB0IpGn7wakHSESVWoEHuFsXnQCOKAkY1+Ju+GypS7tIknutv60Ux+U+EP8me27BbTlRO5EXvnkjmr68FMXV0UVp/Y8S5oOZUAE059bsEM8BclpAr5q0u4nzZLrrZh4Bs2noMxj8EY6HNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460534; c=relaxed/simple;
	bh=XnkfGep55I541ApHJD2QZdhM5aWbZnlK1BM5kBi3CyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n84RXTJ+/quXEcgc3TbrelvcYiIiEljbu4Aw5ZG4/ihm6aTexBHs8g8lFoDWHwmVHY2LRG3nL6lcJ/Z2tFawc+YtfKOTtd3FB7uxIYq6AJJizYpGAvtyC4MLITZsXtpXEFEAlvJakxESRUtNCwvwJP0tv/5tfAMx0W4X3bcpvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0eW5L0/; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0eW5L0/"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d09a17d2f7so206233685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460532; x=1751065332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QuG91aj9FVspnq30Ro0SdZ3sAijtIfNiwe75Boh82w=;
        b=O0eW5L0/1NgWgJ7MfnjvPxaxFIo80HbzeMeuehLA2Zq3M8Ow9Xhgw/Jnq+pG7OMV7p
         1RxMY5BxQKi3pnCjIZDMffGXb9Rr2cDyiIK/hqtG6FZ4+N+cUi/A4+A8qqg+URtMFkHr
         A0xUAMVJVbOwQsJ1ai3x49v2TKzg6n7p5P+M915b6dDqI1MXGm6kaH4Ghgf2xPosT1IH
         eaC1rpeM8RVUP0V9gGTa3/16D2bntw2ezZvaV4ON4ZgdO+1o7S5zhawfWu0PdSvugw1c
         IUrX4RtrMvFTdgJLQ3VaLP7aCi1bZY7yJ+j1a7bspbUDPL+AW+SPkbXW7mIrj7bkHe3a
         RPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460532; x=1751065332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QuG91aj9FVspnq30Ro0SdZ3sAijtIfNiwe75Boh82w=;
        b=IsByEaltvNjTRuNLwpc4VEp3zwV4/dlfBiw3BpJG8VoAdelj6cwxrXeOr62ggbTGEi
         GEy3+t4CubYm1eSrJg0vC4dib3I2MEtMgnQxjS/hZ3LQr4KOxjRikyjU3dbxlxGW/7yU
         unqDZxnqcADBFxhIrYIRwvdRPbaCgccLpmp0BC7xFYqMyi4qQw5Z5wJjLzXJo0WGGtXV
         xsfVGACut6HWxfgF1rcOwKmg3/a+RZrPQnIcz+N5kkIzZU5nwA49tll9YkANdL9h4XNP
         xVO/5P6wOfU8jCzK7aj4xqJlUl4xi7dXWcZWwmUzLeoO1JpoN2cSTIPu+3o+H+xaMcfh
         Q4cA==
X-Forwarded-Encrypted: i=1; AJvYcCX5A3/62nk0/GUuaVAHu9D+oZV71JrFbf/2Xgtp92EBvyVqUVTpnu9BJ2I2ErvksGtOAgwa/F/9nCewzGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVW6bM7sYw93GRRcrkeGYhax+w3WP3/0I0iOINBydDR36oJt+H
	WzFYczhtfH0N8OyMZBghhrSy1Zqp/pmJz+kxvJ/lrk6b6TrM02mI4HWJItWIH9jf
X-Gm-Gg: ASbGncvEdWGMw04msX5CvJmOK54fZUtk3hN2NnsYv5ROMYdaoMv6yRqJ0EgegfHWuJA
	Snnznww/S3Yf90K6TiaoEHt6mRL4eZk+FuEV3LibjZI2oJvbXpoZU8VhNIzN7TMehTBttmldfut
	94epltJToU5R5bzYZzX7usr3Ccg+qqLZmaDWd79KAaNfFPVjhmJVXE+ClvHKJ8A2U7FBdZr/DN4
	Lb0adbUed42oqhPN/msytKgcGssuSMtCzzJ7bU39mxAzqxSXS2N2auTQWP8Z6c6prQouGd6fdU3
	rT3z44rueQCi+pHqzpNfEJKBI1JWtxxIvTLkR0VPo6oAozKcJe1Zz2xlrfslF6szEOBa4vtRNnD
	DSA==
X-Google-Smtp-Source: AGHT+IGNj3h+Rpu5SikVNW6ff7BWM+PCiJO4+wXZXfuc9+jR2gtExRzEx3jNWUJZg4Y3tr/pE5qFMw==
X-Received: by 2002:a05:6902:2388:b0:e84:2a27:f30f with SMTP id 3f1490d57ef6-e842bb4bab9mr5748413276.0.1750460521069;
        Fri, 20 Jun 2025 16:02:01 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:00 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] Eliminate the full path to the script in usage output
Date: Sat, 21 Jun 2025 04:08:52 +0530
Message-ID: <88fe1267b23608c27ba4e6dbe69c12a49dab4290.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <cover.1750459100.git.unixbhaskar@gmail.com>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean to the usage outputted text without full path of the script

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/filter_kernel_deref_check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/filter_kernel_deref_check.sh b/smatch_scripts/filter_kernel_deref_check.sh
index c70d7994ead9..88071a464c45 100755
--- a/smatch_scripts/filter_kernel_deref_check.sh
+++ b/smatch_scripts/filter_kernel_deref_check.sh
@@ -2,7 +2,7 @@

 file=$1
 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages>"
+	echo "Usage:  $(basename $0) <file with smatch messages>"
     exit 1
 fi

--
2.46.3

