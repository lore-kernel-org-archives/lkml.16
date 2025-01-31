Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1C158862
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354905; cv=none; b=VGaQm/CHjQf0uhsR7BYmhwD/1EULdVQy9xmPTjxk0blyqjJ7zxo3k3WWzkPVUNUDyeZfpl98RcF7Ju/g1NY6+EOId8xbfGnTJ9Zu/4dgHkc2kNRs/4of3k/5FsZd7/ilk89Oul0pl+0bH6LITnLW4yJoSm2dIMoLfPiObW0A1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354905; c=relaxed/simple;
	bh=1Ndbk2BaIajsSq6LVjOKCXHTVo6NfBh3Ifl5W7zU9q4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5Hl9HGkenLrebh/Rzj0e9Pvno95KVRFEAGtUk0F4RboNeBlffnqMUPoK8V1dlmWcZdKm3Yw6CEGf7hmNhDXPeLcpItqHQHlyaWz+Vws55Kpc9IzEyIj3L6W9ARwbI3LwQfhMes8SoQ+PW4pAGwGoKMs5eGu+rqO+sbrcJHFMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p4OGzqLt; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p4OGzqLt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCdoac009961
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4rk84s04nJmPDhNfVK0qQcCyoF1+d6Q1J1vzsSv4K4c=; b=
	p4OGzqLtXG8OrzliOzvzpTXZRhDeT3RGDDBMZY9EFoPTbIUJUyAOLSkJDdAPttFq
	6GapgCKLu98W9eJbwawhKWcESUloo6dGouGMD+mYeRW88gyNNxJr0iw+m2a0Jdve
	BbiDjyJK++CnaVcvcPJfsFGRGe0SsO5QviYxMThLVy/IRbhuDV0DHfluT1+CxjN0
	VMsEr70J3Mh0WWIKhWJ/VDPnv0/eJSvc5H6r2Die4ncKPXmd3J+dIamQLkhsMLqt
	opCzaiMN67RYZCqtomT28t6d0RWuQQiiIJ6pKvFNfF378SZ+UDu9jk+N64nzkxZT
	xNceCnz65VxnS7pBRNdZ3Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44gf921579-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:13 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:01:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 31 Jan 2025 20:01:10 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BB86782026C;
	Fri, 31 Jan 2025 20:01:09 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
CC: Fred Treven <ftreven@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] firmware: cs_dsp: Check for valid num_regs in cs_dsp_wseq_multi_write()
Date: Fri, 31 Jan 2025 13:56:33 -0600
Message-ID: <20250131195639.1784933-3-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6WRU9mbZzylRjBSYv62vo09N1j7PDP3-
X-Authority-Analysis: v=2.4 cv=JPXBs9Kb c=1 sm=1 tr=0 ts=679d2c09 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=w1d2syhTAAAA:8 a=pYzt1GAZzx6qoJfKPqoA:9 a=zZCYzV9kfG8A:10 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: 6WRU9mbZzylRjBSYv62vo09N1j7PDP3-
X-Proofpoint-Spam-Reason: safe

If a value of 0 or below is passed into cs_dsp_wseq_multi_write()
the function will never enter its for loop.

Verify that num_regs passed into the function is valid
and throw a user-visible error if not.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 56315b0b5583..aacf6960d1ea 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3743,6 +3743,11 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 {
 	int i, ret;
 
+	if (num_regs <= 0) {
+		cs_dsp_err(dsp, "Invalid number of regs: %d\n", num_regs);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < num_regs; i++) {
 		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
 					reg_seq[i].def, op_code, update);
-- 
2.34.1

