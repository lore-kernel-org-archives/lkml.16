Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646A2BFC79
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433027; cv=none; b=AEPaHXPT3FYLXj+0zbsONWk7WkEU6lHNq3x/RMM462XSxvZvZNDlpBANLRCSV0oEfstvbfKwOX6HQOG/K6QX6kTGxEKg+qXad2k81zkA0PCDxuQ4dOq3q6kx4VEjpcMQjT10MNoBjniIEMHLRjtG6tk7Wteq9QRtPQN3pugjZKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433027; c=relaxed/simple;
	bh=iUfaeCF69Nkp/7VspLJNX3subJ+K5BfO1gas842MLb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noUZWxMpFWt8U1YHz9GSCnqgWVDG43spgjAAgnHYpoq1XUsBtZrEKP+Syia+lzrnpy2+7qvQ32bbvvHKpK/CjdIN9LmgL1svHCSFHs03aOD8kfrvy3pQMQRDoPrWFaH0y3XwKnuXp+XcAmjMsEr9lXMeVgn8n1Jh/x/RZi4odpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8FRPy2q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8FRPy2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D3EC4CEF3;
	Fri, 20 Jun 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433026;
	bh=iUfaeCF69Nkp/7VspLJNX3subJ+K5BfO1gas842MLb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8FRPy2qNoTKzxtpc7RlnD1OVR7cuEo2NLTc+m75ifE/yaBYm6jotUNMrwbH/dwlH
	 JFH/newSJ7oLWf4qc9dggeU2UUzVtSLZZv4gPJAdQaUGuOfPNx93PMhRah+v63UUC2
	 AU+Mx0kM2ZoxZUoHHI0oogq+AGiyBcIXJWR/GhrNz99jNRmx+eFwqpigU6tUYu9f0w
	 FU7GXZeMIT860jHe3Hy7kZK2wqV+N9e1ZJ2QsAok/YuRxMTb6q1qKd+9j6PSULPSfC
	 OBL5We/ItwuaNruJJeRZMZyXCDoDyXIUN36/cmzMtY0rzDNTz/4qf4xinqWntMRXxx
	 rx8zsM4E6JEfw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 12/27] cpu: Provide lockdep check for CPU hotplug lock write-held
Date: Fri, 20 Jun 2025 17:22:53 +0200
Message-ID: <20250620152308.27492-13-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpuset modifies partitions, including isolated, while holding the cpu
hotplug lock read-held.

This means that write-holding the CPU hotplug lock is safe to
synchronize against housekeeping cpumask changes.

Provide a lockdep check to validate that.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/cpuhplock.h    | 1 +
 include/linux/percpu-rwsem.h | 1 +
 kernel/cpu.c                 | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/include/linux/cpuhplock.h b/include/linux/cpuhplock.h
index f7aa20f62b87..286b3ab92e15 100644
--- a/include/linux/cpuhplock.h
+++ b/include/linux/cpuhplock.h
@@ -13,6 +13,7 @@
 struct device;
 
 extern int lockdep_is_cpus_held(void);
+extern int lockdep_is_cpus_write_held(void);
 
 #ifdef CONFIG_HOTPLUG_CPU
 void cpus_write_lock(void);
diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
index 288f5235649a..c8cb010d655e 100644
--- a/include/linux/percpu-rwsem.h
+++ b/include/linux/percpu-rwsem.h
@@ -161,6 +161,7 @@ extern void percpu_free_rwsem(struct percpu_rw_semaphore *);
 	__percpu_init_rwsem(sem, #sem, &rwsem_key);		\
 })
 
+#define percpu_rwsem_is_write_held(sem)	lockdep_is_held_type(sem, 0)
 #define percpu_rwsem_is_held(sem)	lockdep_is_held(sem)
 #define percpu_rwsem_assert_held(sem)	lockdep_assert_held(sem)
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 069fce6c7eae..ccf11a17c7fd 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -533,6 +533,11 @@ int lockdep_is_cpus_held(void)
 {
 	return percpu_rwsem_is_held(&cpu_hotplug_lock);
 }
+
+int lockdep_is_cpus_write_held(void)
+{
+	return percpu_rwsem_is_write_held(&cpu_hotplug_lock);
+}
 #endif
 
 static void lockdep_acquire_cpus_lock(void)
-- 
2.48.1

