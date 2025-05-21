Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AD22B8D0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861498; cv=none; b=dXBhUXosTE5mWa2w4lYQgTOQ5yH34oD6luKRGW1WPhXd4lfrzotHjtcDr4QMN78Ko+1sbSoC5qXAksBaIxnJ9sLbiexcWHnuXqT/nYHZf+zd9Q89zlcCvoBD2CNBSlLFm2CJQqlNDFJe2jTM63I+gTUq+/I2YdJU7MotLCYjHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861498; c=relaxed/simple;
	bh=chJwl55od09sVeWIrN0MmDLleb4Odia5evr1uKP0pXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PbnCMGvZmUqcgh8O0p0WZ6qqTGgp/qcf9uRNGHQcvAlfjx9aVfLltAvERqCfQbf9w/lPUvW6wLWmACzBR32tOJM0OIQjaQBC15AK4C7t5CdIN0113eHlEEXrDP0OmK61v/5AMjwwyw8PCHe7r8n5Ja8/1dbX7i4Sb8rpgZmlRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxOxmSmh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxOxmSmh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LJgCZO029233
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8pfrRmMMPxVsgesSad2JR7BoMNnIt88nEFw4z/RGv4=; b=MxOxmSmhhtc76zDd
	VKjuwHqbDF6Uin5xc7s6h6CGg8yQ60YMNrG1K2NzR8FRMlF4iUgesDqiSXtjMtL3
	SLgI52SSqY0+qCSVE6CkV03TWvjS2zDeAuUeUGxejWd2eZwr7ecvidDbizLx8CSW
	bioeiRTAHUpBAF2tfdZYf9hvPLSKrzbvuhc0pFH756KVCLDR1B6tonfuEYATlaND
	f+G54wYaGpxRRLjim5DdvUbMV8ahL0zglUFGunzIddfyZVEmC5+D3tsTMvse3F/o
	aRndXbL546InDhxrXekGM48/U5smAIv+gbVjOOqwzRwlnEkXyH4qBz1yJV2ZFJHf
	8oTjRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb4546-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:04:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5520094b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747861494; x=1748466294;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8pfrRmMMPxVsgesSad2JR7BoMNnIt88nEFw4z/RGv4=;
        b=HEDPO7OXcMfufieyWXq4iSuyPw9VdrFI9ERDF7oyNzl/nG/2vRPoWk338HNxO8HyY8
         Yii0NIx/uKHt0a+REzdYxLTdFBbL6PO/9Ie+INWV/Kw8RtfrFfRwEductfdHcbeoGKQw
         8V7MnKixK24gWafffA/Yd7M+urRBqPCjaAL/xTMBazQIYLDJXZfNHOHGOFL65c4QqDrx
         N7r11Wslk9MgkQRcR96pEsrF6LIWYiiqeGjeiFY1WJoqxpLAlRKY9cZNY4CZ39HrV8n6
         yHHwUHKUn4Fg+RB/wtcLRz9RD05l2hQZ7GViA5gmherr+wTFRVrhEvdb5buwL1ZSrhEb
         aF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjTQ2o2gviOzLvz4MfYrxcOVAfHNm194tQH/JDQ0k9d8T4C0hrZAwv4u3Gr1BCvaJG68RL+jmee7MeMdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrI/Ql+EdEd++sVDXrEsZRzy8XRLzqd9xofLfaFprP3UeVSEt
	hl7y4av0Iq8ITGWv8lEhBCZMlgukichwY5uZULdtWzKQ47xS30bXfGXa881FxK2U9LmDig9qZMp
	hXvLpYWaI4I+2YoDmMOqrfu6y35amiKcNvNS+mjmMboCc8jpcCMOzySN2Xk2eY2nmtWk=
X-Gm-Gg: ASbGncv8Fz0Z0r3Uq2Am9V2eCYrWDHWwH8wLAMNsowwp6gzrS4fJl8H0N3sRn+2nqP8
	NHy319NbqMcUt3baB/g8znOINKsxLq/ZJelqVZUo0KURiNxwgItABQOENM20tykFr0GSQeC9rke
	Pc/sBhSq7rkCgyhySdxt9I+JW0dk7yVPI1LBMcbLAOMURHfyLKRJoeVPHw3Fk1/1lH3LFB3gjh0
	7veAiyMFJfA6+BV/hWWwKzWw79pX0LqpoRDaXZcZ1rpEmrnJqasmzj01hMYb3W4VZ8SDQIP6RHk
	ReNOdr+/IP+WDYo1jerfrK/MZhzThTqbGKmyUe71wiHwI20A
X-Received: by 2002:a05:6a20:6f96:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2165f87234fmr31590428637.18.1747861494489;
        Wed, 21 May 2025 14:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwyz7dPN3iVMEKuZm00Xxt7WNxKbvIPZRXOMsuu9ovK+uJlYmywLQxhYU5YAUcR5aa5ssk/g==
X-Received: by 2002:a05:6a20:6f96:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2165f87234fmr31590380637.18.1747861494053;
        Wed, 21 May 2025 14:04:54 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b7f3sm10057303b3a.87.2025.05.21.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 14:04:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: fix several regdomain
 update issues
Message-Id: <174786149316.3123854.11064222745292053302.b4-ty@oss.qualcomm.com>
Date: Wed, 21 May 2025 14:04:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: vM30FtbD0TmdDL-Fjb0voyffS6K9qzaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIwOSBTYWx0ZWRfX3suHJCL/08lE
 /RdjJ3nC9tLhz5HTV6RwNfsZwflWSyBDGXeB7Lq6D5maW9binfId2Y+EuYG19iEv9Y7DBxwrmmS
 2gG1jvs8aJbKgZQNvxS27zDdM/3YJSPxCT4Wznhv4fPNqpXAcwqnVcHIBWY0WiDo85xFu8UG6R0
 Aqak5RVtyx0kp8RVhKXEz5p6+x/4FZ741awzl+ck7/ZC98UToyPEdRtgUrPqgLsvufwWDpe/LLC
 fBQ/iKqAdCQU1xiShhakFKvUaYV0hdgULONdQBeuwZRdA5A2/QlEhJ6pXdNV+KXFtAIbcZVAZeS
 qmJk5hnpwNWSXjIPEL6ojMS10x0C2RdUmwDspIQKuB5qhaLTR/i8ROxopjsW+AIGcn/KPh6FlLm
 L4ySvhNwxc2qXbaKuQTjrfq4gPP5s0ug7NqrqulG1tBmN+gz5dcZhZamElvUi19QRekHZ4l6
X-Proofpoint-GUID: vM30FtbD0TmdDL-Fjb0voyffS6K9qzaU
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e3ff7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qE4HOfYLDg8APkTHxjoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210209


On Wed, 21 May 2025 22:29:28 +0530, Aditya Kumar Singh wrote:
> Following commit 4c546023d71a ("wifi: ath12k: update regulatory rules when
> interface added"), the WCN7850 fails to connect to a 6 GHz AP due to
> ah->regd_updated not being reset. This issue is addressed in patch 1.
> 
> For the same reason, regulatory domain updates also fail during interface
> addition and connection establishment. These issues are resolved in
> patches 2 and 3, respectively.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: fix regdomain update failure after 11D scan completes
      commit: d662c14a51910ba0ad66afd248b601ba30b9f7f1
[2/3] wifi: ath12k: fix regdomain update failure when adding interface
      commit: 37e775a0a9d79a031d28d9e21480f99f448e9215
[3/3] wifi: ath12k: fix regdomain update failure when connection establishes
      commit: 886bb3624e4c9914a943b63fcfdf30b8d2f2b66e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

