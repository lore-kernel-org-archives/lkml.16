Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74143199FA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729753; cv=none; b=HsAdKt6TojYnB+oEhwdUdtb3kZT0k86IpGlZfsQY/5IOsvEq8SWffc0Q3sjS4i20B542ZcBM6prRd23Tb32dqJZlZ+Gi7yfRZ0bt2EAxaBWmR0xFlTuIzO02GyJi2HP9IgxvW4lSduMcBpKsN7HmVCsD4ErRBhXgB7iW5/398fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729753; c=relaxed/simple;
	bh=1Dp4ykfJXr1A8wQl88tJK/wbSIcUXrNLVhrIh2+jAyw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LvgNceX6NTL+scX1MVSpfvxQM4VhHy4FHCId1mvLmNXOvKEn2xrfaQaY2ory2ywvJqBns6ivumf7GklsEzC6hkqCqHJw+ymZBSdAm4c9PJgLFtAm3NnJUKCVMgpRv6MunchWxFyCRNwm73eS1csLo3B68q1BbUl++ino6WtwSBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com; spf=none smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b=e30qjCRm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b="e30qjCRm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso5929503a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20230601.gappssmtp.com; s=20230601; t=1744729751; x=1745334551; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Rq73IbpUmNtbdh1FOL4RVMdkG0NHYMFilgFpf4Rdoc=;
        b=e30qjCRmUJyVph9RqedjI8swIArouPu8Agv0ehfMJJfq28MRLzrz3qdk3WG0WfnWss
         B75JqG/29Z9yjGGOPi2MUzce7LP1K+aWOyCXdmcpgniODMiWZ2dqIn6cwcyYX/+QmgTx
         GF4Hz2bXXXM7YQIZ8QAX+23pmLp6pQYFs1JFUXDVhnDxsTNlIY2je1DghJ7Z4SloPwY9
         K0nh3GRiZG/If6yplj+gd3mBpLtU552600U1vjSATnpuFpVVCDMqxo9Ds+wIYgoAi3qq
         CRSFftR0Rz9ebECjRgMb5DxhfkjFVSvvG/gQpcCxiVkSSWPiCORVqqAMntBUHUiaUSTr
         va7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729751; x=1745334551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Rq73IbpUmNtbdh1FOL4RVMdkG0NHYMFilgFpf4Rdoc=;
        b=IzXfkNJY6Wy7/SvpZ1ZaiP0GQl05jk5Lf38qVqfHaTyRE4a3mzwo48v5+cNAG7ogEp
         ArNGK2tYJj1iUBVt5IjKoIUwZabDlPRiLMHNVNLGgzGkqq4mMn+FPhJ74GzXgDXZVNxa
         pyNO96evu6yz/R6R9Fa8YGLHGeRthcck4m0937c8I85i6b28rTJPfMnLzIu+vb+s0PNm
         iIh/lIPw4NbS7rKoNSK9Z13i1hr7reRyogAQxM0BqKF7plbZIqFt55aLgmuxKpbk0EKz
         GXrM/jscNfBTy2gMerNMtNBzGX7VAaocseDK0CAcvIbjx0ecX/Rkz7MBpTXsQOWJxfiP
         wReg==
X-Forwarded-Encrypted: i=1; AJvYcCUw1qkti75ZfjMjhVzhDzF9orZFNTi4VpYIGeGk3xqsl1ZtR3ZGM58Ee/42yG8fU4iKJ/RTCAuIWWCU1zs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VFhYnDoV36yo2icG/7DdmpMcK2e+8UV8uUtxoKrOy8Mjrbzy
	z9um+DhVz+mNoEu/eHpC2YzCZR+k5maJlro8s9aMqNt3j2S9x7N3WEz3pPjl6eY=
X-Gm-Gg: ASbGncu2gkAMiMpQh2Brh4ulR3yVQjvyUmPwgQrYfR3Hsl7dyGJWIbgYKy7j44/5Hm5
	r6nqge+DItj7KKGy8n7k42Cn66AP4GK36jcAbd79dzMrkVGihw1LUPhOCJZd4N6+SBBTkW2UOJd
	yMgoXvW7UL1zmOmOdWfUmHYZnT9qJ+0xy6ypnExpp5J6gSiKkj/w/WN6FLKJkfSn+weYorQ4OXg
	fF20tpo+O47zFK324Rk98yQqsVAHO+vUHQI1jkvr3odNKq/cyIlmrDSNf1gQonBZwtRJV7tFzI9
	wPLlR9rQl8r4ykpdMjbRZs7JNy3TqWI5HpLAKJSr2P8=
X-Google-Smtp-Source: AGHT+IFKXx8B3GB3eZVGQf50YCeku81UOza8x5Lsxk7p5cMtrXUHnRiBtRcjsGpqtgvr2s85lCgtXA==
X-Received: by 2002:a17:90b:2f05:b0:303:703f:7f8 with SMTP id 98e67ed59e1d1-3082367fac1mr20946681a91.34.1744729750330;
        Tue, 15 Apr 2025 08:09:10 -0700 (PDT)
Received: from smtpclient.apple ([103.85.74.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3082a58c27csm8475039a91.20.2025.04.15.08.09.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Apr 2025 08:09:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
From: Jiewei Ke <jiewei@smartx.com>
In-Reply-To: <424fe473-8472-42b8-99c7-8b0534771343@flourine.local>
Date: Tue, 15 Apr 2025 23:08:55 +0800
Cc: wagi@kernel.org,
 hare@suse.de,
 hch@lst.de,
 jmeneghi@redhat.com,
 kbusch@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org,
 mkhalfella@purestorage.com,
 randyj@purestorage.com,
 sagi@grimberg.me
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A03047E-4267-42E7-A1BB-E0D86FC57986@smartx.com>
References: <8F2489FD-1663-4A52-A50B-F15046AC2878@163.com>
 <424fe473-8472-42b8-99c7-8b0534771343@flourine.local>
To: Daniel Wagner <dwagner@suse.de>
X-Mailer: Apple Mail (2.3774.300.61.1.2)

Hi Daniel,

> 2025=E5=B9=B44=E6=9C=8815=E6=97=A5 20:34=EF=BC=8CDaniel Wagner =
<dwagner@suse.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Jiewei,
>=20
> On Thu, Apr 10, 2025 at 11:44:13PM +0800, Jiewei Ke wrote:
>> I just noticed that your patchset addresses a similar issue to the =
one I =E2=80=99m
>> trying to solve with my recently submitted patchset [1]. Compared to =
your
>> approach, mine differs in a few key aspects:
>>=20
>> 1. Only aborted requests are delayed for retry. In the current =
implementation,
>> nvmf_complete_timed_out_request and nvme_cancel_request set the =
request status
>> to NVME_SC_HOST_ABORTED_CMD. These requests are usually already sent =
to the
>> target, but may have timed out or been canceled before a response is =
received.
>> Since the target may still be processing them, the host needs to =
delay retrying
>> to ensure the target has completed or cleaned up the stale requests. =
On the
>> other hand, requests that are not aborted =E2=80=94 such as those =
that never got
>> submitted due to no usable path (e.g., from nvme_ns_head_submit_bio), =
or those
>> that already received an ANA error from the target =E2=80=94 do not =
need
>> delayed retry.
>=20
> If I understand you correctly, you are concerned about delaying all
> commands even these which are not transmitted yet. If there are no
> garantees on ordering it would be possible to failover these commands
> immediately. Sure something which could be improved in my series.

Yes, your patchset delays all commands. In fact, some distinction needs =
to be made:
commands with path errors and those that haven't been sent yet can be =
failed over
immediately. You might consider applying the delay only to commands with =
status
NVME_SC_HOST_ABORTED_CMD.

>> 2. The host explicitly disconnects and stops KeepAlive before delay =
scheduling
>> retrying requests. This aligns with Section 9.6 "Communication Loss =
Handling"
>> of the NVMe Base Specification 2.1. Once the host disconnects, the =
target may
>> take up to the KATO interval to detect the lost connection and begin =
cleaning
>> up any remaining requests. Retrying too early may still lead to data
>> corruption issues.
>=20
> The host error handler is executed thus all communication is stopped.
> This part hasn't changed. Not sure what you are referring too. The =
only
> thing which changes in this series is when we enqueue the failed
> commands again.

In your patch as shown below, I think nvme_schedule_failover should be =
called after
nvme_rdma_teardown_admin_queue for two reasons:

* nvme_rdma_teardown_io_queues will call nvme_cancel_tagset, and then =
the inflight
  commands will be added to the ctrl's request_list. So =
nvme_schedule_failover should be
  after nvme_rdma_teardown_io_queues to kick them.

* This does not follow the rule of starting the delay timer(aka =
nvme_schedule_failover)
   after all communication is stopped.

> @@ -2153,6 +2154,7 @@ static const struct blk_mq_ops =
nvme_rdma_admin_mq_ops =3D {
> =20
> static void nvme_rdma_shutdown_ctrl(struct nvme_rdma_ctrl *ctrl, bool =
shutdown)
> {
> + nvme_schedule_failover(&ctrl->ctrl);
> nvme_rdma_teardown_io_queues(ctrl, shutdown);
> nvme_quiesce_admin_queue(&ctrl->ctrl);
> nvme_disable_ctrl(&ctrl->ctrl, shutdown);
> nvme_rdma_teardown_admin_queue(ctrl, shutdown);

>> @@ -2178,6 +2180,7 @@ static void nvme_rdma_shutdown_ctrl(struct =
nvme_rdma_ctrl *ctrl, bool shutdown)
>> nvme_quiesce_admin_queue(&ctrl->ctrl);
>> nvme_disable_ctrl(&ctrl->ctrl, shutdown);
>> nvme_rdma_teardown_admin_queue(ctrl, shutdown);
>> + nvme_delay_kick_retry_lists(&ctrl->ctrl); <<< delay kick retry
>> after teardown all queues
>=20
> Without the kick it hangs. The admin has explicitly removed the ctrl.
>=20
> As I already said, this is a RFC for the sake to figure out if this
> approach is a good idea. We all agreed, we should first try to sort =
this
> out before introducing a new queue. There are many problems which it
> will introduce, like the one from above 'why delaying not send
> requests?', 'What happens when we have several short
> disconnects/connects?', ...
>=20
> BTW, there is already a hack in disconnect/connect state transition.
> Ideally we solve this in a more generic manner.

I agree that introducing a controller-level queue is necessary, these =
commands pending
retry should be uniformly delayed after the controller finishes =
disconnecting.

Regarding the issue of multiple connections and disconnections, in my =
patchset I avoided
using delayed_work, and instead used a synchronous msleep approach. This =
prevents
premature retries.

If we use delayed_work, the following issue may arise: during a =
controller reset, suppose
an inflight command (command 1) is canceled and added to the =
controller=E2=80=99s request_list,
then the connection is torn down and nvme_schedule_failover is called. =
Command 1 will
be scheduled to retry after 30 seconds. And then the reconnection =
completes, but
command 2 encounters an I/O timeout and is also added to the =
request_list. At this point,
the 30-second delay expires, and command 2 might be mistakenly retried =
immediately.

The current state machine cannot avoid this issue if using delayed_work.

Thanks,
Jiewei=
