Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE1450FE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710388; cv=none; b=LSLasB5aBRJ6ZpYquQrnq5j7NmbGkjWUTBbz/oEOn9m9FzYS1ZpNrslQ3C0K7JjRgoczwtrOKzYAq3pDk3WdJCwD68rxudsumzdpiSH3EupFieFJXIjDxx3XXMXGszNtHbfYBcf14fweavK3czRNqf+w+0/akgkv1Tupz6ymfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710388; c=relaxed/simple;
	bh=oYsKZrI/QuIcLR4LB3WMeOu7dsFyvR/V80WTMUsSwMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl2kWUPiSgBalw5e4EdUUqkz35fjQsK5hRhlD7p02hISMCb0iFvJOPgPwGYS0Mj3xhsebxYnAfRFVcl0Y4IpBA7qhbp3Tdx5wc6fcuR4Ymlk2LIR67U3fs9a7VylF526XqMKhBQEnRnpojbeYzfT67qsL41JbDM5v+vRr6YrfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7V5S7nj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7V5S7nj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489c4dN012301
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z/1xtniQuJczlJZ01ujz+Bh9
	4R1uqdJi6knoWevjihQ=; b=U7V5S7njDzas1wDtTjAEEvjvjLEu9rr/+G2h5r93
	86wVDvMoepXgrlnDbRyu+vVWo32Z9hGhrChGe4pPTjGpKa/RzhF36aRnC5DeP36z
	A2S6UP9iooPcIOFnwKfLvId8NaxZ7DIYUNN4K5dJFAuzQtTp1NNQ+eNsyMu+Z/mo
	i8D+vpCUOXo2nf3l75PK8KxcDxW5QZ/lnRYdGjjDJFMQJ9vjVmizzhDtu8eO4ZuY
	v+BfcU7DI/V+zB4vwFonjZUMq7xlWMy/XG0Rh6+PW4F066g85fgf1fUkBHZfswxg
	RapJxyQgxTrp4TC+DwfrjQO6c0MFRN6fkokjTHi9FyxegQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52rkaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:19:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so314509685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710385; x=1747315185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/1xtniQuJczlJZ01ujz+Bh94R1uqdJi6knoWevjihQ=;
        b=vbgRwDYKz68JlxJbcc0p5cZc9tO6TiezqFeIZQ2RAPYB5p95ra6AMEiPJubgbKjDzV
         3+R+RDISUR6HuYc0DrwXdd+/JL2O+OQvLoZCfi8wScCPjdhAUYAQAZARnP2mKtK4vvcD
         UKnJ6gnBuH4KOTWxPtIeEJSfI7SgnKi/87yVy94e0zk48ecZElt9g1+Ff5eS9dX0o7su
         4lZrYlCpPITXbteMoHNh00FPUwpHqjtVSgPUQUP4QM241HXUmokyfPFjRYq8XwKZiuoM
         vW4CwKMOsv5d66MqX6tFRnN+1drygzoUylqcFSE0BRyzJuAph0CHb3rFAB7wSh/+khoS
         u/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWsEnQlqGIwsW02NvFGpZB5qSXXSdQlIShJxUsXGrpYHWLABPC49XsTZhkkexB36uGFbemQkZVNhxt8C04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZHb7kNchE6DoPEVA3xpjQ0w9CY40didaxSTx1WzVSPNLSyke
	d1YnB0xlXYTOw0+cm9mJoRuxMBwhu7mLirKNQ9O0FL9vMLafHCQBywSg0P6Y9HMoOIs83jeQTO7
	4cvR9km2DyYuroCUXN7SxIIhlE0Owf6bsxOzW+REjjF4wKw50eHpQPj9kJKDRV5U=
X-Gm-Gg: ASbGncvDaPw6qKxoilj5LXlSzZAlKIlTRuhQs8HIHK1dfwiqBd1k8n3EAL8lIOl+JCK
	+ZvmRISXr5KDnyHVjywV6AG+lv7LHx2k5lHXIVQDn0ztUUnExx51bgi1FcRFE5wpOJKzO+FOH8T
	TUz3WKjzWgmDM0Adh0+iorMXpqB95G9x/okyEEQX3WZbYIaQrXl2Q5C+knVCyOgyGzV1KcNZVbG
	PtYC7LgoNSaBkVAvyoNMZSHq+IKMh8f0X7Bv1du+MGplZH+dTDuTYr4u70f8NbKNTsOHVZ8wiOE
	K+Z6/ORAfCclVVLDMFgjzyKH96uJx7wCeTOvykcoTxcz5MAli6RTfU6zxnD5q06+UKR+gEZgWl8
	=
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr986079085a.21.1746710384869;
        Thu, 08 May 2025 06:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwZ8OHi4nmwi2PAMVW/hTh0yRsHpekT3AVeqkkGbnKdO5qYSUxeVNmtp3L6oWAEFv8SH23dg==
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr986075785a.21.1746710384459;
        Thu, 08 May 2025 06:19:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f7f9sm25700361fa.71.2025.05.08.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:19:43 -0700 (PDT)
Date: Thu, 8 May 2025 16:19:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
Message-ID: <buah53a3j7l2ue3y64m526ztbu7467t4tooyqvc7rhwoxbbnzy@3zxm5sz5qchb>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
 <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX9SIXupKE05UT
 /WdeIEeGLnu1wSKSJzp6nOJmiCXX32+Cnt1ivrCWWs1mP28F2KDHbpRa+BQHcZpr6L9QJY4Jp52
 HHtwVBTYNIOrdeFbs6dNX4yqbAjq3P3+3xCxMRDnHah5oWQloWfKo7+8F93DHEXhAshNiGl2kbr
 d2Qztw17IMI7poa2YbB/jPWSKjabVzJAeWhY4kvME3KzsoBqINpaDrN86KWj54nS98Or8OqiXJD
 5Jzb3wOjiNha0r3c3K5k9hF/tmbxp19vmLEdcCozsV0mP+eVulOPz+OF0+UuwndxBPVzVELCiyD
 Qiw/MvPGZn3sB2vQLr/gevsp06xc81xnP0vp5uXH4k9pXku3vcYGcOTEoNAviLlUx/YyJ409oPZ
 C4GOcppKT9SckT6MPvNYveSNo3GJXyPBAatetLfEqlwks5IKWinHI+cyiYgxm4Z1DroigsWs
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681caf72 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RQ3MwxKCdYl4j3XfnywA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ehQ_cR_wIUd2WJbrOuY3jfrKmYqzjowu
X-Proofpoint-GUID: ehQ_cR_wIUd2WJbrOuY3jfrKmYqzjowu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080111

On Thu, May 08, 2025 at 06:42:58PM +0530, Mukesh Ojha wrote:
> Add the ncluster_cores_array_offset field with socinfo structure
> revision 22 which specifies no of cores present in each cluster.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Removed debugfs entry as per review comment by [Dmitry B]

Same comment. Please respond to the questions instead of sending next
iteration which is going to be NAKed.

> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry.
> 
>  drivers/soc/qcom/socinfo.c       | 1 +
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 55acae79ec3a..7ae4c602e3cd 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 22):
>  	case SOCINFO_VERSION(0, 21):
>  	case SOCINFO_VERSION(0, 20):
>  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 3666870b7988..0c12090311aa 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -86,6 +86,8 @@ struct socinfo {
>  	__le32 raw_package_type;
>  	/* Version 21 */
>  	__le32 nsubpart_feat_array_offset;
> +	/* Version 22 */
> +	__le32 ncluster_cores_array_offset;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
