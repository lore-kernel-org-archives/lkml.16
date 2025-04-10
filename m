Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6011EB5CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299935; cv=none; b=ROSXfDKJ72uL3bwt2jGMjLdfOOy9qVRBmIiP9aAIv2BVrpL6RjWtRkecQjHdcm+4iY84Bc/EMxGwzEak+ItH5Chf9569KL11GA/v99P2wk6P30/+aNCMtztFPgkjCn06u4K02EBrrIXawuF2wl+871QSrJJPjv0clU4QtF1m9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299935; c=relaxed/simple;
	bh=MFygQ21RGHFUCfZIewdn4nOoKvWfvo5JqpXAlO1uPAo=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=AwdX6+8Eb5rVwKIbohMRuWQge9BMw9whQqYnPqhQ0GvLkajGVIr+3YQnBKailHVDaF0HcIh/CVpnm9qnTNCGEl7+XIeGsRke6K0/+A9JOTXhB9U6NpL1CLZQMbTyfnzsycf/aP3zcqBObftaeTCYezR2J75R5sFbaGd4ky1REgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CUckBeP4; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CUckBeP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Content-Type:Mime-Version:Subject:Message-Id:
	Date; bh=XmzJ0B3tkv+LYfXo4ZQdoshwYFl3CPuXjYiiwnEPV14=; b=CUckBeP
	4xNz8ChkttGWTbXPxsN4Ud0GyNAfBqUTO0UlUGIsU16+2080AW5NJdUFr7XMJW0X
	sothGBew2tXj/94Xx+WPfv1yuYfvPMfI6rwbHUNXHjD6z1xvkJ5FDl8/d4gf8vzp
	vRdf4h9mtF9UZhJbdyb6z0HBH+k0LE04QdYE=
Received: from smtpclient.apple (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXDp5X5_dnkCc5CA--.28716S3;
	Thu, 10 Apr 2025 23:44:26 +0800 (CST)
From: Jiewei Ke <jiewei_ke@163.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-Id: <8F2489FD-1663-4A52-A50B-F15046AC2878@163.com>
Date: Thu, 10 Apr 2025 23:44:13 +0800
Cc: hare@suse.de,
 hch@lst.de,
 jmeneghi@redhat.com,
 kbusch@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org,
 mkhalfella@purestorage.com,
 randyj@purestorage.com,
 sagi@grimberg.me
To: wagi@kernel.org
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CM-TRANSID:PygvCgBXDp5X5_dnkCc5CA--.28716S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr1rKw45GFW5ZF4kCr17ZFb_yoWrGFW5pF
	Z3WwsrCrZ2qFWUK34kAr17Xry5u3ykZry7J3WSk3y8Cws8J3yUZr4kKF1UZFW5urWvgFy3
	CrWUtr97XFs29w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYJmUUUUUU=
X-CM-SenderInfo: 5mlh4vplbnvqqrwthudrp/1tbiERcrlmf34jv1IgAAsl

Hi Daniel,

I just noticed that your patchset addresses a similar issue to the one I =
=E2=80=99m
trying to solve with my recently submitted patchset [1]. Compared to =
your
approach, mine differs in a few key aspects:

1. Only aborted requests are delayed for retry. In the current =
implementation,
nvmf_complete_timed_out_request and nvme_cancel_request set the request =
status
to NVME_SC_HOST_ABORTED_CMD. These requests are usually already sent to =
the
target, but may have timed out or been canceled before a response is =
received.
Since the target may still be processing them, the host needs to delay =
retrying
to ensure the target has completed or cleaned up the stale requests. On =
the
other hand, requests that are not aborted =E2=80=94 such as those that =
never got
submitted due to no usable path (e.g., from nvme_ns_head_submit_bio), or =
those
that already received an ANA error from the target =E2=80=94 do not need =
delayed retry.

2. The host explicitly disconnects and stops KeepAlive before delay =
scheduling
retrying requests. This aligns with Section 9.6 "Communication Loss =
Handling"
of the NVMe Base Specification 2.1. Once the host disconnects, the =
target may
take up to the KATO interval to detect the lost connection and begin =
cleaning
up any remaining requests. Retrying too early may still lead to data =
corruption issues.

@@ -2178,6 +2180,7 @@ static void nvme_rdma_shutdown_ctrl(struct =
nvme_rdma_ctrl *ctrl, bool shutdown)
 	nvme_quiesce_admin_queue(&ctrl->ctrl);
 	nvme_disable_ctrl(&ctrl->ctrl, shutdown);
 	nvme_rdma_teardown_admin_queue(ctrl, shutdown);
+	nvme_delay_kick_retry_lists(&ctrl->ctrl); <<< delay kick retry =
after teardown all queues
 }

3. Delayed retry of aborted requests is supported across multiple =
scenarios,
including error recovery work, controller reset, controller deletion, =
and
controller reconnect failure handling. Here's the relevant code for =
reference.

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 9109d5476417..f07b3960df7c 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2449,6 +2449,7 @@ static int nvme_tcp_setup_ctrl(struct nvme_ctrl =
*ctrl, bool new)
 destroy_admin:
 	nvme_stop_keep_alive(ctrl);
 	nvme_tcp_teardown_admin_queue(ctrl, new);
+	nvme_delay_kick_retry_lists(ctrl); <<< requests may be timed out =
when ctrl reconnects
 	return ret;
 }

@@ -2494,6 +2495,7 @@ static void nvme_tcp_error_recovery_work(struct =
work_struct *work)
 	nvme_tcp_teardown_admin_queue(ctrl, false);
 	nvme_unquiesce_admin_queue(ctrl);
 	nvme_auth_stop(ctrl);
+	nvme_delay_kick_retry_lists(ctrl); <<< retry_lists may contain =
timed out or cancelled requests

 	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING)) {
 		/* state change failure is ok if we started ctrl delete =
*/

@@ -2513,6 +2515,7 @@ static void nvme_tcp_teardown_ctrl(struct =
nvme_ctrl *ctrl, bool shutdown)
 	nvme_quiesce_admin_queue(ctrl);
 	nvme_disable_ctrl(ctrl, shutdown);
 	nvme_tcp_teardown_admin_queue(ctrl, shutdown);
+	nvme_delay_kick_retry_lists(ctrl); <<< retry_lists may contain =
timed out or cancelled requests when ctrl reset or delete
 }

Besides, in nvme_tcp_error_recovery_work, the delayed retry must occur =
after
nvme_tcp_teardown_io_queues, because the teardown cancels requests that =
may need
to be retried too.

One limitation of my patchset is that it does not yet include full CQT =
support,
and due to testing environment constraints, only nvme_tcp and nvme_rdma =
are
currently covered.

I=E2=80=99d be happy to discuss the pros and cons of both approaches -- =
perhaps we can
combine the best aspects.

Looking forward to your thoughts.

Thanks,
Jiewei

[1] =
https://lore.kernel.org/linux-nvme/20250410122054.2526358-1-jiewei@smartx.=
com/=

