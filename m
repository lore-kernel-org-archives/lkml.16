Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C47265CD0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422235; cv=none; b=qUQKRJkwgtA0LuSiiLY49Dcq9Pp115qmsFTSatk824iVSrxeDm+N6V8GM3QTykHOuH39NhbKzjz0KbppWyTbMufBZ5QLEPEk9p+MqJTwKhKoiL3B1czRQemWKRredMYxFml5FnZTuL/faFnibz1RA7NlbV99+2nz9qoY9zbmz1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422235; c=relaxed/simple;
	bh=CTCmkJfFk7XyUxkYM9v8GC2VE7hvAnktyg6nV7O53l4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=Set0zJiJP/DkzRWEB/eJjY4DIMrYjd2ayvafUGuae87Fh2FRw+KjQfDSvWdbz58dOpAmr5QxXyEDw4cz3yo1mph5FXE264aEtzFaIxuOuMlHWgu65iHnRv8IuDj151tGL5C+EiSVjB6Amz9+Q/WNpOys6tHgY4GPDMdWwBxMo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5B51FC7;
	Wed, 28 May 2025 01:50:09 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191FC3F673;
	Wed, 28 May 2025 01:50:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: arm_ffa: Fixes for FF-A notification
 handling
Date: Wed, 28 May 2025 09:49:40 +0100
Message-Id: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbONmgC/x2MQQqAMAzAviI9O6iVgfoVkTG11V6mbCKC7O8Oj
 wkkLySOygmG6oXItyY9QoGmrmDZfdjY6FoYCMmipc6IeBeOS8WJPkZ67LH1xCvOUJozctH/b5x
 y/gBWLYp+XwAAAA==
X-Change-ID: 20250528-ffa_notif_fix-f90903a2ed0b
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2

This patch series improves the arm_ffa notification callback handling by
addressing safety and memory issues. It replaces a mutex with an rwlock
to prevent sleeping in atomic context, resolving kernel warnings. Memory
allocation is moved outside the lock to support this transition safely.
Additionally, a memory leak in the notifier unregistration path is fixed
by properly freeing the callback node.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context

 drivers/firmware/arm_ffa/driver.c | 71 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 35 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-ffa_notif_fix-f90903a2ed0b
-- 
Regards,
Sudeep

