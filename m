Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50A1DED52
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307447; cv=none; b=Z5ONPopP8dpk7Isncbr9eh2q3DB8WSoDLTd70YM20M0QqtEJwdgbtncbP0kLL60qkiPjp1LbVIp9ekBeER2umAIKlFQr83dAO4b7KJphACxdE/8Zhhr2J/QyqhxQK45F6KCRUvwfduLSOC/nA6CFxQWDbGtFn85m7YWqpeNZlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307447; c=relaxed/simple;
	bh=2OEkL0/1YloljiLmR1/wOlJR74RgEaLuu5nTvCl8Gio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cVL/s5jAPw8yayOrxtzxKPsZmAnM0/b80SIvwo3NpWuClWyzaX0oz8ICI1+E7+qpMqdwrfXTJv33qE2wGb6T0DAHv/QwDSaTl+vKWbNp5CISCVgIuT9fWyoW1Eb8bfsmDV/iyY057Th+xc+auVoXZjTiDiJ0xjIrvnuSsyMVS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjboE1O2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjboE1O2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DS4vn002106
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iU8Te9v2e7dO4cRDhE2B48yNbmx+gn8TOOV1jRgY0E=; b=RjboE1O2wQ2/k2CO
	CBz6ZxBjoxbC+ccEwE72EkFZwtwJnrKxs1VGOa0K4ZYUPbM79rKLIakPEjeJd8jo
	9EshUoKvRZckZgc+F52WLxUfXUXN/oBjlhTfLShcBZMe4INCxQVzMPHUPEzA8z67
	+ZY+YrCa1zWqW7b310RiUPgn/TnWDu4mLMIIO04WqhHoux8GFL1lOSU3MMxUJ/LV
	gLdIKsZaQ777JV383hdi5xW5DcyiUxMkWfKb6MxTmdiVtL1jasBFV8iMf2NColEd
	/s6v58jRlR5sMgiZ8ljtFuBnc+DTwhWFu/mQeY8WaaxlCEapZ0RrwMjS7x1Ie/RW
	NePaTQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqc8ky0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:44:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23495f5924aso23661705ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307444; x=1749912244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iU8Te9v2e7dO4cRDhE2B48yNbmx+gn8TOOV1jRgY0E=;
        b=ufssNZ5gUqIh5OeLrRwVFfaYWu+GhLUHQUK8kPqp9Yef45FdCXuC9vOQQW3ZNUkZf5
         0T9ZOPEREQliam5lUBWQK64j432u0LP2X+53jLHYhMIJPLC2gzvbCPYoEPMXsMGgzFUE
         fUXytq+ZnC2TxihllSbW82j+oumHOZmxrPYaRgBqi9kM6crWl0Cxgr94cglXUaAUirMf
         hT8qcWdu7tAf3H/lhHAx6lSqPPmNAHL0JXgsrvLsvnNyON9pJT9Q+PzFZn+6c92RFgps
         p7C6s2zez7yTf0P2b/Mns+gVsy7vWwLBips/Ny0Khvrzhm69DPNmCMRyTb86r606zdlD
         NQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCUOMBKnWEsvsBmDFmNYc8UKFvz4TeaaYs6wcTpqJf3CoeeKADdwgCBZcka3JcA5tax4YnT8qdzkcj8gQC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7M4ag4t1M+vNwPdNP78WcbnFu/y1OYp4Q0cDfIuwPwbOSNc9
	BUOVsJ/wahhOg3PNm/oCXZWSg9GLBaUCJAvVQEaaKdK7scm+D1CYMaU6bcNUpLB/sadGqaNS7T1
	r0Yli2+VglcekcsXZVgwC/xOa6c0H+33OQa0U4dECvNuFsnSIKLUhoM5tVUGFCbE9D7A=
X-Gm-Gg: ASbGncvIEYwMRRCmnezhInRCL11yGvpLTpAzlaZddxLS2epSveGWyJWVpKAuDEwsHIv
	oj1bgEZG8mDR1K33Jejh6SwbPa6HJDht5uHrXZIgC1sey3yJ9BTrqYo3ua4nExnKu8r0M40JRsL
	5tZygLzEgl2nsWKjfrm1A/d2fgQTRid5LuZ7ITC7gkl3JqiQQg5JN73QtzaZdhvq1J3oyAnniT9
	mFGqrwCUDX5I9sqqMSOQwPK44t0byyEi0MQPQR8dg5JshshImcuCIiXtbehWGYsQdOqG+2nDo4a
	seHc7yk6/cGNqAK5Q7qb+FxuAyJh0Tx+5ktu2FDQ9UutnViResrDUO5shEw=
X-Received: by 2002:a17:902:cece:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-2360207d144mr100448685ad.15.1749307444464;
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKUIj12Oorwr6eMwdlFcVN5kpcaOIa+5CYqOuw7TexiO57rHPLTcjS8SGWf1NRkYcWeiceg==
X-Received: by 2002:a17:902:cece:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-2360207d144mr100448475ad.15.1749307444096;
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
References: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix hal_reo_cmd_status
 kernel-doc
Message-Id: <174930744300.154748.1746628903090398734.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfXxxfBNDHJd3iL
 KMf8yXxuTa82GOppbtBCi2OnsvzPewP4tskxaUU+5gK8e5wo+L6pMgtwXElaGgu1GFvDhc4lk3D
 xiyPvM4oCotNXCgmz7Zqyizvmkbx7MrDZS/JnnN9FmTvtIbNfAjPjatqPIOqKO4CdnuTRcmuSFx
 pZw6safQsb0HA+lz0MSD2vy4nkF0Ry0Oqz/G4/0Z5NfPkhRHisAsq7/d0SAK4HvSvYuDA8QwHLj
 ePLBmKj6MTKIzj/6w/5CDaONnVCdMb2j4OfWmWBBpTgYtBaYFQm0BBdVzPfUKyCXylOArZuD89X
 cfLRE7Xt0oUB/sxZfFubECIXgDXSxbksExhPDeWYzDHzKpXEsbP0LjEWo37BSe/1H8irnWC+n5f
 aZIjqo+Lw3CXxOQT6CEvYlo81o2VR+HadZVe7rjPkvvuWFQ1I5uX3ZGMTlV98cMm21GoDI/s
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68445035 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=DsNapGL-N8PPGx-XoycA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 3ctbXT1UaePsDHtTKCnsWUel-PtJd8O-
X-Proofpoint-ORIG-GUID: 3ctbXT1UaePsDHtTKCnsWUel-PtJd8O-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=726
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070106


On Thu, 05 Jun 2025 10:27:22 -0700, Jeff Johnson wrote:
> Currently a warning is reported when running:
> 
> % scripts/kernel-doc -Wall -Werror -none drivers/net/wireless/ath/ath12k/hal.h
> Warning: drivers/net/wireless/ath/ath12k/hal.h:596 Enum value 'HAL_REO_CMD_RESOURCE_BLOCKED' not described in enum 'hal_reo_cmd_status'
> 
> Add the missing description of HAL_REO_CMD_RESOURCE_BLOCKED.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
      commit: b6bca6d7149e0bc1a56e831af0296d45688945ec

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

