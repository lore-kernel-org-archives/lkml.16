Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C38226D1E;
	Tue,  3 Jun 2025 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987320; cv=none; b=Us1w2Tu7f8lru5AfKzb2+II8Xy3Gap6BGqvN5U5YoZKvZNso82kwhtYWci9mbCst1kzkOAI0XNyzMWLoAJzwRh6RtdCc2W6dTj7hLeRwePPAXvDFXDehVd3yswJMfDXdRFkBJQKIaccHwmctYraALEIogKxqE1tCORwz7p1n2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987320; c=relaxed/simple;
	bh=yUbCb+Ctu1riXH+pW2liC2Tgugc0HGwAuwLzAqBtQa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/Zi6law6TYqA7mdcjFUmbPuZ7SZPATgrV9LKuNKLR3cdzoRE+Jrj/S029cGhImx/QPERW8PlPdbMutRwdL8+NIPbpFU7eOPnOACn/xH6myTe0iTt9Rmo3uUnCgJJSYEr+Nlun1gqF4emVHwKBG93OlcDFvyc+7KFQu5d+qsI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SHFmoPRC; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SHFmoPRC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HY2s4014215;
	Tue, 3 Jun 2025 21:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=cu/BVBcspytBjGwz1R42iClswynE3
	pQaW0YdKGIbiG4=; b=SHFmoPRCLMaHnqCroYbdi19tRb5mXoEKY+TcAAaCTr2/F
	0+HAx5wwL8cT8RNyp9oP8wpSS6zn+oB/3XsD9ypSHeLlFL6xDR4RcWuy5NUuzN92
	UVtxwXx0MMQMdqfimSCCF3rfCJYpJUnKNvr+U0qMpjxaPIOrgRlLBa4VR7x2r6Fb
	bXhAkVX1gKrhdb8RT0owkI+GrsIWMIF/MQmem8D54TQ96HMJu2QkFJfaknN8gRQI
	QH+vWp8pQDbK+tycm4305BTI41pjUQv1plKL16IxhabverhZCV8GWViCNGMDlRbE
	n798961kAys62ZyGPLG+VSOCkv0yN96m7CPmRp6ug==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bjthe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 21:48:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553Lfbkf034993;
	Tue, 3 Jun 2025 21:48:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a7nk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 21:48:17 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 553Lkl43039979;
	Tue, 3 Jun 2025 21:48:16 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7a7njr-1;
	Tue, 03 Jun 2025 21:48:16 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Stuart Henderson <stuarth@opensource.cirrus.com>,
        Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
        Qi Zhou <qi.zhou@cirrus.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()
Date: Tue,  3 Jun 2025 14:48:13 -0700
Message-ID: <20250603214813.197346-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE4OCBTYWx0ZWRfXwUP4gZjp2tRx m65Ij7HEZGJ41dOZUFZunhK0ov3aBq6wLq1/z+8pO23TXoW3r0xno4dE3ZR50JRGwoaX0nSNctN vKYHEVqfTbve3P3tM6SE6Fk+82ZWejJ2O3nLYQ3u7c70rT3HjVt9sAPvU5yrYD5zhBcT838NePH
 LUzTipWskevbtvze7xv22TtVa1nl5QDvnOdeXUNAGJF1gK8sE7EdpLO0A/l+NH+p+WcuwDUlNhl NNN+v3Tr4ZJC8plTzOb6gcoJPhDEIuiG2a4sRhdym/JTCZdwNGYfMvxgeGk8/Xxi3mZ4MQDtHKD HNI+v704ugyurWDiWFtBaUghji76lHwqMhc+DdxmR4DGcWC8dWpWvdC2L1hWQ4uBspbb4FWvpGZ
 Jn/d/B3/H4CfANUR18pSFjx+WOWLNwuc7iMQhNcNKpxCGR1ekhRsO+eVf3XYh6vzlOzgZY1j
X-Proofpoint-GUID: wwRIlk9uXZ45jzUac2hlg7TL-g4bcF7X
X-Proofpoint-ORIG-GUID: wwRIlk9uXZ45jzUac2hlg7TL-g4bcF7X
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=683f6da2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=3p5qKXADCijJtyuCSnUA:9

There is a type promotion that can happen when freq(u32) variable is
comapared with sclk_target(integer), when sclk_target is a negative
value it promotes to a large postive integer which might not be a
problem in this particular case as the condition evaluates to false
when that happens, but bail out early when sclk_target has negative
error codes.

	cs48l32_sclk_rates[i].freq >= sclk_target

Fix this by adding a negative error check when
snd_soc_tdm_params_to_bclk() fails

Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is found using static analysis with Smatch, only compile tested.
---
 sound/soc/codecs/cs48l32.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 90a795230d27..9bdd48aab42a 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -2162,6 +2162,10 @@ static int cs48l32_hw_params(struct snd_pcm_substream *substream,
 		n_slots_multiple = 1;
 
 	sclk_target = snd_soc_tdm_params_to_bclk(params, slotw, n_slots, n_slots_multiple);
+	if (sclk_target < 0) {
+		cs48l32_asp_err(dai, "Invalid parameters\n");
+		return sclk_target;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cs48l32_sclk_rates); i++) {
 		if ((cs48l32_sclk_rates[i].freq >= sclk_target) &&
-- 
2.39.3

