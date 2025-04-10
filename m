Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884721E9B14
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301292; cv=none; b=D/opfNDqgcmuNupbdXFX4Eggn+9V5VksA1HkdMoAkebYS9dp4SsJ9sjP/NQ/q/lxG5/kUMX7unTXCHhrOYqprYZPN1vfhL7GAoWjI+VaZqiLii4SjombvmEy6cCt0SBrRcy8cyd5FNty0BWXazlNdPowMinwr02XFu5KusuaQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301292; c=relaxed/simple;
	bh=r/WPmzNSOG7DnhnmxRVyxjV8aisZ4YY9NJhFvRVaLr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJSdPkS+AYkuIPkntHi0acbTHqCXMuOLGjdVgpGKThbmxVflaQKFzgiHSCelDtvtv9FHFk3e04r2HrPz83XXS2lTmC+3o98n36QdY6Ui7ljLwhx9+hPZXpR/hT/skyoiY6+nU1HJWvAfrzipkToiZYdndMycRizDzvbY2d1MEPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b=nxO9olZ0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20230601.gappssmtp.com header.i=@smartx-com.20230601.gappssmtp.com header.b="nxO9olZ0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227914acd20so18029395ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20230601.gappssmtp.com; s=20230601; t=1744301288; x=1744906088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq/VSDygxUvqusiASIxz5VUwIaO2iFyZjJyGjGC2vUg=;
        b=nxO9olZ0dHoU3lG40XetiovtiLgMlTDg6dCyWY0drGL53FO3yil94xKpC5q4IHxl+w
         AxWJ+vnf0PDU8a/1SVWhOQECIs1zHQiDP+NC9LKP/DaU6PIyn5WEL7rgga1B355jdRcK
         Mo+EyWwLUXq6SznWd7PJKxUXeZ2vT33t748I5w5L/d9bF83pvWVemBVY/8vk4Z5aT3rl
         tJMEpf9gY8diJZoX+ISjIBi1jxZIqbKbGW6/1CEmjqpDb+EIympw0TESytT83NMybzeV
         iKi/9AAuxq2BAOXtdXG6SvtYodLcJX2XpIb1z8n6gVHYHNAhNX4fAmPJWVbGoljP+cmt
         EWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744301288; x=1744906088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq/VSDygxUvqusiASIxz5VUwIaO2iFyZjJyGjGC2vUg=;
        b=phguNFyn0c2xVtNfdBgkz3eveSjmE1+ks4lLr5pvpyjQSgriZdSooEy+byZ/7DfnaC
         hbHr5kXAoZPQCbSM3YyVVr6cIDqhPjnicZVL5MREnToW01ahGSGWCTqzWeVFzqEEuCxH
         55zPxtGhITh9bv/Uv2/cIuEIX6S/Z7ONatCF1TKRCAncnT93n9M+PhPrD5mkIaa7sEED
         rAb2ugX1c1HO2PomVcZjmYVdjblPPaEqVCEhRBeMu2rLC+gP/lwcxvc+tnHTBGIQpOSw
         7H9BvXp4MqXr330Ml+WecfjDupkUeb99twUZOtVaOHpcmWBGgyV46GYd6ONW2NAeT+L+
         ID+A==
X-Forwarded-Encrypted: i=1; AJvYcCUCtk63drvv+UrhNKP3kV0hOdC7auHiRm0AhQIHngoXQk+JPjlW3E/5YtrGMGV0K4Xvx0eLGy3MP5M9dho=@vger.kernel.org
X-Gm-Message-State: AOJu0YymqGa9G5OjD1NT8kH1Mmm5ioDiKP6f3ydCk7br7dLklGwQaEsf
	9kZKRNoerN3qiFHkN94AP+oaereOHAtRkg2byc7GcMPRzLHQrT0E9UUgsrj3PWU=
X-Gm-Gg: ASbGncuMn1NIa8uzmm2ufxuXtVaxsYuR3lrfBGRejxt9kQKaEkd1V34uzMLNxcmVnsO
	x2vPftKOl7C4JVJR4ieROwhFVcSR2avEItusv1Oy+UVfgCYMS4lfLqwcITObK77kkCAgQlhQLsz
	QVkYkaTqbFIslRVhJQdrQEqeG+iWIsamF+ltdHfs8ngCNXvGrZvlYpN6fm5qU4qpVHjt352j5Ev
	b6WkmlbeBqb2WutJeoTHQhKQZjVqi/mu6V1nuGertN83VMAWa3KNJN9MC+v8Z+wwre1yRu8H6KP
	TUuF1W66pZh9D959Sh6Boy8fBBqBB8L/Wvln7SXUbZOE75qwKsarjA==
X-Google-Smtp-Source: AGHT+IGPEFfzuYGsKFWjoyUUk7FN1CYFyByM7i9vyd1ThL+ecYguA91ljiuUWfeE5IQtgQhbj5/kRg==
X-Received: by 2002:a17:902:ef02:b0:215:58be:3349 with SMTP id d9443c01a7336-22b8fd48490mr54741595ad.14.1744301288183;
        Thu, 10 Apr 2025 09:08:08 -0700 (PDT)
Received: from localhost.localdomain.com ([103.85.74.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5afsm32488185ad.226.2025.04.10.09.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:08:07 -0700 (PDT)
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
Date: Thu, 10 Apr 2025 12:07:57 -0400
Message-ID: <20250410160757.2567493-1-jiewei@smartx.com>
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

