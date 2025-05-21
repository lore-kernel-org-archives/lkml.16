Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FA1DE8A6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841751; cv=none; b=a07+Cq6VzxuuZ43ly7aFGBykUnvgcPfJnreackNgGzbDXqCbzLApb4dg5z3pREAUE7CjNuLKdlR408+L4IBWmGqc+oXVUE8xISBEcc/h/xRXszfByvGcFS3eqAHZ/u9kbqdcmYybxLc6//ORk5u6891oNMlDfTuIrFjjyseKwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841751; c=relaxed/simple;
	bh=Ji/NJC0jS20Z218vWjgerhtA9zNemwT1VchT19GibRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL8NFMFrWV/8zjC1Efc6mvI+kC99Ikdzvzj6koaDnmbf/YcSWfkpj3vHJBU0hIAKPOjg78WiL27cWODEwfj4AZiju2dIRhMgTvtOA2p4BElgd1fw6PvcaL94h1iTQar7/O+/lZYwwqo6zbCo10YvkGAnZb+wP9QDj2WntUpfZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7G9z/bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7G9z/bS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMoB016599
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZqbR0fKZ+8evj8gXjmb3Yq6g
	rxO0kRUezTH9ydk9GVU=; b=d7G9z/bS43rrmEoAfUML4SvB1LjWtrdwXZ1o/Sho
	QQIwI8J7T8TUppmC0ukO4nnMJ3rC9+HLEMts4oONoxr5Z3RcHpLVI+zw9DaNURHl
	C84FUou8xhctHDKCF9WMwTAdCbFE0NXpIZbNRgSRjwMlWroTYtAQWYTiDqEr57Hp
	q3iEvJDtxd30jF7+3C3StUN47b3Pe84qLGzFXRSgvH5gA+CaR8seKEAfhVfCfrSB
	K/I6D+OebToFtS6EnkPtlJ/x/jWPVwbqnziHWBXcO+0J5eNCMB5JTA086Bpj4ZTX
	tahmepDCBoNqI+EQlOMjafQlD7IyDA635ZCzGaRsRcAbuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9uess-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:35:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990715so1894482085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841747; x=1748446547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqbR0fKZ+8evj8gXjmb3Yq6grxO0kRUezTH9ydk9GVU=;
        b=ry1BwY+SgQklAafXtF5GPo/Kb1JlO6YI7FX4EN6/Ki8cqy5ag9qd8CzlRyIg4V2kpg
         uqalYMUBjaDw8mprRVYFqmIHADlkzicT+hCul3VmtTOFZMO/LwHewByvgCcT5EwYDQLj
         dOgKJ3d1jNc4QHV2LmKoIgqaMft3gSe9RmOpcnFso6BouPrFZ3Mpjju0jRbU9mz1hV4I
         pKwyRHcNyT7/gJ+HVXSI1LwkTSYA0LkThJ1vj00GgNRRS7f5RzTub3COi1l3SRcpXSyu
         ahhop/84gE1gk/hzx4XzVtICqOeDfZ601uLrFlYMHltjncebnctjvzsjudUtqvDqPK3/
         JX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6SZ0kjmpAcdO6TQDkfjTrBJkg4RDOHdhWm9Ko6aViIechTNmsLTbbhu+Lo5AF2RyN3mbQP1Hc3VoVpeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/lIOIYgPeuB4Q1hg/YLhGVfVszEzHeDvbyr5NY8uWYhPXbd1
	jVfpxb7VCyCD0JEvOd3ZYnpwi24ohLVDdiUYKu6GHny+AhqkzKAH+fb0RKa+6hZJ5sbtZaiQQK3
	2zDO2SKMOK/keKLDLKReFFu4ZO8bLpvutLpHe03cQVN7xQ5tBp7i+AUXO9g7VPsk3gSI=
X-Gm-Gg: ASbGncs2/luqmaAa0W2B1tCHiuLQUJBFm15/ba5kHaRSwKmibnS1lQ0wbp/I002L7kw
	IkxS/Z91/dVOnvuid8ZKrnovuwNLXT4ZMF4fknpbWrI0d5Np2ITDuCBxnpLvVjFGhY1vO/nwx9Q
	qCJ/u8ehcIGMCEPu7VjVNSndvST8fdmX0TUTN84EthDseqO+tGSes232DtBdKTHnNdbwX5AQ5X2
	62k1VCj41/qSSFp3e8lSL1VBdQjDGwwCzqaa8WxCmO8B5NwaKnw297AoOYNbucyNLlWHSFXpAe8
	rQXmfUjYwapXPBB7GVsNrDLqgEG1CY9YoJzWaHHvsopNkfu9Pk6nAHattfZTZ4PrJ0+TnRmyYlY
	=
X-Received: by 2002:a05:620a:f13:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7cd46718919mr2924692285a.3.1747841747265;
        Wed, 21 May 2025 08:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEif88mxj+wAdT9xL/pZzi6HaDSZ1ONvlON73ZZu7ioxiYyL60zLC0ZSOy7v6VGihut3FvXnw==
X-Received: by 2002:a05:620a:f13:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7cd46718919mr2924687485a.3.1747841746729;
        Wed, 21 May 2025 08:35:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd099sm28483211fa.57.2025.05.21.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:35:45 -0700 (PDT)
Date: Wed, 21 May 2025 18:35:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <u77g7yhjr3ruwkmz4qnmyssuypk46lvvn7oiqdgf5lnofpczj6@y7qa2nx6ss2x>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
 <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
 <3b498b4e-7159-4cb4-bc71-78f32feaf402@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b498b4e-7159-4cb4-bc71-78f32feaf402@quicinc.com>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682df2d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=46_AkE07xEbgfvBdi1cA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0ekEykqWKSBQQFHor2Y3S3zJpdwOAzY-
X-Proofpoint-GUID: 0ekEykqWKSBQQFHor2Y3S3zJpdwOAzY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MiBTYWx0ZWRfX4QBZP3mztQ6c
 iYeRr3mODKdlOD+o4JVfbAzycW7Yt1ASc8icsUR8N1uSFZr3zGXlRNcetDg+Kai6ED1lrMad5J1
 6avpwDtPbRGiVsrbGT51GoTjoFOzyUGkl93SRvjVDBQCVGZCDt6Y5j2oU6q19F85sHVriRywvZl
 rox+jwssLWvgV6YpZLbNfakOrsIb5XfGFmCAx53qVaPDuAGtYk/YYOhewWjNwbj+UWDfMuimkvl
 hEhj6DbIkzc1z+eQjTXnRL5xiX3oYpBIBzu11umLJd0RFlNFG3DRdC+5HVhl8uSlh3a+gq3LJLD
 GnBSob6Rz9zSmGBq+82sJwYpqpw2GviSCxK85B/hR51197zFZnAsVAXWxPhIszkXxrbQiq2OeXN
 0vCAqzgtheDeYlr+8HYGuv9DOgxI2a6sKqrVkapO5ajcN/CuUjTdWOpsjCyvvjiFg8ys5YO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=656 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210152

On Wed, May 21, 2025 at 07:36:31PM +0530, Prasad Kumpatla wrote:
> 
> 
> On 5/21/2025 1:33 AM, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 11:56:16AM +0530, Prasad Kumpatla wrote:
> > > From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > 
> > > Add the sound card node with tested playback over WSA8835 speakers
> > > and digital on-board mics.
> > 
> > No WCD codec?
> 
> Yes, No WCD on qcs6490-rb3gen2.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
