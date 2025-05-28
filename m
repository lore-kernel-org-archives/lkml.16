Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61BB28BA8E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444878; cv=none; b=NO8ON6iXGeaEIlEgfrB8uG4kWoHHaniPVGTpnRr0kvKTj78qRReK3vUXQIa3QZahOelnszhje2RaacWeq1bNdBmknvfqib1vcr+549TrvbQCEA6+XYI4OW0s5NT0mviZETigp28V3Sh7GPOUVGCOWUPYFgjSdWPfkYJEfOVIQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444878; c=relaxed/simple;
	bh=eP5T/3qpa46WCtYicGSqpDmblYqTBRA3wTFS43IZLJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EY5Ud0e8i0DQephsY8kCjFbh81sAp9HjsdmHtAEObUHbNQBcNn6/RdXiziMvDvKOm5xxGeRFjISCZDgBFhxxZmUhkvjGwi0IxvlfIbhEuWKLjKmg7bDFbPi4ah64n3ZuhClEk9mrPPbnOGU8CafJp15RPx8Kh+26bPh2aLnfgRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7heSTcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7heSTcY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6CJ4K002357
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gb3xYR0twSf
	q1c//vnklZfUitvGdMHO5hjz2yEsPShM=; b=N7heSTcYMgQVcfh1o2dxo8/pNnv
	hivx2q0ojUQrcqKDhtFmqBZh9Os63/Aayc2nv6TVv25dquQN9E3WXOqz/3als0Kh
	uHCrdisqNeI8UOLiXRqpa+Lrs/DZIaImgjNn/0Z6l43oZ/5Lw/wnzTJefTgRtWRZ
	hLnrt/GPBfvPPIHvCA1FXVrjyAomXy7prBlyfCikxbZwwKoU274Q93C/o8Kfzqx4
	PXyFk9TIJvcYil3B+H0CLHqZ01jK+mX6U3Rj106OEmenEu8oKWHwwAsO4+b2I0l9
	MHuo1rEspv7/WtUqflvbGdjWf1dwikkSZe6ahIQVSharCdwofgh+CUz2tHQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkvdrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73bfc657aefso3172551b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444874; x=1749049674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb3xYR0twSfq1c//vnklZfUitvGdMHO5hjz2yEsPShM=;
        b=KxRbdvgLL3VdpNI9YUXK5CUZT7BvNjqX5OuPfjTQqCIszSy2sH1ll47f9uTmiv8djW
         YncFVtl5eLd/xAKL4k3sdcykoEwBAF1qgx2p787UfX0b9kcQNDMicIAwMoGbboUwu4pf
         VFhydYr4U94M4c+wNkcmDn5pCQs1x8bX/oYUddOIvh+I1py8OL2hci65w3sgxvG9+Zii
         ZWtAuA1UCcsXLOH6w+JAimIFNx4SuDCXjnnHWadxWtLixHPTXXFZJpbHpM48RH+utoEj
         MM8JCbPM+dE8OCgKYPFXVtNoIeOuc75rJ1RgvPMJJcSLsqhnwE7umDvGiwNdr2pGQJGo
         KHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8yfyRo3Ung3K55sm0BZFSQqMowUhPxw+M0ISqd9UwUK7AnI6avSMdDfpKuWzHT18SYy0KOeVsGLyoTGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG7K+Y1ylfdtAQ93LTQrVticorl8ELrvwpQvkeqoxaGfZrEKr9
	kLsY3GARYcqvqiuGrrjz8B2cCsCE7kpBFfHzZAenzWva4jKC6AZAB4jKMAq5/PQpfGYIUN/uiJQ
	dzAXpAK49pZBTHHH58Fk7JLCkxvbthyOFgiGuBdQ2uXmK1Ob9rzARQ3OzjOlq7sJmoWE=
X-Gm-Gg: ASbGnctoa9d8DOyzOWdHJbWXbyCSffGo2q83eoDKCnqwJYYakBoMTuonQC+vrpbRwv0
	r641zqJQL/e6CHWwn0UlrlRBA5z9wZxIzSq/mg/TbuXsSbXW7hFQnqsK5W+PPS4Mov6uL3hcGew
	eQPIC39Bd2CZiZM1knFjuhcCrNGXnZPSsFbUUG0CWWzDwAPJ4gWOFsCARFwS2mp4ZucjktK5f0b
	y9677f8N0hy/snk3bRxCOXt3qo3EwoTz0yWBt9HiNSE2XryGzy7Y8q+ctuzC2ehJOUbJOMGH/5T
	vhenx/IppURWnlg9ArviXGO2IIiYW8afBRGUYV6kRggqmE+p
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23275015b3a.5.1748444874045;
        Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2DPZNzIWOgIK1UTiCkv93RY2irWaXKYNcC4GZJqV7teGlU+c/3gBg+IH85a/2jZay3rIAgA==
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23274987b3a.5.1748444873687;
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links
Date: Wed, 28 May 2025 20:37:16 +0530
Message-Id: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DaQOLsWLycfThAMxlxMPONTwgeAE-AZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfXxePpurJWFn1S
 vdng9YLd9dyizOy3qoe8x17Gzqbd9E+5kXgrvjRoKvR1xWj8YMBEci45+tc/ktHMj6gLI/4vwMf
 WQOy/IrSPs0dKUirPiY15qNjkD8iUuK5GThZez7oVBvGrZwtqPG9TciNPkJDCmLUzDch7z8Sh6W
 oMPrB+jIaj1b2A5H9g9FF25LBMmETHD8rIKExqxPTD4fimkSmv+QoI61OqmIToCSvxhEwMZi87W
 UIRsEc7GBEotjDDjySDpk+/KJX9gFhx4/TN3YOjQOCb7eapkERaKwoYiR35V+JNpJgZgL/WjvJ/
 NQMpalwYE1hJKXaH57JuCoK4e0Zs4p5LpnfOf3AZxAyopb95YS4PHV68wNAsFu+8Rtrgwj6/W5d
 IxGJ8bu5uVnrhsac/c0kBNtepgTdVcr/zLCGLFjjzRtf1ajAXa7fWxAHVx0KlvRBc9QTiUwQ
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683726ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Tf-tFfCcsC9FfDuVxHQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: DaQOLsWLycfThAMxlxMPONTwgeAE-AZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 99fd34728e38..b1b31d197b42 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -147,7 +147,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 1) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
-- 
2.34.1

