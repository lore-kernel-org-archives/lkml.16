Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556027FD67
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420447; cv=none; b=g6B2VjwQAeBeWuVyl3jcfgY7nRXm+L5VfgnL3N5OTIyGYmgkFNo6HiizwBrUhJ3VDfCtAsWeMJ5/kGBAiZvbbW/mH6gayhIaLmT2K1AN3wUR+xgX6NjOkBWzgi+ic5U+7sUsAWB+Ugl85r3i8XtRbB0du/ulfGQ0/sZ0p7yr5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420447; c=relaxed/simple;
	bh=l7wfDBiV7fPwNluX/sbXVzXO2k5L/69mo0OWFXFZ0uM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKT50PO76S1wxC8j0TYzzSDI/zBsojpWFQJGrr0FRl3i7ZUeaINRR40+OtwGBjqbb5ZyXUFmVQuf6fvFpWv5SEKaGKn4k0tZDo6vk+xRr+A64DscMhRYXSeAOuMeCH1PvXb3QRjrbydNy5DY9CIWjoz+7MmC/waQqA+Q3qm39yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1RRrQjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1RRrQjR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRuEu023203
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMwJC17N0LZE/PF1Re+m8j8/ER7di5Fs7MKJCmuSolY=; b=C1RRrQjRL8kVmzyP
	LZlAkZBgprpLpZBM4LpXi1qGUPvJwia+ag+l4xyW3Eu9mfSc2NaiTQcl0cxwcP6W
	g74hyL+S+VS4ijJsngIh+2JGVP+yNwRqtmItbP42pkdNIPrOcfqW5YwIkSWdfG10
	6oU9TqL+HIFaD0U70Z26kPulz60Cj9LNad1cISjKRb9Ty6jSDnlhXs+gbSzpchUV
	y8QWiqR/Y/2Vbh4rNG3obH4fRNhf6ZhGDG8CJSecruAz5ukjI+7nsoVZ0MYIf6/R
	9cf/oJ8Hh9cWMl+47vF2kYRhZ/WSedt0QUYCEwn8MvZg/iZDOuwgdXINg/KWfKb6
	8/B6HA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq953p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e8baf5754so462866a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420444; x=1748025244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMwJC17N0LZE/PF1Re+m8j8/ER7di5Fs7MKJCmuSolY=;
        b=vGAzS20DGaLT1hRMXcAl7OIZNUkjkNSdJjEXo5AVrzTW9Z9w6ldkH5WHQkbM40RyC0
         UEroAUaz5uJhWmIaQdONVYOXxHw5pLprNB1i4o80L9XItMKLukfe+vcP0l+r+5M5eXLw
         qxvcRtsv0STWhXfUZll0P2vabi3zPQW70A53fgA87iahlJ+QnMfI+XCR4/nkFqrJQ+9n
         e22c9w6r9agJ6TbyieWqV46FMHmE2J0zRacUYgqGIy3EJ2zp4OVls55JslRf5tJtRGUO
         dbWua7nqfqctCurj55EuJoXShcGP5uhPpm9ETwc0lLmDg4/96qk0C4nfm2GKm6nMAXiW
         6FlA==
X-Forwarded-Encrypted: i=1; AJvYcCULkDJQ6ASXV9GZoxj9wbHgoSqYFIUIch93qsuAOvceOummMLSLAA1tUSenKZvw6U3Ub7IXFSWvJ66LmWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzeoyjv3d7u/ru5Wn48zie7Yaw4vztFETOMrXOB/W1w99zwon0
	z7CUEdkkM6yQWHMG1s6MnruuijNOp57juAeuGbVQbKPsl8afLdh8sSd+QZChS46mEzup+iCw+Pk
	YWB3Itg1gjOyrhJjmAIAl8RAnFBMt6ul3p0LU1IxzWGJBTIcb+zsuY4ObQebBT5qIjxs=
X-Gm-Gg: ASbGncvVPhnBkKm04+YTphqhqUzXD2CmsEP2a6RpU21p20MX5KFkEy+8yWqzaVAu/ue
	ZVRwmrNpmwY6ibZJzWjcn7KAe6bI4m3Jb+aNbg5WxLZzjjBjTHsG/BubxyoUAZ1IC9MOn1c/N+R
	tt+2HiHdSqswtsimuXWrAeFzEKolEf72hDHCMOBAYnpidJKrB27OAWAGuU0oZQEalS4Qho5epXG
	z3AX/KiVsU8EtDcDaKNnqpkTyEKLabYzP1kyKvytwNsaIDBUJymFvc/JCHiIP42qboHhFKQCgzY
	4VaA2PbLfdxdOUGwMuY4+JauhGi077spmwYQ16Kg0GdXvhpB
X-Received: by 2002:a17:90a:e28e:b0:30e:823f:ef2d with SMTP id 98e67ed59e1d1-30e83216f6emr3390123a91.22.1747420444342;
        Fri, 16 May 2025 11:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrnTa0VFLRTEBZCfV/Z7H4WzAhUIJOQQAV7WI7LhPnP/umk4KgcKmhJ1vHpXH01VjBGHX2w==
X-Received: by 2002:a17:90a:e28e:b0:30e:823f:ef2d with SMTP id 98e67ed59e1d1-30e83216f6emr3390085a91.22.1747420443852;
        Fri, 16 May 2025 11:34:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321145302.4775-1-johan+linaro@kernel.org>
References: <20250321145302.4775-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Message-Id: <174742044217.3092151.7410193996690738196.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:34:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: oNZhg3kp-IObXpaOsLLIpdCu6tVgDc_7
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827851d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfXxmLyB7cseGbK
 x3tYQ2JSRGxqLwINqbL3lO231683Oe5ZZZhacmLLaZ0CgqUEL0ORC/j2ZaW459zawL40E7xMJyK
 mLJdXfEcfuubrHvSY+qBqduJvFRSM7D0RmlcOQYbViwfFHLEuiqRrRP5xs0ltQ8OQloxbFWX8j3
 SzNDxvv1QOcGKANEl6YMuAtXOf1CyyR53SFqgielX+2Eus36cmRW4CHxC14ZIWhGypaOfqNgNxS
 DmeJp6OMvPQ3Sh3ztBUgpAAdg61FU0nZPpF2tsx/kSznLp1S58gIQZtVfJNJ9COLSuZSdzQpkSx
 npjPXuFbqAEH0jVypTOIhbXtj+eAiytDFUbU76Xh+nN2Ompfx56xEqggvHzg8owaZWa2d7LMbM7
 5rcRHHBlJO2VPCvsDebuBqb4i+LjPV9imug4S+2DRLoqWqcUd8qs9Am0NW2weXnlvJd2i5pH
X-Proofpoint-GUID: oNZhg3kp-IObXpaOsLLIpdCu6tVgDc_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=947 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160182


On Fri, 21 Mar 2025 15:53:02 +0100, Johan Hovold wrote:
> Add the missing memory barrier to make sure that the REO dest ring
> descriptor is read after the head pointer to avoid using stale data on
> weakly ordered architectures like aarch64.
> 
> This may fix the ring-buffer corruption worked around by commit
> f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> ring") by silently discarding data, and may possibly also address user
> reported errors like:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix rx completion meta data corruption
      commit: ab52e3e44fe9b666281752e2481d11e25b0e3fdd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

