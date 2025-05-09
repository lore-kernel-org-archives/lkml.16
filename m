Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A421A2C3A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792383; cv=none; b=PD8wP3zVBzGTCHHPpghPDrdJtpgUsuldfo++LkvMYa3/MPEcYDAgb67tAkyaqNmQAjEu86xS/3gCraM0oYSa+NveukOM2ChPVuNMoWkfYUcEth6IqxaKg5a0tUbB2jXDiVLGr5wfo7iYk95iVLxDZrT5pGzj7FR/Txj2jI0UGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792383; c=relaxed/simple;
	bh=96Tg58Lc+vMRWzL00RdF0preMK39zEFWmb1QusjV0vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzu10AVhPGzb7KlN52GMOgUzqHSjh5HoI24vbLfmHBOKPTOI60fG5apF59NmC/9578dKMNiMIDXnH5ap0mSNykkloPhhvYQgPVMDhJ8uviovq0nchqBUj+oyV6bn0TYm5wdelssBwU4PtQnUHGXnQkgKFS8MefT+yZxchTzKQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUuXKYHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUuXKYHL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BfuCX031489
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFG5Da+YfOlVw9RRbBfTzV9AWaQl9DWU8KlZRXqpzfA=; b=JUuXKYHLxyincbcH
	3IGZUI6NarqsJFKHAkE9EDmhzizZVQ2IR08pkiGbNr2KAFQNrnEXgmYTNlmb3Bnx
	L0/eaE/pzf+yeN1QyIp2dRsDa7fhhIBi0g+E8VSFhoYifYX9l2KSfw45QUMk/+3C
	zZiVoKL42bV7C5S2m2RezcPr+Dr/MyQ6FNW7XFEQoq2svb13zA4bGAjnZmPdu2ll
	tmi0asOc6LfdH7cwiThVAfoKhfFMtz+aZDp9y6OOf2q3pSvipJWwmM3lqrsFw/w0
	YvrcOQzoVvoxkQV79s+WyyltceWdfBZpLjishapJBDeHIxHK5E1pzKxnCsl2pESl
	U1Vl9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgmj5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:06:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so6155561cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792380; x=1747397180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFG5Da+YfOlVw9RRbBfTzV9AWaQl9DWU8KlZRXqpzfA=;
        b=GfXFjmKrf6LxUTx0Hgq94P6EnaC4tgBFemE2Zh1oXdla97ks/22Rir1ahPt10vbJzB
         hSI1eRumScgwF3isRaS/QIn0bqgIpykuXxDpJ8i3x8COXmnCqzMVxIngd/ll5Z1sYe2f
         QyxKVQKjSVwKUtR/krNMrupPvLGIHz0EP9SVkv7jkcrGhxHLhvUnTZLP7WCQlJyJryfy
         /nT+uMFWAHNZ4fTLFZb0c8I9vUh/9rnAaw9jc5M3GInQxjYhzBvQKZQPEr72dBctjiq1
         wyt2hj4TOHArfC3fNIre3n6edf1y3lXhoaeohfCEEPyKu89Dese2UaIhrzL/Brh9fBB/
         l2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV1WdPFrLY0OTkXSOd+p4iHffHiCZY2H2+qg6f2wLECsKK4cjnLf6g1pzp/2OC4T6shnBe8m2vEr29mpj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUA0qauZhsaUXt+9UICbB3SKl5RfUxpD3yZJX0uprHRsmQr4Xq
	0C5/EijstJI6FbzRoF53FX/IuO+JIyGEl1CK84ChdcANAHrWV4it3skJK2+PtbYUNnGP+bknLpG
	j0B5nN3wKEh10o2lDNLBB2B9X7wphvNdVYSAxSn1iYoYey1udynwV2GC/86WfiqA=
X-Gm-Gg: ASbGncv8kvrncW9Uw6a81HkTZiuDdsbnRal3puax6SO9zCkTuq1Y103wr/4ihxrrOJK
	oHv/DRJTDH8s8qV/r5tiAaedEG6cZfUxecDeqLs9ZKSsuthBEnNlmLw4BNaX5ND0DleFvbhmleR
	hToMyZeYaccUtOvQZD5gWgapK/I2kReFRGnLZIC9Oy6HPSexNV06MkKVWothI21YCt8RcI17u56
	2V0AViSk9K+kU7b0dBlbaXZ1NTG8OVp0sE4KPn8a97lcogFaIRoNie2AH8OsCQlcWLK1inzITW4
	JpUbFSTP5eevQHHep77KUr2ih8I9WX4U6y0hFdhrvYPcsN1ojpCE1BFg+kxqHif/SCY=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr190529185a.8.1746792379816;
        Fri, 09 May 2025 05:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKcBKsJkKgfMZZzUCoL4UmLzaEErHDasd9ek1N9pmcMcSpwfQinc55ChB7fmY4ymnXRybyaA==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr190526685a.8.1746792379449;
        Fri, 09 May 2025 05:06:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc449sm140992266b.20.2025.05.09.05.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:06:18 -0700 (PDT)
Message-ID: <7695636a-e6c8-476d-ba8e-51185a7ae2cb@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:06:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 01/11] scsi: ufs: qcom: add a new phy calibrate API
 call
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-2-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-2-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681defbc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Z92jOV8uMcrVojWvk68A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExNyBTYWx0ZWRfX/F2ctzEpFit4
 cAjV+972rSqzpZqRMlRuxwTtTTe1tjKOsh/PrwvH0rdxhO9Kg7PM5deIscdqI6xyXO93KchYi5m
 iMFHEdHyZt26SliXR/SDRC6reJ1b4OFr2n3i1xRnQoqI58F+B41aVOiD+H8qcEs637v0nFvdwNo
 2Y5uzcSxz4HiW6Mm+kmgGgWb5zVxmvDy2Oab9qn4H0JpFCF/NTYFd9kYrJcJKBCeQSOr7UtPGTW
 S6hOfe9OeFEmIL4SZanSE2tlatPRj/IPUaGeJQVDFPRq5C6X8djYlCMUyuUe1fjIuOIg2JjQinD
 GuBROePrcLFOvtvqaRF5hNvNYGZ4mFm3a2SdUzgp1A67pZbNMZOGW2FhYDdCAvAYAqInf/Vtd3n
 GwhNsT+fTwQg5UiezlwCoGq0lQkY98hrTID7FnacMcF7uuHObtLdWE8uTvFhXgZtsua8XfjB
X-Proofpoint-GUID: BM_6UpCytm45SUSzFwzEzWWnt7D6G2MX
X-Proofpoint-ORIG-GUID: BM_6UpCytm45SUSzFwzEzWWnt7D6G2MX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=810 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090117

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations
> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---

I would imagine this would all go through a single tree - be it phy or
ufs, up to the maintainers - unless you want to merge it right now,
Bart/Martin?

Konrad
