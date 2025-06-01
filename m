Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAD2F50
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763803; cv=none; b=dzZw8edT8isFIqQ192slfVq1kWV5x7DaRxoIjxmjN5kMcoJXIb1Fr7iRIV3uY39SNfeTWpaueaDqZP9TZIvcOvzUpu1xKwk8hkubYAPcoJ7Zq0CS/6NC3lRYJTHxSM7rLxUopwOq1pURfdn4M7fcW0C6IfdzA6BTv41A3J6d28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763803; c=relaxed/simple;
	bh=mQxRcLWFsI0msDgbtMHDKTZbj0McOnFsJJhj0vNZtVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttV57L4phA6dGdwv4dkGccu0NWLuz4HOmSY2zKExI0dIlkSBaFzVqUPZ/xDzctwX1wogiGVXlG1HIHGVFfY35n0JtbTzky2TMdfvgWSyR2u0KndwR60acRLg6XbvjI0GH3NocL4ziJNumrl/xnl+CgOFFDsSiH9cPUQ5c+td2T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZSRj9UD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZSRj9UD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5516moQC017477
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcI7oHOMxiNKOugRygvTxu0Z
	3ZaYdDHVHJGQHCgJsCw=; b=hZSRj9UDC00Rs4QKHpAOvgD32g9FXWVnzpC1TXzZ
	usegtq9RiibsytOUtB8SMsgu5cbu+Xx8rsUopkLOnKXcogKEgyYLbkaCL9NOiWbl
	h88Ea89R3aexH0ZQSP75dSgKHe5UFRT/Mm4+LUaL7efkGJNU7l2CxOIdKudDy8/G
	zIW9/2yaqH6VRuu4eQCEkQB/c7FuwZpeGIubEqXrM8w5j2ZMwRxGSWwG+I5Dkg6I
	nNnlr8DCiDaHwOdQH3SKZTf5vYSdruv4oRrHKWH71HA9GbfMLuWY8Mkj3EJBzxVV
	z2+HGH1qpwQX78TOo6RU6pQJ10QVZX741UNXKvN08GOdvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsdt14c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:43:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so533974785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763800; x=1749368600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcI7oHOMxiNKOugRygvTxu0Z3ZaYdDHVHJGQHCgJsCw=;
        b=GP6fyABsKNaKJrN/hB+D/yStbk5q0qSw+wZ+kInDWZPf2Cit5lTzlPNYmhIgdX3fWw
         szbYfskDqNGkLvVJhUUfCoTIUyKkUVPysjF7cU0eoKcRxvzh7PYyxB/XqFL1ofF07dOF
         GkVqJmmAAAZ9XTy9X7TQGpbWu0fJOlhUt+UgHDkoAJ3ggeyiRjKIzn6jnb+ODX58CN09
         29Nv38X6VhhcSRMNsjKyaGjD3ExCA7mpdJ3PqcuSf71htilCp3cEARrmJv9zfWSkl5tS
         Eqxon14fr1P58LqY6CziR0O8mv+abtg2wsbtu469bpcMVJ6p5r93ik+BqCGhK7qKczxc
         6qXw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Cc/6asx/LmC4erfVLThYBHQPrY6CqGoBNB5Uau3NX8vAFpKUv47vnADLd1GIHQwkydHAuu8A5pnazC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6ynmEnt7BrTVdzpA1sg/6mr3ZJC9hsakCfVSGrmcD/U7RIy7
	mNB2YhzZRisxSNkTaNh52xdBCw79+OHnTwSr7mfGxJcwoM42oGJQSNpIcb7yYGswumMFrpmrG+W
	cLebUEpzAKDSC+t3u6YqhD6gZn7HF+w7pPXd4C7OUHelugwOHcTg2N7bBUJPkXvrlUXg=
X-Gm-Gg: ASbGncupxkdm2u/t4iXyl87WK+NZxQ4mgvTl7CL8FhD6dDMHbtJ8Hr7g7M5E9Iu1pL1
	KN4l66CvYNfxY+2vEAHhdKAvWem8s7Vb8Q2EnrWvU6sszkdlHFkwILMLVnBxwRmkGzOqGgRdbRl
	C8slhyGI0mvSrqQH44atSPwbBLIX6MQtUzq7YnoXrgG2M6UK+4nlmKPhIV8GpM+fMAIVdjosutz
	CBj6WLQkis1l/omS5GSjxtWXJL+EKbwiOP0GYVEO9peMH0tQXa9UW/5E/c7Ju+KlqHjAxjkACFD
	iLPCN1xd90MfQZqGStyMZL33BgndbxQUPt+IDct5rUfegdkn6kr5Qw1n+0XHVAukDjpS5WQmx+k
	=
X-Received: by 2002:a05:620a:2444:b0:7d0:9c9a:e627 with SMTP id af79cd13be357-7d0a1fa317emr1251713185a.14.1748763800315;
        Sun, 01 Jun 2025 00:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYIM22xzEbjvo1mRrhKzL7+WUAL8hLkRRUmKaSO0zlkJGvV5i70ghveevJFktn7zC7JAmJA==
X-Received: by 2002:a05:620a:2444:b0:7d0:9c9a:e627 with SMTP id af79cd13be357-7d0a1fa317emr1251711885a.14.1748763799982;
        Sun, 01 Jun 2025 00:43:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791ce7dsm1211805e87.181.2025.06.01.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:43:19 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:43:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8916: Add Venus OPP table
Message-ID: <ijmplzz3eqaloartncj73vyhchkgtjmysqghc56yemsqdjlnob@54xybknmunuy>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-1-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-1-54c6c417839f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9qfe09xUDeBvYs0YKjV0WvdRbdWc3Z25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX3JDlL5A0Lsn/
 ksvFWmyexQiBmP4w6Hd6u0DCiPLih0EYDcP4XKXG/k8wmo8t798owV1F8lvpkxIFOnVgu6QvWLw
 E+jmDsscj+KXSopFRwi/lJrEsr+cSHEWgvL2LQeMRQzqTW/HQtda8yThfSjqWP1dIkd7zMqilb5
 j8VMYg53ZzSvAZkby9XoW8+UniumhMIqaxPRc6hSC0bfuX590F3mIOUuRYtvd27bRvNgeCrnK2j
 Mukk7sh4RfapzWm8zqn75EV8NzK1tor/3xRVORBJTGThM4mWJ8GNYAqok3KcNB1BZ1rmYKMSZm/
 yhkml0+BiViBkFLfcTGwCH3DtqJ2WwCe6zAJ7U4VaSBZL65Ijyo66u+sNXCh0rcpEXys40oYYW7
 9WKSw0rztgVTtTsAgXYQfZo/tmby95o7KFpIGQH65gxBAa3ujxroMFFPa8SeR85Pf1MVf/MU
X-Proofpoint-GUID: 9qfe09xUDeBvYs0YKjV0WvdRbdWc3Z25
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683c0499 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=813 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:19PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
