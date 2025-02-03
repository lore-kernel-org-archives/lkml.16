Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D49209F22;
	Mon,  3 Feb 2025 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612442; cv=none; b=j5veq8jml3hwnAaR1gngQJBg9eXVJv2pGTUPxiurfX/LR3W+Kd/uE/Ziu0eRgUrC7M54Hzm6B5H2rjPwaOGIN1qv+154WKe+1RRUTcdIg/+KW4tnhTrvRTnFE8iVcaB0H7opbxm6QT8APYVMYnJzWPuv7WWQQu8IbcteqY2qz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612442; c=relaxed/simple;
	bh=yKG+Kh3LCX2coRRjlATN9kLMjakFXxnDXk9LJECQwHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cSxrGf6hQNtXo8x/lYcf0YHoqOYi4cS0niDL3hiPQlQsIT5q8HfVhLbvDuG5ivc6MhmKad0N+ktt0caV6Lfb4i+g7Chjf4I4mBgmxErQRvHssukd1y+I1gQ5MEPx4TfUZ9MItSxRI77NVgmHDESRgVK0TkiBy8nMSQVOfBWwwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THpxcgwx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THpxcgwx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166360285dso79585445ad.1;
        Mon, 03 Feb 2025 11:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738612440; x=1739217240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCkewTQJuhYEa+h+muT5dYEg0dFSuvRXFKJuYGApdac=;
        b=THpxcgwxFYUNqPfrVjcX9z3hRiyMryUo6kvNHRfL42F9EfweTqpYCwCeUGx46aYC3G
         5V3WuPOU3vomuo1FONlQH4KQ+uu9k7XNm6AxI2b9stqOOkuoMnlQJpPtILK8Gi1JD9A9
         7wqo4nb+sG42mx1jtzBNaIyxweSELkGHzM2ujs9YU27Go2KzQz9kgL43BY/d/URV85qh
         slPPnfZtwwN2hw3NcdkotgIeR9xh/WNYkdGUakR3F2bspbVMtpPGfurjkbTaKegXo7wa
         8QgpHicyAW8pgwA4HYWjg9gN0tAt/DkTbJ4ddFbfhvN5kaRyCsMXsZ8mMPnTMhivxXKr
         M+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612440; x=1739217240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCkewTQJuhYEa+h+muT5dYEg0dFSuvRXFKJuYGApdac=;
        b=HpNTmRSefCOFvfZGaademZWoZJ7adi8JZStCHhIl3EU2nShEhU1laLn1nY/7v+B/iP
         ogmB4KyjYrRMPXqxgnZlqDhs6vHBsFWV9Uhkzwww/dVu+ksXPDul3+nm5G+q3tb+V7cg
         ta1t9L561v6kZnVZgO/FMPEY8HNnt9AIncIQdSgzSw4tC9p8PIv+4BvbabtTT8J2QgAb
         oPYC96bC+omsUYMj/6RE9NBwIALhIeiifGLIxSrg5bZf3xbEehqlvREKrk43+X0aosHM
         KAFEzOlIvmkMQufyyhN1X63kvZwtIHPQdlME6RpYh+Q2uAoA1mB4PtYNvxwOP2XtPZ0v
         z85w==
X-Forwarded-Encrypted: i=1; AJvYcCXNEnsNMtZJmCUoKbNbxmr9eaUpydBr4WKccGLzHs8WO0P0Ty/TdWMwhtLtiM4eg6XryvEsCZQ5ZSs=@vger.kernel.org, AJvYcCXcpxdLmIyfVjadxNfHtgm1a/saDF8gdaGfI4a+As6p6Bn3mIqsQ+WoY858ep1VvZiU6CAH84iBifyeh2ZE@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1yMWHu/BMVb1cSDUSa48K8up7lAJaueik/NBAY6flxH9g35D
	C9YCA4zyovbNPrPJcP6AFMXN0K9csIIW1wY/qfwiIol1obcundHHlFZZ9/D2
X-Gm-Gg: ASbGncvTmMZ9PC46wdgvJyWGngrwl13kwadeQYpjWzMh+zWhWYY6FROBqcVbwe93cPI
	rBKuVX7NkTzNKQAwd9ufKd4Is3Lp2Prq4QMwD9qX9fv5jbyq1O/4oRHYrhdGCoY/OdWO4HvhkJh
	9veo5QoQTcuyeBfa3GDmrAm5jGR4axehpfelwM9VqAn2mVp5kDIFzxz4VqIzgjSkeEK1y3Qf+ad
	53NUyq78dF+vUaFoN0yYkb8dYpsWW9XSEOus64Yuj/4YVZMGcT261q6yVFL7zAu77vhCJieaZ05
	o3AEYdW//8Y6yVnTPL/xHXSgtWTbWHCV1ED6ZBo/4j6QXhrcwQ==
X-Google-Smtp-Source: AGHT+IFK24UTFfmtAUwDpn0FQ5GaqQ+EilfytYLLGPQwTz5+a4zDHViyNRRWyC/JNFcaQC2/TMVkQg==
X-Received: by 2002:a17:903:1110:b0:20d:cb6:11e with SMTP id d9443c01a7336-21dd7d73be6mr352942635ad.26.1738612440138;
        Mon, 03 Feb 2025 11:54:00 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:1019:6a4a:bc66:3bc5:4445:21a2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe94b189sm8515004a12.43.2025.02.03.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:53:59 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] docs: Move "debugging" section to the top in index.rst  
Date: Tue,  4 Feb 2025 01:23:23 +0530
Message-Id: <20250203195323.13012-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the "debugging" entry to the top in Documentation/trace/index.rst.
Turn index.rst into a good starting point for people wanting to learn 
about tracing. Make it the first document users see, as it serves as a
tracing tutorial

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 Documentation/trace/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 2c991dc96ace..f3d235c8438b 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -5,6 +5,7 @@ Linux Tracing Technologies
 .. toctree::
    :maxdepth: 2
 
+   debugging
    ftrace-design
    tracepoint-analysis
    ftrace
@@ -24,7 +25,6 @@ Linux Tracing Technologies
    histogram
    histogram-design
    boottime-trace
-   debugging
    hwlat_detector
    osnoise-tracer
    timerlat-tracer
-- 
2.34.1

