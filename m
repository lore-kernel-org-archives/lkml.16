Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27222E718E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035426; cv=none; b=aEjn9LdUNa+rWDx/81HBCpJQnFEeosLgsZrYAm8Gq2vKo89q5+muG+qmAm3uJW8dZ8e/jPobPn2ylBgzQPkPCEkWclgomDCKai8qC1X4YzRYeG9J2ofv4ZK52XPhXK34XsNlzc7938gIcRRc2prIDwcrgtKdKSNNtcExUXlMVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035426; c=relaxed/simple;
	bh=RqHER0llPYqrYL6CWjpVbzvE/vaR1vYLS2HFgFolPzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tVhRXC1LWn0EqwIgiT4T3IzJ9Sww5LCS79eq1kZCayvVDCwUGCjnHzV4NumsejbGnWYCauSDRwB3WLuuVMRaJsl4fI7yZ9liPhpQFcr8ssHCRav8P8cfMU5HillLv3Qtk2JBZ60sh0hmJkB5c43mrD6GJ8hyK4VvEOIN6ReaKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1rwSdl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1rwSdl8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC5Ybg014245
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mrff0Eh0/7pHswQZD6QzcRarWPckGhlkojitmmAjnqg=; b=i1rwSdl8LyYF8ru2
	nOE5WTYhxuBadQ7Xhuhx4BLDQYkD2y0fx/o+j5OWGfWPlM2o0kzQ2vz0WDG6QTBa
	MXegwvTdMNLE6RaP3jDgOCfGAUhXVaSDNotGt1fQ5b0HB0LYQn5FTwbb6yeBpijx
	Kv1XjKMa1OzzB7NyxFkCtf7p6Vp5ez7CHRQek2ZdfN23RBQN+a2+bLZvl7Ou1zDM
	FgdxVC/K01nK/Ga69sl/SK6XQSxLkmLCl9kUk8ffbkB0y0olIVkzBY0T350E+rlo
	GXO/NUJAPjTTUjsDQntdPw4x1LC7zxZmuqc8ffrniekLddbc1SVKCyn99Z+PiAgP
	YtdJ0A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn0y75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748b4d5c045so1929588b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035423; x=1751640223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrff0Eh0/7pHswQZD6QzcRarWPckGhlkojitmmAjnqg=;
        b=EMNiPhKcbeZEPUFPNXLV+qGSU+JUvB95bsF7F+VPN6sJCWQR1djVmQOR8RkqVG7Q4a
         8tVL3O6vlJEQWHhtKdCJy6Hx77sKzhxho0+UC1ZIkdDriWlOj7px0N8myWDXGJLHrLpc
         Wr2cxbA0B3WUVIgtPWM2xDL8nB6f+MA1/3zqoZ0uh+15opHm+nCF0xHeBxk49BiW0kC+
         M5uHbpMABvYFk19eJSPwTgoWdbNbzBia1U9zS0o4TU3d/DYUSDN2Vf4lqST3k27ldk1A
         t8RYM0ih+yh8PoqvoHYWdZYml40tYp+gb9cgdkLLOmJpFvFEDC9boF+SDtZcQEbYMscj
         gYpg==
X-Forwarded-Encrypted: i=1; AJvYcCULQGKZ2MKv/fd9hdHZoRsic0nmL0208E0zNTD5pP6NU980NPLW9+jckzhpwZBT2KrddlTn1U6G0Tw98MQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcOKfWbgH+7OCQ+UzkVKlgrPBZhQYfVolESVkibcxpgcdW9UL
	Mi46aHkQQTD5fek2J6YD9KI9mQ5BzcPE64XwuPW4V3Kmo0qIO5k620VW1SIEX+h5GChqq2c9/Xp
	Pyv0lKmbeyC8FS0do/+1gyrDUUH2/6r3JUQfcJ/09IWyMpRJIfn9USAGrORGH/BDlM0s=
X-Gm-Gg: ASbGncs7wfd+dT5I+eOay6S37iPWqBewTLEz/sGQAZz9kjk/Y9wbzhC/nwVNfN+fi97
	tLmYx91/pJuBOGMgjN/IZyY9rHVaxMuv+WVk3jvL9SDGbMQfjsQeGb+k2Wawsxauk1o8AzGjIjU
	+SooUR03qmKOELgbYzllf4F5R/MQx8T3mLycJQoi+9jxV0kCvVu85Gwg+yv0JyP9J6NzH9zAClM
	jY04+QPhpYoW6Ejn+jVzxdJ2WHMu5rbD4AuMiWZNS0PXHhxFTlTs2K+950yHOKtFJkcbSNLQF6f
	R24y/0qUeul/lARuyiRSUc/ZVEewGvP1C3a5wqgers90QcJ1GQXWbosWoKY=
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id adf61e73a8af0-220a12d79demr5320882637.12.1751035423430;
        Fri, 27 Jun 2025 07:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyIcQ16jrQg7zZ/66v+sKRfzIx2MtwgIs5TwJxFdfdeYQzRugkkvP+TH2uLlGHAyjE5IUTyA==
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id adf61e73a8af0-220a12d79demr5320841637.12.1751035422998;
        Fri, 27 Jun 2025 07:43:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4ccsm2458956b3a.156.2025.06.27.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:43:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: tglx@linutronix.de, mingo@kernel.org,
        Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250521053323.284845-1-sumanth.gavini@yahoo.com>
References: <20250521053323.284845-1-sumanth.gavini.ref@yahoo.com>
 <20250521053323.284845-1-sumanth.gavini@yahoo.com>
Subject: Re: [PATCH] wifi: wil6210: wmi: Fix spellings reported by
 codespell
Message-Id: <175103542219.3295854.15091356582053137199.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 07:43:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ddXg74SwCzW_5jKxTt4mWSocjklsKlBv
X-Proofpoint-ORIG-GUID: ddXg74SwCzW_5jKxTt4mWSocjklsKlBv
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685eae20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX8R+uNUxmRTxK
 w3m56FeNhTKv9YyJhnEtO3oFxZFJzccCD4jHytaBhTiECI3BnRP2FRRO3bCTuaUDkvCUXrGDOVN
 YLK36SXWZh1BmqSK+xRpQgVUONIXQG8wOlLbKftS5dFZZKA6YvsFB64rvEudiFVAfDs0Zgm5kdV
 8NNRvwpCR8yth4hXdbmBOYqom3kABDVtG2wA01g3ynz9wmai/CPSz21r68mX6D9SqHnZf8eVe9f
 BoU5InkQveGqRbZDGFXNEyJn4n0nrxEWTA/tDOkaXHpIeruxhnVwT1mD6lkfk22UdSbu7GbvlSX
 GjRfTOhI/UNDgEWbcOQCy5z8qk8clDJgcdDSWiH7qm7uRmhoXfYc2KMTC8VvUUaeXLuXV7Tr/14
 +QT5RzHc1K/xwKpE2zOdshqDo1p7cIlE25ravX8+LCSrMtdH/gmOtFtgyozEIrXEXeRcDPZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=732 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270120


On Tue, 20 May 2025 22:33:21 -0700, Sumanth Gavini wrote:
> Fix "busses" to "buses"
> Fix "Measurments" to "Measurements"
> 
> 

Applied, thanks!

[1/1] wifi: wil6210: wmi: Fix spellings reported by codespell
      commit: ed259ae54de6d7daa778dcb3471c00367d32c11c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

