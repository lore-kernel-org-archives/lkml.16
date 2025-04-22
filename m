Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F961EB5FE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311673; cv=pass; b=u/OA52Q8FhMNy9Yofsqh9amY/cZy6yrn3mWr8KuLLg90NM9/z972eyNOBZ26iJiWJEDZrW7pbLjDZGXpmYRrk8lmrsPoset76lDPYjONZKFzdufzgFETC/3Am5c6hXr1alZbSXP4TegczrzpwhbWv2OU00Yez8BpKTDJVvIiB+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311673; c=relaxed/simple;
	bh=TDYVq1ODaBDbWAoxkQf1jrbhH3y6ZYNelJSnFjfJ9Mk=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=ddxB/thHvxmnj0UG8bI04ZqDshVXLOfcpJsrbtwmOzTvxIpFjHEvryRU3S046HVWuhuzpK+wjrHwolU9DETbPDA6Fp0pPJh6IJgM3o/zZBlqVgi91iOR5sLpjD2YWwG5PNBIEJ/a1ZkbiWQyOfVuhop3CuKkgcAwWlE9mg2AG84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=DpYwdLvr; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="DpYwdLvr"
ARC-Seal: i=1; a=rsa-sha256; t=1745311640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MeU29dofExYbIkfV51XvcbsI+EAUMPX+puegC3pt2cIidGXgPRl/0IjG4kNpElnSa6Q2otZW11Xg04Xyn5gTUe6Gh/lO1HsJDrtVTcCpIOzIO7poRj8bUjD5aUOI5dSU+/lPtXwy4MUkdBrAN99XSsVHg1d5QXmEMs2yXya/8IU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745311640; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=KtG5ksvLYXVAqXRcI/dgQmZoqMGkRn/ix0CjfRa5Idk=; 
	b=RnY+5PXSzXDbHVPO4h8UX6Ca/IBPGrIAI5hxlYogkW4CHELxfY47G3EldiTMEckMth0TcS8BGiSwGEB3Mfn4hcf1H4UKaNKxtdPn9Vf0dR1DuXyx96mTtHMNJqAyG3vni4QhU+Ug5K/AqENARFQZH7A1Lhm4BVRY0TExzhJ5zWQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745311640;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=KtG5ksvLYXVAqXRcI/dgQmZoqMGkRn/ix0CjfRa5Idk=;
	b=DpYwdLvrzBVaRka+G7EvH5x6EgRk2lG5xXQgiam/qzcVVv9r3RiK9DEskff4ejT2
	kSuSgYZsrWM7Yuj6TNUsCgLA32ag6oz28i6izwflto1QAvqU0+QoO5vkUn5UQ0GkHzS
	LGu+KdNrLOwauoeV/mT/G9PMrKOrGNJGoyX9W3hM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1745311638259917.1867112371721; Tue, 22 Apr 2025 01:47:18 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:47:18 +0800
From: Li Chen <me@linux.beauty>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
In-Reply-To: 
Subject: [PATCH RESEND] x86/smpboot: avoid SMT domain attach/destroy if SMT
 is not enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

From: Li Chen <chenl311@chinatelecom.cn>

Currently, the SMT domain is added into sched_domain_topology
by default if CONFIG_SCHED_SMT is enabled.

If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_weight
is just 1, it will destroy_sched_domain it.

On a large machine, such as one with 512 cores, this results in
512 redundant domain attach/destroy operations.

We can avoid these unnecessary operations by simply checking
cpu_smt_num_threads and not inserting SMT domain into x86_topology if SMT
is not enabled.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---

[RESEND] because I forgot to add any mailing list previously.

arch/x86/kernel/smpboot.c | 8 +++++---
1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index d6cf1e23c2a3..da6192e1af12 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -485,9 +485,11 @@ static void __init build_sched_topology(void)
    int i =3D 0;

#ifdef CONFIG_SCHED_SMT
-    x86_topology[i++] =3D (struct sched_domain_topology_level){
-        cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
-    };
+    if (cpu_smt_num_threads > 1) {
+        x86_topology[i++] =3D (struct sched_domain_topology_level){
+            cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
+        };
+    }
#endif
#ifdef CONFIG_SCHED_CLUSTER
    x86_topology[i++] =3D (struct sched_domain_topology_level){
--
2.48.1

