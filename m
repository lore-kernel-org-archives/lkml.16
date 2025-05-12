Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5B124EF6D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086896; cv=none; b=LMqxrtdwLK4ddmJhHNDgDb2RzYo+kFWt/iKGfp4AzqDVaudCXvWbz3dtquS4UwQacMZkKD18wU6IzuuC0DUiAik49NxWffc5Pi2gjOOr4uX3LQLavJ0XIlQLcK80eXOp9VscMJWabcHvXbostZjttBojsFbHAZuTCB4a15CeYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086896; c=relaxed/simple;
	bh=4x5B7a6fKHJMZ6PV1sqoeNUXHRhVpSMgwJruLge+DnE=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=TtwVeJ7lX6RWgLxIvRC+JKtuqmOcQHLjz0dxHoeSs8KA4NfG8z8P46EdibdtxQL3jDQg/mkGxDC7ZMj+VxAm7LuLB/Evde8GLeWyvl11gielVo+9y0lZTefFkWh+DmW2AJsbUK+9vUcx9fnxvYBKl09ZMfEiz922l8G0sC3SOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjowzAc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjowzAc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F55C4CEE7;
	Mon, 12 May 2025 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086894;
	bh=4x5B7a6fKHJMZ6PV1sqoeNUXHRhVpSMgwJruLge+DnE=;
	h=Date:From:To:cc:Subject:From;
	b=cjowzAc1Bm9WvC1MWYxn1GIzVoJp+m9oyobRRF320RFUBrrjFHP8WRpdhPwVBJwZA
	 FKgC6cYHcI9ADKhSsfPDoW91bPrC6XaJVW8xDQ2Y1ivcINO6yLGZpyikJx33h2/IlW
	 UGZZF3suvOx3LgRqevAXylKs4FVuRwmaBoze7Fkfe30h6nCOd1Aupuk6w6Wzi3y4CV
	 Dv/aUlaXrFzPf/drEwwyjtQKdFeSyr/j0wP3K0YKyMlwceAcLTPj6BbdJIMbCDFSOM
	 Ddbgqpayyw4QNij8YeJh5oo4i3jCnVv/6cRmrcYINGbVIW3GVXxcck02s17H4RF2G9
	 D89Bzt4LKr+nA==
Date: Mon, 12 May 2025 14:54:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    linux-kernel@vger.kernel.org, stable@kernel.org
Subject: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
Message-ID: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Stefano Stabellini <stefano.stabellini@amd.com>

dm_op hypercalls might come from userspace and pass memory addresses as
parameters. The memory addresses typically correspond to buffers
allocated in userspace to hold extra hypercall parameters.

On ARM, when CONFIG_ARM64_SW_TTBR0_PAN is enabled, they might not be
accessible by Xen, as a result ioreq hypercalls might fail. See the
existing comment in arch/arm64/xen/hypercall.S regarding privcmd_call
for reference.

For privcmd_call, Linux calls uaccess_ttbr0_enable before issuing the
hypercall thanks to commit 9cf09d68b89a. We need to do the same for
dm_op. This resolves the problem.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Fixes: 9cf09d68b89a ("arm64: xen: Enable user access before a privcmd
hvc call")
Cc: stable@kernel.org
---
 arch/arm64/xen/hypercall.S | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/xen/hypercall.S b/arch/arm64/xen/hypercall.S
index 9d01361696a14..691ca70407c57 100644
--- a/arch/arm64/xen/hypercall.S
+++ b/arch/arm64/xen/hypercall.S
@@ -83,7 +83,26 @@ HYPERCALL3(vcpu_op);
 HYPERCALL1(platform_op_raw);
 HYPERCALL2(multicall);
 HYPERCALL2(vm_assist);
-HYPERCALL3(dm_op);
+
+SYM_FUNC_START(HYPERVISOR_dm_op)
+	mov x16, #__HYPERVISOR_dm_op;	\
+	/*
+	 * dm_op hypercalls are issued by the userspace. The kernel needs to
+	 * enable access to TTBR0_EL1 as the hypervisor would issue stage 1
+	 * translations to user memory via AT instructions. Since AT
+	 * instructions are not affected by the PAN bit (ARMv8.1), we only
+	 * need the explicit uaccess_enable/disable if the TTBR0 PAN emulation
+	 * is enabled (it implies that hardware UAO and PAN disabled).
+	 */
+	uaccess_ttbr0_enable x6, x7, x8
+	hvc XEN_IMM
+
+	/*
+	 * Disable userspace access from kernel once the hyp call completed.
+	 */
+	uaccess_ttbr0_disable x6, x7
+	ret
+SYM_FUNC_END(HYPERVISOR_dm_op);
 
 SYM_FUNC_START(privcmd_call)
 	mov x16, x0
-- 
2.25.1

