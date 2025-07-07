Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1641D416E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888743; cv=none; b=u1kxZL2korm2ylLllE8ZN/sj5DF/Y3LzDIio4QGfMYcBSt4NfrzRSt9IGACa+VGhcrSLKEPTo3vp+1gIiZcNXlMl3TmAwvWojjwB4HZ+SPkz2LFrcHVly818rvE7LtqrNBczqJXZjQ6kXZr8/C2CB4a0kipKYxx7lcGspVKLEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888743; c=relaxed/simple;
	bh=rg3zfYj/gKmxQ0efgsMlBI2lBNFHL2LVIpJizVtx7to=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=PadgSbHlrfg8PM2eUupoDtmKTDAg2xUkj9QaqMrJ6BRzmiC2FAsYmGThalswn3iLmFUyre05+FNWZCwEepfCmpt4xHbuV/lHTp7+++DZ3u/wmbSvhYzzmL/gf1PtYDLuQ7y7WT9xglOIid67/1naO10jSUQMuz/PFkDqsP+wJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vyFOUWjQ; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vyFOUWjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751888725; bh=MU/1w8aaNHjKYcUTmUNkETbV0YpGD2hchqf3WaXNKyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vyFOUWjQoaHlWo5SaLnxwsZGdmeMPhFhgo7dyB+LcKjGovRCx9dyWbjUyqQfE28ht
	 nnKV3/6zR1qIZG8IydAAQ3Jyl+WkNym6CtGUWiRKN3NS2AkkREO9HeaaAYQ86WuGld
	 4ycmdm432gOD/htwJj1+9wFflAB9C2EVzL2JZyQ0=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id AFB344FE; Mon, 07 Jul 2025 19:43:59 +0800
X-QQ-mid: xmsmtpt1751888639thbn2rggj
Message-ID: <tencent_BC9915CFE98D8D25B70D9E9272DDDB5D9607@qq.com>
X-QQ-XMAILINFO: M/NR0wiIuy703CI9FSqpJzvoNrGKSfgic8AdKbbeKP1PJ1R5d7KCHkREERLHCo
	 luDW0LeVg/DobUBWVA6v1++h5TtXWyD1hMR/WyHvHU4EPkLnLGXCPwSQTr1Bo0RaqTmbhzQkdGrW
	 75bdRdsu2lSMcrni6MrTct17GT94b9467YC2AhUK6czd8bQDSqz9TNyVTHCXdYDlujgzht9cpUfA
	 V70cfWhAol/5g56/kCggXDW5C85J41wj2Rf99wioH3/F0tUjbZz1M8tru4jblD5PyiuFn2wLZqvf
	 kv4gFa+we+ajJQvVNmnHQI2SVHIGzGdz07lD0KqcqzuEjKSRddGCwXuTuKX28683E5DhjlGU+6Ei
	 ygS1wK4c2ILCxpFxeNpmO1yYTlBMpMwroEO3ELVAuYLJUkvFz8tELFK4YKKAp2sLw2hBeSwkTaux
	 2qMUVWEMIEYe2iTp1lGjiY/pwySmGOz8EjWVKDgXj672wKLt3R2Ebx3ue/MJHlTwjwE57Fzyh2uf
	 m8N5i9blpk5PftAjjmPuMV+XWG4JECaM59dkRHVh1nqPf+MIF6132RoVLoOAMpBhW5mH6cni6GTU
	 jBEdA6xdEVtC81A7gzAlXYX/rOcNkBG54wEIW3d0u86lNDECfMIL4Z2ZK0X8AsYgNZ13NQdw6CmE
	 IV4eYiPGGPTDrFemFWcu6z1fcwoakWdzqvDBWHeVKCcU2QJEy/9MQ4PLNBPDhdJQBKAbFnZ1IWZR
	 ZJkduS5hOxWQWDjRFFVPf5b7leLjg2B5PGPaNnQPN5EG3tOfPReAjvbFV/DY5/XVHClssA0eU1h1
	 4oqfzketjrWaRvHorP4IHen1A+5YJ0Xgqr8LvHCvkW7CEmBvfmQvostFZ4MQeBTWQyfg3EO9ibm6
	 DGYKuczwvXNaKaHwRfoHo5i5KyReeT8CMpvKXV6oYvd0Ll5IKSwRQZWmFkFpFj4D8U+fG18tfMde
	 0PAUwonKG18HRz5SjQqz1twqN8ui8xMPKTLko1ki97z5GeWpYfVQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: abbotti@mev.co.uk
Cc: eadavis@qq.com,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V2] commdi: pcl726: Prevent invalid irq number
Date: Mon,  7 Jul 2025 19:43:57 +0800
X-OQ-MSGID: <20250707114356.3567993-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <bc883c14-95d2-4fb0-b32b-9a46cc0c4acd@mev.co.uk>
References: <bc883c14-95d2-4fb0-b32b-9a46cc0c4acd@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reproducer passed in an irq number(0x80008000) that was too large,
which triggered the oob.

Added an interrupt number check to prevent users from passing in an irq
number that was too large.

If `it->options[1]` is 31, then `1 << it->options[1]` is still invalid
because it shifts a 1-bit into the sign bit (which is UB in C).
Possible solutions include reducing the upper bound on the
`it->options[1]` value to 30 or lower, or using `1U << it->options[1]`.

The old code would just not attempt to request the IRQ if the
`options[1]` value were invalid.  And it would still configure the
device without interrupts even if the call to `request_irq` returned an
error.  So it would be better to combine this test with the test below.

Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt support code")
Cc: <stable@vger.kernel.org> # 5.13+
Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: combine test with old test

 drivers/comedi/drivers/pcl726.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
index 0430630e6ebb..b542896fa0e4 100644
--- a/drivers/comedi/drivers/pcl726.c
+++ b/drivers/comedi/drivers/pcl726.c
@@ -328,7 +328,8 @@ static int pcl726_attach(struct comedi_device *dev,
 	 * Hook up the external trigger source interrupt only if the
 	 * user config option is valid and the board supports interrupts.
 	 */
-	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
+	if (it->options[1] > 0 && it->options[1] < 16 &&
+	    (board->irq_mask & (1U << it->options[1]))) {
 		ret = request_irq(it->options[1], pcl726_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0) {
-- 
2.43.0

