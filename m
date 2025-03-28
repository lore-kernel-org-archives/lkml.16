Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D441E0DDF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743191128; cv=none; b=MWIr3kmv/Q4v5dM+NdiME4E/meHIEHPDtS8cBhm83p/gFzFgsyTzaEZ4638Ejm0MjLXqwYUj9YqjXFzhFh0+SvMFQze+W0RdZRYK2FLxcduiy1YOViArvZQXJUPEPAq5mIVdGc1akHL9Ok4WZR+8n3lDV1mQTinpxsbggO6qR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743191128; c=relaxed/simple;
	bh=4MOYdNgWkuykYtDLL+uWJuPdUj1BvzZ2t9NSiU4EON8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXl0TLSYbISvlMD0rnkkg/GGje3bnEmiLGu/pHoh/HfphKDygHuZINVz1sGCoj4hwjnzp9vTaFW1gzwxd48Cik8R4urK93/FJu7Mx9U/kDBOKpaGfrNheDj6lO9ih+234F1fPgLH0ZRbe3mMQYOItSPJjKliAwQ7POS5OzwZmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlO/OiMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlO/OiMs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SDHTv7012429
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hvro5GjO+Wldw2eoT96XJ63A
	JVuzQWMJ2SYOkl9vzGo=; b=ZlO/OiMsXxnfibTyZMAPDrBEtjwu2ltf8lQmaeA5
	W248m61J2AHxcnDgiZy0T4s3fEFUMzZGeEDPye3Q1jT2y9Dz/smTI4Jp1SNhj+aJ
	w0caTVUJroQ2M1PPu1dZnA2O8tu9mqGspOUzPdEYZTvExU87TT86gSSr8KfDABDZ
	C+Hp8+IQuY1eLoado+IKzp/9bg8pMr7vey8pV64ubw5kYcDqt/EwjzdBg5QrAsyx
	CtkEymqeCzmwEVZzUHt7zG0INLoEgrG+kGJ6VFNk3OAMqNg9AIl6J86R6Mu+jcQ3
	iRKxsCWRTf41D6LacYwwkKx7L60n4ogpWZwgfKmu6EXLhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutqqy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:45:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2262051205aso35963935ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743191125; x=1743795925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvro5GjO+Wldw2eoT96XJ63AJVuzQWMJ2SYOkl9vzGo=;
        b=RiHhvrQpPe1dqhwN6u8G6rejGL6I+RMNSg5WKS+ZE5rQsofiQAMp6sKqD5fJ2FD7HI
         clju3Xbb/zuSh5ReIa/fhgCln9AZP0m62aVsjFJuuKLsdyK8fZg+YIGpGxq2rL022E+O
         O1soLb5+PxsqnlY3g1HpVkURVD9Xyc1WhUVPGxRoecrRxIw1S2vBE6yEHpU3GmNMEeQW
         NJZtpRGai5/Pc+IRdqX8d4b9gVsbtWtRab8Jpn6usGDfWH0cldPuQKZ77oe+8C7kwMAm
         XtNfp8UJj5npHWuPNRMRBlVjVa+ZbMRdOl0rvpJfQ+rwagHsOaLugtj58jgwx/l5d3S8
         Uveg==
X-Forwarded-Encrypted: i=1; AJvYcCV9LprRvKDfaE0DUygaQbJbkOPKr5VnJTxUQQ8RBHc6Ak2Tw8lQmSgiFItiqUIHqR3F6zkcDilOAw5pFG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEO72s68egSdI475221ZKnFhVZKrulh/KNDoYl4Rj+Hjo2KRTL
	kXAz40xX8sO5XB4fCfM4KS+JhTUw/nHm08SnuzuISpgjdhcZn0heFyYcoGqihpbP+3uZf9QcTyq
	+B8gYJKrj0SErSuMbMc38UKBCmsa1DpVVDhLTJRHKuvT9lZj/LM4BbJAcbPzlXiBS8PxXwbJQCg
	FzblVHJSrDea9yLc/I39CLJfbSIL2Ef01WW/N50Q==
X-Gm-Gg: ASbGncuL6Xf6oPaEHL+0BUAcslZXo0YIfYMXDOtY8DJnYMv9Q7sWXlvsqGSpiSqxntV
	lb0EVj+YCjMAcAnaRh8c2sZTQQlrw8UGCcZ3U2d+eHdV/OoK4Lteb2GByYrn8dmrxgtC2WeXO5v
	HMzQ55BTZx01B9TAzWJ7u33K3kBmdi
X-Received: by 2002:a17:902:ea02:b0:220:ea90:191e with SMTP id d9443c01a7336-2292f944dd7mr5603355ad.4.1743191124722;
        Fri, 28 Mar 2025 12:45:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2FloYykYPJgUHYSECpQ9Y3zz3A/KY/pa3AFDLAj9DQXvG9v4c/yWr4SAhhsaubUsKlu76YHyagAGjGMbmqyc=
X-Received: by 2002:a17:902:ea02:b0:220:ea90:191e with SMTP id
 d9443c01a7336-2292f944dd7mr5602735ad.4.1743191124237; Fri, 28 Mar 2025
 12:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com> <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com> <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
 <zzcd4pv7laryb2c5wkuwrhj2ih3lciqgxfyefj4qmi5clxftbi@ykpy42anl4jm> <d09fe2f8-fdfa-474c-a742-b6cd2f8662e1@kernel.org>
In-Reply-To: <d09fe2f8-fdfa-474c-a742-b6cd2f8662e1@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 21:45:12 +0200
X-Gm-Features: AQ5f1JrEmDVBvWjH9IO2Mtkm1mRjebe3Iamg0GwU0FiHaNIm70ztqd-cjwD8G_8
Message-ID: <CAO9ioeXSdpNq+cOSHhbbE2Qya5LXjXixj4_g0h2PHBRcLxdsfQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: unBobXpKYxvwvQH4xm0W4P26mf2FX8dU
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e6fc55 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=AD09SHeqe-8lbBjqVQoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: unBobXpKYxvwvQH4xm0W4P26mf2FX8dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=672 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280134

On Fri, 28 Mar 2025 at 16:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/03/2025 13:45, Dmitry Baryshkov wrote:
> > On Fri, Mar 28, 2025 at 03:13:57PM +0530, Ayushi Makhija wrote:
> >>> These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
> >>> I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.
> >>>
> >>>
> >>> Thanks,
> >>> Ayushi
> >>
> >> Hi Krzysztof,
> >>
> >> I hope this message finds you well. I wanted to follow up on the reply I sent. Your feedback is invaluable to us, and we would greatly appreciate any further insights or comments you might have.
> >>
> >
> > Granted the lack of response, please make sure that you've addressed all
> > the comments and proceed with the next iteration of the patchset.
>
> Just to clarify, I did not plan to respond here, because email style
> which tries to respond to my comments is unreadable. It's impossible to
> find what is quote, what is the comment and what is the response.
>
> I expected inline responses to the original emails and detailed changelog.

Works for me. I'd say, let's get the next revision and check if it
resolves your comments or we have more comments.

-- 
With best wishes
Dmitry
