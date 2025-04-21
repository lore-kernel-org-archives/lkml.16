Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCF20C037
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240456; cv=none; b=acs2SJCMhfit1hiA5aArEp0Nf4dLKEmTH+wX/HsZ/bj47XQ1bTNZVGiv0n0szZQ8nj5YiN5GOU+Gy5xoNqJkoM/N7nAjVRBMDAF1naoNHUTPJlAjQTYin9Vry+XuN2iIKDki34vZQwVWXi+04PTd1s8pK2kZjEXOkrzavQo5UWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240456; c=relaxed/simple;
	bh=UdoBYXZDI6i91jbwfQE13A2pfJqNj28gRiPFYgsqjEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUrptslEwOnQpARDlfMdzVbf4+cA5c69gcEn+pSLy7VYzij+46vEGWTdrRymWMXKK71aGbY2UcD2B5YtOXdMM0JwYCkBUz0gLc18XzP/ng5So+ICd2s6cIqWSYIX9/t3mGnsF0GdFZtjfZX+eNEyKk+lp2mfY+FV+mw9xTlxwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=P+SboFVm; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="P+SboFVm"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A2F63FFE3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745240445;
	bh=vQ6ou3tWqXEiNZ+OJ9V6Fm/EPrs0acywzCR64vd5LIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=P+SboFVmDBjMjpg9phP5s6RtXbandTWjQNrD7CSlHIMacS+0Xyj4cyO7wOxVKdIJw
	 3EnhXjzXupUp7AVETcbNAndaluOJumHP8svu5UDRDmaU8IqI+yeKaftDIco58T9nAG
	 vpwlFHZd27qtqSw6AQUwjTvXqOOsgRgKaQ6nvobnSquUdDQ04VtakyOrAJ2P/+jgR3
	 HxcS0BhnWoLcB7RkhrDcdSdYNf6vaA3MvNQKvof+rHMCkkNzE1+bvMTp1YfzdVCwW0
	 dnnrnAeXBwyx3mLlm4H0NVWmfNyQ1MrKrhmISBNvWmhmnLEDjyVbYaeW5M0GTGdLtf
	 b2IVB6Y9b8kqw==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225505d1ca5so37699895ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745240444; x=1745845244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ6ou3tWqXEiNZ+OJ9V6Fm/EPrs0acywzCR64vd5LIA=;
        b=Kp48aMsFdYpwq6PJ+0tjIPx96ChzxEpHjXoAlSeNtL2q/BJHsKQdgFYLadMz4YfnR+
         xR12T/83nSDscLqc7aRbZkDMd5FLcJrgug7KWVRz0J+moqjsWtqofzbM9jUqLbU1a/NE
         inNrfeDO6QrmAFKBDaTL+K0KapgB4nmLRhoIuY3YGeu1FylFwKEZxcQQC3+8+ox76aJl
         cvAqZ0L9EMJ9YgJc/L6rO240K1y5vZdF3q9tDEqoQsX5OaB7rmQEruyiP/xidLWRKSy6
         m+XlIWlfGTpRSCWQ3ZPXFQVWTFAXqwohUvVHUTAOadNoBjUIyvzoJhQDEMrUT4kYtYXb
         jO2A==
X-Forwarded-Encrypted: i=1; AJvYcCXKTHkGi1JOJcszfdD4hQB7W2kXrgIyLW5k2GqfF8uvU5ZvlHacfntr3Q2J3dPXjONo9RotTFcQD7oEPiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZH7kO6TnTtM91wdX5Men80oagBoC1aLrEQ8HbRZgf05ubpnx
	2Qz8F0ConWuFuTEilmSUrJSZOZkaXTkVea+FiYPBdbvvBeXhhzlzbWK2HEZzAD0x1+PNWsnGWiA
	2OQnbiZbN0bcAfoCsVMl0eAkP7OjNbh3fgd4EHMabw+C0rz8aXtjVLMNIe4xDGEZ+tDTyc+jz1Q
	vQ7w==
X-Gm-Gg: ASbGnctbMja5cbcuIm4uxan8VOQ5KbBi48/lPjvEX+ITJCIv8Jze3Nw6i5F7z0t93mO
	773kArm53gLCLi7HsmLp0Tu1SqFfLtQkrQVj6RBTDtrxPe1M8rZTs0e611FdWxMzIAZcVbBMPj7
	QPjDux60FnRE6qlSCpzJJr30Sz2bkS0rMG22rp1uFNITtmzTvXimGIsCq6RCz1T7s3Ux+D7wJTZ
	v5qKTZlFd414JWLRmonKtZwr9TtoLH0vFeYcpSVs6uD+61hz4IKHsN3/D2gfFHxvUB74fYz49Js
	7p4+ViXpbEvWt9ZF171IipIK950EHqdoEZT5ytA99hJqYvsek3Ccu+ak/fuepyATZHE=
X-Received: by 2002:a17:902:cf12:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22c53626fb6mr170043345ad.49.1745240443749;
        Mon, 21 Apr 2025 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExX1Xc2vMU2pblQy0GGeMZoJV1lDHlig9j2h90ZQJ2QyMEyBmrDv5Jg0PlkH60VKL6UPlkuQ==
X-Received: by 2002:a17:902:cf12:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22c53626fb6mr170043015ad.49.1745240443473;
        Mon, 21 Apr 2025 06:00:43 -0700 (PDT)
Received: from rickywu0421-ThinkPad-X1-Carbon-Gen-11.cnshub.home ([182.233.178.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda7b3sm64758665ad.52.2025.04.21.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 06:00:43 -0700 (PDT)
From: En-Wei Wu <en-wei.wu@canonical.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de
Cc: quic_tjiang@quicinc.com,
	chia-lin.kao@canonical.com,
	anthony.wong@canonical.com
Subject: [PATCH v4 0/2] btusb: fix NULL pointer dereference in QCA devcoredump handling
Date: Mon, 21 Apr 2025 21:00:36 +0800
Message-ID: <20250421130038.34998-1-en-wei.wu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a NULL pointer dereference in skb_dequeue()
during QCA devcoredump handling, and adds some safety checks to make the
parsing more robust.

The first patch fixes the logic bug where dump packets were mistakenly
passed to hci_recv_frame() and freed prematurely. This was caused by
handle_dump_pkt_qca() returning 0 even when the dump was successfully
handled. It also refactors dump packet detection into separate helpers
for ACL and event packets.

The second patch adds bounds checks and replaces direct pointer access
with skb_pull() and skb_pull_data() to avoid accessing invalid memory
on malformed packets.

Tested on WCN7851 (0489:e0f3) with devcoredump enabled. Crash no
longer occurs and dumps are processed correctly.
  
Changes in v4:
- Fix unused variable error in the first patch
- Refine commit messages

Changes in v3:
- Use skb_pull_data() for safe packet header access
- Split dump packet detection into separate ACL and event helpers

Changes in v2:
- Fixed typo in the title
- Re-flowed commit message line to fit 72 characters
- Added blank line before btusb_recv_acl_qca()

En-Wei Wu (2):
  Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
  Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump
    handling

 drivers/bluetooth/btusb.c | 120 +++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 46 deletions(-)

-- 
2.43.0

