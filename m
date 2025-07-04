Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEEA31
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 00:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751589094; cv=none; b=nD96D+ni9HNb/yOnpGDwfJBLsmrum54PlA2mb8120aQOcFCbOfieExtPZ2gvkMDpwyvAyWoif6mOTOP5rLKhmF3JnKS3fF8aTRzLZNPtzaJgtFXp4D7aKXKoyybsJT38JrGpHl3XrmuUbEdeZM+zVIS8qWVzwxvvF3FmEpjpv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751589094; c=relaxed/simple;
	bh=72zDQTd5BmmYeY1nfHTe2maCok+0iQOLU6grGNy0p08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4jXiYJ8VJOR48EYy9zIAxRwZzXEhCxl/S7ILIxcrpUqdCyzUJKQoMRv389wkzPG7nZ6awRQwSmilync9/+g7h/4U+gUzwF8QCH02HOME6+4GGZqKkPxatpXbdp1JbgaQjnqb8w9kJTGJNjPGM/0Ry5VQEGLCdj4DLtE2l6SI44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=LGhtdO5F; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="LGhtdO5F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AOORWtoNtKLsZJgWY71g6pOF0AA/x+qOVBm+Q6RvWFo=; b=LGhtdO5F/dvV9SsL/rCTmZMLQG
	BbZNw1WQYinZCj4Co3U0t3CwsT0BaRkIhzPc8AkeegN2RLZR4yTeIKEn44Nar2/PWRhyvOyLv8EYb
	exfM9Io3fvCyBlE944GUrbYbLtauanHT78CLie2KPukIrjflmQISOT1ChMP6U9ykRpOsi5ev18X+o
	5Or9/T3IoKjsgK2M6RTuCMqKzZRNR7hqP+FFnxYej/apw8DF1SXwd4BaHvcs8DSQxYpS5fH7uXH/Q
	luY5M0IIl8lpyCH61Bhy6q4SKdlKrofQh/jxDLpwUIcYb0r8bosE+5r9SeDr/Y65DSy5XrMSdBj4K
	neQlWgIg==;
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uXUJn-000000002Dp-209v;
	Thu, 03 Jul 2025 20:30:19 -0400
Date: Thu, 3 Jul 2025 20:30:19 -0400
From: Rik van Riel <riel@surriel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>, Jann Horn <jannh@google.com>, syzbot
 <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 luto@kernel.org, mingo@redhat.com, neeraj.upadhyay@kernel.org,
 paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com,
 x86@kernel.org, kernel-team <kernel-team@meta.com>, David Hildenbrand
 <david@redhat.com>
Subject: [PATCH v2] smp: Wait for enqueued work regardless of IPI sent
Message-ID: <20250703203019.11331ac3@fangorn>
In-Reply-To: <87ikk9tdqs.ffs@tglx>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
	<366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
	<CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
	<CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
	<874ivuldog.ffs@tglx>
	<aGVwAtUi8eKNT8Jy@yury>
	<20250702135954.7a00497d@fangorn>
	<87ikk9tdqs.ffs@tglx>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025 18:56:11 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Wed, Jul 02 2025 at 13:59, Rik van Riel wrote:
> > Thomas, please let me know if you already reverted Yury's patch,
> > and want me to re-send this without the last hunk. =20
>=20
> I did so immediately after saying so in my previous reply. It's gone in
> tip and next.

Here is v2 of the patch, with the last hunk removed, and
the changelog adjusted to match the new context.

---8<---
=46rom 2ae6417fa7ce16f1bfa574cbabba572436adbed9 Mon Sep 17 00:00:00 2001
From: Rik van Riel <riel@surriel.com>
Date: Wed, 2 Jul 2025 13:52:54 -0400
Subject: [PATCH] smp: Wait only if work was enqueued

Whenever work is enqueued with a remote CPU, smp_call_function_many_cond()
may need to wait for that work to be completed. However, if no work is
enqueued with a remote CPU, because "func" told us to skip all CPUs,
there is no need to wait.

Set run_remote only if work was enqueued on remote CPUs.

Document the difference between "work enqueued", and "CPU needs to be
woken up"

Signed-off-by: Rik van Riel <riel@surriel.com>
Suggested-by: Jann Horn <jannh@google.com>
Reviewed-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletions(-)

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
--=20
2.49.0

