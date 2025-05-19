Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF5267B8D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640514; cv=none; b=b5JMDYFVuWjP/w6eP0bFWlq9jv2D2WswBccX/gBynxC2cR7a8mLgdzs1iO6SiW8E8ZLulSZdGekmbqCT2TBYY1zKuHGGXeh/x7k3Q7iHpPrhcbfBkaSpkcD6dwwQfacTucpjafS4Gs2m9Ui9uCFme9wr6F6+IgHc9nHDNpHyffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640514; c=relaxed/simple;
	bh=vk2JBAbC25ErFqWfBeuURkGjcQMndPvAFYVIsJCCaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGPJRGmsLS6sCo8NJ5fHYo6nW/0X/YbA0Hl8ENXQY9OhsEfneglpKue1jnSD3leyZV2T2Dr/PNyI6ZEGPpel0tijSYuPEc+ST3RyqD7ShWlMiSoLcj9tm+MVWNXlfbu6QbedIKuAz3xK9uArbx9reeHY6q5xiRzudTbm0CDtClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0QrJhkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0QrJhkd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GcF9023182
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GDNjg9CVy+PvEX5/Lt+VfpCC
	TKTdj8ZZWuSFdP68hXA=; b=a0QrJhkduYTi6k9BXTJEPm90ATc0ZTixqaGxQD3F
	Fdcqu1naqbZw2meBivpOQ2JAJG3cV45EImKWO9SpuEXQ7qFInQRQ7Min6OtPVi/+
	qLdTvZvnN1qBhIQxIRFWXIK7kzGQATGkD9ebVHgIQnHyjRtMz3D7mzk0PkfBWwn8
	8FGgd1KycSemxKJZg5tTwVx+VjvA19nHzIzH+HBSqsj2SIiUpUMMuf90YTibe0+W
	s6zmKgD7EstmOJ+SyI8lqaNz4xu/GTBh7XYz0ntY19G1nqJSn/P5JEoI1JrMs6RF
	KJC7lyjPM7mOYR7ksoz2dFQfZeGpWLZsiylDp/Ala/kuGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041r254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:41:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30c50f130d9so3621681a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640511; x=1748245311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDNjg9CVy+PvEX5/Lt+VfpCCTKTdj8ZZWuSFdP68hXA=;
        b=lemcgBipIqvL+MhKBXNnheROMYBojP3+1t1Bztf3BFT08ggUEMMK9V8pcNu8zZIiKd
         WlPwkQecO6SGz7AAokjl8vShZdQrwJL2wPOez/6b21Vgfa2cahL0yiJ2nnBZfxPW/KhV
         uScz8tppbZujvfm12+BxRsoeFtvyCwzZiDMKjR3v5v30vTbkZAmqJY7slFby+z9cCxhr
         aUYqROgNS4DJgvt0BkNzuUDRJ0BCmD8U5kW7/xITbgt+spnj3YdDCwjEo2r8AuLs69YS
         8nP7Gj0zWns9OJR59ssG0ITkIjHnnMF7cOxAUofaZdIyrLCA5vviXiEKEp62J+SyEBNd
         rIjg==
X-Forwarded-Encrypted: i=1; AJvYcCUshDSChQbqYdlQAriQuEGtbIWRamgmP2bZVW4A69Wlq5tZl1vvJR2nw5lLDCqNoNu3meJ07aq/I57M324=@vger.kernel.org
X-Gm-Message-State: AOJu0YwszNd7AHX9x87sNQR6Bahm19OSTZtPmZfKIGIx6C/VgU+tQPVD
	2wPpjUUx4wrNgjCiR7UsIur37ymWUv2VVy6n7tW0Y+B67j5u9OKwp4gPOk+YncgV48mTGQv/7jp
	OG52AFm/LdCjI5769joejBZ1ba1JqVSYKcwdxChe5Iw0FYG3I2A3YCjluWtSpFJHxOpuNFSobNo
	4=
X-Gm-Gg: ASbGncsB8UfKhjH3BNnbiusqcZ1uyliYWGcoAB6dSfaowoxpK/V8/9N2FahVTaRgsiA
	PNTbOYWzzQQEc7e0PYl8qpfdpHY67zQhcwgj9opT8ZvHlWM2L18sLqHGPyDJ8gLReDm+bNa2dz6
	t2TvoJIRKcw5AeOUUUOccdKN9OOgv9kiwv7RSJoITcKyZenFRvveMxRUFvqZG2o2lpQQbdR5Sym
	tUaR+TLiHa6FljPJV+HpjJvMLatyz3Ul9ncs5uZ6tCA3/uMth4+8/IOnqx1nR8JkAlw9dc6D1qy
	MyaPEh1Tq0yWsksa6MoPFBEOWCxS8O5iRMiEpco=
X-Received: by 2002:a17:90b:4c0d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30e8314bbd9mr16540688a91.20.1747640511267;
        Mon, 19 May 2025 00:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3pyCMyr/gG5Or8VZNaN1zL5hwnJXCU4mQRJygJCN20gkdCDZOvJ0RyHYVIoqUvhRqTC9BbA==
X-Received: by 2002:a17:90b:4c0d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30e8314bbd9mr16540658a91.20.1747640510802;
        Mon, 19 May 2025 00:41:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm5659201a12.48.2025.05.19.00.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:41:50 -0700 (PDT)
Date: Mon, 19 May 2025 13:11:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Message-ID: <aCrgupYa6J5rRJYL@hu-mojha-hyd.qualcomm.com>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
 <yv3ageskkr2mwtgnrldlpgmvgqbxfullp52w7yjg47lm34h5cb@n27gdmljehyc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yv3ageskkr2mwtgnrldlpgmvgqbxfullp52w7yjg47lm34h5cb@n27gdmljehyc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA3MCBTYWx0ZWRfX6dZO68aNxFrF
 WhcykIGlF92WfIKRDnkwYCHsmhvGcZFqf1hPQvbEpYvVbpUZOT24hxFdzSLZCInF1x4ggvTRYyp
 cyIYAR5rbj5uw048QvU6AIh5mEno/zuv0eH+mmH16pJukNXA/kvaWvw2LfzgSSD328Dh7ArTHTw
 Z4ynrx1nm/GAPJAvWE+ezxg6FFKEHU1ydGHAaiCfZq0XAjfm4aSQehdlbZR4eTb2tdju3TguLCs
 bcnyTa6M8rErEKQ5mGu4IQEvCT4rDq6v6YXeAqlQZmmakiI9HCFZahk9eSntglhNDkTlzONHE3k
 EsXAt+xgjDhxhwxfSzIw22ZoPcDhq5YM0hRsq3r5NyhU29Tn9bgLYCMwA7ET2gEOtR9Sexy5xeh
 5HWdCz5trUXs9c2TFTfQeJ198X9i7nGDI2L344wfqPREFf/kHGQdq3ULi24teTLU4rUJ57UB
X-Proofpoint-ORIG-GUID: qvM2vtO70XXFTbseGhanS9m6-KaOtFso
X-Proofpoint-GUID: qvM2vtO70XXFTbseGhanS9m6-KaOtFso
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682ae0c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=8TtkWFPNHdivomkhMlYA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=818 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190070

On Sun, May 11, 2025 at 05:30:52PM -0500, Bjorn Andersson wrote:
> On Thu, May 08, 2025 at 07:16:34PM +0530, Mukesh Ojha wrote:
> > Update soc_id table for the Qualcomm SM8750 SoC to represent
> > SM8750 machine.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - corrected the order. 
> 
> I believe the feedback given related to two different issues with
> "order", and you fixed the sort order of soc_id[] but not the other one.
> 
> Patch 1 can not be compiled without patch 2, so applying this series
> would break "git bisect" of the master branch.
> 
> 
> I'm applying the two patches in opposite order, but please do make sure
> that the kernel is buildable and functional after each patch in the
> future.

Sure, Noted.

-Mukesh
