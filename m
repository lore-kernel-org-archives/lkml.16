Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53337277808
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378200; cv=none; b=Ek3cTAa/geX8vMvJ8qLHscyc38HBJpilJD6wY+Sv0LMoeiug98IXsq47BUEM87ehB7UQKTIubnp/U+5186ewZOFVLxAd9xFgmNw+F0RrKpdGwU7C+bm2v+WSEoQS3PDmsJrrSU3zY5JcrLHmrMaBf3af4rWFPfV6W4CVEH85dXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378200; c=relaxed/simple;
	bh=FvX9IvQ7Ier1QvcK83GKrL/en43fv09+Z2mqBydrevA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M11QDPGYyN4o4blsyLo/eBq3l8GjViahREPsxKfPfHstP5L4y1y0u6/ann12AUfgTTDaih9RWKVIbvUNaC4d7tjfZYMOzXt0bUGEa1BQ3zU17vxs0Ymhsx7/U15HHRm7Y1p2gqldYzxPO93cKgj2+qjSliRCe7n4Q+6XgMqH/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C5C32696;
	Tue,  1 Jul 2025 06:56:23 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A5673F58B;
	Tue,  1 Jul 2025 06:56:37 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 04/23] ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:55:57 +0100
Message-Id: <20250701135616.29630-5-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index e0c233c178b1..cad5367b7c37 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -284,7 +284,7 @@ enum arc_getset {
 
 static const struct user_regset arc_regsets[] = {
 	[REGSET_CMN] = {
-	       .core_note_type = NT_PRSTATUS,
+	       USER_REGSET_NOTE_TYPE(PRSTATUS),
 	       .n = ELF_NGREG,
 	       .size = sizeof(unsigned long),
 	       .align = sizeof(unsigned long),
@@ -293,7 +293,7 @@ static const struct user_regset arc_regsets[] = {
 	},
 #ifdef CONFIG_ISA_ARCV2
 	[REGSET_ARCV2] = {
-	       .core_note_type = NT_ARC_V2,
+	       USER_REGSET_NOTE_TYPE(ARC_V2),
 	       .n = ELF_ARCV2REG,
 	       .size = sizeof(unsigned long),
 	       .align = sizeof(unsigned long),
-- 
2.34.1

