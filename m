Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA329DB7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704041; cv=none; b=Yj9HSlMQ0qexo3gB6KUCoU5k6hq3ZWIETjhsuUzPeM+/byVy997QFjy7PTq0F8MO4mhRL7uxuwSzRGoAaj2naMBD+loRRW9wvGw0X//TVHW9CxVxq4CgMxfu2fodAoGTSI22hiFxLTmJWHr0cSUFdgol69IKN23an4ED3iKONmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704041; c=relaxed/simple;
	bh=Fg+YxudkkG3l9R+NxL2FXCTQRxlqlESyxCe/d89YqpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V6Oo9yApP9OgrVJIkukaY5fVv7NDZXpYRi94oB0vzXpC/UcQgkak4Ww4AXhOAZUAJhmSIw+NuxdTbs4yAf1gg8u8gSz0vgjLOTCDzdjtohkcO9rGo9FiSJG28OpteLRArsdMg/e4a0KefvhFU/u6M+NqPTRkop0FLrxiIQ3++y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvYfH9Yu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvYfH9Yu"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e7967cf67so4316819e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750704038; x=1751308838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SdQ4Hj+h3Z+DHU3zAkOjIkMup55iLgQ6wwen/JteTis=;
        b=GvYfH9YuyXa2hqaGisZWoSMrf4EqZtwTW4555hiIMBNAUsxWLHdpHGivuz0LdTjO31
         Kbuf8mwUTp68ZgxuUwc/BTIzPOZOpjJK3iGVr/LPRNRS0jKAnhrriJpLIbci1EirgvC3
         AsyLzYlNGmT7h4AhtBofICHu0bOfIVb9elCaI6MfjaWjSiU3VrzOk6BIXiKm1GkyP0Ez
         V1Udwj4JVRUpy7/7i46Bbj3vCcXyryk8lLmW8CKBSInzlpeN5NtpqLQD8QzIVloNYjRl
         CiF4yeIBradSh9fjMGt75H4msnTm7kV1SflBYH4wgIIvBlkUynpNPyukrQXYmhJIJWta
         7qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704038; x=1751308838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdQ4Hj+h3Z+DHU3zAkOjIkMup55iLgQ6wwen/JteTis=;
        b=CUz5T5rUMuxGhaI8s9AiYH2KRWV03l2JxptwwFcoCAAdW+RFZsnW++0Sp/c1N6U2cv
         DX0r2F+e7OpXjISsk415xm1c9C83zL/8wWKwRPzuFbuL3Oik8jp5v8kKRwRaqnI4srdb
         LUI9x2fXdxCcScWw1ErXTavfuap8s6WDrKk1vPhajX+yz3k4OPb/zmIx5lee0u//fzKM
         mN+Ti0cQrOZiogaEYDQV7FJA0x/Ln+8JvDbEQq+ohJjTTXruF9psSW/kCDNeiOxqYArr
         sPArMZ8rVoZEqmoqVdvGWAJRArYzkOMOLMq6BKMRfnioQzeuD56DqqRKGSkvbalRSe+l
         CNlw==
X-Forwarded-Encrypted: i=1; AJvYcCVLgFkrTPycxYbSnbENGCSaJmDlU4fkaqtKlPHZOkb9Ivto3NHEMTzjeQoFHDJTptlf5rMj20perAK0ms0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDrC+LxLix2g7pz1KtOWjdDvFNgzDlbBZ7lcWlSY9xZ5BCXbE
	HHrVyAaIWq36cF/6zgfD8Rk2gxYTjqdDACYy9w9Qc6t98R810nRmCmwY
X-Gm-Gg: ASbGncuf6PeNjwf88nXv00vr0P0PbOKHBvEFVu77QNf7JEDumDzWSedOuc9AoqkqBjF
	mjbzLfXtV2ZNivs5evfB4QtpGfk1UPjyOmYqHeDtNejO+E2rDXaKc4oTNzvvCS+8xwJOSDLrW9J
	L4X9ilr3Gb5j+kSppv5UAyDdaY2bu54B5VUkyrd4bRHoa/faxLCO+hzrbcY1r+nHKmbhjlUHXBB
	IJLv6QWeMDyixnqbk0cYAbeAQiZjJDZEJoY83B92vnaBDpzivPcY78pFFRrWUjgBBSAtCiNvl7s
	qv0uAkv/H0+sypV+CK2AQ8jH1u51aggD+LQKmw6hTEq7wJnRJxrXWNb+eA==
X-Google-Smtp-Source: AGHT+IHbSGySEZY/bEVNQRwqngsUs+IJ329lbdUBsAWR85r4I1XszBJTeJhLo7VI5XLkdMjE15ayaw==
X-Received: by 2002:a05:6512:691:b0:553:37b0:d992 with SMTP id 2adb3069b0e04-553e3bb3e62mr3798454e87.19.1750704037876;
        Mon, 23 Jun 2025 11:40:37 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bc2e3sm1500330e87.131.2025.06.23.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:40:37 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Wang <00107082@163.com>
Subject: [PATCH 1/2] lib/test_vmalloc.c: Use late_initcall() if built-in for init ordering
Date: Mon, 23 Jun 2025 20:40:34 +0200
Message-Id: <20250623184035.581229-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the vmalloc test code is compiled as a built-in, use late_initcall()
instead of module_init() to defer a vmalloc test execution until most
subsystems are up and running.

It avoids interfering with components that may not yet be initialized
at module_init() time. For example, there was a recent report of memory
profiling infrastructure not being ready early enough leading to kernel
crash.

By using late_initcall() in the built-in case, we ensure the tests are
run at a safer point during a boot sequence.

Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: David Wang <00107082@163.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/test_vmalloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 1b0b59549aaf1..7264781750c96 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -598,7 +598,11 @@ static int __init vmalloc_test_init(void)
 	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
 }
 
+#ifdef MODULE
 module_init(vmalloc_test_init)
+#else
+late_initcall(vmalloc_test_init);
+#endif
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Uladzislau Rezki");
-- 
2.39.5

