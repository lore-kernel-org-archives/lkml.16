Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D62609DB;
	Fri,  9 May 2025 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822891; cv=none; b=JlRoZ35jFkFRG043vkVErtzjbtfXjCGAWIF7jiqkAuzGCsr70rG5ZUwa/fKpk9OVZwDmOnAiHGzv0+Jt5k8gMFaGjZ6pjxWVzT3xuFd6mtzFGYwyal5gTBXnGkyOe8sfYh2WJEqaRX54YXq3BED3XzwvOsm1/7+kufB858aW6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822891; c=relaxed/simple;
	bh=dIVFzbgX2H5u7vdg1ihytOKDMoXWZKWEyGDHqrH6o90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n27kJ0UwlYDcdLMtj3Be95AdRGJYlu+YwPe5f+eE1QSTF3lqTEzadnIX4ynVGJkH7uqrEjQ4CyJpzE4Jm/cfBDx9030ekItlWX1nSMH6m9t0U/dxv/D1/OyiYV430Tt9m5Rb3qomadSPzclcMTpfbyIUxe8xnP/DwS+6O2FJtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifCsuh4C; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifCsuh4C"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad221e3e5a2so152303666b.1;
        Fri, 09 May 2025 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822888; x=1747427688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8ATbPKvedG0du7nkeOvCtVQy3Ks46Id+Cr/SltFthQ=;
        b=ifCsuh4COEk1M4Stopl2cUO2I+SW5jKRkvnomWV4B7AtxCrtZpMML0OEU4Bx3yJh03
         JY5wI1Fg/H5hlQb6zicIihVZgrLxoQMyUVT9xLf2f5p3j7xlSvlE5XahDWm+pk+atxhV
         vVqxKog7Z6iAvZfTXhRqEKScjoAmCSeucDQdosOZhtG38N9AmLQoWrHelA3IHsJlOEtI
         bwpSiRoKalaXTbH4ZljTmw7gxL/vfsvKU6TEHmgbWxlb3lXX+i2SLGLsYZHmDVOdcpv7
         shmIVcg7bdJyrwHySYVYH1TQU/T0UQtFONblU8OLWNNGoLlxoMOM1vR6OLqfnmece1Pg
         S79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822888; x=1747427688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8ATbPKvedG0du7nkeOvCtVQy3Ks46Id+Cr/SltFthQ=;
        b=bcZG17zwETfRoguZihEYKRvEtPNINzkNK3uawLejoekMCriNi1eTgznGnjVmnSxF7R
         hSaqS6yce5E1wcp9xZaEpfNW03FjHuAE+6calbOme3j0Mcja1vI+Yd+/5No5g/dWJBw+
         SeYnRWtbVAh4FvIZGyfv8qOj9P1/2xoENj/zR2jMhJvsGEUNZALW5KFKJnELbp0hsQW8
         VAhp2uPUibjVAC6z3RJQzpfJxCnFas1anBqzTqhSAhZqWJeK+CC3fOFHjFujhcsCo8p6
         UNJezYtkhchP5vbvh8HxnwOnfumJwPjCdxj24mjgl2P0vL3f3q+1xUNuhC1JgApdB7w8
         0OBg==
X-Forwarded-Encrypted: i=1; AJvYcCVjJjURVrhwSABbbZJ15GOovyVJh6Qb9FC7as02J8ugTufAaMov75oSH9GKpG4kOK7M6Qvtz+znd8lFzHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+OwgASuwfTsY7sOH5MyJFstiZ7JOf52YzCdqUpvmdMsnFd+7
	qC7SXFQqZ2Va0KFBmVZyFU2RzKIr4/kc6e26Q07K3dzmFig7zQw=
X-Gm-Gg: ASbGncv/+f8dX6beS3zBwcFOCDxc7/iqS0P9/ofkNwhcJpVwkPC0an/t/+VOyP6psWO
	rWjIoZhQW6AbdgNhtmynJPYs+gndU8//PS8fh5znUeVYtc4DG6/I4GhCd5yB4+rnqfEmKARwmgp
	km3/2TKLhK0jWkmZeiDDZQHhBjkPdF3lphjjErObbcyNtWEroOzccFxB/Obz2AzgqUCbXT8W4vi
	WD+465DCIuQXqNM5khwzwobNkAndZ9mhwMw00/i5I/bc1d+6eWdWvihjrqI+2q5wFWonYR/PxDw
	pOF6Yj4kSliGFDC0STplI3p3OtKZSxhxBvR8ZmjRx5bkVPpBrwhlGxI9Wcy+
X-Google-Smtp-Source: AGHT+IFKbDxcHsVUqh8XktR9V5/nZEWyoVf1RvAYENE7LFOz0UBa8kT9bZBdoS5lQr56NpYrTq+9/Q==
X-Received: by 2002:a17:907:97d2:b0:ad1:77aa:503 with SMTP id a640c23a62f3a-ad219124207mr497551366b.36.1746822888088;
        Fri, 09 May 2025 13:34:48 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:47 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 9/9] CodingStyle: flip the rule about curlies
Date: Fri,  9 May 2025 23:34:30 +0300
Message-ID: <20250509203430.3448-9-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require set of curlies {} in all if/else branches and all loops
not matter how simple.

The rationale is that maintaining curlies increases churn and make
patches bigger when those if/else branches grow and shrink so it is
easier to always add them.

There are more important things in life than herding curlies.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 57 +++++++++++++++-----------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 494ab3201112..dc18ff40ebf2 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -280,43 +280,50 @@ supply of new-lines on your screen is not a renewable resource (think
 25-line terminal screens here), you have more empty lines to put
 comments on.
 
-Do not unnecessarily use braces where a single statement will do.
+All ``if``, ``for``, ``do``-``while``, ``switch`` and ``while`` statements
+use braces even when C grammar allows to omit them:
 
 .. code-block:: c
 
-	if (condition)
-		action();
-
-and
-
-.. code-block:: c
-
-	if (condition)
-		do_this();
-	else
-		do_that();
-
-This does not apply if only one branch of a conditional statement is a single
-statement; in the latter case use braces in both branches:
+	if (cond) {
+		t();
+	}
 
-.. code-block:: c
+	if (cond) {
+		t();
+	} else {
+		f();
+	}
 
-	if (condition) {
-		do_this();
-		do_that();
+	if (cond1) {
+		t1();
+	} else if (cond2) {
+		t2();
 	} else {
-		otherwise();
+		f();
 	}
 
-Also, use braces when a loop contains more than a single simple statement:
+	for (int i = 0; i < N; i += 1) {
+		f(i);
+	}
 
-.. code-block:: c
+	do {
+		g();
+	} while (0);
 
-	while (condition) {
-		if (test)
-			do_something();
+	switch (x) {
+	case X1:
+		f();
 	}
 
+	while (1) {
+		f();
+	}
+
+In the future, code will be added and deleted but braces stay untouched.
+Maitaining them when if branches, loop bodies grow and shrink is useless
+busywork not even worthy of discussion.
+
 Spaces
 ******
 
-- 
2.49.0

