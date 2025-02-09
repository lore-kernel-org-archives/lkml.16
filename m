Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212825674E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089054; cv=none; b=R/Ge7WkiPALQblL0xcw+EKsTUz+vR4E4P/hp/o25/QfaGhOCwspG4kin8d2LrI671IKbHEtwW1MLSkZq6nJurnHJqdAoBNiABHWA0f0K3uS+itaiFuTh7BGP+ta4zbLXpV0IFLz70AZ+PyzNfopu8HxUrINU7j1eN7NspqiBVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089054; c=relaxed/simple;
	bh=Tp2RMTNWmMiB3ScDHPsBc/iqmX5NfmXh+9E0SD2gLPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9eOvDgHTa6amhw1BosuFc8aLTlVXB6ACb454fzZlYfrbAse3XU3s3HiRJgy2D5fHjTI9FDMHw9JTbpYsG4ayo9WHnyIM3A4Ip/vX5YezQeXhzTlk/U+ofDhY1A4a6JrBK2dtK4YteLrPbzmz5jLa38dRghVXarvjzmJkasGIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=beA2ZaiO; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="beA2ZaiO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739089051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IiH2NYlYsxSXLU1sZ46R9u08xGC0tcovZjatzA0NQ/g=;
	b=beA2ZaiO51l+gHGagbiy/5PON6iHcgDUL2hOT4U9nQRs1pDSlEUfvytDoLVV0jN70Am9uk
	h8sS4Ej53b1rW6aS17PW6xy/OK/bG4alYOo3PTnHR99YN8sn8Y62wddmhExI5mrIaqrnyN
	tWzymrtgpzZIVp4gUoF9e4tes3cbRmI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] fadump: Use str_yes_no() helper in fadump_show_config()
Date: Sun,  9 Feb 2025 09:17:03 +0100
Message-ID: <20250209081704.2758-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/fadump.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..8c531533dd3e 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
 	if (!fw_dump.fadump_supported)
 		return;
 
-	pr_debug("Fadump enabled    : %s\n",
-				(fw_dump.fadump_enabled ? "yes" : "no"));
-	pr_debug("Dump Active       : %s\n",
-				(fw_dump.dump_active ? "yes" : "no"));
+	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
+	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-- 
2.48.1

