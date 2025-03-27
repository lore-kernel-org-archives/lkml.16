Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1DA1B6D08
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116333; cv=none; b=lvL8ATeEYdGIFP4LWGKjF097LsBpBxTHyiyTl14UfJbHonWpoR6vmDIaxygnp79gQhXk0YhnlnGIDgvWqcAzk0cnFzfBSrmdrb1ZNj4fU3seW0atGPWFp6bqX1lytfQ2xdbezjqbV8/JOuA3Lw21HvpRnHPE4iOQZZ04rQuaj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116333; c=relaxed/simple;
	bh=3y9Y3K4SDYPchjwx7ttfojP3FnoOYdp07CDCHc+7bZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RZKbDqgS/CgOOfOdaBxcloz9jDfvaGsopCHkR+0UjzX2YN87gH2i8zjOB9PA4RycxihZaMO2cH/SdvPWHungagImZUaAjUrJM2bP4GgzQYZxEbfKBtht15JM0g0VHBqkQlWpRqh4e+11PR+aGLKLHigi7OcpCq+z1OjfDZEX3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D29Dehio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D29Dehio"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RE98eT011771
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwsNi8QsOReXFcb1FbJciF9gTf46FOalgcDSlPmHHGs=; b=D29Dehio0Or9/daN
	6+5Tk6E8plpTqElygAyZMXsDqenWWv+dBAvkgP5i8DJh0i639jV24WJfmzdrcMT+
	GqmseLflBL1YuLZrfK0RBy4agXZbC4zuXn1NLPe8MlWMneNsV0xZUX5ZnU/tP3dy
	sUllqXhTntO7MAd2CdA5LTYlbfJRhOP4XLQ261clL1Nqs1BpOYYHfPXM+FyMsDzb
	DqMpe6qg9R7y7Yz73ZRppYBMLxtWGxYZqjQbin7QJL/s1WExb25IOJo0ErLbMunV
	VGKRHmED2Lii14tTaV1PxUFl+1A1Klb6gmDHC88HUikw3a8lViAmNJeeb7NlPWw/
	NlqKPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj6ek8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:58:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so22508875ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743116329; x=1743721129;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwsNi8QsOReXFcb1FbJciF9gTf46FOalgcDSlPmHHGs=;
        b=GSASN/NVPIRTNt0QLKwZ8DTOSYSYTge8CEem8Jpg4H93HX1M0yAzuOIjtA1mP3shQU
         GIBp+pxdfg6k+RLAVtniSVBjocPSep7vF54/O68CK1fffYp5wO2GQonee/pt4D2tWpc3
         l0TUSp6oWFNrSs4L3k1/qLZl6homJ0QRmDvqdvY7vZsqYTTBns0qVEh87+i6H+H6nXTZ
         WzRfSNNelXsjXmdL2UCsv1StHtlScdGacPNP/FIxaY0ZLIYzDgiBSz2cJsPL0WrMNLT/
         gHcN30xdD1aMjM5PZebgERoQJMsVSspIgSh+6Rw//lfzeT0oU7DEjIIi2VlD1w8M6ADG
         FzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFmxh1rQ8qI8l9cFsdj+m0yQ17JNzX9Ns970vppazFV9JxpNoAfZGhTEZRG8qOTE0AD/ZSNHcUxPB4p8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9QKv2QF0L/fBtA8VkIt0lTyc3psaQ6/oYY5XJF3nIar+0ajw
	Y4dXfxs9udyuBlyt/PKFLnr6HvxOjXv6AAweJ0aZiNZAjaJUtcHlg4VEhem+9IXvdNrkC19HrKI
	+ZSkKTYrwBJ+l7z1eKOkH6ip3KG9lvoIMDs/uFRGkRG9QNskOgnJ8EnksAr2dmJvIwi4S3ts=
X-Gm-Gg: ASbGncubH7cJ8QMMdA6qoqjtCkRljdlcFWULLzxQukenraJ6d6TUXwXgPqbSLvHdhGk
	OfZCg5bfx8e5PSPHXuc2uwUMIoCaIrr4bpkI0MWPEANgSPJz8W/Zt1vYaFZEdGiDBY5Zq2Luumc
	ah8BcG00mLPD/lr/qZzfaQDqY3kgd7pOILGj4pZMj7tv3fOXHrL/Q9ppjgwBcE3x4q2a+wSxDG7
	n1BeuM+o1fuLxn5HtckqxBlEgUmdkEkrGY3vXFi0eQTMhaPGUpL28t3eJAeaRVn+nRyj7CqQGWk
	7xc9vIPE64YfiH8z72CB4X6jPUUMesDDHS+uRAXAJ9mNxAHR+Tc4
X-Received: by 2002:a17:902:e74d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-228049593d4mr63194775ad.47.1743116328902;
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo3llEhAshCJigTArwJsK8MdUEo1K8YaG3xciPsGH7ORmvx1slvNw9CWL1ccqzjL2yn7l9wA==
X-Received: by 2002:a17:902:e74d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-228049593d4mr63194545ad.47.1743116328414;
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec7bb9sm5442425ad.6.2025.03.27.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250321162331.19507-1-johan+linaro@kernel.org>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-Id: <174311632770.448522.14375483509145513378.b4-ty@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 15:58:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 1IydUHMM4fdjj-oindhbXf9ETkMnRfoP
X-Proofpoint-ORIG-GUID: 1IydUHMM4fdjj-oindhbXf9ETkMnRfoP
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e5d82a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=NqV8gX1W2k58nkAEOZ0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=667
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270155


On Fri, 21 Mar 2025 17:23:31 +0100, Johan Hovold wrote:
> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> without an iommu (under OS control) similar to what was done for ath11k
> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> DMA").
> 
> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: extend dma mask to 36 bits
      commit: 79ce49513222a89338e78bc7c7cb4a0fb4d6cb23

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

