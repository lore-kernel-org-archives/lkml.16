Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BCC2AF1B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451013; cv=none; b=SI7XF62bBL0ZE8JBmfwuZPE0nnxADbDtJ6d7gRddU8+OkUx6kX903dCN2VnHqMIMXi1xqCPMGLoev9uZS6hmnFDzRxPNrSIHPaaC0NAJfM6GWoMXF0y3grd2dIRzgNHLSFt6+55+k8irJIXbPWZ2a2xdVhezWMrc+Z+icOxkKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451013; c=relaxed/simple;
	bh=hEg+WKVwi/0B1dVI0AvaCpEXJg82KJZJAJ11XdXcXT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8IxN/vxYmTNBl1Q3owOy84S+I5QVEtUvCQtXgT1GIeh3NaZoItFSGWcui1eQg9E9vd7xCGA1oxj+LNHuxcBpIRheDimIgnMBpsEOOsHpp7mtkg0uJBNkg46l0Wp3CBEzrWVjEFakuhDv2xCeyiz0jjZWm4IiJf/zXsTKR+72/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=N9VWdZKU; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=OUnLBeuI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="N9VWdZKU";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="OUnLBeuI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB5611F791;
	Mon,  5 May 2025 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746451010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7V9PDBh96s9T++F2TsLmR2Xsuc9lS5rGPMPHdNvE45Y=;
	b=N9VWdZKUp5waaEwReVQDor1mwa/ZewVgFy0uwCckhPALBAFBpGqpcUJIOQ/iPQwlwwiuVd
	8Ofe4vZVeFcIvrGhLLmf+y/2R+9qsCSDHpO4VF6GZ8hlkjVNiIlofaftYeXsE7vOJ337qm
	fS8lxjzkhCHApAbZsr6iaSm1CyBp6lU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=OUnLBeuI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746451008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7V9PDBh96s9T++F2TsLmR2Xsuc9lS5rGPMPHdNvE45Y=;
	b=OUnLBeuIp+m57fO4epo6IeyDojK6pLqBVkyJXMH3w5jBSR+h/gmc41CIp1NwiJH1eyUkch
	D60wMuc7UsGdd6PbR1dgDH7CEqqrRJxDithb8s5+nkNoakE2Zps/HR/tIAPy+LwMbz2dgw
	B6TGj55B59+EtMP3GXIz78ZdIVh6f5Q=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A897B1372E;
	Mon,  5 May 2025 13:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eyqpJ0C6GGiRMAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 05 May 2025 13:16:48 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/alternative: clean up asm/alternative.h
Date: Mon,  5 May 2025 15:16:46 +0200
Message-ID: <20250505131646.29288-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EB5611F791
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Remove some unused macros in arch/x86/include/asm/alternative.h which
could potentially result in weird build failures.

Fixes: 1a6ade825079 ("x86/alternative: Convert the asm ALTERNATIVE_3() macro")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/alternative.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 4a37a8bd87fd..8359ed0f2090 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -335,11 +335,6 @@ void nop_func(void);
 	__ALTERNATIVE(\oldinstr, \newinstr, \ft_flags)
 .endm
 
-#define old_len			141b-140b
-#define new_len1		144f-143f
-#define new_len2		145f-144f
-#define new_len3		146f-145f
-
 /*
  * Same as ALTERNATIVE macro above but for two alternatives. If CPU
  * has @feature1, it replaces @oldinstr with @newinstr1. If CPU has
-- 
2.43.0

