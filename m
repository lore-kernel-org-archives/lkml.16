Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E599033EA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209714; cv=none; b=GvdyngMffFzwghKW/NMngbhAC5fOat4esazH3p0jjrzPSbKt2lyqSyQG/VZ3P2IQEyQ9JkrrEqBnOeoDuk1WrBI47vmOs9yqxdgOOJ2KDTYLwaVckXx/JF/xXRhNIEvnHKGgOPRnqbn7MjMkEuiSAldC91Jv6rSJJlx8nGKzCBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209714; c=relaxed/simple;
	bh=fjVxoqBq0tG50me8xFQJx38ltEGKbUD6GPm55N0kspY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=blnDt3SteFPZnbGuFXTmTtum02QrRgGAZgtWJVgSfo4bHY9GpJdB0IVcvz0G/c2O0yzAb9xBSeNovZvuWMGJGutnHwsCJchsSx1+7ZREexZQYZq1VQ6T6pD7wIKCjoRXZiYmDnUpxrZXZuyZU5rQFU3xAiuFM+wCErfg/e5ygPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kY6A0Gw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kY6A0Gw5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539B1VEU020984
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 14:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAlXsfsrquK1S93niFLe52PvZv7ysy5cm+5sewzm3OE=; b=kY6A0Gw5RjTgDUQx
	0WNBUEzbuAGu7lG9fqa2sqxAxn+bToNflyVS5aEOy/ivCfDwzlVJmJJnVe43s7Z8
	1czlzyx3yRNh6sQDmx4cG64N+Dy18wvA1w7spXfUVSWQORgC8ecvdDFXPbAqT6Iv
	meT/FmzBe2130OXePMoT7qmD2e2IJ7OmPHILtfB24TCLMBPwycMAVKVf3Pun4UCH
	IxttwLkg+dzlPz+w3brPv45JfeWFGnG9ecdbqHU6ZAPaG1iZZDtDUPdXkS/7izwx
	pRUhMj+WqwWu6KW+G84xYRO5IZJv+HWPxsF20qMVBx1ThLvTAMt+NuWoRbieb3dx
	tR6hSw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrkt7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:41:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8a4410816so5659264a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209710; x=1744814510;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAlXsfsrquK1S93niFLe52PvZv7ysy5cm+5sewzm3OE=;
        b=NQXQattrHlUFRjIvx629vkDZlA3pkGvIlX6/uLHfkCLDqpH3MHsqG89iQxdm7v6lUi
         /O+t/4FZ+3k6ica1FPOawRpYCmgFgPkGSlx5k9/iqo4qc4jh3NeNTGvBU95z6rcpdl8j
         O5owR6TN/49lM0NuYg3dy11GEyMszutJhvxUdnPYTieBwGCqCxnTtx9L86yWDp8lqXrl
         LsvMAI6GtOODrNXXFwVHBQH7pQ+qH3nXDCPOv9ZgavVqH+lPdC1P8/FpJkRPXUIa/zD+
         ml9QKcgqnrUvlwiR+bE5IM1zYvvxZFkX3KhjHYVIPP71d5nUqo61zpF5H+mqqDHU9moZ
         WDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrksbAPlXg+BylRXbQDLDrScFaY5Nc4r40VUPmGsORu+kGal2nXHk9VYTbqd5/1LmLI8sdtLHJvWI6PFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ehtfs9FGlvX+BcVXbUHOlXCDVVx0w4r/Sr6B/Y74M/cjaJuZ
	QhnYbYIeGsXiE4H020NdQ+/lxVQ9yW51wMac2N7z3b451oPJLfr2cCqLu+JV7N59l5dJeZORv2N
	kWK1mSfKFbttnrpzYzxD1S1bSe9CFKOgQDugiTYoyWnniTOgBNuCe6gMrROSnb+E=
X-Gm-Gg: ASbGncsuthSyZe6gGo5aVY43OAWvwFq6KEUYNs+hwbbECDz/AnfVOKesr4JVaXvQb6M
	Ty2YgycsyK70LUQXh1APvAqJ/W1yWQ8vK0SYmU43TslT8haVcf+99fJo8wCwmLyMCofXxCscmtI
	eyyjR4wV0bh5nkV46v0YsmKRbzUBMoMec2+7pwYd/9fyMPa7omgZ+oGB/fJ8SQ4bppFQtXhao83
	cRhXJZKc10urdYjtrNc3bYwGtbTtJOMINWr87fFdleWL8LmzRvZ5Oyx4svmzO5HjFYpQyaW+i9C
	HBAcvCttfWnYICGEPAQCSAk8Oa4zcY9T4nZ3mVhGAzSgQX3A
X-Received: by 2002:a05:6a20:2d29:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-20159158073mr5477101637.7.1744209710193;
        Wed, 09 Apr 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd0U8em6xrEZ2t7SnXCW3CgYP38EE8cCvSPcV7P2UyDUSrlOWDuG74IpGN+9Z1b3imdkiXgA==
X-Received: by 2002:a05:6a20:2d29:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-20159158073mr5477058637.7.1744209709823;
        Wed, 09 Apr 2025 07:41:49 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2571sm1307153a12.19.2025.04.09.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:41:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
References: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: ahb: Replace del_timer_sync()
 with timer_delete_sync()
Message-Id: <174420970903.585328.11717154866782453003.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 07:41:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: AtDymDvVqvTij98FQ81q_ua8yGCwkEco
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f6872f cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=xVpgQal_Ih3nwBzge5IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: AtDymDvVqvTij98FQ81q_ua8yGCwkEco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=846 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090092


On Tue, 08 Apr 2025 09:14:12 -0700, Jeff Johnson wrote:
> A linux-next build error was reported in [1].
> 
> This is the result of a treewide timer cleanup [2].
> 
> The ath12k AHB support has not yet landed in the tree where the
> cleanup occurred, and hence a new call to del_timer_sync() was not
> addressed by the treewide cleanup.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: ahb: Replace del_timer_sync() with timer_delete_sync()
      commit: 25b2f46bd7de2f0007d742de9d2e72e65db0edf3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

