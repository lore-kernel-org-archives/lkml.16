Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651A1DAC95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481653; cv=none; b=qRf1LioaTuomFTxflTI2zmm+wB32Hchbn85S5bqo8u3pbJsIQkpR5VcgWiTbIDJs1v//HwI3xr8U5cbaLbHCtr4gbMvrurtALeLo2jPB3SZsl2nXd8uOh2afHNli3dxk7NNsHAIiD0dw6ZRH5LcWmG27iTcyxdLSqWyVNFc9jQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481653; c=relaxed/simple;
	bh=qHhMjL8bK/YyS2w020DU3CdOOQucIwg1Js4WmbnvFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgfOfLXHnqhO9WCGIoEEcqIjpzXULv7XrT0r69atJB0EP+L2hnqyZ+OBGvKgf4aP1d4OH6hGvmYJKO1iN3TmB/bcNX3EokL0qV75ijSklHwfLgg3kl8H5auWmP+h3iSZuzKDKb1RkdhqrtWo3S5ztHgoUOhSRUxnLBvmy7HWSr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMrwXGpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMrwXGpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F62C4CEF1;
	Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481653;
	bh=qHhMjL8bK/YyS2w020DU3CdOOQucIwg1Js4WmbnvFGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMrwXGpm/fvQRFP+/LiRNnBdaQBHA5pXbZfRrxB+TuoSdfgaEM75lde3UGDg5RI88
	 qytkpgUuIfuOU0qbfr7Ush4QJQrrMqkfImZNdwm15foaNcMwUbx6qNvl0H+sKOb2Ag
	 SvvnwShicxqYbJRr7IgDpFbzv0DNrF++NcBX7BOaVqTg7Wsg7NvlwJu5W3q6oMq6aL
	 YrMWzUKh1qqHrbQO1FKP7weP6OqQTV3rOoWAeDBUfyas9vIaZMrHpbMBEqKygWB+dk
	 cJVTOaMktRikU0n64xQOpbTy0ibgUmagFWYjHqBOUI+LyCdoayCteysoPhxF9Xe/Mp
	 kP/cpY2/n2gBA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 05/11] objtool: Always fail on fatal errors
Date: Mon, 31 Mar 2025 21:26:40 -0700
Message-ID: <7d35684ca61eac56eb2424f300ca43c5d257b170.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Objtool writes several object annotations which are used to enable
critical kernel runtime functionalities like static calls and
retpoline/rethunk patching.

In the rare case where it fails to read or write an object, the
annotations don't get written, causing runtime code patching to fail and
code to become corrupted.

Due to the catastrophic nature of such warnings, convert them to errors
which fail the build regardless of CONFIG_OBJTOOL_WERROR.

Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/SJ1PR11MB61295789E25C2F5197EFF2F6B9A72@SJ1PR11MB6129.namprd11.prod.outlook.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c8b3c8e7090c..cde669923b72 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4753,6 +4753,9 @@ int check(struct objtool_file *file)
 	if (!ret && !warnings)
 		return 0;
 
+	if (opts.werror && warnings)
+		ret = 1;
+
 	if (opts.verbose) {
 		if (opts.werror && warnings)
 			WARN("%d warning(s) upgraded to errors", warnings);
@@ -4760,15 +4763,5 @@ int check(struct objtool_file *file)
 		disas_warned_funcs(file);
 	}
 
-	/*
-	 * CONFIG_OBJTOOL_WERROR upgrades all warnings (and errors) to actual
-	 * errors.
-	 *
-	 * Note that even fatal errors don't yet actually return an error
-	 * without CONFIG_OBJTOOL_WERROR.  That will be fixed soon-ish.
-	 */
-	if (opts.werror)
-		return 1;
-
-	return 0;
+	return ret;
 }
-- 
2.48.1

