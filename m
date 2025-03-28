Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC741CAA9E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151999; cv=none; b=iLqV85ayjLXz3x0t2Ljguk4kQovlaC4vdXiVi7ym+/dYWpD9xdvBUTOpLJOYdt1sCwrBI+smGBQ/joMe3CLclqOxeUWRYQdbpCLyJV1ztVKflqi+K9NfJGhDlYahazurW9ffrdInuAcOIWssU6dzQCxaOsDgfGG40ZKtfPSgM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151999; c=relaxed/simple;
	bh=guCE2WsY9Defy1aDADm8ZYMxyHivzAMoig7lpN2TvHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k4ovwimoQ2uJyL0dTn62xQ86M4t7VlU6B33+9IOah3FVbh9jBAJ6mTuFMWxqdH7jj+YLUalEAOda53a9yiw5VDX2sm3rlvmd1oUMhckd3CBVXZ8Khj6EPfbuHnfX1O/xJewhPttcb7Sn8izwSgWivtlKw9sZARC4e41ljWs+oV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk51dovH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk51dovH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC027C4CEE4;
	Fri, 28 Mar 2025 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743151998;
	bh=guCE2WsY9Defy1aDADm8ZYMxyHivzAMoig7lpN2TvHs=;
	h=From:To:Cc:Subject:Date:From;
	b=pk51dovHDmNhzcT3xYaANTDZuyU9eDeLbZNqeF67YixD9tKMIkacoy86cg5Ah3Bam
	 uAYCG1ShZWfz7VKqky48jc9mI8XFuUsSKTYFP9vTDo6hSQ9Lsgs/2LTZXH/cxz7scH
	 InrlmCpKroAdw4LkQ0SF9Xkuia/kCdyd64pfPyWY82QVlcuU0AEuqAkoBISHcDpAES
	 bjZHhvhkZyJbjCRXOcyo6lE/s54EzyQ/cRBSvxnZbHToS3CAXPbDZRYGLgmjo34KUf
	 ZRRs3W5zB+eFSHbE8RcV1VixwUPhk0CDbcjsZkQdgsLKPURhPAN95weVKhwslSD1sR
	 0U5UEdxVhUVBQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
Date: Fri, 28 Mar 2025 09:53:11 +0100
Message-ID: <20250328085313.1193815-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Björn Töpel <bjorn@rivosinc.com>

When a crashkernel is launched on RISC-V, the entry to purgatory is
done by trapping via the stvec CSR. From riscv_kexec_norelocate():

  |  ...
  |  /*
  |   * Switch to physical addressing
  |   * This will also trigger a jump to CSR_STVEC
  |   * which in this case is the address of the new
  |   * kernel.
  |   */
  |  csrw    CSR_STVEC, a2
  |  csrw    CSR_SATP, zero

stvec requires that the address is 4B aligned, which was not the case,
e.g.:

  | Loaded purgatory at 0xffffc000
  | kexec_file: kexec_file_load: type:1, start:0xffffd232 head:0x4 flags:0x6

The address 0xffffd232 not 4B aligned.

Correct by adding proper function alignment.

With this change, crashkernels loaded with kexec-file will be able to
properly enter the purgatory.

Fixes: 736e30af583fb ("RISC-V: Add purgatory")
Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/purgatory/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 0e6ca6d5ae4b..c5db2f072c34 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -12,6 +12,7 @@
 
 .text
 
+.align	2
 SYM_CODE_START(purgatory_start)
 
 	lla	sp, .Lstack

base-commit: acb4f33713b9f6cadb6143f211714c343465411c
-- 
2.45.2

