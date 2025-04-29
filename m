Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B92C3756
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934960; cv=none; b=nmHKAxctEi/w4kG9uA+BjqeLxtyDv1+0tDMhK+ZxhZuSNMdxr/Xs2LL7b+yddElLe1UAkkoIaUC3NLt9CPw7H5JxIuDkZPBYC74NGjIJfSf/piLNHbgMVCcG2vOIdDgJJQ0VJzvsXwXo1iaUJ6xmPtjAHFydFKaxx1FZLzT7oQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934960; c=relaxed/simple;
	bh=NmzptEY34b/cD3sHm369y3fOt+bMLPv5i30a0GyraAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq+XL/Q4MfeGd6VnRhqt+v69SLVMmmVBazD83GzuFSCcApjJiktH6LtdCIRNXwtejgTYaoqe1yN68CSsswJCbclSc1R3W0kdaCh7sKdP0bL5Dx2YNHToQrn9lrfms66Bo0BFfaqENw1/pvlZPkAwBpb6eCzYexkM20/4lC8DLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VYSbvAuS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Sx1JVVP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VYSbvAuS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Sx1JVVP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VYSbvAuS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Sx1JVVP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VYSbvAuS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Sx1JVVP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2CBE211E6;
	Tue, 29 Apr 2025 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745934956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udO+WsBoYmV4jCsI7FROJt1qzDWmTSKfWkfV1PNTgMU=;
	b=VYSbvAuSwtwvSwso4m7QyYC98eJxzR6BNPESyjeAsQXXNJ8uDcaGhrse38n8CtoaSHD5gH
	K3WHsKGinEeQAsiKx33wZSAbcsEKAVYcevV8KH0hNRc/pCRAclls5jQPEMun1Lx9rc0n6A
	wppKd31VIEGONSBqT1iVcLA32n849VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745934956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udO+WsBoYmV4jCsI7FROJt1qzDWmTSKfWkfV1PNTgMU=;
	b=3Sx1JVVPYSbAS3pxRMy1oBPkWz1zslajsqogw01IG26H4QUKTSqTVwLoo3rfTyLNjPNZxA
	cMZqpsSznCIALbDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745934956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udO+WsBoYmV4jCsI7FROJt1qzDWmTSKfWkfV1PNTgMU=;
	b=VYSbvAuSwtwvSwso4m7QyYC98eJxzR6BNPESyjeAsQXXNJ8uDcaGhrse38n8CtoaSHD5gH
	K3WHsKGinEeQAsiKx33wZSAbcsEKAVYcevV8KH0hNRc/pCRAclls5jQPEMun1Lx9rc0n6A
	wppKd31VIEGONSBqT1iVcLA32n849VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745934956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udO+WsBoYmV4jCsI7FROJt1qzDWmTSKfWkfV1PNTgMU=;
	b=3Sx1JVVPYSbAS3pxRMy1oBPkWz1zslajsqogw01IG26H4QUKTSqTVwLoo3rfTyLNjPNZxA
	cMZqpsSznCIALbDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF2961340C;
	Tue, 29 Apr 2025 13:55:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lMXQKWzaEGi8cgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 29 Apr 2025 13:55:56 +0000
Date: Tue, 29 Apr 2025 15:55:56 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Daniel Wagner <wagi@kernel.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
Message-ID: <6894c914-a734-4a7b-97cb-e9a344fa5560@flourine.local>
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
> On 4/28/25 14:44, Daniel Wagner wrote:
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index b502ac07483b..d3c4eacf607f 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
> >                  msleep(100);
> >          }
> > 
> > -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> > +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
> > +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> >                  return;
> > 
> >          nvme_unquiesce_io_queues(ctrl);
> 
> I would rather have a separate state for firmware activation.
> (Ab-)using the 'RESETTING' state here has direct implications
> with the error handler, as for the error handler 'RESETTING'
> means that the error handler has been scheduled.
> Which is not true for firmware activation.

Okay, so something like this here (untested, working on it)?


diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index b502ac07483b..32482712d0f2 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -565,6 +565,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 	case NVME_CTRL_LIVE:
 		switch (old_state) {
 		case NVME_CTRL_CONNECTING:
+		case NVME_CTRL_FW_ACTIVATION:
 			changed = true;
 			fallthrough;
 		default:
@@ -575,6 +576,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		switch (old_state) {
 		case NVME_CTRL_NEW:
 		case NVME_CTRL_LIVE:
+		case NVME_CTRL_FW_ACTIVATION:
 			changed = true;
 			fallthrough;
 		default:
@@ -596,6 +598,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		case NVME_CTRL_LIVE:
 		case NVME_CTRL_RESETTING:
 		case NVME_CTRL_CONNECTING:
+		case NVME_CTRL_FW_ACTIVATION:
 			changed = true;
 			fallthrough;
 		default:
@@ -621,6 +624,15 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 			break;
 		}
 		break;
+	case NVME_CTRL_FW_ACTIVATION:
+		switch (old_state) {
+		case NVME_CTRL_LIVE:
+			changed = true;
+			fallthrough;
+		default:
+			break;
+		}
+		break;
 	default:
 		break;
 	}
@@ -4529,7 +4541,7 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
 		 * recovery actions from interfering with the controller's
 		 * firmware activation.
 		 */
-		if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING)) {
+		if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FW_ACTIVATION)) {
 			requeue = false;
 			queue_work(nvme_wq, &ctrl->fw_act_work);
 		}
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 51e078642127..3a383225afed 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -247,6 +247,7 @@ static inline u16 nvme_req_qid(struct request *req)
  *				shutdown or removal. In this case we forcibly
  *				kill all inflight I/O as they have no chance to
  *				complete
+ * @NVME_CTRL_FW_ACTIVATION:	Controller is in firmware activation state.
  */
 enum nvme_ctrl_state {
 	NVME_CTRL_NEW,
@@ -256,6 +257,7 @@ enum nvme_ctrl_state {
 	NVME_CTRL_DELETING,
 	NVME_CTRL_DELETING_NOIO,
 	NVME_CTRL_DEAD,
+	NVME_CTRL_FW_ACTIVATION,
 };

 struct nvme_fault_inject {
