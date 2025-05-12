Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863913D8A0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035680; cv=none; b=VzAlsieMHHiOSs11SPMcU9goYoPJhQaMRAl2ChVmrlaNqdPcUTe5S2AOBVYQ8iRKzCZuNoCq3wzvvvOQKl8sN0957Lyx78QufDLZQZJwpKUMj7ZXDKAt6FOOYK/MUCwBvVY509On+ITBoR4wMqMsswSHHRSyrf7DGwq2VvJ7DRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035680; c=relaxed/simple;
	bh=yZ0CGA29M3rcJ+MvhLe+QeIcohtu6StaRYQuN2haPIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH3QR5hAb1aZ82qywktCOsggMcxkoLiYwMXBOZAx6mKIJAf3GZOH7PNF8qCCE6VdA2FoR6RGofgBWVGblgwWuC8h+Ih2mdxrsnxyR3c0Nv9E2kdLM9doot+SLMtOz/xPIkYKvLPLOboSsmD8xUXy6porJsIeJqkhvsjVIyMdZ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tm9kUkgM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tm9kUkgM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7HifA023194
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=07H7J1WxUG240fs/pO939g9t
	ouj+8gGhAGiadw9TC9M=; b=Tm9kUkgMjp9XD0j7794zYjC7Kxhh1QR6KXzGcaA8
	+43GUr4yz4Sx8zIBf6Pf0hjlZ8HdtTLqUTNtdqPuZdkVqs3fWT3Dz/X3Y0xt9U9C
	2QYkWYRPl7l9rJsiPFj6C8NcxLXwnNfmkBvHi78ynvvTpRzzCkKL4ns3fdhbB1R8
	K3VqOor2CfWQpQspWtEpBh9q/kNm3VsPg/csw6i5GLjRhE/SNRSas7124NPsQNWl
	kPH23mVKSkes+j+RKRHnRwkxXvJPwVBmdgnVqPl3ts9jRFg2/Bn/VLYItZKbF2dS
	ZvwPNDIpB1GIxzRx2+ELxYyO2UfaO8EgmX9TxPRmGfseWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfeg24x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:41:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3086107d023so4569052a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747035676; x=1747640476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07H7J1WxUG240fs/pO939g9touj+8gGhAGiadw9TC9M=;
        b=E6Lxx8gLgTyCoGGP4MtQ07odEh+ygii3cRd7SVTOpeD1Ij+2yF0bI6qPLIMe8dXLZZ
         gp+h42xxGHthU4nRB7vwUE189JFxOwlqwReVcy0IFm8d49V5cxM0DFsT9+/ZDZWx6Ad1
         gyvj2j95+GK5h+20pffcarrhr9Vx/GM376qMttsG1Yp2DtXFYM/tOOCOeUQM7lFF7OtS
         B1//Q/8f1r7cQS1BYo4UmDZo72VClw2HqXp4IWoYvml8W40Fmi2nKNqZ5Ktc26ZGJmOf
         VJfRYHbJc6i36sqNxKCfp40BYrMIjsTgm1LqNAIhEJo2IO7yiChXZ9qo3U1xxWN3Dq1k
         zsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOqTXuVs0v5ubwAI5sGsJrtH/NcZGeQGHbfPL+9sQ2u19cWKgSjKeFD3nH3ijqVR/PZop2zMvNHfcTUyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDkGZASD5GyIb6F2T1v8FCWW2JbRVdNGRAaviDCpoDAQaA6waP
	MsESx+siFiaKBtqmrz59iZW5l0hKH5uoSBhTlTNUZA4twv0v7YYx3tlGuDaHZS6AChXLiherpdN
	QF1znF4Qqboa6KpVNfeC/MPpxiwNHj+B7Rd1/BYyQqXyMfeSnbjsobhltewmHpTM=
X-Gm-Gg: ASbGncvBJPDUHayWjbHhiyUabq/ZMYTtPhT+ugrOr0dJoMUTtli0jleoklbxQpPTeOh
	C8bcB0EECu1C96qjgvDLfCqjxYKHUBjDILAEMHq84R1xeVw/Ge5Cz96+gZhJIPlAtrmg0UBMTCR
	u78YvRlCdk/XOdHpMoVk8MhoYMa/3Mv8JzwrQEp0D64DCbUSMdNReEXXe6F2872c7vxHdwlEqD5
	KsAYB51aRH2FA/rm9ginszD6hcKSRqdarPy5Wnk/9Dmh0pceiCp8pRIbuFFGGVAeUIzEj+OgGsq
	+CZGWwzXfOCdUqw5FJ6B4egxzxbR
X-Received: by 2002:a17:90b:2d06:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30c3d2e2e67mr21168294a91.15.1747035675990;
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExWuL72ZS+7tugxJHglTxQK96hvhpMFxtO0vu/JY9uRC/XDAlkU5cQR07NvobNtlJ6mInbyg==
X-Received: by 2002:a17:90b:2d06:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30c3d2e2e67mr21168238a91.15.1747035675558;
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
Received: from hu-pkondeti-hyd ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e76062sm6007792a91.44.2025.05.12.00.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
Date: Mon, 12 May 2025 13:11:08 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
        robh@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        beanhuo@micron.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
Message-ID: <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA4MCBTYWx0ZWRfXxj8qec0Hwk+S
 Lykjhm3kSeIxNIc/ermhiD58JtGPS6b4wXnw++YrlRQ3JOyRWDPKIWk9jsrNKYAK3fRN3crQ5XI
 Dr/pLxP6IKiRMS+D8wXj2riKs/cVJzpTluXsFNQ4TU1HJvieh2qbz0nuQ5GPbaD5YHPc+sdphVx
 v2ijBgpKKLeiiOoQS1q5R5CfyWWEIRUHhW+4zlsBQiujnwgYSri4MlKfI42xPdqDcY5uYg8Vv5I
 MfPIBG/AoroGqwQI9s+moOSIQ6PuUpjoQFqz48uPr1dzWp+R82vIgPTA/KvsCmUmkmEgAJRYmUq
 Qml/XJNXcGabO753NRiN5lli3sAuoiHBLbr1sjqozRjI9Smy4d1t1rmhX0GLtF2YMA4vAKKbbbV
 mNxOqy6OhyDfZYr/ahLwuLhoigpJx9SFnLMFtslAfY/78IwfITYxKmlbWqDPseVDDF4fBtWP
X-Proofpoint-ORIG-GUID: 3IDwjg280gXG78acfWfQRoOnfR6xAJL_
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6821a61d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=gDD5y9GCQ-Lx19kb1DEA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3IDwjg280gXG78acfWfQRoOnfR6xAJL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120080

On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> > 
> > 
> > On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> > > On 06/05/2025 18:37, Nitin Rawat wrote:
> > > > Disable UFS low power mode on emulation FPGA platforms or other
> > > > platforms
> > > 
> > > Why wouldn't you like to test LPM also on FPGA designs? I do not see
> > > here correlation.
> > 
> > Hi Krzysztof,
> > 
> > Since the FPGA platform doesn't support UFS Low Power Modes (such as the
> > AutoHibern8 feature specified in the UFS specification), I have included
> > this information in the hardware description (i.e dts).
> 
> 
> Hi Krzysztof,
> 
> Could you please share your thoughts on my above comment? If you still see
> concerns, I may need to consider other options like modparam.
> 

I understand why you are inclining towards the module param here. Before
we take that route,

Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
based detection?

Thanks,
Pavan
