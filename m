Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697B23817A;
	Fri,  9 May 2025 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822886; cv=none; b=kIg6sHQyUCtMkYcx7cFvvXh7qT+vJpaioZqtCaXsYXCStqxzvYykKD4thRCsPJsQdabJf6Qnkacg3bwusC/t5aPH1nIWdCZrMaFz+I8Cp3rGcRYA3KSE1L2mvTFZ5VQ7B74L7VDu8hEJ9YXwQBiUsSzhM+EnqmcLa71Qh8tOilM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822886; c=relaxed/simple;
	bh=CgME9rjzVmsEJxTzZ/XT40bXQNtIlAKK39UW2wklCFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MkXHUGba9r9HIlatHMeDIzkXy/awELfTbBTfQolZ7qgv6qwUHjLVXexz7pqRsx8snonI3ucMtu1kp8nTsQfz23iRpufqJ7Do7aP5DVpCOS1s7gx5bpli5WFmYDsfQmlC3aTDVorBPSBzN6KzcRjOAMz1kfInNtsBLV4tWgMTr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow+J6for; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow+J6for"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fcc96b6a64so388555a12.0;
        Fri, 09 May 2025 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822882; x=1747427682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfyRC2VzYaZC2GUkqUlQF7Ku+gg/z0lMo7eLUj4gBy4=;
        b=Ow+J6forQ0TBRsZjULgKNs5ZvdF5ZKgCZjS2/pK9YpSQZ7TgTdim34+GRflIwNaDgA
         vjpqZLX40Yh7NsV5s5AJqyIiFG2FM7wNM1Ow74wSr+0mXLEk9cq8ekxyQRIj2I28qCBG
         3MzxnWc8VIr5ZJxVaH2k4M/k/pfYVDQb1oFrbbdWZvc5x6tA/5QGgvK1AfCyqV5aGdFZ
         opnEneTl+SkT3OIFz8t11yRWFAb6Nw+0rfJ9O/RDfHm0p1ppyct8AIaHcZ3/Gv+oPopR
         OGdNqGRIwKh8yeh8rcPokBfZrOGO/KJ7vaHbVf1WhtzA4HIouMmKUqzSv2KXPkApeKDz
         M1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822882; x=1747427682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfyRC2VzYaZC2GUkqUlQF7Ku+gg/z0lMo7eLUj4gBy4=;
        b=wxUxG7F/HRpmmRLzg++2Q21tAZPErZ0dNZichHNGxQNfWV6FxTrh/nG1xQhgXZP+/O
         PVf3jckh8yGFaDSeEBy/4H7P1VPZwN0O8iTBUcHMIb4Mt98uhbTko/710qkCYyaFrbwu
         VxkrCG0ky7y0eYg8kkyuSP+8BrBifqT3GPExGxj6v+5OFrD55gGIEri6U7fdWNR0Hmsg
         myJhYeSRYzNPTWevSl8qOisuQaPMd9YhvzoIm03BTmhJwLjOV/WGZRslwgaY/asNHVZw
         2m43sB2JqpWfMYnBDsBOU2b4tt/5EDNq92fNZvgvd4dPZKNTJxRQp+rHiOpCO2hA+uaR
         ojAg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLez952pw+ObVr8EZ9a1OPT7nsk9lJOxwwKqUddgTFEYR9P90jlokY7B22zdmwsTnQk8QwjIGq0J3AV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIm9ayWJRDMr/rtTDC4bzWixOfTVf7F7fv2gNF+qdJw0dHbw8N
	a4g2s1c9xJ5x3SnIAkXXJeflohO+5+6J1x03vQSzlo6SXsrezGQM1PlO
X-Gm-Gg: ASbGncul334NN3ZOgfwshTGU0Y4u+Fochc3S5CmpGyldBdnruIBjMzM1RvhOs8OnupO
	xQUjrAax0KN8fgfniEjCV9BVv2OijSOSrGOhWfci89Hz5hN3R2N/sGTKGnqimRyshy1khsn7uIT
	twwiqvkHKWDJJbotRbY0CqYPE2eBVEziM4WYn1Ddjhbw5eA1/WsSMWfuNs2ywF4cPGM1gyz7Ivt
	fhFo879AREno0rpR9PhyGHT8bqmk/XwiNg+ArHPd/6/a/T4ulfzXoqYvq+mbp4fhRL3VzLPszRN
	CKBBgBESxlTyeHF19watBKY8MZwhtG0Xkg6X5L2oGsv1dj+f5g4uPzhmlcIY
X-Google-Smtp-Source: AGHT+IHLhNNIjJ78BknXXSA2LQoWmr036iyjtdUNTQA0dbwglv4GzsRZuZX3p8MRa5O7rc5pcFDPDQ==
X-Received: by 2002:a17:907:1688:b0:acb:39bb:f969 with SMTP id a640c23a62f3a-ad219166f24mr436615766b.43.1746822882166;
        Fri, 09 May 2025 13:34:42 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:41 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into symlink
Date: Fri,  9 May 2025 23:34:22 +0300
Message-ID: <20250509203430.3448-1-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every time I open Documentation/CodingStyle it says the party moved
somewhere else. :-(

Of course, I forget where it moved to by the next time.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/CodingStyle | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 => 120000 Documentation/CodingStyle

diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
deleted file mode 100644
index 320983ca114e..000000000000
--- a/Documentation/CodingStyle
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to process/coding-style.rst
diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
new file mode 120000
index 000000000000..b4a9864269eb
--- /dev/null
+++ b/Documentation/CodingStyle
@@ -0,0 +1 @@
+process/coding-style.rst
\ No newline at end of file
-- 
2.49.0

