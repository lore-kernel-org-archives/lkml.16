Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217391A262A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743126422; cv=none; b=nGwwmh+aqimtV+YtBScFy3rTpWp0Pd2UqTcXIV25MjAQg+1P8ce8KNKC3+u7N3ztdNsp7+PJDc2FXs2JHLX8OkPkbE7W5lgVFkEgYHa79k9IV5UjmEngZIqsoeNgI54Z7YuQQYv0EDUJOeTCr5g1zlyWIJqoATWqtIqCt96pSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743126422; c=relaxed/simple;
	bh=gD872F4HiXHd0hgxZ9nCLIWr16yhNwUFBf7pVx7VkrM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=SBoGWPkRJazAntRO4+B0wRYRAHfyCN6nh59L+A4BXyrIfOVk7nEtprqrBWQvZLTTJkkb5sS5rOjdjnCMj+bi0ViyI4NacevZZc7FsrPAnfNTGpe0Ee0BoS+OESUf3uAto8cFgpVhjAhkCHVF5BRHL0jAIDFP5Iv5jz8ICVAbP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=qNfkS4e3; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="qNfkS4e3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743126416; bh=9j5d/J8zcsc5onhRmFuStFe5/dVv8ZloWD0b6T9BVks=;
	h=From:To:Cc:Subject:Date;
	b=qNfkS4e38LmjltPkMu4+UOb+3ARzmNSL3esC4tpUjwBmE+58HhzOM/XJIqBzH2i2g
	 Drc9IUT0sxzYt6ZsSFQJpwkPdQk54N5e0SiEvUCG5wSPDpgTNn+9vU9YDTRdprrR/4
	 RUUwNFke3VAMtfk6WldxUBYR1Sn+w73inNiCLoMw=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 98D004FD; Fri, 28 Mar 2025 09:38:13 +0800
X-QQ-mid: xmsmtpt1743125893t1l3naihh
Message-ID: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Juz8M7sFYLcR+S2gUYWW88+ryy6gT64V8NCj4docy/xDcvjiPm9M
	 LSAki3QnsVpmF2d4RcsYT+c/x2BH8fxVtlzpZst4EWiaIe4X4hSvBpE8IPt/NMgSK/wmZxqERESN
	 EqiReWMHMQf9+6cAYEBtAvWvP72J0BIbcGsowh+jG/F+LXwY/3u57yWDqx2fqMJQzB6BCIFNU5f8
	 sIUILE1JhEs/Njh/EmDrYTAcVJwHWem+H7LzDdolaLZ0LhW5iAmLnv7676RcZSsli0oOQXDQcfmr
	 v3fSmvPKSfy/gfVHdwLhmm25Wz7aVwjUx6Bt5ia9HCgUBZSR7QSTHfoIkqVwRTq8KuY3IRosWWlQ
	 PC4OTrRzOJwf5AszMqVvU1KzKnHFxfKxqmp5rrJUpfOjOcD87SWjGWtDpUEpMLusOQkEglGEsE4X
	 xOzusL+YKWFqvm47QHjExU+gS431ouvlq9uIctx8w5pWUfATwlVQvaAXupKsEStdhfp4QUby02wn
	 tLc/dSixNNT0ujJcYq8D9otMEzJ6bNw7Q5KNyRYPHnJoy/9qy0rTjA7Iz9jzncO9jD28W8lEI4Bz
	 De4eqTMbEGFtrrEjOYTpEnxkhf0Ujg5q/Q+WvsAnphif6sPgOYB2d0DCLfLlAN3TScr0adn8tfcQ
	 6PTeW2ayTv8zjlWGRub4hKuCkeCkSOPEBsenoz/CC/YPFhYStGPpnVN4re80pg+ozAsIItMG07Jh
	 25LvylM0mCkcf56tKk/i4G13suZcaYMVG35cXCoA/WwqvH7LsopS0qggE7rU78+wyrE0wTKb9N7S
	 i9fSvNKASVxzOonYUekX6qFKrJG0ZQb0bHlvUQCR+oHDS6cky0/I10HX7HwvhZeDAnKSfjfr6FuL
	 ZZwK7JvmswWav5NmcdBzYMi4nmKCkCvkcDtzrad0C6OiOmf5JRlYjNGbkRhun75Bi5r9uzB81iAZ
	 w+TJl/BpYBnKGCT5gtPib0DPqIF1AURqCD03en7H8=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v2 0/3] nvme: Add sysfs interface for APST configuration management
Date: Fri, 28 Mar 2025 09:38:08 +0800
X-OQ-MSGID: <20250328013808.88688-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

This series enhances NVMe APST (Autonomous Power State Transition) support by:
1. Adding warnings for PST table allocation failures
2. Exposing APST tables via sysfs for runtime inspection
3. Providing per-controller sysfs interface for APST configuration

The changes allow better visibility and control of power management settings
through userspace tools while maintaining the existing functionality.

Yaxiong Tian (3):
  nvme: Add warning for PST table memory allocation failure in
    nvme_configure_apst
  nvme: add sysfs interface for APST table updates
  nvme: add per-controller sysfs interface for APST configuration

Changes Since v1

Add mutex_lock in nvme_set_latency_tolerance() for Potential competition 
between nvme_set_latency_tolerance() and apst_update_store().


 drivers/nvme/host/core.c  | 24 ++++++++++------
 drivers/nvme/host/nvme.h  |  6 ++++
 drivers/nvme/host/sysfs.c | 59 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.25.1

