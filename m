Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E87154425
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374206; cv=none; b=iv4H00iTWfQm5/E6eXdvFQyF4L8iilBlazUCmaR/0rexTAMGExSS2sxyh+MP+m9lIZyfQQFT2RXRIHnqzG60+jpJe6O+mnTG/liqxO1zjmnN8+kFIK1kvM6b7o4XIEV9n5T0kygJBFizo3kTRSK5fu5sHGd7Z6CQKrpRV+oyfgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374206; c=relaxed/simple;
	bh=QEOJkA3etMlLHU4ekcQkPSteBUYWoWBdktp1CtObWWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O115nBW+qB5h3MqTCZna2CSCMCDzsKDABvPCbLW6WPDdHcCSEb4+zX7Pex+Wi/nqyrTumvf6bLa1wdM46EPGIZJKgIMfjTFpj1T0GjG7W0aKQqtU6l5Crwn1dZxbmf/iCHSW4sDlY9FDR9Grwr9Uqz+MGT/phUIZZEpz9f+ja+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSziVuPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSziVuPN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Ftjsu031973
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 15:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fU7EPeiJhp/W6CddOsK+6Ixi
	fqtfkJGM4QHGsWZLeEI=; b=WSziVuPNpJ3zezhWR4Lq8u80nMe0L9Mn94da4JgH
	gMv4OLRdHdkmx/uqaifOcb6KK9tLXRFEiI91Gc7mtHbG+Hj4MrZrAUMx+huA2wtk
	EJFZwFpoYa6PWbksPWfOSXWL3JmJrJzFqSM7mVwmvWpbGM/1Y0HnBgkHNCcIhEy2
	xIfoNMLF6gWGGkHvnJx/T9YZ0UsF2gmXwPRsNUFdAy6tvNysRBnn6uyQ6Y8mxbTx
	moTHuxGMGmjtpqvkhdfbqcbexET7R1hWvS/TdfJYH9WY3GQLvizrED4Yv/F5B+R0
	Gl9zTtrODHinAi9YgC16ayGYN8z5N8Lv+5ihEooqFOmUuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a5pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:56:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769273691dso64717711cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 08:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374202; x=1746979002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU7EPeiJhp/W6CddOsK+6IxifqtfkJGM4QHGsWZLeEI=;
        b=f02qEclUnDh1p/830Mzy+ncWAyg1Qutv8TXiBQCMRT1ADpOpNYAfmIaeGqIVX7gaX4
         mjj4MYy7rmwGd3eTJ9w1BUdkw1hHPtDEFiCC+aRjGD+Xi7T0W+HvcM7H0GwIm9p7yt1m
         B4rD8rlMQRiVeMIMx5rqPOE+3DXpe0kEIugdyQQhVP6cwjqja5bCFJjsuQMqeEyhBD1B
         KqY4LUKIdcr9gRG9mp9PgndT8cAxP7BjzYLMDR9c0YS+/oLgNFIt0N7yY2Zv5CBwUDTV
         eWgEHDrChdYVKbMeOU6empBh1dcQ0E3iZz2XPxhw9O1E/NlbODS4g3zDAZuAohg1rhIB
         DlGA==
X-Forwarded-Encrypted: i=1; AJvYcCWgoGlYmoHpDyW1E3E8g7yRn4c0/jg7/V4kfVk3T1iDUGd60aLfmJrxu5vYvQbFmULY1+QEnf1DIw6E2Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuykaPRjUsQp9gfohOrIeS10Q4PR0bEHtw9+/j2kpkyZM4v+Z
	F/MTb5m6vNd3nYLwZAl8eYe9dc0fRypmMJvGvw7n7PduAOFhfDZ9gggXrtHU5FamDPeHbIG1bxe
	W9I5dHtuwRCVQtcEuEfIBSl1QdkmGYPyP16OFdN7CMLsiWeksCdVJEtoOy3Sqvz4=
X-Gm-Gg: ASbGncsHGDAyeRrA0/WIiAaI045yiHDGXVP01tYzSIInEC2yv2Ym7qgIge6XQU8lQGg
	ggELwLx3u5yI4urKQHsAq3DQgtRqeQKb4BRMdWVcc2+d3Ij1tlrPnsYeJPKSodbx0Axr5w9A2Oq
	0H8tID/bvMaMMKXsprjdzsQDQiDRDn5KYAf64f6gjI5fSyhEkMI5W1DEn0UT7eFrJ3+9xqbBQ45
	zE7Sz0qRUF7r7E4tie9/XBV9LmElzLaF9e2eOtzRmecYCiUYTvGQVfK9AMC+Fi4Aj/o0SsBAsKD
	szVbHGfBu83BQC66hIygCsfrByGj7iQb4eq/lz/KfcNT+faucNfJ3/J3PxBzT2lgJx41B0fRbjI
	=
X-Received: by 2002:a05:622a:350:b0:48a:f7d7:f9f8 with SMTP id d75a77b69052e-48dff9db952mr69708791cf.14.1746374202458;
        Sun, 04 May 2025 08:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN4u9AyjqDi5g8VZkq9PYV4kNa6a/Ba8/S+CxQZZMJL5dOCD2iDARt0FReF8lX95lkfsxStw==
X-Received: by 2002:a05:622a:350:b0:48a:f7d7:f9f8 with SMTP id d75a77b69052e-48dff9db952mr69708641cf.14.1746374202092;
        Sun, 04 May 2025 08:56:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8d40sm1309157e87.98.2025.05.04.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:56:41 -0700 (PDT)
Date: Sun, 4 May 2025 18:56:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
Message-ID: <bu6jivw4mtxcxo7vyoeuzn3unck4ehpsknwmhp4rbm4rkudt6b@xenhgqvyltug>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-8-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-8-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: MwmjXpA2CVWjRn4LkGs2qDCUq9AchZLU
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68178e3b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CU_EFOmFiVvtlzqC2ZoA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MwmjXpA2CVWjRn4LkGs2qDCUq9AchZLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0OCBTYWx0ZWRfX77WKUMoHHhbn
 b/TA6di5eiDeiyPf5bX9fBEu6Y51RHYeZBC6TErgPiOdn2tbsvtqc4/WUyaoqbJBPgVSRtLAi0k
 ugBU+4LefRQdHtrEIEv3/3Fb/nf/SPRCoVl7QbjyOy8yOUsIpFaGv70/DumLigKzlcHMVCYhw7B
 ppgs9Co0HuGedfFp06RBlxj8+3sUxRiHo+Wh1cGD+XVJ7MXxgHerpONBXio/0CJCEebE00U0Ks/
 t7VAxWCLJXYMJw9d7I4iW4XoGpZi1p2HSbQCzTaeTn/BGkjzOFAdfmXaxq1ByvlBT7zGDySiUhk
 lCfEEmsoy1kndn61FWl1W62SN5eCpmGedG/7jk308KijoXafQwg1S5ZQwWCYxs+P5hzOYSRJX64
 q+XGVKMaFbbReeViXyTb2rAO+iTseVHUjSQiDG5+s/Gf0Yhb0ySnulplfDro9U0NXPAfNy/q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=790 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040148

On Sat, May 03, 2025 at 09:54:36PM +0530, Nitin Rawat wrote:
> qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
> Remove it to simplify the ufs phy driver.
> 
> Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
> into qmp_ufs_power_off function to avoid unnecessary function call.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 29 +++++--------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
