Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F41DD0EF;
	Thu,  1 May 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135717; cv=none; b=ghWzoK2kP59DtSH63Nnzk05jsJ0GtRAav/HcPk7TODGv59YN1DDiXOKt3B0Y3KXqFuf1A9E5R7gPmePF8gF+WePawAuPljt6GkPEnx0YbmOBU5zIU/egT5mtY53ajombPGVpP58QhKPotaGKeg46ZrMhT/AO1uO6v40vSSAVC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135717; c=relaxed/simple;
	bh=g4aUu3QyiDLz+7Iv2E0gKO3ZOzoRf6Q8mL3Yu9HXQnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XwOlrXOQKvrA8mQUdNnYFZPPHWmxPQ8Mm492pfAyyo5V3VSqSAx8iqLBwFwFar56Jghyj4iERsNJ0lenNo3EObcRxOxq4Oox7U6mqKhm6Ph+WoU7bjUlK6gTYOsM5LzQmAujXNTWy56BnU4FWpVMl3BBME2KqZH0kyh4imdptp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIyZf4Rg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIyZf4Rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6EDC4CEE3;
	Thu,  1 May 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746135715;
	bh=g4aUu3QyiDLz+7Iv2E0gKO3ZOzoRf6Q8mL3Yu9HXQnA=;
	h=From:To:Cc:Subject:Date:From;
	b=PIyZf4Rg+Lre6BKs/T+vospdRFQ1O5VCiXLjebKOjOh4S3zuoiM7xBajbfekAl7WU
	 czomh8hvqHBPfbheYxqrFEZDEsDlD4PruRACVH+/JkDF27QyyEajh68e0YXGNvntmn
	 KTdptYQLh533GUHOhaqy+5fch/8EDUA164n5OpsYnzhM3RFWXLzZqP6rdDOQfN07fe
	 IVcxsK6PnqtqMIgTcn2CJOJijQa7RrLPxKnS6Ps0K9h4NYEjjoNlPZKGK1AEacOvu9
	 rd/sgxgl5pipvKdc7ci5hqiyCsBoG0bRZfFJaPexznDgPtAc3QnM8at7f/JzapjuTC
	 EMI0/S5LgS/yw==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 0/2] AMD Zen debugging documentation
Date: Thu,  1 May 2025 16:41:45 -0500
Message-ID: <20250501214147.2488164-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Introduce documentation for debugging some issues on AMD zen hardware.
As one of the debugging techniques read and add information for
S5_RESET_STATUS register.

v6:
 * Drop pre-req patches already merged to tip.git
 * Use Boris' suggestion for reading S5_RESET_STATUS

Mario Limonciello (1):
  Documentation: Add AMD Zen debugging document

Yazen Ghannam (1):
  x86/CPU/AMD: Print the reason for the last reset

 Documentation/arch/x86/amd-debugging.rst | 362 +++++++++++++++++++++++
 Documentation/arch/x86/index.rst         |   1 +
 Documentation/arch/x86/resume.svg        |   4 +
 Documentation/arch/x86/suspend.svg       |   4 +
 arch/x86/include/asm/amd/fch.h           |   1 +
 arch/x86/kernel/cpu/amd.c                |  53 ++++
 6 files changed, 425 insertions(+)
 create mode 100644 Documentation/arch/x86/amd-debugging.rst
 create mode 100644 Documentation/arch/x86/resume.svg
 create mode 100644 Documentation/arch/x86/suspend.svg

-- 
2.43.0

