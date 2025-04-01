Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E1116C684
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481652; cv=none; b=ZicrvUnd49eDBri+od6moX2lZzTW+fTbyBqDkJRepWc6IXFCwBGk9EpLtxMytNO6WoaoGUI3k3/NM/N0tbPQ4HuRZ+geuoSpurd5rj+4LEp2wq1ink2MNct1MC1Z4Q8Bvj+AwnY5HX16opz5JvCom6ntYGXWwL3SB92Aci2YjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481652; c=relaxed/simple;
	bh=dLWk2coWakqqwKMQk2PsX5SMEBKGRg80zqaKkYV6ewE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZS84eYMkhFav3z4lIDdAOq/2oMDQtEFx5TEdTAhdbxRtjTjte754nhECCmaZuuz2XavzBZ6D+49VQCEC9K7A5jiwvR1BtaeCiJ/i48bvLSZs1DxC8Igtw2G8QeC4tyTZPR1JlPbmZd3pZVq9k3GT4Inkm3dEU7/rDaOu7UhTNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riyLeQe4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riyLeQe4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B88C4CEE9;
	Tue,  1 Apr 2025 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481651;
	bh=dLWk2coWakqqwKMQk2PsX5SMEBKGRg80zqaKkYV6ewE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=riyLeQe4wCwDyxP3ZycMNRHKqxeSe0N05qBnrMKeHLKRo4JUY6VVSSW2NJCNXPjMz
	 WSo+7vc4pYY3EAIiY6ZFh/pAH7AUfr5jNeYD9cL1WG30IY1LaLa1aApIsc+3FoRkJO
	 +gyNMNgpERuExvm9bIuCnnhp4qaQoEBlL2fdkn0QKHCXYY4C/uCBZeMF2Kmwqu2YQD
	 +N6Cdm0mO3cfi9mh0/CsLFU2FXz33weo68WkbUaBB4HCnB9spoNhx+y09D9uL76FFL
	 6nczSrgRlnoxmIH72JtSNRExK9fxxLxMGwmV4pYNsIXp19gppQufQOI/OudpRE/FKj
	 v91DvAVuZgSMQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 01/11] objtool: Silence more KCOV warnings, part 2
Date: Mon, 31 Mar 2025 21:26:36 -0700
Message-ID: <a44ba16e194bcbc52c1cef3d3cd9051a62622723.1743481539.git.jpoimboe@kernel.org>
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

Similar to GCOV, KCOV can leave behind dead code and undefined behavior.
Warnings related to those should be ignored.

The previous commit:

  6b023c784204 ("objtool: Silence more KCOV warnings")

... only did so for CONFIG_CGOV_KERNEL.  Also do it for CONFIG_KCOV, but
for real this time.

Fixes the following warning:

  vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data

Fixes: 6b023c784204 ("objtool: Silence more KCOV warnings")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index b93597420daf..4d543054f723 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -275,7 +275,7 @@ objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
 objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
 objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
 objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
-objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
+objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
 objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
 objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --Werror
 
-- 
2.48.1

