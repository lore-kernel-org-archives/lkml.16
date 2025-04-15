Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354627979D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701220; cv=none; b=aZc8xsdyxao8PHYrzV51skIMxNqBHSTKF6doNh/wm7fT5MasZ38TAjJU4+54w3dISmJZca3HyCXXP9s+8K0/QxoMYBWXoRBbiLKFTDR4779soW5YXtGxsfTQ3oA+FPRcSylfZD2WO/7JNPS4MtnbvuArJf68xwwQdNufjx6IGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701220; c=relaxed/simple;
	bh=h5dIhNUGRcNVLReL7I05zUY5kTUC0DzPldBHwsd5x9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAtU5HhpMRAtACR2r0HYHfr5ZvFLDSlw4UA2ssWttebZPVflkzIzC1MyvWJfOSPihCniq20TVmzKBgiR3BBW4+jj27NaOjw4aU7yTfhncoqe2N0Z9Tkq3xrckG8voFdCAfFeaCz7LqBRRGzIp1vAGd7flkHcAITvOhIXSEXqTDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SaSrlG2N; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SaSrlG2N"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22438c356c8so57754865ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744701217; x=1745306017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvP3jktdcQlD/wgwVWubnz5z+eT6waZA1U4rtXZRHts=;
        b=SaSrlG2NoX3QQbjT2KAZd263HQGTexf+55IukAw8U7sxe3JSb0Hm0tqgpSX8Bm0gpb
         1KaF380X4EnRJAWWCIS9hVhm6vWAM5SgtBpgpefrE9LF9I69ybzHjK2ZCWiePpg6IK7u
         4qzjEk3Q51umeo8sCsFII/9TFyBc1VetlGBjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701217; x=1745306017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvP3jktdcQlD/wgwVWubnz5z+eT6waZA1U4rtXZRHts=;
        b=i/hbUOlNEGT1Vf2an+EjpRZL7BnKamYnCQTDN+l8VWhcKdP5Teq0CeYGyc+DmnCS1F
         FvG+EsFzAeGmOhKh+48oGd+4v0sqmRe9wHhqEPpqv8idG3wSt3isFEjN1J0ONLWWMa/e
         oNeDi9o0zgju3thUvpXvHs9mTVqJ8iD6CMs733dk1TNidnG8cRQ1EtjoYJxayPDcHhUL
         wZZu51P5aAayw+32EKpp2Gg+dU+AjgJBnujJBdTMPmC+lN3M7/Ubeha6qi1OR6QNy3nF
         nBdAP6npOpvr6OAIb30WDe0xUH1uLu3eC9R9D32jH0tinuiVaj40VC6N4OiZBMJKQGLB
         hBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVj5NgThvinuS7tLBJvKjsxCHS/QA70ex9oUWizaI+LIjxoI53WzcJn9qpGrNSUbZqOg6CV8CyKYzTH1FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznKRGpgjDq0DYf2kmH01hIrgPPJRS/J2mdqZaJGLedt1fhTGn9
	PAvCZN5+x037Y9WVb/3I/8MLL62aDxCgjgPOlBHQFxl6bXCzpjcd/2Ha1CdMOg==
X-Gm-Gg: ASbGncsLYyqgbXon/8SrY/9BBfqpuAFbywdUiy4uMOkmUcAsinKkOpUaSKboHJMTqkz
	Q0F1ah5cVMjOzN1OvLYGi8r1noJkNomCpAVyyBoPWlkLITtVzMp+7MZ0YhI4jv/g6UquNrLjozX
	XRsq8hbL/Dk86oKhuhFBeixbmnqb4FLvs6I+ZJRyXq2Yh9Y9uSvfsJWATkW0zEeBvW1Ki+0wns4
	gTuGHiLe9L6cxrQ39IhcO2bDyCFW94xWv57BsjU87yaq1yrNLVl8RI5a8eYqaJunFv6O9VubbUI
	qKzqQZd3fc4BGJYCn64/y4P+7aYf210pMW+debvAuSw7SC3pRwzdhn0fKkdkvkPoMYt9KMisSDc
	o+11C5dSVfxjpgrPLk7LFBvgdifHJcTu2
X-Google-Smtp-Source: AGHT+IHzbUw60awGAdnr73JeuAX7Ko77w21zXHTS5A1bqgbmfAjViEsZsECWSFQGbmRiP92KE4/mbA==
X-Received: by 2002:a17:902:e5c8:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22bea50017emr210745615ad.39.1744701216954;
        Tue, 15 Apr 2025 00:13:36 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (132.197.125.34.bc.googleusercontent.com. [34.125.197.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65496sm110776435ad.42.2025.04.15.00.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:13:36 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	paul@paul-moore.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	selinux-refpolicy@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH] binder: add setup_report permission
Date: Tue, 15 Apr 2025 00:13:29 -0700
Message-ID: <20250415071329.3266921-1-dualli@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250415071017.3261009-2-dualli@chromium.org>
References: <20250415071017.3261009-2-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

This adds the new permission "binder:setup_report" for the kernel
patchset "binder: report txn errors via generic netlink". A new test
is also added to selinux-testsuite to cover this new permission.

Signed-off-by: Li Li <dualli@google.com>
---
 policy/flask/access_vectors | 1 +
 1 file changed, 1 insertion(+)

diff --git a/policy/flask/access_vectors b/policy/flask/access_vectors
index 58a559ca1..36817566e 100644
--- a/policy/flask/access_vectors
+++ b/policy/flask/access_vectors
@@ -835,6 +835,7 @@ class binder
 	call
 	set_context_mgr
 	transfer
+	setup_report
 }
 
 class netlink_iscsi_socket
-- 
2.49.0.604.gff1f9ca942-goog

