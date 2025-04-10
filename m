Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F22036F3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305236; cv=none; b=fl+cSNv7a8VJ3Pz5cOwdpoetwwKdq0RDyo7OAaN9J7nhWTWMyK6D5RA250vTwcCRQsipWEEYGYA8rnLmb7CXCXWv0vI+Qv/xik0O9LH6zQToUQlJQLyL9kVm1EjGrsiYahIbMAFsKlDh/T79NLHZoC4QyERe+ABpehCzuwkNGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305236; c=relaxed/simple;
	bh=r/WPmzNSOG7DnhnmxRVyxjV8aisZ4YY9NJhFvRVaLr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJVhyWcsocB8Ma9taEdnJnJo1L+tXz8A/mTQNAPRhPYKzZ3a64aTdHC/jJelMlExnT6r7v+qNANEmckTgYREAg6cHy90+Ep0bgUoZdwBOLBvDokEPWmKQXYBwk4B8MNHlsig5qEvaG00gJ4jAo0O//elYqAgsDgSCYtmQcWMwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com; spf=none smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b=hdHaDrMO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b="hdHaDrMO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22928d629faso11559095ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20230601.gappssmtp.com; s=20230601; t=1744305233; x=1744910033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq/VSDygxUvqusiASIxz5VUwIaO2iFyZjJyGjGC2vUg=;
        b=hdHaDrMO+AiifcN1/KxPIAliRtIrEHzWHa8s7TeUg2dnslsmryNr1Rj2wrWR+tYLek
         KST35IUbRnFRyyhJdBwHTZoz+2NIQNjL12FehCVCc7AlF4IhBZ6lM/Hkr0yjuLd92nOT
         1boaUgcUYNDc4/6xC2nhU22zSV6N6+qHeKWQzqRvShUc3W4afT4HccNjsUBMjFP6q7Lw
         E8z8eHvWiMc5ig0/uWSw+WcBT/gLZzvWmABLpyK3n7ySpCb2WisB33sqf/nooGF2zUbQ
         9wywyRnEdOMJCGZfWhcosOh2b9q4Bp0p84enjNpJ9Hs4Tvqa0GutvDygkfGi7JXfW6kl
         iK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305233; x=1744910033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq/VSDygxUvqusiASIxz5VUwIaO2iFyZjJyGjGC2vUg=;
        b=SEg27cyuAbSSNKCyKF9MZioD1KzkcU5WLxACQvy+Q+xYFujSLcuvgn/uBRDVBQp1an
         aZIyGByK63RvEtgB8u61ungE7x8ymNp+B+XRwSKzR9LfVaTk39++SDoaJSCP4427+vti
         Wrz0UP6ebotYOtupi3vpdQNzrnK/pv/3zw8Ak6WnfAkMctu/prIOsMvr/7Uxo+d6OSbK
         9cR7futNVPs5EdVziFYEDGMjrSEY/prHk4Ixs6Cbq5QfeX6as8Y8/hDhy+6+4i+GJWFR
         cckRfrJaMjoNKnKg/tKxQOmTdwW8/7fM6x7zaSoLlAxmP03o6HDdf/r0r1yaI6vz+0/8
         sBNg==
X-Forwarded-Encrypted: i=1; AJvYcCUFhhklcfc9Shen0NsnRMFZZHq6Q45D2+YTJmfC1OubFB3RUnCNO72p1Onl5w6xFqa6unLVhwh2eXKfVI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwreHSdz1U0ysaKqFKlCoqeX9xJSgUddLs1l4YKSud/JHuz92mE
	9z2d1Fkiyz1va0CsJIQi5lJXbUBqQ25SufVR4OSZsWDoBNgrMCC03VxXsvv7G0A=
X-Gm-Gg: ASbGncvBnEQLlmWiRNCxPFYB4PXKdx4Uq72xzwt5qL8+Meu5zPRAoYzSgokPSIvsPVH
	PGb2Qy52tPluEdS4Y4Hl5GRAuPOcPW/6p9ym0x/WkMO0FNbBSHyUMMXB0Y27Pg3+yBo9Hv9PmkD
	PImQW83NIdLSWcfvHocnhlysbsurd5xYuBsXDhowJvaOaklYJZn6s9yfye1WDRXsJUVSip3FVms
	vZ5dC2ZqhBBsJtghW3OYivPyME2sV6CeX4kiVfT61/9azO2tRCCBdiFekDWIvbvOEvnXdSD3GRU
	9J0LoCVQNp2WQPbYaHhmEbMTHA934aiJJz1JiE8/rwGfixULgBMsdw==
X-Google-Smtp-Source: AGHT+IG7qAV0tWMqHzjYRRs/ciOYKMfjBxdBqsj5qeEnoYzZvY7nHBvNuiM4SI4rYfKRFkQl7QhunA==
X-Received: by 2002:a17:903:1ab0:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-22be03902bdmr44796655ad.37.1744305232795;
        Thu, 10 Apr 2025 10:13:52 -0700 (PDT)
Received: from localhost.localdomain.com ([103.85.74.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7caf838sm33169365ad.162.2025.04.10.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:13:52 -0700 (PDT)
From: Jiewei Ke <jiewei@smartx.com>
To: wagi@kernel.org
Cc: hare@suse.de,
	hch@lst.de,
	jmeneghi@redhat.com,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	sagi@grimberg.me
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Date: Thu, 10 Apr 2025 13:13:44 -0400
Message-ID: <20250410171344.2579478-1-jiewei@smartx.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
References: <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

I just noticed that your patchset addresses a similar issue to the one I'm
trying to solve with my recently submitted patchset [1]. Compared to your
approach, mine differs in a few key aspects:

1. Only aborted requests are delayed for retry. In the current implementation,
nvmf_complete_timed_out_request and nvme_cancel_request set the request status
to NVME_SC_HOST_ABORTED_CMD. These requests are usually already sent to the
target, but may have timed out or been canceled before a response is received.
Since the target may still be processing them, the host needs to delay retrying
to ensure the target has completed or cleaned up the stale requests. On the
other hand, requests that are not aborted - such as those that never got
submitted due to no usable path (e.g., from nvme_ns_head_submit_bio), or those
that already received an ANA error from the target - do not need delayed retry.

2. The host explicitly disconnects and stops KeepAlive before delay scheduling
retrying requests. This aligns with Section 9.6 "Communication Loss Handling"
of the NVMe Base Specification 2.1. Once the host disconnects, the target may
take up to the KATO interval to detect the lost connection and begin cleaning
up any remaining requests.

@@ -2178,6 +2180,7 @@ static void nvme_rdma_shutdown_ctrl(struct nvme_rdma_ctrl *ctrl, bool shutdown)
 	nvme_quiesce_admin_queue(&ctrl->ctrl);
 	nvme_disable_ctrl(&ctrl->ctrl, shutdown);
 	nvme_rdma_teardown_admin_queue(ctrl, shutdown);
+	nvme_delay_kick_retry_lists(&ctrl->ctrl); <<< delay kick retry after teardown all queues
 }

3. Delayed retry of aborted requests is supported across multiple scenarios,
including error recovery work, controller reset, controller deletion, and
controller reconnect failure handling. Here's the relevant code for reference.

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 9109d5476417..f07b3960df7c 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2449,6 +2449,7 @@ static int nvme_tcp_setup_ctrl(struct nvme_ctrl *ctrl, bool new)
 destroy_admin:
 	nvme_stop_keep_alive(ctrl);
 	nvme_tcp_teardown_admin_queue(ctrl, new);
+	nvme_delay_kick_retry_lists(ctrl); <<< requests may be timed out when ctrl reconnects
 	return ret;
 }

@@ -2494,6 +2495,7 @@ static void nvme_tcp_error_recovery_work(struct work_struct *work)
 	nvme_tcp_teardown_admin_queue(ctrl, false);
 	nvme_unquiesce_admin_queue(ctrl);
 	nvme_auth_stop(ctrl);
+	nvme_delay_kick_retry_lists(ctrl); <<< retry_lists may contain timed out or cancelled requests

 	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING)) {
 		/* state change failure is ok if we started ctrl delete */

@@ -2513,6 +2515,7 @@ static void nvme_tcp_teardown_ctrl(struct nvme_ctrl *ctrl, bool shutdown)
 	nvme_quiesce_admin_queue(ctrl);
 	nvme_disable_ctrl(ctrl, shutdown);
 	nvme_tcp_teardown_admin_queue(ctrl, shutdown);
+	nvme_delay_kick_retry_lists(ctrl); <<< retry_lists may contain timed out or cancelled requests when ctrl reset or delete
 }

Besides, in nvme_tcp_error_recovery_work, the delayed retry must occur after
nvme_tcp_teardown_io_queues, because the teardown cancels requests that may need
to be retried too.

One limitation of my patchset is that it does not yet include full CQT support,
and due to testing environment constraints, only nvme_tcp and nvme_rdma are
currently covered.

I'd be happy to discuss the pros and cons of both approaches - perhaps we can
combine the best aspects.

Looking forward to your thoughts.

Thanks,
Jiewei

[1] https://lore.kernel.org/linux-nvme/20250410122054.2526358-1-jiewei@smartx.com/

