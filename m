Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1A1E5B83;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254995; cv=none; b=TDc1ivzBn0YdFiKePf0cRydxGnUCsweMYkY3BeKaDVyA/R0bAEfHHRlzwdfJD3uxQmYIf06FryM3cYf0QiViiI6I2lxYN2qDoukc2E2Uozi9P94ow4diXuN+BhJsYt1+PZaWZ3Wf9jNYHziJo0jta5pgpdpaumKW2Lr48AyvipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254995; c=relaxed/simple;
	bh=70CpwTFUuUr0ZBQHvWnlxclVDHf464oJy3CMyyAPe6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLVEhYk4dCpS/vwJT8XOfYm6YScxn3ceDsIptSI/w6pk2arXfSmSNM3OsRN60TvfpgsK6EGI1euC8ieUr90V/DZpG+WwsfuNoAomsBorzFWRVnv1SkinEe4s0Tvr3tF8IJY1C3854ywk8TZmGjG/RvWIRfP7bH7cfv4RQorqhDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4QwFvCu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4QwFvCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D9C4CEE8;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=70CpwTFUuUr0ZBQHvWnlxclVDHf464oJy3CMyyAPe6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4QwFvCuFNBkd8ieLaQ/6s/TkWAFdurcyaPHENdXyoZjkcCWDSZHyY6Rql9/m4SnK
	 X0uPU4IEQ6wH1i8AHJNUCpLB+fBy+TZ1M4vl7qXQt0rRhKf3gbdKv9EcW3kLvzoNI7
	 wbnWBIvHCO9TmZPS3auqvLF4iWlmOliTDwEcRozQjGq1E4y4e/r5jIn3PPjHtCd2rT
	 fh5Gy6CoWhtEyNzHqsYaaKHECaXndzELHI+FiOmY/DzPPp/uS5ioCtqkTOsUig28bB
	 qZeXe8sPO1TxoMpcDUy+fGKzbeEaf8eBNrRaisf/yeG/J2agMYZfeH+QMl1CESSp+B
	 Yf9lhiakCc9qg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBT-3QKt;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
Date: Tue, 11 Feb 2025 07:22:58 +0100
Message-ID: <0a989eea90e5d03a36a07760f8b505e074e85c03.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the corresponding ABI file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arch/arm64/asymmetric-32bit.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/asymmetric-32bit.rst b/Documentation/arch/arm64/asymmetric-32bit.rst
index 1ca2b359a907..57b8d7476f71 100644
--- a/Documentation/arch/arm64/asymmetric-32bit.rst
+++ b/Documentation/arch/arm64/asymmetric-32bit.rst
@@ -55,7 +55,7 @@ sysfs
 
 The subset of CPUs capable of running 32-bit tasks is described in
 ``/sys/devices/system/cpu/aarch32_el0`` and is documented further in
-``Documentation/ABI/testing/sysfs-devices-system-cpu``.
+Documentation/ABI/testing/sysfs-devices-system-cpu.
 
 **Note:** CPUs are advertised by this file as they are detected and so
 late-onlining of 32-bit-capable CPUs can result in the file contents
-- 
2.48.1

