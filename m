Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E850A1E5B67
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931315; cv=none; b=SvKFIG1X3GDSeH5dueptj2SAuobrkCr2PRSbR6M78NmcDQxCrcmYtAx6ZbK7BUvVzj/66zYzchvjLNyJs64RB/NLmfdvLEjrxuatwk37bIziarpyaAS/zmOF2UjQKJP5pkF8chaRD40F/3xAsPGV21UDAr4cxqFrKLJBkP9sBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931315; c=relaxed/simple;
	bh=qozU28y69mqm1H5QpZwiPTDKHpkC3GO5O5/ETqP5OLk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MKa+7gukiApipW+1mfsLOieAh+rpwBiBSwc173O6JPCVLBQX07eXV80YYzWz8W5hkvQmUDSOWe+5eibM/4wIahGBuvUeREbgJAog/tNvHBXoUXUp2SbcB9xEZn2iqM5vu68vP6Kj3ydZCQRrzPMJ8Gf3ZbGUIgoO6XiZ8TxEY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Gd2uaoAd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Gd2uaoAd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=pTyW3xOyUBNtVPXAs4am3thZhwfMayjzqs4QeGMPqnE=; b=Gd2uaoAdm/r9gVuJkJmGCae6S/
	H1lPR6Uo2IJTXtzn6DQX/RZMU9DsOpHnpd+fetzAx0zVVoAr4xcOdHPLtuWiEuhDi4R4MvIBMecmt
	jGGipA34kSN7LOGgQBXzVE5md+IPOyTgwgrobEAuz/J5uvQ0qwGpg7p68K79b2wJZB7RtH2s5Su9Q
	VbSfzDfF8kd0HEk9Jy3dUEtc7Ikj8xqGZ7jTN8K3JsmTPs/qbADTZTR9gf0fujB0S+zB+TaVXu6sY
	cgB03oOeSfYf3LkD0K1tKsf/86d7x/muevVcDArLg32/pHkpotpD8EuNUr1eEgpaOoi5DkK4DjTBU
	FtRMR95g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT7-0000000HAeT-2m5y;
	Fri, 07 Feb 2025 12:28:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 256193002F0; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.068435759@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 alyssa.milburn@intel.com,
 scott.d.constable@intel.com,
 joao@overdrivepizza.com,
 andrew.cooper3@citrix.com,
 jpoimboe@kernel.org,
 jose.marchesi@oracle.com,
 hjl.tools@gmail.com,
 ndesaulniers@google.com,
 samitolvanen@google.com,
 nathan@kernel.org,
 ojeda@kernel.org,
 kees@kernel.org,
 alexei.starovoitov@gmail.com,
 mhiramat@kernel.org
Subject: [PATCH 01/11] objtool: Move dodgy linker warn to verbose
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The lld.ld borkage is fixed in the latest llvm release (?) but will
not be backported, meaning we're stuck with broken linker for a fair
while.

Lets not spam all clang build logs and move warning to verbose.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 tools/objtool/check.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2264,7 +2264,7 @@ static int read_annotate(struct objtool_
 
 	if (sec->sh.sh_entsize != 8) {
 		static bool warned = false;
-		if (!warned) {
+		if (!warned && opts.verbose) {
 			WARN("%s: dodgy linker, sh_entsize != 8", sec->name);
 			warned = true;
 		}


