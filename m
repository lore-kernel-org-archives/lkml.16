Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FA302048
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893539; cv=none; b=T/6BMlEHmtW8BkM1rGKM8UTvK8i+ERZezEIOLa9WaLT3hHyRVEHtRukUMt6GDGNkvjUGslaUTy7pVgHSqYzovZjrLjyEKZqxSbTvXTSez5FDGzPf2ov9PPwHbFfm6oiWhAaHAlMkEkYifzmLtLkJcyrgQskrZI96JzwXiCdRdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893539; c=relaxed/simple;
	bh=QtmBwOe5Py6ndIWGzbeMkxazGPHNwvaG1USoZ4ofzzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKo5S8js/GWI0IGKwAp/yh3M+GPde+j8k3BWII8LQqfgdAgqS66mQleVqXLq2V69qf+wwViCwAtW+bPC7HNQVqVDj6bLIfLu1n8zH8aAtBHOzuxdwZUm9kM382K5/2Re9qYBjDXN2OGI93fajwuEvtewU84lMsH6A0NKQ4pOgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=pEeEZ3EQ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="pEeEZ3EQ"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81826d5b72so297301276.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893537; x=1751498337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiOsnbmXgKqRz5wWOYZUUHO12tKj0FKseA6eFuor5tk=;
        b=pEeEZ3EQ+f6PqmtRLOCl3EhegfTA9Pfm3mt/LaUcL66MENvJ2ogWORqm2A5nILmeHT
         YtYTgGwZJRkiOf+1QAb+LFAHFbX/P0Z2EiwHwkPtuVftY1ko40XK0aPphpQsS6xWFONd
         tOtu3QUhNp7MYqaBBq89vvQOjsx3hzp1VZJzldCBj/8NVNrg2b7/sN3XE9jlrUn7uA98
         Wyuf/7+FAMfn/mb9gb+kY0m3GXd0qcRLFliLGGKxvNvgS/41xeFWy5KW8pSmUyyo808+
         byqowGTaYfRdYfeXwloX4qo6ckCbWBldRdyiaOfQd12ws3LYm5fLrfxzW8Ad68KN6kiC
         QpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893537; x=1751498337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiOsnbmXgKqRz5wWOYZUUHO12tKj0FKseA6eFuor5tk=;
        b=BVWWKdQwVnp5I7ENhNY7Zk07dUB2XKoW9aqFLxcpjRigXScK07VmVZLz4hxJGmdi+9
         V6StpjOtn9e1HbsD8HnG6TMXYftU+FLL1DrWMdCsS6tBn8bAiKIjj4WIZuPq53L8N7eP
         j3L35Oe+12IeDbtC9PbB7FSiVBIbqUe1YD3GaBgRPSyQnepI2RaJ9JwlhWqPY2YXJ5C6
         3gkzWZ0KNEIZNGxWyJquKwO+ntugeyE5b4+EH1FlATGvw7proJXaph44As2lhKxZNabm
         VAD8VNhum2NsMQXmhPRY0fm5xIn9SssGJfKOD5HZcVwGKP+uxjDHiNlRysrC0OdLO/pS
         aXvA==
X-Forwarded-Encrypted: i=1; AJvYcCUJOza43eOJ1IWRdW6GydoJSa78A3pAEc3Bc7yBmQOAycr3+9/WHi7oqbIS4F+30/oFWievyyHxq30THJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UqIKBRsNBFlZsjMx/Tje/iPrRwzZyOtDWWH8sIzyc/gzel6W
	d9DXAVNFkaIbc/leZxIkAd9eEXvu8MRhSb/C8sgbtBbhx3RjSNDJtaLi8QiuMXuYmpk=
X-Gm-Gg: ASbGncviR7+V/2hEFqqUq+qCiiiZayLsLHq6nWonfPNLBT7N1COfVdz/C13GnEDq+YQ
	avF2k0QOqDCShB3W7y0ixIVzseYFy4oR9Wusfp5FuE44J2xCgtBJUhT4pAt6Ox6/GXjafe/dWEZ
	fr9J0z7rV7bAz8B+AVqhkeAFrX6pXa9gEAVhCNP6nxW3FKh9UaLaWvGW5Au4trjnW/X1+WaMPyS
	pBNFpFERtcx0wEml3Zvj7xHQTlVhYCqppKE7ES5jUTTInAeAxJL1kykj3hs0uqMUa/haEPsvb6y
	iGYpDsPp7Fh5x1lblmedKKO7jYDCJmAiqWMl3YJTjINEK8YoD3d+q40E6rLW6Caktzz9+CIZ/us
	tBiYCoGTAafY48t1XacWBIFSYd30Hh1FlJo5NNPDIUqjFoO6PunICd7Odd3vFPBY=
X-Google-Smtp-Source: AGHT+IHpMMB7jazz0bY3ev82KOYzlZveTNga66zjJgcMQk/SF9LbDk+lxuWqWkLu9eZxFgZd+C91eQ==
X-Received: by 2002:a05:6902:1246:b0:e81:cab6:6db5 with SMTP id 3f1490d57ef6-e86016cfbebmr6753343276.8.1750893537044;
        Wed, 25 Jun 2025 16:18:57 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:18:56 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 08/32] kho: don't unpreserve memory during abort
Date: Wed, 25 Jun 2025 23:17:55 +0000
Message-ID: <20250625231838.1897085-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO allows clients to preserve memory regions at any point before the
KHO state is finalized. The finalization process itself involves KHO
performing its own actions, such as serializing the overall
preserved memory map.

If this finalization process is aborted, the current implementation
destroys KHO's internal memory tracking structures
(`kho_out.ser.track.orders`). This behavior effectively unpreserves
all memory from KHO's perspective, regardless of whether those
preservations were made by clients before the finalization attempt
or by KHO itself during finalization.

This premature unpreservation is incorrect. An abort of the
finalization process should only undo actions taken by KHO as part of
that specific finalization attempt. Individual memory regions
preserved by clients prior to finalization should remain preserved,
as their lifecycle is managed by the clients themselves. These
clients might still need to call kho_unpreserve_folio() or
kho_unpreserve_phys() based on their own logic, even after a KHO
finalization attempt is aborted.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index d9e947eac041..7ec9b0826a6e 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -778,31 +778,12 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
 
 static int __kho_abort(void)
 {
-	int err = 0;
-	unsigned long order;
-	struct kho_mem_phys *physxa;
-
-	xa_for_each(&kho_out.track.orders, order, physxa) {
-		struct kho_mem_phys_bits *bits;
-		unsigned long phys;
-
-		xa_for_each(&physxa->phys_bits, phys, bits)
-			kfree(bits);
-
-		xa_destroy(&physxa->phys_bits);
-		kfree(physxa);
-	}
-	xa_destroy(&kho_out.track.orders);
-
 	if (kho_out.preserved_mem_map) {
 		kho_mem_ser_free(kho_out.preserved_mem_map);
 		kho_out.preserved_mem_map = NULL;
 	}
 
-	if (err)
-		pr_err("Failed to abort KHO finalization: %d\n", err);
-
-	return err;
+	return 0;
 }
 
 int kho_abort(void)
-- 
2.50.0.727.gbf7dc18ff4-goog

