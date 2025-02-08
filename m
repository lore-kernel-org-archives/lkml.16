Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218D1B4F02;
	Sat,  8 Feb 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026323; cv=none; b=fzZYU0wY5Zb4k5cBXfYrZHWlxxXbWnwo6nYB2v51/kc2/ldojynuomEF2BVYxknooApyHWu3Sordiy/pNahMDGJMU07QyL2fDKZRlhY0/27MlfgRfccR66sveEYaKMlcblGvJice7eFrW8mLn1WuuzYK9onl5ZoezYrpEOvk1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026323; c=relaxed/simple;
	bh=7kWsqrc/KlJUhNXjQXo9cz9mB/l9i6LuYbjS3Fnz7WI=;
	h=Date:From:To:Subject:Cc:MIME-Version:Message-ID:Content-Type; b=s8IRXVp3T1gsVVbxnk43QH5Xe63ZxQwix87CLW2jTGzIujFliUtid9sSGGJZKsCTc+rYK7a0djSnTazaBA3TomBUb1Un+z75wa+UQYDB4BxSK7tWPyQJ8zLlosCl2VNO5cR2BWXryAoHBp+uIp0lLcuNqmGrKaSP1GnFP0ExFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CTbXbCS8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+INuT4eM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CTbXbCS8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+INuT4eM"
Date: Sat, 08 Feb 2025 14:51:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739026319;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=HMYkJT+hQCLeSJ+zaIYjy0cT0WVbl5J56c1fh6/RtP4=;
	b=CTbXbCS8UyJgJZyesYDea756VruzBAMqN0ugxoY86hZIyGNVJ3SleBorslOQNVeIYrQ1Y7
	96Xz59GuV/8LqOjaO0HYEYf6fp9ugJcaIa/lhwdphd0IdxscW1QPsXILEDPLxFBKAHJOEZ
	BxayzJ7/gMbXPI88DysEOdn+1MGx+gbtwrE3MOobeETJvgQmRNN9utj+ovNZVSx7f7QBTB
	2y5mWadU2+ZjvkJ8PtUL7+5eLLwfi4z0FVNiQBA/0Nizox0slaWc9dd9UymRQ7mU7MRBIT
	SCnEZZ+aJY1QDGGkw1McoBwXriJ1Pw1UkkefAIZFmAp4mFp/7BGNlw6TIr/Cvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739026319;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=HMYkJT+hQCLeSJ+zaIYjy0cT0WVbl5J56c1fh6/RtP4=;
	b=+INuT4eM7oKm9/3klXj24iSlDnGB1GJI3SL7De1RNqtvZw5HVLl+fxXA0CBvwaj/Wr39Za
	381X0CFyG29PG2DQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/urgent] objtool: Move dodgy linker warn to verbose
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <173902631922.10177.6027685106980851214.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the objtool/urgent branch of tip:

Commit-ID:     7e501637bd5b702a2fa627e903a0025654110e1e
Gitweb:        https://git.kernel.org/tip/7e501637bd5b702a2fa627e903a0025654110e1e
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Thu, 06 Feb 2025 11:12:08 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Sat, 08 Feb 2025 15:43:08 +01:00

objtool: Move dodgy linker warn to verbose

The lld.ld borkage is fixed in the latest llvm release (?) but will
not be backported, meaning we're stuck with broken linker for a fair
while.

Lets not spam all clang build logs and move warning to verbose.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3520a45..497cb8d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2273,7 +2273,7 @@ static int read_annotate(struct objtool_file *file,
 
 	if (sec->sh.sh_entsize != 8) {
 		static bool warned = false;
-		if (!warned) {
+		if (!warned && opts.verbose) {
 			WARN("%s: dodgy linker, sh_entsize != 8", sec->name);
 			warned = true;
 		}
