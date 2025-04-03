Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E12512CD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703305; cv=none; b=BQOQs5N5ILEUSmDEgrPFxLnWfAxdur37LdyylfY0Ts4DutCIvg0jK36dEuoS9JynlfLvnYs/YyTnFGAnqtbN+oIF68HvpRzcQMprreIzozlXHvTNa4I01xqlEMGtcL4u4VqyBaOJuBblvjXKQjorsweDVbZcopCypu59iuyvoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703305; c=relaxed/simple;
	bh=1yDHNqjZIdxcylaKfZLuH3PFnsolGFsj+0GPacGBx+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UeGqHVdAHdzI4MrfEinclUCTNUgYKdTXYV5q7tW+F2qZssm7M3J4HM3nMdZrc/l6N288qp+JkGMmXo6bBfUaXfGR9+XbcR3DbTEonstbDyvEUlgCVY8gbQ+E5h5iGRUvL4k1POQlakX6BzeD5rrV2AlmJXl6HocQCTfawt0ipGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso1941098a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703302; x=1744308102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSlvvlKCX4PgAkHg3RKqxIFkI+EouqWNtmXva6H0lTQ=;
        b=PO197KfHu9KyFjeKESEw1Pj1UzibR/Xt5YjZpMgxPYQ3u/uOeEZUPEzFn75qG4v0b+
         S6mVAW1EEEfKrycZP2/yESpDVp3rqEEWN3Aq+zSxfdwEbiS2t0fVeVvxts7XiJzinCJS
         AJbcZRs/WPGwgwITvCKktFIqi0NefsxYV0mduIYV3oR4hjoAmnljb4jDNTfonspK80Sz
         RU+OY4yLsxJRHdU4Yx77a0xizbrY3MX/VUsGLZ2UkfyGG9fueFwaqM8uIdCazKz0Nkde
         FEvOBzbtAP5n8i7cUdym0S/RiKlbje5yL+i7RZMP4VWuI2qtaohKxQuvyNocNNFoxqj6
         b78g==
X-Gm-Message-State: AOJu0Yx6zB3fRjtFaQamRAEu2VB4d+G8QTKTNdKc9TplV5HXVpmHEtQS
	Fy9t8m6F9VWW9Tn44OXG3uLoUJuRo8wfMsQLXLhpOXIZY3iF+Asu3zkJLA==
X-Gm-Gg: ASbGncuK+x905pa//f9/cXcMz2WAcInpmG+e1W3TWiw0RzRCynhc7lJcm4Ar6J8jfBa
	GKsleCwV01C8U058r8leof+lfALg5In06morUCjawT2pPsLcl/hMzLEb8wvIkZn79JolM+vBoKp
	ZOI3CE0pqm6RcDcpjCa54p0r3ugeHcYoqKPAB0PnDrMJCGpThLxq7jV9kXLviVPVEWcR5mZqikQ
	TfUJlYAsbd/tSw+tF1QLCQcRPzAGLpEI9yblqIaWnq3DjGLm3dfnR+PJb4HKFJX++IbUztH7Y/O
	iwtR0/TUJ+x3n5D4Pnr88J1oaVCxhtJ+1NK4
X-Google-Smtp-Source: AGHT+IG3fyPviomCWx1pVQdearZFFlxt5dXSvKcTp8OyYPwm81YYk877lQ2X0dx1UnBlKuY8DHNq6Q==
X-Received: by 2002:a05:6402:13d2:b0:5e7:b081:aa7c with SMTP id 4fb4d7f45d1cf-5f0b3b8efc1mr71593a12.12.1743703301610;
        Thu, 03 Apr 2025 11:01:41 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4054sm1256324a12.67.2025.04.03.11.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:01:40 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 03 Apr 2025 11:01:29 -0700
Subject: [PATCH] exit: skip IRQ disabled warning during power off
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
X-B4-Tracking: v=1; b=H4sIAPjM7mcC/x3MTQqAIBAG0KsM3zpBK1G8SrToZ6zZWGhEIN096
 B3gVRTOwgWBKjLfUuRICGQawrJPaWMlKwKh1a3Vve4UP3KpOXpjvXOTWVY0hDNzlOdvhvF9PzN
 OUG9WAAAA
X-Change-ID: 20250403-exit-bf815877a1cd
To: akpm@linux-foundation.org, brauner@kernel.org
Cc: linux-kernel@vger.kernel.org, joel.granados@kernel.org, 
 kernel-team@meta.com, oleg@redhat.com, mjguzik@gmail.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=leitao@debian.org;
 h=from:subject:message-id; bh=1yDHNqjZIdxcylaKfZLuH3PFnsolGFsj+0GPacGBx+k=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBn7s0DfEswRvh8us+wX/4KjkV2q0bS9ma0Ybwxq
 d3qzA5/pLCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ+7NAwAKCRA1o5Of/Hh3
 bVyrD/sGD9+ybM20xqGB2gfsb/TGzMQL3gzduA9qYafm5qK/DbWeDvm8ilxOu8ui/muVCKi3pPY
 gByA2YwLDDbU7Ka0QpsG0AoY3WWpfrmL5IfIEraCWB29IpOQo136AoJBOaQM1mTJsxm80DYc8H1
 tOt/J4auH5PHDF/M6srVLxZ+Dl2Ownvcaf5xBhpAJc5551mcl/tglaJcL4aKjT7RDJXrGJn4lC3
 L6P2lW7UDZQPNKVfK22C0UmztfI8txA/rILgHhBOVHIavGt7hq7bqnbRz/X5/4AoOmVoGv92eMD
 SvJyyNdRJtu30jpsy+zAP4zv15QMak929Aq/LDtAtu0rpiLpTOZQiWUNp87D1BdXOX1LpSAY0/3
 s16RSuIGPlyCTBDbe4Nik93gXocUwGpfzlp/m2N8W3Gl/2B1CpfzQcxkQnjRq/yCXPjy7PNzE7T
 sMQNOdgFCYVemVgcXHR3N4noq7LT9cL1GERs//NiKl0xjwE4uV5QFq8ApKrRTAxijyxKUWGRyU/
 vh/YB+TEif8CgNmucUdpxXIBmK1xR856PluPW1iljGB/kZRewWCvyC0/HDc50hjwKeYi8FYNuhe
 mltNhW6vi8XTnbIqluSOs5X9PdBFDdcaT+n/Me1k+zvfL2zzgGs+zLx8h7Qm5cBXoE20U5wJuUH
 zSHCdoeFmVkLJ5A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

When the system is shutting down due to pid 1 exiting, which is common
on virtual machines, a warning message is printed.

	WARNING: CPU: 0 PID: 1 at kernel/exit.c:897 do_exit+0x7e3/0xab0

This occurs because do_exit() is called after kernel_power_off(), which
disables interrupts. native_machine_shutdown() expliclty disable
interrupt to avoid receiving the timer interrupt, forcing scheduler load
balance during the power off phase.

This is the simplified code path:

	kernel_power_off()
	  - native_machine_shutdown()
	  	- local_irq_disable()
	do_exit()

Modify the warning condition in do_exit() to only trigger the warning if
the system is not powering off, since it is expected to have the irq
disabled in that case.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e4..97ec4f8bfd98f 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -878,7 +878,7 @@ void __noreturn do_exit(long code)
 	struct task_struct *tsk = current;
 	int group_dead;
 
-	WARN_ON(irqs_disabled());
+	WARN_ON(irqs_disabled() && system_state != SYSTEM_POWER_OFF);
 
 	synchronize_group_exit(tsk, code);
 

---
base-commit: bfc17c1658353f22843c7c13e27c2d31950f1887
change-id: 20250403-exit-bf815877a1cd

Best regards,
-- 
Breno Leitao <leitao@debian.org>

