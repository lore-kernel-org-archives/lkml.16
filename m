Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5538DEC
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372472; cv=none; b=J8OKPTGeemPJq+4B/9Oy6/hgaTO2DNCSeI1TdIlScIL9KKS9El4KyUOGHu5T22noONX9VcBXBhOlq7al+xKFo9Vq0jhndkNCTpKREJ40M/LzqDMEc5POAtCCEOWzZxlTBZ5CVhki4/P4Jhvs0wghTBAIIeZ+Hxgp4/yD8BudLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372472; c=relaxed/simple;
	bh=LUmwgjsGIZY3yOOJYl4bu107Ntl6Jtj40wTSgSGzqeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trLnnDhGlpYnQ/29cv4t5l86bv3Rtxi7pqlrhC30cIfk73Rf3I4aCgWj/XaFequNtepOC7I6QxSErauEpM0tsiL8yWKvTbnrpp9Q/7kg3paXYTGrqDW+KlPEybjdmzu+HWJq8sZBvQV0GlWHWv/X0fIncWUrdDCc9Y8sgQS/dFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEjiQ9sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEjiQ9sv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FP2mI005976
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 15:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMiOZyNbZ5taHnkDse6HWXJ6
	dUdIIbmPQ3Vxz/Yy7xI=; b=OEjiQ9svz1JEfaxj2JOruNUd826815zcljHZNM/i
	MyxtwzNfmBwd3UMcPzkt2dqVE5sfBBjJPA+GYtHqP0XdbjeQL+WIxReGWvCG9JGT
	q0IzTeWwrFRREV58xBnBKgtKHSCAsO6czaGLTZfoZTQmqFNaQfp/Cy30uE4s8iDx
	5baCw6/DIviJNWSaiQRzoPxB5uIrVrJ1wbJsJTr+uI1BmkB4I/3KYcTgSVIDUFnA
	Fh3bWVKzoAOpGGrr3bbayRPXMGvHul5FTP0r8dtFM3kSSQlwSdJs6IhKTBS7SLYM
	oGAl5sXC5Ta8mrUBQSlUhVFtJhGPaS8StNthjlSnISCDtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg24td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:27:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso715654085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 08:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746372458; x=1746977258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMiOZyNbZ5taHnkDse6HWXJ6dUdIIbmPQ3Vxz/Yy7xI=;
        b=VrJpgj2eNXIwKmCOjQq+VXkMWdwkW23NG6Rty6IFU+YUHWO0737JCzS8OFtJZkAxZW
         /MSIBguxtfv7nPruGKwi0e7xPDw2vx8DbXB1oS9G2e47l5rh5W+aCTP5qteRBR1XDtaZ
         l02Dond++E8Fgs6xijqVnkM4yDYugKzHrJD35AtpdEMP3hCR9ADZkB9XRboOwihkuD1h
         Qgp00up6R8yYuj+3diY6Ofc8NWmdWYyDFpV3cdH8on/A4pObURcwrX0T3mQpvIu7rNXf
         Du9pvMNfMg+z+r8WcMbIBK2FWhmJHINhBmG/k6c0B6/boMvOlTNDlnvTwlJBlsiwwNeB
         K60A==
X-Forwarded-Encrypted: i=1; AJvYcCVmFSIBYcbPnkEKldLUJlfv4rpr+UyqmIBS+288IkVuzgrnV5tQmLAygjN9UkD0lP+mDtjr9QbVC/pst8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSDae1lbpcRDw+IG9ZwPpzwCahV8cYGvupfTsJ/oDAiG9BSB5Q
	HIRG/rgYruYHNJOHirXR/yeI8zxL6yytru0FTchn+HeyDZS3ODGvtEJK7vlNb3NMWRITo/jIe85
	eUNiM1bdwjI4WTSdKGW8gHvJzLKgoIZ0l8sztptOjsLv/qSroCWllM0W2Ip2/+sk=
X-Gm-Gg: ASbGncvi51evtIY8yXibL8j7l7n/ogbR9+JPbpzvwry7Btm4/gaBSxGg3jdh8hO1WlK
	VtwZFFOPzlOQDCXDTolIcEJZNb/gO4zPahX0xGQlWToRtkJyeC6dPLgBBReE06Sy5mjbC5qLi1p
	6mbPt2w2rYG1WCZuzNE6lYuvs651zDXK7kbySBLm4jjUfHTBp+291e/oIYfe9iFpAIoUa1Ydr3N
	dr84oly5TrlDKLhAolSRPdHgHJojOHwQ1hS37Qb26ss55nxSmVZyGEs6zmqyFD2GXm6FLrPZsXN
	+j1PcsW3DqLnjfUQ5TW3Z8ZikJN1Es5+5U3e3DWhXYGu5ZGQuhrt7wLFeS6DbNoDcnkWgNu5e5M
	=
X-Received: by 2002:a05:620a:454d:b0:7c9:2537:be51 with SMTP id af79cd13be357-7cadfdd5c66mr743897985a.24.1746372458207;
        Sun, 04 May 2025 08:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVX+z7TEc6vt6ylfXVwNT1h9JQA48LH+Jzgzss3FvyThLUZMiNGTS8I+avTmoIzuwv2wL0/w==
X-Received: by 2002:a05:620a:454d:b0:7c9:2537:be51 with SMTP id af79cd13be357-7cadfdd5c66mr743895685a.24.1746372457874;
        Sun, 04 May 2025 08:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b179bsm1291505e87.27.2025.05.04.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:27:37 -0700 (PDT)
Date: Sun, 4 May 2025 18:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <4nfhtdavca4aqiqfct2wvqdwq5kskfzh5kffnz7utnyreiichw@giixjxypwdcq>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-5-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: s8C1hMKwxSzMBV8dwQQsjQck-eDpt3Gp
X-Proofpoint-ORIG-GUID: s8C1hMKwxSzMBV8dwQQsjQck-eDpt3Gp
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68178775 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eTLblWtPMpn9__zQJdEA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0NSBTYWx0ZWRfXw9o4uQN4FOqc
 p+I2WeG/WEXVdpz5oahqNj3FCqEpbI5LLyCALOujkSSUv1R7oQYYFLyWpHCUlagc9R4Qsag98Gf
 GEQyboci+fHmeXYPWkiPDFufd0fz1HYxt28v/NZCNzph41W2GxHsK436TiddxATgYj33pjSZrjW
 WK7mx2gf798C/VNhitRqUmIZs0gL5VJO0H7VXpXO39GRnTJBXq2XQbeFpGuYAzhVTuI21QeULfd
 a1lgzaMBPs0BuOpXDTo0l0CgtpJYaHQi+NU6iTvwPoqk6FUpbLSB1imfqIZbf5Ov5ZmVODZyf2U
 oJbNGPny9Ergfl1TKRzLkoslZ/t/Z811LHZO73Az5whnpsCeeOVK77fxMGBrOJ2Ysu1pF7E/9zG
 7TAtZCfNZYjCrJ4o2klQBGqfvZL0FsQZZz1eWEnc7TD3F79+pqaq2IiqZZr4wHY9LSX5W5kK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040145

On Sat, May 03, 2025 at 09:54:33PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during initialization, instead of every resume.
> 
> As part of this change, move the UFS PHY reset parsing logic from
> qmp_phy_power_on to the new qmp_ufs_phy_init function.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
