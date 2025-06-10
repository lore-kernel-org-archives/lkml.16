Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95831226D07;
	Tue, 10 Jun 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555780; cv=none; b=n3XXQnZtcWE7iEkgLPPMMEUYDwfzVOVCbe1KqP3lh4cVKGcwri4rELXQFcBK60ZMULr4jD0c45RdJqkGe0yeCsqhlwvQJYBxsTIt+jPDJ8M8r0V9gUBkIcuor/roJ40z7O9fdtI+ePJGKvSFnRsNMC9f9Ea0NP2zL/UQ/fDa598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555780; c=relaxed/simple;
	bh=uW88LRNIw0RFEkbHENtP6ZWcuMo94nwGHAxeNjDsLlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RoFEC40LSJccwmSqn6lUgsY8JotmTEsYiWM9kAIlSONWFRNjzwqsqpMvwpXjB4yGLbBYaArBchm3ChF8PCQLvncv+FtHe38gIhspDYVa0VC53fX91pXQUOb/2Ax4jpsqQiudyJWI242MH1YGuF+IKrBspIRSIBuuclpp/uACGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8BxrnI_GkhoIKUSAQ--.46843S3;
	Tue, 10 Jun 2025 19:42:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBx3MQ9Gkho108UAQ--.60866S3;
	Tue, 10 Jun 2025 19:42:54 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v4 1/2] Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
Date: Tue, 10 Jun 2025 19:42:51 +0800
Message-Id: <20250610114252.21077-2-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250610114252.21077-1-zhangtianyang@loongson.cn>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MQ9Gkho108UAQ--.60866S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C262xC7I0v67AEwI8IwI1l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lw4CEx2IqxVAFz4v204v26I0v724l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUJVWUGwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Introduce the redirect interrupt controllers.When the redirect interrupt
controller is enabled, the routing target of MSI interrupts is no longer a
specific CPU and vector number, but a specific redirect entry. The actual
CPU and vector number used are described by the redirect entry.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 .../arch/loongarch/irq-chip-model.rst         | 38 +++++++++++++++++++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 ++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..d9a2e8d7f70e 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -181,6 +181,44 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then go to CPUINTC directly::
              | Devices |
              +---------+
 
+Advanced Extended IRQ model (with redirection)
+==============================================
+
+In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
+to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go
+to REDIRECT for remapping it to AVEC, and then go to CPUINTC directly, while all
+other devices interrupts go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then
+go to CPUINTC directly::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+       +---------+ +----------+ +---------+     +-------+
+       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
+       +---------+ +----------+ +---------+     +-------+
+            ^            ^
+            |            |
+            |      +----------+
+            |      | REDIRECT |
+            |      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI-related definitions
 ========================
 
diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
index d4ff80de47b6..7e4e3e55c7ad 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
@@ -174,6 +174,43 @@ CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVECINTC，
              | Devices |
              +---------+
 
+高级扩展IRQ模型 (带重定向)
+==========================
+
+在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
+CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断首先发送到REDIRECT模块,完成重定向后发
+送到AVECINTC，而后通过AVECINTC直接送达CPUINTC，而其他所有设备的中断则分别发送到所连
+接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直接到达CPUINTC::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+       +---------+ +----------+ +---------+     +-------+
+       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
+       +---------+ +----------+ +---------+     +-------+
+            ^            ^
+            |            |
+            |      +----------+
+            |      | REDIRECT |
+            |      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI相关的定义
 ==============
 
-- 
2.41.0

