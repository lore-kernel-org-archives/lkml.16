Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CF628B4F4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348897; cv=none; b=DJdKeYbDtyukdm/Vrj2v3Uv+GZQhXyDSkhUJoinerhQzVJm57gFS7zzPWZJjOECK9ob8uV/sHlUSX9IxE7jCX6SL0+i43iCXOS4g3TUNz7EzmExjtJSO/5wRl6FL3Pm/36nAJ++LAu8q6LJoeIwQ7YmTfPrMKpSAarbLqvJaqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348897; c=relaxed/simple;
	bh=sCw/3W2Iynl8aKmKCPobN+g9Kfl7YikwwLHYLf6g+i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKwBEJogCp3qhA1siZAXeBFOPO2bN/gtVI2ul5UOOEwuPTCkAQAoLG7R9ZQrLDJRbFX6qkMD/HmM+HJ9BM2oF/qd5FGjUNhEFl5JleDAeLbKFfJHpIibPreK0QxWBZLr7vqUrxcDrqAN28+dXDUeMmxmX4MhqNGQce3fN2EdMCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A591D6F;
	Thu, 19 Jun 2025 09:01:14 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C613C3F66E;
	Thu, 19 Jun 2025 09:01:33 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/2] arm64: signal: Remove ISB when resetting POR_EL0
Date: Thu, 19 Jun 2025 17:00:42 +0100
Message-ID: <20250619160042.2499290-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

POR_EL0 is set to its most permissive value before setting up the
signal frame, to ensure that uaccess succeeds regardless of the
signal stack's pkey.

We are now tolerant to spurious POE faults. This means that we do
not strictly need to issue an ISB after updating POR_EL0, even when
followed by uaccess. The question is whether a fault is likely to
happen or not if the ISB is omitted; in this case the answer seems
to be no. If the regular stack is used, then it should already be
accessible. If the alternate signal stack is used, then a special
(inaccessible) pkey may be used - the assumption is that this
situation is very uncommon.

Remove the ISB to speed up the regular path - this should not have
any functional impact regardless of the scenario.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 417140cd399b..db3f972f8cd9 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -95,8 +95,11 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 
 		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
-		/* Ensure that any subsequent uaccess observes the updated value */
-		isb();
+		/*
+		 * No ISB required as we can tolerate spurious Overlay faults -
+		 * the fault handler will check again based on the new value
+		 * of POR_EL0.
+		 */
 	}
 }
 
-- 
2.47.0

