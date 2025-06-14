Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839A8F64
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908141; cv=none; b=YQIZwRH4vEN3SgKYeDXxUfbmHM0xg8L9+kCoXPClJOIvJM0JDPiQ9ZVI9yIts8V8+21nBi3MRI8Wwh2DxzAsf4B6eqnMSe4C3wKD5cVRDYoziKiyZXEWMwcT8j3YrziL1PET0gH9ii7+jOTpL6QDlptJA2weSWc4pVxKxjMTtk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908141; c=relaxed/simple;
	bh=7kGr2gtmOdfEIWCYB4TV78C+iaOuKebNh+tK55PQz5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFOotxsWCzqDudCau5JMVlzJz/Jv4M7KYL2Ruyy1Axd1f4DYjDqYzTwrmVrC4gB18YF0sDlS7iSn1VaMq2Tl/2BFa5KcfvlUKlPTBete0kfEF/nGksVM8C/WqGBd2jaDWPM4NNx7mxTCg1b2H6PnvTshJHAW7IJO6HR+wjAgFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aGmjsX0D; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aGmjsX0D"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so23560395e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749908137; x=1750512937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbvHDprtay3hSsSZgBi8CDmVfxzR1ra6CJ9zeD/q3CM=;
        b=aGmjsX0DtZg8+2N7/vP64o+TIWxIu4TcsYc67cdi/5PvdZfaiBlluAW0jM1heegQD0
         iGiHHn8bZRkobQ6hhxS+LSfk1VwnEgCfloCdopPgaRbQ+e4wR8TUYeYQ0ZWYMLOlIZ+z
         v0lUsxcZxYYnO0w3vsRT+gZ18/G4mAvtSy+Z4UbeSFFxYPgqHD+0ANExHcLPrOABE/h7
         VueGXRc+BDr29YV8k40jQqK/rlOLBKNwMh2HpSpD+DDIeQOu3YSTHPeJhKEWiAFst6zH
         BmwQ369IZxVCCbJS/gA2zKtcO7StY5JhiUaUbKanW6d2MSWUCALn+BBeShVNzpirgJdU
         tDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908137; x=1750512937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbvHDprtay3hSsSZgBi8CDmVfxzR1ra6CJ9zeD/q3CM=;
        b=VrcP2kP+XT2WNPg6wjS7jSmsKOW6Bx3blsPf2QdqAgwTdCiOUgcNyMOf1i3S+4W3xf
         NO1R2kmpy3Wt2z6KWHe2El80pjCIvO5tN7jJWVXtgx9bGq051/nmi3hi8DIoxPDA+vfY
         MCkv16/6FCOwMBITJ3kb0TGojEcx8RESqXvoFiVytawtGiaXjRN4BaTkhDIhJbml8TQp
         uu/kFoAu2ezpPGXTGGHdPTVPfFmhu14YCrwG1ZczZNpPC1VE7fCG6x4lQZnch0Ufuae0
         1k//MyeScBrrnNOW+WSSb4oAHR3TNTgz7TagpXab/iGebySpDGudTsTeTCR8QJFLkjf2
         v1Zg==
X-Gm-Message-State: AOJu0YyX5vAMvFH+pKdOgBjmeHdFCbJaXzAfMZaAUKbB74Uz7CRERMD8
	tUeRhWBWAeNFCyQZdj7mkt9paowsZ9oBfFoUFacsqTouTusqBWQnPN/LcT9AXqk4avUPCmxEc9U
	r2EBFrc4PhQ==
X-Gm-Gg: ASbGncsMFQIv5eCn3fmpbfSy48rs6hwg+NrXV/IF5DDE8LW79osgsfYkyAN34Z9ykrw
	XfScorb2i34YcgDQ0aSupgylmL896tKstDbic9CEuRt92wKk2JB4Cp2Si6S2xWFSbKbSj0o8kiV
	0UudNnadovcotYClMf1ROilfkRSWLro225fJ8IqCiTyx3u11KS22p5QGR6k9C4koIeywdEnfmIL
	zULDwSAWQpX0+m4fLWn9kaXDMZCkX0+p7Kb3tva61EN4iY9XwUL26tVBmgV890G9GvLSlMqui2z
	5Z9ozWEIBjqT8YkyWAzro2W8OGHgJ1g52gjKoIb2+WCAojIo4mJdzxlBQslaj6vcm2/XjkXWxrb
	AyKI12dyDwQ==
X-Google-Smtp-Source: AGHT+IHFh2SE9foUGo0qr9ZQZZlbgqOupIm23YvxzbA4yYHIvWVtrFmARo0HUo9eRzJ+vzTdiOS7UQ==
X-Received: by 2002:a05:6000:40c9:b0:3a5:39d5:d962 with SMTP id ffacd0b85a97d-3a572e8bfc9mr2396358f8f.41.1749908136643;
        Sat, 14 Jun 2025 06:35:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm5306744f8f.67.2025.06.14.06.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 06:35:36 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and system_percpu_wq
Date: Sat, 14 Jun 2025 15:35:28 +0200
Message-ID: <20250614133531.76742-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

    "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
    https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
    schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

    schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this patch is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this patchset ===

1)  [P1] add system_percpu_wq and system_dfl_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because of that, system_percpu_wq and system_dfl_wq have been
    introduced in order to replace, in future, system_wq and
    system_unbound_wq.

2)  [P2] add new WQ_PERCPU flag

    This patch adds the new WQ_PERCPU flag to explicitly require to be per-cpu.
    WQ_UNBOUND will be removed in a next release cycle.

3)  [P3] Doc change about WQ_PERCPU

    Added a short section about WQ_PERCPU and a Note under WQ_UNBOUND
    mentioning that it will be removed in the future.

---
Changes in v5:
-	workqueue(s) early init allocation
-	Doc fixes

Changes in v4:
-   Take a step back from the previous version, in order to add first the new
    wq(s) and the new flag (WQ_PERCPU), addressing later all the other changes.

Changes in v3:
-   The introduction of the new wq(s) and the WQ_PERCPU flag have been moved
    in separated patches (1 for wq(s) and 1 for WQ_PERCPU).
-   WQ_PERCPU is now added to all the alloc_workqueue callers in separated patches
    addressing few subsystems first (fs, mm, net).

Changes in v2:
-   Introduction of WQ_PERCPU change has been merged with the alloc_workqueue()
    patch that pass the WQ_PERCPU flag explicitly to every caller.
-   (2 drivers) in the code not matched by Coccinelle; WQ_PERCPU added also there.
-   WQ_PERCPU added to __WQ_BH_ALLOWS.
-   queue_work() now prints a warning (pr_warn_once()) if a user is using the
    old wq and redirect the wrong / old wq to the new one.
-   Changes to workqueue.rst about the WQ_PERCPU flag and a Note about the
    future of WQ_UNBOUND.


Marco Crivellari (3):
  Workqueue: add system_percpu_wq and system_dfl_wq
  Workqueue: add new WQ_PERCPU flag
  [Doc] Workqueue: add WQ_PERCPU

 Documentation/core-api/workqueue.rst |  6 ++++++
 include/linux/workqueue.h            |  9 ++++++---
 kernel/workqueue.c                   | 13 +++++++++----
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.49.0

