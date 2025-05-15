Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101C258CDC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332117; cv=none; b=HkpO3ayg6yCny8ODajdnuioECogqw2yKIG3GneJw43F5MA6AcsGJdv9kENjyCvMUWIM5p4PSv/XOMcKgMd6ts2w/pWemQzGyfqeUjKKm8XkO017BMYmC4gA+Q1bDRWJF80CbSN3MIpi3GNQ56mDSLI54uUytYW8ThPRfQN0JEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332117; c=relaxed/simple;
	bh=sOy5uLlGhesCw0G4Yakd2VaCUr9lbd+bxygNUNr1M1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UZLtXSsl9NhKkyRk31M7jNtIQ//M8H951s+jKtXCRjQhBI5Nt88yKtQKea+5OBS/uWyJCN6/otyMPcc7HLl/ILLSHgw0YN3Y/3Rs7DBqk3fgg3ymD/cFK7uLuFWUIsWQ74ZLMVL8X7SKFaxeH7YFSd0LLHqklD6iCN0La37OMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvHM+jI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvHM+jI/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWsb002119
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fsC+dmKFbzMLabhjaIcqTK
	WghcdPAOZ8jCkq1SrvNUc=; b=BvHM+jI/+I+NZcxEC6wHiOBS0Ch/2s9jDlYCx6
	uF2pM334ZPxhMX5wWoWeawL1Eoyh0Eiu6SxO0x63PehVjqtvyLFvFOgGQl1lXAHz
	y2TVL4w2iF8yXyS8c9GrcVye60sWapoZaKphp5uoVhfLLdvDQRcJCO76P4GmMJlx
	saT+eLBxxZ+TQs94EAWGOglJit85VT8V3h8URl7hTWkjyTNfXtV2YHMaBs/riWBA
	GpNQQ42SGoVKB6G3aKu0LBNUORFWI1xjSwENDlHvLd1rB78114GuhyZWjtvCpl8/
	daCINFGhnT2nJY/RXTuTZdgDa/vX2AU4DEfrUvpZahv1VIzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrf23w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:01:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231d4e36288so648325ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332095; x=1747936895;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsC+dmKFbzMLabhjaIcqTKWghcdPAOZ8jCkq1SrvNUc=;
        b=ArCkZvhHEv6oFAAsZx4s35BVEnPaLmh1615LIZ7vzScibV+W+mVclcBjOA/KQZkL1/
         0GqiGILetks6NyV4xMvvQkFSs29CEfeARtVhllAWoC4Yiw0cYJEUYnYB4/pHDFtBAlVd
         EX83L+O4bkTjJK17eXeXRJqY+f1W8fqUXYlniSN2V6dtSeLaRhG0RtQvzgV6ZjPTPtQj
         c6aLV9ZSIP7F2O6udOMMlAGLZ/7RNL930+yCV8WIeEx0M7BrJZRm5Ow3dL7vybzPJS4j
         h8z7HLJ2kkotaHW6sw1ISlwhpit8QKZziffKs/P1PHgo6IwinPz4cDMu+mQxynvJjpxQ
         bGPg==
X-Forwarded-Encrypted: i=1; AJvYcCWMNNGMJXwfXcNVt31lOAXkZDmWrQz53ovXmnnq0y3nQ4dd6rgIOUrYNU2ooU6GbldA63l1BRcZzrTqTbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iPZJMMXHmXCjVoAbc6pRX0PVtQ4tPTXgkhyD/j34RVX5kto7
	XTnpXxp3/ODp2YIdAvixsiBm8ZRQzuikgODL717VaZXNC+HFy6wrt31dwqyOm3WafaRs0xkOsT5
	7XxVBSvAjwaMHZG3s45oEJNmGtbWyPtVyqb8+Rp5mq005BdXXXZcilLrbdWnqOVU7TOgWMVQ00u
	0=
X-Gm-Gg: ASbGncthjWpEhvhvif5L0JLUO07ikQLx9NVr/69n7QXuHPovFoDZPtj0mizdYA3ggwb
	1WNlJTpX3e8tz7LUqAyy+/GAGNra1QT43Ti8rTbQUWGGE3CDUy3Wp/o863SKQ9ESSz1AptPfNGG
	AJaD+taDjKXaaMXpeZ8DhAc6mflCCO9/LyyQ1SfTUNUJ3AnDbbymEcLbkGIBayn82dwTo007+yc
	Z0MCzEqIJLHKPr3sNOmbnQC/hwI5cyiqcVZzTwM/uIAsdjl+k1TyBWH6udk7sbGjdWdD/CNP+Eg
	D5aw8YUzXZTII4aygc2KXRvO3DEGq22EsWOxG12prCfa2tvSMGi2o/UgvNrE7G8V8+8XKFYqye7
	MjFZvFT1Hl1KSctZzLaJJLVPXSvJD7dF1Dsp0
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr4613125ad.33.1747332095565;
        Thu, 15 May 2025 11:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYXXgxnWdQmJyD0XWr6g147ptwEDwXQ4FgNhLnaaUV+QyO50AQyshEdbhLPpZCG923rRRs4Q==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr4612495ad.33.1747332094987;
        Thu, 15 May 2025 11:01:34 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe887sm777435ad.88.2025.05.15.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:01:34 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 15 May 2025 23:31:21 +0530
Subject: [PATCH wireless-next] wifi: mac80211: handle non-MLO mode as well
 in ieee80211_num_beaconing_links()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-fix_num_beaconing_links-v1-1-4a39e2704314@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPArJmgC/4WNUQqDMBBEryL73YixCqZfvUcRicmqSzVps2ot4
 t0bvEB/BoZ5M7MDYyBkuCU7BFyJybto5CUBM2jXoyAbPeRZXmalvIqOtsYtU9OiNt6R65uR3JO
 FKQqrba66ttQQ26+AET2XH/ChgCMyC4fbDHWMB+LZh+/5u8oT+nuxSiGFVraVqqpUq/TdM6fvR
 Y/GT1MaBerjOH4op/TT1AAAAA==
X-Change-ID: 20250513-fix_num_beaconing_links-c44dad29fb5a
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: CTZOP00EL1-tGAMeiZ87yyOIGmrOBd75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3OCBTYWx0ZWRfX6xV0NESIPpCf
 iDLxp1H/D5d+UA+oQrwCa81PxVmIUFajXKyY5yNj/9+oSoFj8xoIWOcEVjD0aWvULlcbrsTsM39
 7WxnLg1jbZlWouC4Sqqe8T9bxkzowCfFrguKmujzUSp7GKOCD7cSDJuDika62ns+Cvu2rqjM/Rp
 gZpU3s4tlQ8lkR3OGS47LCWQsC7suS0Yju/8fbqFx1mZYlDAE1WW/TrFKE99CYsoEgb/krgmKqj
 nxQfssebWRGscm0mZBNc7ABqOUKfUV8lEJmWRSXgiUkWzE5zV3NsjzGP92z4xf0qQybQVhpNYen
 kIne3+2PAHieCt1niE+e+0bo0XIkwf4WvltVucMlK4/60vZffCLRQFUTU2/YnUwnHk7WUP5hN5o
 ICFEet5s1Y0+qHeTy/e6ohOBlW8T8AyQOOMUK89GuEyH0UjyXztprjKqbnSQ4FV4Lf3XzFv0
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68262c11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8
 a=EUspDBNiAAAA:8 a=24pOLicwr4PYXPShmKMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-GUID: CTZOP00EL1-tGAMeiZ87yyOIGmrOBd75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=835 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150178

Currently, ieee80211_num_beaconing_links() returns 0 when the interface
operates in non-ML mode. However, non-MLO mode is equivalent to having a
single link. Therefore, the function can handle the non-MLO case as well.
This adjustment will also eliminate the need for deflink usage in certain
scenarios.

Hence, implement changes to handle the non-MLO case as well. There is
no change in functionality, and no existing user-visible bug is getting
fixed. This update simply makes the function generic to handle all cases.

Suggested-by: Johannes Berg <johannes@sipsolutions.net>
Link: https://lore.kernel.org/linux-wireless/16499ad8e4b060ee04c8a8b3615fe8952aa7b07b.camel@sipsolutions.net/
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 net/mac80211/cfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 2cd8731d8275b2f67c1b1305ec0bafc368a4498a..05b7296b152cfbe1e81f8981eee52d72f711706c 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1290,9 +1290,9 @@ static u8 ieee80211_num_beaconing_links(struct ieee80211_sub_if_data *sdata)
 	    sdata->vif.type != NL80211_IFTYPE_P2P_GO)
 		return num;
 
-	if (!sdata->vif.valid_links)
-		return num;
-
+	/* non-MLO mode of operation also uses link_id 0 in sdata so it is
+	 * safe to directly proceed with the below loop
+	 */
 	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
 		link = sdata_dereference(sdata->link[link_id], sdata);
 		if (!link)

---
base-commit: 06c4b2036818585542a16f286d88ad8e7b7a8252
change-id: 20250513-fix_num_beaconing_links-c44dad29fb5a

