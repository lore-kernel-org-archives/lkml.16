Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DF1E9B21
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642745; cv=none; b=roV6lQfE83lywIp53Ek0HhhFzUGDEUEMplPzSCZur8l4WT7zZgYmybAeHcnFIg9co6q0g88FO2wbJFb3CpM+4jjaM93mYJaMAJCGEcv9u28nvdxon6XsUk5rGNawFDNPImxHHB0JDyl/aQeBGeZe0UiLPzRD+yG+XBNgwsXzXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642745; c=relaxed/simple;
	bh=1P23idn8S50Wp/z6psc62ni2xbplTpC+5t49NOZ2Zpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a1ZMVOcbL7mdEoOJGzsH2fn7JoL9z+ozdVLqiRAI4kL4Ep+TW8pfycUYL4jE1o+0ioQfKEcjVN9QV96Bym7bTvhQIiVm9yRGELx+4S8SEr2MOGFudooZmDtdCWY8clR2ARHYZu3E7AGJAWRq6UOl9/q2n+oDjZLUxXLs/fk5iiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tcpy0n2K; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tcpy0n2K"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1380593e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642740; x=1752247540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0Q3LF2X+8a61qCC6llydbLSjvVlZ/Q0p+A1+lNpFsg=;
        b=Tcpy0n2Keiyx2bRzDpBpkAtFPY+HMTumb+7H2Xx20oCq57EzuzysT3poO4vs0ySygX
         es55mXwh0+PszBtVHgzrmjrkv869yCo6di4GaOYEbvMVr5SwGAVVusEkkvz+p1MpaZ7O
         13YIs3Bt8WfRg0lRtzKPxLN93rF/pZvPIvHLCMZKnvbnkRNI2bsoW40gSXVVdkTzVPBt
         Xb6g8elQBYE8PhbZsbQyCNxEzIUmEt415oOm7DDXA7bIurv2pQTBOQ5uanc8u0PyeagP
         y6XLb6wOQyMl7kePxEQEAVOnqhM7hZgHNqa+fmDCXjiXP9zIGTzpEOC8gt3Epsw5b1jk
         BNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642740; x=1752247540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0Q3LF2X+8a61qCC6llydbLSjvVlZ/Q0p+A1+lNpFsg=;
        b=nrHNAhQ03ad+RjC/z+dNmusedPmw8Dm3Z20rIoKg/ZpeXebOK5A37WjO0Gj6fJ276B
         aA0KHsVr6dndJ523B6s9SMCTNPNdIWls5CBlZoMvVaTkd+Ckt2oR9GryYF1lQGenrOqM
         cVuv0PR12Xb7+XTzg0BIi1myOpSfCL3rVkkpADQSN54GfZw+HQZ0DVTlhKzYSQRAvSc9
         793OQX2z+TBPHMZFDyNusl6GtNMnhMWMJYGcB2hEhJf7AAv3DPLOcbSyLRaRhOpb1JmX
         LhuX4Ys1aegVdSWAQ09z28YhQOHEOCgLxGU7k7mDfE2Qh3Wf6cJcajQpLcc5QuQbZvZY
         nHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnaKaYvkfcZTN82lnd3d5qwGpwA/7NpRQSXoumSJGK2/3lX/qmcyhsqJIwzrZAa3ugqGWDjha9BR8+NX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznVbGtgKQjjUMSc/pazokUgar5GkgW03R+AQDXyVwejIbIDsXc
	GS9i37eqBOKDJPTMkh3dPFfBKEuIa3FDFKvYKiSH8WA55JdyYxtvtsbg
X-Gm-Gg: ASbGnctlOUgcxdcHTE8LATIzOlqpom6UAQV2oEFWGV30CBssHfFp6pyVOLNE2BakC2F
	G/g9w+gU2f7SR4GaPDd+lJXxr4w7N9+7+BOA8SZ0TCnRIGnRFcttlpLT/u6RuVYNPnf2DrLHHSn
	H4+Bk9BETrjh2RVB5HvlqxDyYQxa2jOnpXwSQ37qGl45h4MW/1WBNEcG3goXNA0kCIzqrdjOZcF
	uRERkA604+kXf/Yz7TiUX57jcTWhAEWoTQDwMs/sdLTV69vncs3blpM/h8jGvLaQBwPPLub5zPk
	L/C2QuWfInYx/rOeaEWnIpwUF3yq0VSRKTCPa7oxuS+8wDy06ftu8xPAqw==
X-Google-Smtp-Source: AGHT+IFDQmOJmOUPECY01enwclADE0hOpl3t0KsXrnWY1Pas6IAjlW705AxCcYjP0ABpz8i541WqSw==
X-Received: by 2002:a05:6512:131c:b0:550:e527:886f with SMTP id 2adb3069b0e04-556de363b96mr977862e87.51.1751642740150;
        Fri, 04 Jul 2025 08:25:40 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:39 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 1/7] lib/test_vmalloc: Add non-block-alloc-test case
Date: Fri,  4 Jul 2025 17:25:31 +0200
Message-Id: <20250704152537.55724-2-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704152537.55724-1-urezki@gmail.com>
References: <20250704152537.55724-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/test_vmalloc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 1b0b59549aaf..9e3429dfe176 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -54,6 +54,7 @@ __param(int, run_test_mask, INT_MAX,
 		"\t\tid: 256,  name: kvfree_rcu_1_arg_vmalloc_test\n"
 		"\t\tid: 512,  name: kvfree_rcu_2_arg_vmalloc_test\n"
 		"\t\tid: 1024, name: vm_map_ram_test\n"
+		"\t\tid: 2048, name: no_block_alloc_test\n"
 		/* Add a new test case description here. */
 );
 
@@ -283,6 +284,31 @@ static int fix_size_alloc_test(void)
 	return 0;
 }
 
+static DEFINE_SPINLOCK(no_block_alloc_lock);
+
+static int no_block_alloc_test(void)
+{
+	void *ptr;
+	u8 rnd;
+	int i;
+
+	for (i = 0; i < test_loop_count; i++) {
+		rnd = get_random_u8();
+
+		spin_lock(&no_block_alloc_lock);
+		ptr = __vmalloc(PAGE_SIZE, (rnd % 2) ? GFP_NOWAIT : GFP_ATOMIC);
+		spin_unlock(&no_block_alloc_lock);
+
+		if (!ptr)
+			return -1;
+
+		*((__u8 *)ptr) = 0;
+		vfree(ptr);
+	}
+
+	return 0;
+}
+
 static int
 pcpu_alloc_test(void)
 {
@@ -410,6 +436,7 @@ static struct test_case_desc test_case_array[] = {
 	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test },
 	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test },
 	{ "vm_map_ram_test", vm_map_ram_test },
+	{ "no_block_alloc_test", no_block_alloc_test },
 	/* Add a new test case here. */
 };
 
-- 
2.39.5

