Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21453248F7E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752540; cv=pass; b=YozfLd0s0IsphTSnrRWDyRQXUpbXOgyjV3h0lovNPwUt023DSNuE1jy8URjy+3ZE0mCcTL3DzWTBAnNunAUHT5I6sVr4kS8RD13maa8/JpmpL/yd5dCmXoH+Li6xhVl2aI5ByUQIakPhqt4BArzMU8Gs12zmqpXwLjXTJUORRJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752540; c=relaxed/simple;
	bh=SaFeltjIhffRZcpSoI9ui/Z8/TR17m1v5uOiSvZXsFI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RpzTrCH0AEMWeORwWfE3SErmy+KtkOV+Ee7Wp5SLxOpU7JFxxka+SI1+IwZO6cgStIz48PH6MovqNYOmmKWOLaId1D6CgXaSALXSLxzjTOR5vaEUTucSgw9Jsh0lWNtwen6bgIQJe+dM6QEsqXvVu9NtLnWrEZkmguTV9S4fuWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=EameN6R7; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="EameN6R7"
ARC-Seal: i=1; a=rsa-sha256; t=1750752505; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dqw8vfjrZUk5usJMY3XbRoNyqE+R9NbrFn7I9DpgDkBoaqujDT3RVvAb2hxF3I+gkQ63y7R6c2w2sj8hw9pfUsO7wdWHCWLSViWPW1MM25/zek3jrf0BOEzm5AsDSLSzyA0idBITOjjUwKbNLa9948+e12UIhSml1BiCT5UxaOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750752505; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=rQM7oFwr7sChbW7FI+ZavpM60eKYk7PeTWBCwjL44LM=; 
	b=gikfV8JHINeKgFNlOJ3A5p0dDzj7RI/u+GrwsBy6HcalqhPfKp9mApPvvSv7ydpeYNUS6c4hBzHhX7nOCRrCyELWnt4Ajp0gB9nt6rt5laA9dgZFAlwYVMuLZCNuUyWzzxYENGdfC0Ego17vadqiWjvIt8QOcQWl011ReG+QYZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750752505;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rQM7oFwr7sChbW7FI+ZavpM60eKYk7PeTWBCwjL44LM=;
	b=EameN6R7YwbXhDAc5QB+EGxOG20bAo2YKu/b4xwOhwJZg3hG/cj4ZFD9GbIU8z6T
	MzsH6KIk0C6zt39Lind+l/zA3QBqiDn5DgJelSwQad51TEEtssvmcakgo9+Nc8WsY/T
	O/6mzgIZjFv+7mpGsqXcuvB0SV1d1ana1os9xUv8=
Received: by mx.zohomail.com with SMTPS id 1750752500469835.715678127577;
	Tue, 24 Jun 2025 01:08:20 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] x86/smpboot: tidy sched-topology and drop useless SMT level
Date: Tue, 24 Jun 2025 16:08:06 +0800
Message-ID: <20250624080810.66821-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

This two–patch series cleans up sched-domain topology handling and
eliminates hundreds of pointless attach/destroy cycles when SMT is
not available.

Patch 1  (from Thomas, unchanged) gets rid of the #ifdef maze in
build_sched_topology() by statically initialising the topology array.

Patch 2  (mine) is a follow-up that simply memmoves the array when
cpu_smt_num_threads <= 1, so the SMT level never gets created and
immediately torn down again.

Tested on Qemu.

Li Chen (1):
  x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled

Thomas Gleixner (1):
  x86/smpboot: Decrapify build_sched_topology()

 arch/x86/kernel/smpboot.c | 59 +++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

-- 
2.49.0

