Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332E15098F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386489; cv=pass; b=MQg/8D8gTV5mJJWsV0yEEBqcfOViiCQBCyjKeTtEKVJUR6Z7jopYQE81Y/IvEu8SfIyVUviNL8xX5s3XejHN2kFZKIoML/iqDjdTY+oD598mI6aZf8GRG7Hu0o9DqM8tJKp2iXH4CDcYlS7iscpR5GpsjOoq48b5MzfpiC7m3Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386489; c=relaxed/simple;
	bh=cRMjQnGbRLO2a/lzUo7NWb9b766pWsz2zW9Pr0ijW5I=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HFGGG0Y23CpFVUYATFcltOnEO1GcxffRsL66C/cztzxao1OMxwfaw2DUqHX2klhJQH83091KfntX/bz9OAkzQA1sfquuV/CO72Fsi42Yz/0Rbs26xYdmOOnZVU80h8zgGJh9uVtRymgRKafDaqHWchLJcROvFwfV1xIfPhBLefE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=d+dE8qlz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="d+dE8qlz"
ARC-Seal: i=1; a=rsa-sha256; t=1750386454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EVQcQ+dSr9dWPN0m6N4kBxweGO/KQI026kdyC/r+tvaYu52c5m//HDcPFm39abYHOlo5UiEL02KSxLKBZzZqrO9Lmj3C0bFdFRMaLs8RuqrGsJX+Ih12YFtSElIjVPhQBWs9tV9UzMHvkCo7UcF1+K/eVoRAGVLhGYWy0E2oE5g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750386454; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=e8cKjkVou50pLK/2YYUB58h1KPp8lfD6jgUscJYxNvA=; 
	b=GpyUz2SMhLeik7Zm1wxraou/ahBAST+0UG24edX8ehZ/UszAKOb90nezJWttSoVW9DSN/DZ2XKS+8pRONNQWhR/dA4q7shMNuvM8RZhH6yylI5Wt1T7ycofow8+2fpLK1PE9kpBmiu60J6bIEBwITrofGHDs9U/PPdbHJOVkgJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750386454;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=e8cKjkVou50pLK/2YYUB58h1KPp8lfD6jgUscJYxNvA=;
	b=d+dE8qlzqyWIDGPRruYmgS5xpeZhHyJ2dhZbXmGTnrhRARJ9o1iF8K2wQQr1TNq+
	E6X980DCqHGIU55Bll8HwubILWQWZwKbj/6IwkAMFZipef6aKyhrdiMCSDx8KtRaSzu
	mAkxGslawa41W6YqkHzy/hNrU/6mm8zOyVoCezu8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750386451383502.4636524387738; Thu, 19 Jun 2025 19:27:31 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:27:31 +0800
From: Li Chen <me@linux.beauty>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1978b29a34b.dbd6def8716427.2074630307673917130@linux.beauty>
In-Reply-To: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
References: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
Subject: Re: [PATCH RESEND] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
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

Gentle ping.

 ---- On Tue, 22 Apr 2025 16:47:18 +0800  Li Chen <me@linux.beauty> wrote -=
--=20
 > From: Li Chen <chenl311@chinatelecom.cn>
 >=20
 > Currently, the SMT domain is added into sched_domain_topology
 > by default if CONFIG_SCHED_SMT is enabled.
 >=20
 > If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_wei=
ght
 > is just 1, it will destroy_sched_domain it.
 >=20
 > On a large machine, such as one with 512 cores, this results in
 > 512 redundant domain attach/destroy operations.
 >=20
 > We can avoid these unnecessary operations by simply checking
 > cpu_smt_num_threads and not inserting SMT domain into x86_topology if SM=
T
 > is not enabled.
 >=20
 > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
 > ---
 >=20
 > [RESEND] because I forgot to add any mailing list previously.
 >=20
 > arch/x86/kernel/smpboot.c | 8 +++++---
 > 1 file changed, 5 insertions(+), 3 deletions(-)
 >=20
 > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
 > index d6cf1e23c2a3..da6192e1af12 100644
 > --- a/arch/x86/kernel/smpboot.c
 > +++ b/arch/x86/kernel/smpboot.c
 > @@ -485,9 +485,11 @@ static void __init build_sched_topology(void)
 >     int i =3D 0;
 >=20
 > #ifdef CONFIG_SCHED_SMT
 > -    x86_topology[i++] =3D (struct sched_domain_topology_level){
 > -        cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
 > -    };
 > +    if (cpu_smt_num_threads > 1) {
 > +        x86_topology[i++] =3D (struct sched_domain_topology_level){
 > +            cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
 > +        };
 > +    }
 > #endif
 > #ifdef CONFIG_SCHED_CLUSTER
 >     x86_topology[i++] =3D (struct sched_domain_topology_level){
 > --
 > 2.48.1
 >=20
 >=20

Regards,
Li
