Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC528CF44
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552260; cv=none; b=RCr8EL9UuXlC3se09AcQQW3hJUGERlKVVG1Y1yrLncFJjsxZkt8kW8KkMDCZvgCWC//L/jDZ2Xed3y6+fakXuAXEJArLfeDRoSlEtPO55Z8WSAAHv2zmDN9uRGD8AyiQLUxM9X69NHd5bIfJMNyxX97upJFuPRbhohC4OqCNDV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552260; c=relaxed/simple;
	bh=ZgnsrQ43S4L70fg/UsiHrN3kFf5lABAXCfemPqc403o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i33dGrnW0CpAx16dCIJkQtJpL2M5Urf+r8OGX/isOec/CrExEPfSWrfvAwJoDWy/ZYJRCPeVmEA7RcaI4Qc711zINAOM2yzYzLFV/V1gqNeZTLUxltKeTrVk+KRFTh35xJ0cSBcd/yj9ArcDFtTaB4EEHJpAkPmNrNTvflzTB14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hSvbOCDP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SZv3vWoW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hSvbOCDP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SZv3vWoW"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749552251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnE55vTMy7qpHVnuymQd+6282kdfSCrwu3U5LR8Xz3c=;
	b=hSvbOCDPxCHQ/4h4xHalIasiGLr6fhm+Yt63Ncw/rSXe3TaBkO7w9F9JOn9UPQjT3IMqs6
	AntW6NObwv6xFZQK+05Ff+cYb4tczjZFPPiZ9WFU0VvcdTNGeLWuFiojq0oxu1vM/171xK
	Cfvbstb4fpl9aX9i012iSP7XSYEeJDoUYw/4GWTZNWgzIdpchXsmsT8h6XHuneTECZDVNB
	qTBX6LsvgtD1kbJjOrp+VzYo9a7LGInYJQzafi2AarOvUJXtRCiy5j/MJ0eIYo/xs1Y5dU
	BNG3UKhAQnvdDxU2W+a8XIP9IBFNTjuLVwsTkxgmqz8nclZdJb/Zkk1+MUgOhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749552251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnE55vTMy7qpHVnuymQd+6282kdfSCrwu3U5LR8Xz3c=;
	b=SZv3vWoWL6cvSDw0kPG1I6WBW5MM2CoKO+cbPjJIJLeC8RAMrHPgAKbkYefZxmSXz+WEN9
	OmgZ0HkJStb7e2Ag==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 2/4] selftests/futex: Set the home_node in futex_numa_mpol
Date: Tue, 10 Jun 2025 12:43:58 +0200
Message-ID: <20250610104400.1077266-3-bigeasy@linutronix.de>
In-Reply-To: <20250610104400.1077266-1-bigeasy@linutronix.de>
References: <20250610104400.1077266-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The test fails at the MPOL step if multiple nodes are available. The
reason is that mbind() sets the policy but the home_node, which is
retrieved by the futex code, is not set. This causes to retrieve the
current node and with multiple nodes it fails on one of the iterations.

Use numa_set_mempolicy_home_node() to set the expected node.
Use ksft_exit_fail_msg() to fail and exit in order not to confuse ktap.

Fixes: 3163369407baf ("selftests/futex: Add futex_numa_mpol")
Suggested-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../testing/selftests/futex/functional/futex_numa_mpol.c  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/t=
ools/testing/selftests/futex/functional/futex_numa_mpol.c
index 564dbd02d2f46..a9ecfb2d3932a 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -210,6 +210,10 @@ int main(int argc, char *argv[])
 		ret =3D mbind(futex_ptr, mem_size, MPOL_BIND, &nodemask,
 			    sizeof(nodemask) * 8, 0);
 		if (ret =3D=3D 0) {
+			ret =3D numa_set_mempolicy_home_node(futex_ptr, mem_size, i, 0);
+			if (ret !=3D 0)
+				ksft_exit_fail_msg("Failed to set home node: %m, %d\n", errno);
+
 			ksft_print_msg("Node %d test\n", i);
 			futex_numa->futex =3D 0;
 			futex_numa->numa =3D FUTEX_NO_NODE;
@@ -220,8 +224,8 @@ int main(int argc, char *argv[])
 			if (0)
 				test_futex_mpol(futex_numa, 0);
 			if (futex_numa->numa !=3D i) {
-				ksft_test_result_fail("Returned NUMA node is %d expected %d\n",
-						      futex_numa->numa, i);
+				ksft_exit_fail_msg("Returned NUMA node is %d expected %d\n",
+						   futex_numa->numa, i);
 			}
 		}
 	}
--=20
2.49.0

