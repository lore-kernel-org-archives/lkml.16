Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E922837F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781335; cv=none; b=dTVlb+LcBg1Ik/5T/U4zSD4DzmUXO2hXCzBS9hDSVXyPVgNgXUg61vvhxHU3Iymsf6s3Iw39qkvqot8ZHPg5rSnjBmnWSbweeyjMdPn1M+TZAPymBrSpMZCwXxrnIddLAKnijFS7EYq7m7V7KOag8w87acTXQCBDuf/3v/CxAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781335; c=relaxed/simple;
	bh=HUDRZvq5FdPxLGNy2+hnBvl4Z1n0T7sjEmHE2wsxyD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYX67nCu9k+LhetQK2kJGpNZIh6TjLNh1LjgGMnElOe9YfLFXjWA37Jzq+YKPcGcA5jFq0oVBC1fkbgBUNDBBpvH+up+PupRq/cE6b3BSokgiSMvmvwjSLcEVWqA4Tt3ybsngJhhwN0JeLUnlPeHAVBbhl3XgaHTuKP5NCO5YVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raP/Jepy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raP/Jepy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07D7C4CEE2;
	Wed, 16 Apr 2025 05:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744781335;
	bh=HUDRZvq5FdPxLGNy2+hnBvl4Z1n0T7sjEmHE2wsxyD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raP/JepyCV7bUkmDEuQ2IFlscYdMHjgwTtl1K5x1AwzXcR0VpnPRxXl2d0zI/7GKm
	 T2ocsDbKd+3PDtTbPAWKORVyc4593qrwbmgWwzWIbiqsnZ4GrXnA0YQplpxSvvWS/Q
	 3hyAnKlhOoclumtLmMD2mldl/gv16sK3EcTqBw8LHyh4vpeR2oRynJLABqzY+P2Xj6
	 4xSJr0SDSkcaL1PUF1W9parKZ8+kMWnFVkhprHiTQLS4cg5IYW0WxWaobCD4Y6QMHO
	 jkzafoPxMKJH5zp5O0HVDdtlVQ5V1L+7bgBTgzpnJo+HYOqoPTc/vGmPL6eIqmWuJi
	 06FOjoxJ66lpA==
Date: Wed, 16 Apr 2025 07:28:49 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Message-ID: <Z_9AEaeUIdWi2vLS@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
 <20250414102301.332225-3-mingo@kernel.org>
 <CAHk-=wgCFJ923gMqPYq5YrqUuLM3He-O7wvLfpvwNrySSK0vMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgCFJ923gMqPYq5YrqUuLM3He-O7wvLfpvwNrySSK0vMw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 14 Apr 2025 at 03:23, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > We'd like to introduce timer_mod() in the kernel, so make
> > sure the namespace is clear.
> 
> No no, this is horribly wrong.

Yeah, that was a horrible script fail, I sent the updated -v2 patch 2 
days ago (and it was updated in the Git tree then too):

  https://lore.kernel.org/all/Z_0oWnbcjsekHXJd@gmail.com/

Unfortunately you weren't Cc:-ed for Thomas Weißschuh's reply, so you 
probably didn't see the fixed patch.

Thanks,

	Ingo

=============>
From 48f2aff7501a6dd1154297b7a00e0f2fbea36e24 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 14 Apr 2025 11:23:06 +0200
Subject: [PATCH] scsi: bfa: Rename 'timer_mod' to 'timer_module'

We'd like to introduce timer_mod() in the kernel, so make
sure the namespace is clear.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
---
 drivers/scsi/bfa/bfa.h         |  2 +-
 drivers/scsi/bfa/bfa_core.c    |  4 ++--
 drivers/scsi/bfa/bfa_ioc.c     | 16 ++++++++--------
 drivers/scsi/bfa/bfa_ioc.h     |  4 ++--
 drivers/scsi/bfa/bfa_modules.h |  2 +-
 drivers/scsi/bfa/bfad.c        |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/scsi/bfa/bfa.h b/drivers/scsi/bfa/bfa.h
index a6b8c4ddea19..80b75669fc50 100644
--- a/drivers/scsi/bfa/bfa.h
+++ b/drivers/scsi/bfa/bfa.h
@@ -429,7 +429,7 @@ bfa_status_t bfa_iocfc_israttr_set(struct bfa_s *bfa,
 void bfa_iocfc_enable(struct bfa_s *bfa);
 void bfa_iocfc_disable(struct bfa_s *bfa);
 #define bfa_timer_start(_bfa, _timer, _timercb, _arg, _timeout)		\
-	bfa_timer_begin(&(_bfa)->timer_mod, _timer, _timercb, _arg, _timeout)
+	bfa_timer_begin(&(_bfa)->timer_module, _timer, _timercb, _arg, _timeout)
 
 struct bfa_cb_pending_q_s {
 	struct bfa_cb_qe_s	hcb_qe;
diff --git a/drivers/scsi/bfa/bfa_core.c b/drivers/scsi/bfa/bfa_core.c
index a99a101b95ef..667a631a2abc 100644
--- a/drivers/scsi/bfa/bfa_core.c
+++ b/drivers/scsi/bfa/bfa_core.c
@@ -1526,14 +1526,14 @@ bfa_iocfc_attach(struct bfa_s *bfa, void *bfad, struct bfa_iocfc_cfg_s *cfg,
 	bfa_iocfc_cbfn.reset_cbfn = bfa_iocfc_reset_cbfn;
 
 	ioc->trcmod = bfa->trcmod;
-	bfa_ioc_attach(&bfa->ioc, bfa, &bfa_iocfc_cbfn, &bfa->timer_mod);
+	bfa_ioc_attach(&bfa->ioc, bfa, &bfa_iocfc_cbfn, &bfa->timer_module);
 
 	bfa_ioc_pci_init(&bfa->ioc, pcidev, BFI_PCIFN_CLASS_FC);
 	bfa_ioc_mbox_register(&bfa->ioc, bfa_mbox_isrs);
 
 	bfa_iocfc_init_mem(bfa, bfad, cfg, pcidev);
 	bfa_iocfc_mem_claim(bfa, cfg);
-	INIT_LIST_HEAD(&bfa->timer_mod.timer_q);
+	INIT_LIST_HEAD(&bfa->timer_module.timer_q);
 
 	INIT_LIST_HEAD(&bfa->comp_q);
 	for (i = 0; i < BFI_IOC_MAX_CQS; i++)
diff --git a/drivers/scsi/bfa/bfa_ioc.c b/drivers/scsi/bfa/bfa_ioc.c
index aa68d61a2d0d..4a9bd084cd5d 100644
--- a/drivers/scsi/bfa/bfa_ioc.c
+++ b/drivers/scsi/bfa/bfa_ioc.c
@@ -28,12 +28,12 @@ BFA_TRC_FILE(CNA, IOC);
 #define BFA_IOC_POLL_TOV	BFA_TIMER_FREQ
 
 #define bfa_ioc_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_ioc_timeout, (__ioc), BFA_IOC_TOV)
 #define bfa_ioc_timer_stop(__ioc)   bfa_timer_stop(&(__ioc)->ioc_timer)
 
 #define bfa_hb_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->hb_timer,		\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->hb_timer,		\
 			bfa_ioc_hb_check, (__ioc), BFA_IOC_HB_TOV)
 #define bfa_hb_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->hb_timer)
 
@@ -159,16 +159,16 @@ bfa_ioc_sm_to_state(struct bfa_ioc_sm_table *smt, bfa_ioc_sm_t sm)
  */
 
 #define bfa_iocpf_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_iocpf_timeout, (__ioc), BFA_IOC_TOV)
 #define bfa_iocpf_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->ioc_timer)
 
 #define bfa_iocpf_poll_timer_start(__ioc)				\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_iocpf_poll_timeout, (__ioc), BFA_IOC_POLL_TOV)
 
 #define bfa_sem_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->sem_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->sem_timer,	\
 			bfa_iocpf_sem_timeout, (__ioc), BFA_IOC_HWSEM_TOV)
 #define bfa_sem_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->sem_timer)
 
@@ -2333,11 +2333,11 @@ bfa_ioc_isr(struct bfa_ioc_s *ioc, struct bfi_mbmsg_s *m)
  */
 void
 bfa_ioc_attach(struct bfa_ioc_s *ioc, void *bfa, struct bfa_ioc_cbfn_s *cbfn,
-	       struct bfa_timer_mod_s *timer_mod)
+	       struct bfa_timer_mod_s *timer_module)
 {
 	ioc->bfa	= bfa;
 	ioc->cbfn	= cbfn;
-	ioc->timer_mod	= timer_mod;
+	ioc->timer_module	= timer_module;
 	ioc->fcmode	= BFA_FALSE;
 	ioc->pllinit	= BFA_FALSE;
 	ioc->dbg_fwsave_once = BFA_TRUE;
@@ -5062,7 +5062,7 @@ bfa_diag_memtest(struct bfa_diag_s *diag, struct bfa_diag_memtest_s *memtest,
 
 	memtest_tov = (bfa_ioc_asic_gen(diag->ioc) == BFI_ASIC_GEN_CT2) ?
 		       CT2_BFA_DIAG_MEMTEST_TOV : BFA_DIAG_MEMTEST_TOV;
-	bfa_timer_begin(diag->ioc->timer_mod, &diag->timer,
+	bfa_timer_begin(diag->ioc->timer_module, &diag->timer,
 			bfa_diag_memtest_done, diag, memtest_tov);
 	diag->timer_active = 1;
 	return BFA_STATUS_OK;
diff --git a/drivers/scsi/bfa/bfa_ioc.h b/drivers/scsi/bfa/bfa_ioc.h
index d70332e9ad6d..3fa8a65bf067 100644
--- a/drivers/scsi/bfa/bfa_ioc.h
+++ b/drivers/scsi/bfa/bfa_ioc.h
@@ -333,7 +333,7 @@ struct bfa_ioc_s {
 	bfa_ioc_sm_t		fsm;
 	struct bfa_s		*bfa;
 	struct bfa_pcidev_s	pcidev;
-	struct bfa_timer_mod_s	*timer_mod;
+	struct bfa_timer_mod_s	*timer_module;
 	struct bfa_timer_s	ioc_timer;
 	struct bfa_timer_s	sem_timer;
 	struct bfa_timer_s	hb_timer;
@@ -918,7 +918,7 @@ void bfa_ioc_set_ct2_hwif(struct bfa_ioc_s *ioc);
 void bfa_ioc_ct2_poweron(struct bfa_ioc_s *ioc);
 
 void bfa_ioc_attach(struct bfa_ioc_s *ioc, void *bfa,
-		struct bfa_ioc_cbfn_s *cbfn, struct bfa_timer_mod_s *timer_mod);
+		struct bfa_ioc_cbfn_s *cbfn, struct bfa_timer_mod_s *timer_module);
 void bfa_ioc_detach(struct bfa_ioc_s *ioc);
 void bfa_ioc_suspend(struct bfa_ioc_s *ioc);
 void bfa_ioc_pci_init(struct bfa_ioc_s *ioc, struct bfa_pcidev_s *pcidev,
diff --git a/drivers/scsi/bfa/bfa_modules.h b/drivers/scsi/bfa/bfa_modules.h
index ed29ebda30da..9911794286cc 100644
--- a/drivers/scsi/bfa/bfa_modules.h
+++ b/drivers/scsi/bfa/bfa_modules.h
@@ -61,7 +61,7 @@ struct bfa_s {
 	struct bfa_trc_mod_s	*trcmod;	/*  driver tracing	    */
 	struct bfa_ioc_s	ioc;		/*  IOC module		    */
 	struct bfa_iocfc_s	iocfc;		/*  IOCFC module	    */
-	struct bfa_timer_mod_s	timer_mod;	/*  timer module	    */
+	struct bfa_timer_mod_s	timer_module;	/*  timer module	    */
 	struct bfa_modules_s	modules;	/*  BFA modules	    */
 	struct list_head	comp_q;		/*  pending completions     */
 	bfa_boolean_t		queue_process;	/*  queue processing enabled */
diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index 598f2fc93ef2..695c77c5275d 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -691,7 +691,7 @@ bfad_bfa_tmo(struct timer_list *t)
 
 	spin_lock_irqsave(&bfad->bfad_lock, flags);
 
-	bfa_timer_beat(&bfad->bfa.timer_mod);
+	bfa_timer_beat(&bfad->bfa.timer_module);
 
 	bfa_comp_deq(&bfad->bfa, &doneq);
 	spin_unlock_irqrestore(&bfad->bfad_lock, flags);
