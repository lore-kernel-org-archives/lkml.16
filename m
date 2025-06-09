Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227283597B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465098; cv=none; b=SsQsfkL5nVrzgqfF9cB2Rt0Qg9qfnotlUpUKmBjDpffFaW52nFUSzfSdMlt+CzuSv4iMceZqIx5BxUggrearGHklW58gtsfOjQtUPaoCxzvWi2L48VTsuInQj3gaFbWifiVKxJyvge4Lyqmj2EyLPYSVd6C9gU7p+TvL52Mu6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465098; c=relaxed/simple;
	bh=QeEcKSQrw3zGHuhBfdHgtQnTX7+LDA8ErOvQiZ7c9RQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuHLXe9sS5ukHhMjtJ0JfwCL1blgbBrrDGoI8+bOy7qvCM+OWuBGyt6tbnZx/pXJLEQYFgFlzE8KqRo9bF4FC8cQn+sM3fM6Ks/Ll7byAByC/mvJQdyEHoAvNReNrfoYpUzRdJiiIDYsN6UhG2BUhVW1d6rZXCKuE1UWMI7ARaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40F6B150C;
	Mon,  9 Jun 2025 03:31:17 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A33F3F673;
	Mon,  9 Jun 2025 03:31:34 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Forissier?= <jerome.forissier@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] firmware: arm_ffa: Fixes for FF-A notification handling
Date: Mon,  9 Jun 2025 11:31:23 +0100
Message-Id: <174946502085.1178371.2142006145857749120.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2025 09:49:40 +0100, Sudeep Holla wrote:
> This patch series improves the arm_ffa notification callback handling by
> addressing safety and memory issues. It replaces a mutex with an rwlock
> to prevent sleeping in atomic context, resolving kernel warnings. Memory
> allocation is moved outside the lock to support this transition safely.
> Additionally, a memory leak in the notifier unregistration path is fixed
> by properly freeing the callback node.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/3] firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      https://git.kernel.org/sudeep.holla/c/a833d31ad867
[2/3] firmware: arm_ffa: Move memory allocation outside the mutex locking
      https://git.kernel.org/sudeep.holla/c/27e850c88df0
[3/3] firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context
      https://git.kernel.org/sudeep.holla/c/9ca7a421229b

--
Regards,
Sudeep

