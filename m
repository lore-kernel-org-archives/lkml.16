Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E32E7F33
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035429; cv=none; b=Bl9Q09is9ZYZEmpnRUXGCr8IXWjhV53rnhLIUzGyjo0ro8wxSdaEDqhyaPP8FnfHgIPhcLp0rWQw7jtRvA7ieBk8TrHRNlhOqV1esSFNL9OXnyQ5w2bRoGlPKM6FVhwXj3OKx4O4wiV+MOQgdIVU4/SNuJa7YcPLIjsgq6EY4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035429; c=relaxed/simple;
	bh=urXZsPHNkhY8Rac6oVuHg2L5aQRzeDUs5jJpbuU1/zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FEaIeeL+9NfJUX38apQNiG/ad9jb+DOe7IwRQPyyDbOI5peLeooY7QW3gIAQhumbvbwVlbTpKA8QwIt4bqC0bcEVmedYFRteIZzVRKuI7n2J0nkQ5l24pu5EqMbM601RxEIkfAMbSbtW4WielaTEHjQdEemnulmiUyUJIeaNK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ex35FR+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ex35FR+X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC6OTk017354
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9EFRwZP1e36itfZHTjQBQ0grKUjgQyq/PCcoTAa6Ww=; b=Ex35FR+XA0pz48RA
	3sun/WwGlbfnJ5QDtzyS8xzJ7rRDztcCs0iprOxPlBhXpNkaNvLHN2yxtlvDDZ2q
	ub5VD6yNtccsAIFt0n54dH7WO6i0tBbgons1DLV+azRyT8VmBRGJNoOkXtofiYmP
	2SaaC5aT0Ec7Qje7R9K/iQvZjDDkrEO8ibdI9OZs1ir+vS3k4V5vsKi61+04Jz8z
	RkvPZPmr5UAkIUUQoVOL2YwV3UW0VIuD5RUgUk3BDIZmP2o4SArEY+sigmmvMwoc
	hHa7cgnG+7MslJ/U5I2+udHeXJmNp9gpsYr4ExQVXuuKETk8FrNC26CA9ofKpFGS
	i2Ct+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25rvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748cf01de06so4749552b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035425; x=1751640225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9EFRwZP1e36itfZHTjQBQ0grKUjgQyq/PCcoTAa6Ww=;
        b=H180oaGujo9Ygb+V9+oMxA0d2mWGaqWlWrHGLcTiKM7Aeey99cw0DkuJQf+UfVLLzw
         2wIbn4AERQj3pC4AFEQQDkNJfXFxL2SHLeCFEwKDf3MOxZnowbfGWonPtvn19SyuGkra
         mP7ja62MuxvCjxvWo2FDolRAcgRqL3O/Eh3Y1WsXqTBZefZpewao8q60e1LpUnivIj+n
         urxdzfn/hQzN9gzxwPw0UBOn4SHKHC6kfL9AsERACULmfZ/LJJZFanjlDYpU1HE4bXBg
         iec7cu146VdwqT0Z25CbMc2nD2rl+dJYJNYdyuzE0G3F0EGnoWySOPXIeZ1UTsemm9sG
         8Yag==
X-Forwarded-Encrypted: i=1; AJvYcCXtJGkzVMsQjDHqKr0feswadIVc+ShxHrjkkEaMrnKfkohycJUFwAmzH89KlBmlbW0O0F7LnqCmC52bFhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh86r2Lj5FOt8dJshqPhLSb51rDxImeXy9bYUY94Q16pwr+Ef+
	nMPimpltbtZn4i+ESUZi2BRgcJ1bS6k3ENHNVbf5L7/3NvupQHkIhnTFtjFLZ1HRvhTLowzZCFK
	1eH1j3+RIxBgJlMBnxcjBvqZmufQvc56Y6NgMEwaH9N5vkm67+IiKRvJdo2ggL3H99vc=
X-Gm-Gg: ASbGncvekheHBCBpEZVjzdgPmhkpx8B5nMZTNW/wDQTcEWqR/G0dFJwu1xPq76Opk9n
	VzqrlkslHZaXt5L7+B8Kjhincw0xZjvB1auTv4iWety5AI/0R/UynA2MdC9kwl6jJNuHfOOhjes
	ujT4oMprC2BYLuVp2szGoEVHvFNuJE92KjbjBY/9tqEv4JFwxG79Mo0z0RM7M1cIntt2qIy0IW1
	3FdyBPNodDKz1tN2veNNSgTcVf1Az65MeECAGN/TIPRnZwY8HQyj7z9s8SsQyfq1RRRfO8zAJsl
	SBoD4/xte9MWWxmC5mKAtUZyF+ewSzOR73uQi0NO0RO4Qn11upm1wmvXzCY=
X-Received: by 2002:a05:6a21:a44:b0:21f:53a9:b73a with SMTP id adf61e73a8af0-220a16c9babmr5592247637.39.1751035425412;
        Fri, 27 Jun 2025 07:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJBal1ZslfDL0W1aI95Q+gUhSBqQCx9NdcvLWnqtVxfiL77OjhxkDFG4YUtNERsvAyDfMSIw==
X-Received: by 2002:a05:6a21:a44:b0:21f:53a9:b73a with SMTP id adf61e73a8af0-220a16c9babmr5592211637.39.1751035425031;
        Fri, 27 Jun 2025 07:43:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4ccsm2458956b3a.156.2025.06.27.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:43:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: viro@zeniv.linux.org.uk, mingo@kernel.org, tglx@linutronix.de,
        kvalo@kernel.org, algonell@gmail.com,
        Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250522205701.393612-1-sumanth.gavini@yahoo.com>
References: <20250522205701.393612-1-sumanth.gavini.ref@yahoo.com>
 <20250522205701.393612-1-sumanth.gavini@yahoo.com>
Subject: Re: [PATCH] wifi: ath6kl: Fix spellings
Message-Id: <175103542398.3295854.3644708485845243274.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 07:43:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eae22 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=04a6cyt-vfZyN51_R3gA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: h7P1OcEQSDx7cRGAZzBD0zElw1td1V_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX2YxfOYl0NgRz
 /sCiyzlIJR/DtbAlkRRbc9KkI4tnEzkZbc45o9xD+GcgKVo79mPcZfQzqMQU2VCLUj5rgQOrWnY
 zmQ6H1LVxONbg0Sg/WhIuhPuV5xI7HIWe2m2wT0i4mpJH4Gb5uoMh+bGnRVaLcWPK2PQ+7Xdp9T
 XVjoPivZ5JczZteRuWbRP9kvQaPDevVtqA0LdiHEx+RvmnLvTgkvWSkh8jaZKma1LPBl2t1Hwqx
 7CV4YyA0m0rq7ez5MKy8kVks/uuiQ1i6+5f+2kQz2ger+lAv5MDIAXPkdQZuXqKe/1BXYlbVryD
 kucgUZZFovOuPcovA4KqFgId7Tmu9LYOFmXmOPZvAvGgZaO1X72SYjBVCnJ3dSzinIUw1OZ016E
 SzDxG68E/U08p16q4X10IAfbucE+Jc+ZSgdJkz3FEza029GRhpR83j0vQtQqvZI0tf4En6sh
X-Proofpoint-ORIG-GUID: h7P1OcEQSDx7cRGAZzBD0zElw1td1V_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=691
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270120


On Thu, 22 May 2025 13:56:53 -0700, Sumanth Gavini wrote:
> Fix misspelling reported by codespell.
> 
> 

Applied, thanks!

[1/1] wifi: ath6kl: Fix spellings
      commit: cb6dcabdfd0e3b608969d1cab71d8658495f9c4f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

