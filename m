Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30811212B05
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807616; cv=none; b=gO+ktzvgmTQUQJoamYCpE/O/iZ4JF5PFiT/eM2A/qC1IwKUl0o/bKOeEyQy/z6udFiQkDjpHEOUFMfadhWe0IfzwMJHSsAdMrjAJQWSjMe7aXVIqDFu7VJcNMwcOIcU9hB2t8Kwl1pdY1pLaADyZcZK7La9kOHg5CFEEl/0wamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807616; c=relaxed/simple;
	bh=bZMJIKA/Q8Y8cbpxTVSrNE3ays5xUUBzuHzZIUbk3gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M9hi81FbMbmg4SFyveNoWoy8twXdRcz6lvb4VfzAA52P0bCmhL9uX4SWhJZzg+G05btFVZsfmsdK18kMEemt+GJ6XTAUKG+yYyDbc28NgbfC7WWDW2pDJ+I+8Pv6iYD16dGHE88+6CbBGIEicZa/4wT4r2dsqpm+kzZgCmkpi9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry5kwAiz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry5kwAiz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7411f65811cso1885120b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746807613; x=1747412413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WuTzL+215B1tHHIPx1bndSHtxQPnuNkFwtYhq6VJISA=;
        b=Ry5kwAizcVWMS8VhcyN3Y9f757HO9EyDPZNml1RLEziUayxLGsA81Umbqpqt1gvyLn
         9+BQR2Cduq//nFgcfcVgiqK3hzo+ihGkvDciCGN2hpP28JbjLi1HHhYYjMX6ylRqmGTF
         JH+34VHUI8ln4cZ79IKc1aZc9v8YkTIB4lorOw21tKlJxEqOad9x6OtEyd+4uzd+jlHj
         cDlGtCTLU3yKbpz9MluZSaIe3XCLExISCt0eQkHmw1f8HgSHn1v3JQ1EQFFnDiEvvpa5
         j4RH7nrQi7vY/77hgtc2JQnVqGhItXfl2q83aVPGWfjP/ncrIByB3JIEGpmvJDU36avS
         oYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807613; x=1747412413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuTzL+215B1tHHIPx1bndSHtxQPnuNkFwtYhq6VJISA=;
        b=b3Ice+F1IZQ6EkIvVis1ohP1hn8b2n9krApgZkUKE93reNupYif0EuFPQMU/+1jn3N
         26KzkP/fq30motMBN9ziZbhS1v4cbn02QxX80xHrjxEXj57vegBua2KZ+MPxOADjiSBE
         OHg8gOXm0w7a8oGX48QV94Ur7JjqWsDOz+uqklL71C3OjzfxzI+Dp9igLJFza18oNGXN
         89RxoIwJNuqhmE4P1lJ3wEQRsZ1aPNBX0yRxqnTw68n0pESJUB0vWGddYCYm0VVsWq+e
         jXF3kL8QGxp2Xcy9hDZ009dr20kwXHdZAoPezxwZR+Jr8OHm8GaqL91wtp3r87Tcq3vS
         HagA==
X-Gm-Message-State: AOJu0YwYcw546xmwncQdFqZzu2cgRmJByY8QBlUgnXg3/itkb5xdKOsL
	xzn4XbKjTbmAPTBWNmazTAzyMI6shW8zBxUWQAKhD+iUiySr8m5lGdrwVznz
X-Gm-Gg: ASbGncsCz+2SJarzSEf9RxOPl1NxShx2SP45rdB/lupAxwquyc6gp9raJ5Wk6F+TCez
	SHQtWzvsexqqISmAdM5tg81ieyLnVT5AePedFZc7diTWdPWHssDtj0H3qxZZ+VJgnTGPCBv9EgY
	UhB8NC+WXG/+N7iy5Bkvw3XfVGJBLETVSgFTjci37EvVDeFn03OJldZbIeV90Wc8BM4Hj94S/tq
	Hcan34W6dKrn/SrpwfLG25V2NYkNSM5mlyEB1ktCbY0URpIhONxJ0RYCCGVGc6Gq8Im3+Dz1mF+
	Q6V1jRQy8atYYbKlMu5R0xcWbiD+bFWLlzXMyBb3
X-Google-Smtp-Source: AGHT+IEWql3Ddh8TsXl6V5lYGyLHAnbo6wvzYweE8Rryrnp6fcNK3nZHHZVIhuXflve8pTkTagY7vQ==
X-Received: by 2002:a05:6a00:1915:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-7423bf9bbe0mr5265358b3a.12.1746807613286;
        Fri, 09 May 2025 09:20:13 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8f45csm1958760b3a.178.2025.05.09.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:20:12 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Andrea Righi <arighi@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH] topology: make for_each_node_with_cpus() O(N)
Date: Fri,  9 May 2025 12:20:08 -0400
Message-ID: <20250509162009.540506-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

for_each_node_with_cpus() calls nr_cpus_node() at every iteration, which
makes it O(N^2). Kernel tracks such nodes with N_CPU record in node_states
array. Switching to it makes for_each_node_with_cpus() O(N).

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 1 +
 include/linux/topology.h | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index f0ac0633366b..1e2bdda1a0a5 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -541,6 +541,7 @@ static __always_inline int node_random(const nodemask_t *maskp)
 
 #define for_each_node(node)	   for_each_node_state(node, N_POSSIBLE)
 #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
+#define for_each_node_with_cpus(node)	for_each_node_state(node, N_CPU)
 
 /*
  * For nodemask scratch area.
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 24e715f0f6d2..ffee6b4a071a 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -29,6 +29,7 @@
 
 #include <linux/arch_topology.h>
 #include <linux/cpumask.h>
+#include <linux/nodemask.h>
 #include <linux/bitops.h>
 #include <linux/mmzone.h>
 #include <linux/smp.h>
@@ -39,10 +40,6 @@
 #define nr_cpus_node(node) cpumask_weight(cpumask_of_node(node))
 #endif
 
-#define for_each_node_with_cpus(node)			\
-	for_each_online_node(node)			\
-		if (nr_cpus_node(node))
-
 int arch_update_cpu_topology(void);
 
 /* Conform to ACPI 2.0 SLIT distance definitions */
-- 
2.43.0

