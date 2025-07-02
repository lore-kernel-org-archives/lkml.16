Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB11DF985
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479229; cv=none; b=mBEClhhJnZ2wQ56r6Twls/z1ROojfNpHdmKkcm06HpaYRNvljM9A1XLgQAONw1gdylLDRGJe3MtQZeQX/VfqJ1rJDmyOtfohZELkaAyCNW6UsnByEl3LkJF/imrNjjbpN1kR90CRqM8Wa0ImvaZhqdBtcR/5EnX+5UMKmZsGK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479229; c=relaxed/simple;
	bh=Xuf8spfkvfIo+eGfCyGQMHBz1btYuIytxrfSCrx49r4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ul7RxDYSCttW5puyjxwMBnZfWuZtjjngd+7ptQnA8TYiyDqL4eZD7EZU4kTDbYKOsKtehb71U8V1yvIg0kCqci8N7+lPkQxqXigeXwA69mzIxhyqr+deLD4l1j4QsU8hw1dFqSL1WEBcH7/Nq8dOhGG2OuBocJyN1oWClNvJb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=VyXOKgLd; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="VyXOKgLd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f6iyMujqzrnDdTrj2XYolFf5/B5KQ6CxEHYDhUWsZUs=; b=VyXOKgLdtwMiyD+TNZzq/DJ596
	HAxbHYhWWTNOxEQOqK5a7NGketWneY0ww6OMq5nrjfAqf2eFOjsxFaRy5kAgngZog5dp6zdtWPi78
	VFsE1cezNzirW8fTtCBLGGwPECHdLwl8lWq964p0kNZLVfk32eZ6Iu5t72sbFrpv2CvQuOABLfDae
	HogNrXz/CEemlPxcyB/Bkbao3NjbTtI4AgZgh12toZQ8K6560rUEQb9QDQIhgdjrbX7wDyrOExYfG
	tW+Gm39PEVABDmZ28cgDmLZUmm5mn89OEhXPGuwbvvrsBaRDgh/ZDdDeqruQ2prRFm5VJgFEm60UN
	BR9SWMdw==;
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uX1kR-000000005l0-0KOv;
	Wed, 02 Jul 2025 13:59:55 -0400
Date: Wed, 2 Jul 2025 13:59:54 -0400
From: Rik van Riel <riel@surriel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
 syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 neeraj.upadhyay@kernel.org, paulmck@kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, x86@kernel.org, kernel-team
 <kernel-team@meta.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH] smp: Wait for enqueued work regardless of IPI sent
Message-ID: <20250702135954.7a00497d@fangorn>
In-Reply-To: <aGVwAtUi8eKNT8Jy@yury>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
	<366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
	<CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
	<CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
	<874ivuldog.ffs@tglx>
	<aGVwAtUi8eKNT8Jy@yury>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jul 2025 13:44:34 -0400
Yury Norov <yury.norov@gmail.com> wrote:

> Thank you guys for explaining that and sorry for the buggy patch.
> I was actually under impression that run_remote duplicates nr_cpus !=3D0,
> and even have a patch that removes run_remote.
>=20
> Maybe worth to add a comment on what run_remote and nr_cpus track?

This thread did surface some useful content, and Jann also pointed out
a good optimization that can be made, by not setting run_remote if
"func" tells us to skip remote CPUs.

Thomas, please let me know if you already reverted Yury's patch,
and want me to re-send this without the last hunk.

---8<---
=46rom 2ae6417fa7ce16f1bfa574cbabba572436adbed9 Mon Sep 17 00:00:00 2001
From: Rik van Riel <riel@surriel.com>
Date: Wed, 2 Jul 2025 13:52:54 -0400
Subject: [PATCH] smp: Wait for enqueued work regardless of IPI sent

Whenever work is enqueued with a remote CPU, smp_call_function_many_cond()
may need to wait for that work to be completed, regardless of whether or
not the remote CPU needed to be woken up with an IPI, or the work was
being added to the queue of an already woken up CPU.

However, if no work is enqueued with a remote CPU, because "func"
told us to skip all CPUs, do not wait.

Document the difference between "work enqueued", and "CPU needs to be
woken up"

Signed-off-by: Rik van Riel <riel@surriel.com>
Suggested-by: Jann Horn <jannh@google.com>
Reported-by: syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com
Fixes: a12a498a9738 ("smp: Don't wait for remote work done if not needed in=
 smp_call_function_many_cond()")
---
 kernel/smp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 84561258cd22..c5e1da7a88da 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -802,7 +802,6 @@ static void smp_call_function_many_cond(const struct cp=
umask *mask,
=20
 	/* Check if we need remote execution, i.e., any CPU excluding this one. */
 	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
-		run_remote =3D true;
 		cfd =3D this_cpu_ptr(&cfd_data);
 		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
 		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
@@ -816,6 +815,9 @@ static void smp_call_function_many_cond(const struct cp=
umask *mask,
 				continue;
 			}
=20
+			/* Work is enqueued on a remote CPU. */
+			run_remote =3D true;
+
 			csd_lock(csd);
 			if (wait)
 				csd->node.u_flags |=3D CSD_TYPE_SYNC;
@@ -827,6 +829,10 @@ static void smp_call_function_many_cond(const struct c=
pumask *mask,
 #endif
 			trace_csd_queue_cpu(cpu, _RET_IP_, func, csd);
=20
+			/*
+			 * Kick the remote CPU if this is the first work
+			 * item enqueued.
+			 */
 			if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
 				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
 				nr_cpus++;
@@ -843,8 +849,6 @@ static void smp_call_function_many_cond(const struct cp=
umask *mask,
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
-		else
-			run_remote =3D false;
 	}
=20
 	/* Check if we need local execution. */
--=20
2.49.0


