Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5F2F41
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989167; cv=none; b=X9HtbMuLOFp4YRQBAQjBr3e4kjVGY4hDOu1XOVA8nokvVgXeplJey0stgIruj5eepwY007Ndl+Uu+I4E8klGshCE2LlNlWlpgpMKuSuhkliO+PM1xCA4z6AT3FRms1r5p+L1wmtbusRbJj3uE51qcqw0kUPP6MA4F3OMt8J2hdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989167; c=relaxed/simple;
	bh=LdoWqX6NJlGXXSJ+cYlzEBZpHj/7Qnh1SeCOCqpSn2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcsqaJtr9sspjpW5gZ0IGGm5EDNqYSLuOk0e7/2QDkX+oz2BUEVJK2zW7s44H2XI63DFiKyEchlawXqXVj5POcrcscltevZn1nMgI97KeFcIsnU5UhcRkJgeA/8yFhGWZDLleY594IKNdnvKeK+0EVJ8+Ad91qhk34i7r3dzPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5/Sqj5c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5/Sqj5c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N54wot011357
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oN63icDHKIbFtc/MXxoQJaV3
	/1PeVKuJUchWHtMFzZ0=; b=e5/Sqj5c+vDqdRem0jYnNWf7a1jNeD54lvHRIH8X
	eCqMi5ZJ/t3oCEb6RbODAoEMBvr+O9BkJ2alQ419qtZmc/jh2E4f5nSj+iWYkBAO
	Ye5WZBs9n+X5bErvnYRX0X6WS5Ml7WGcT4djfa2TcCzxnTgGM0323o2zBjOrS1fT
	K0gqlbDSEW5GiqaGp2iqAC0umII+AurnaHCl7ftTEh+yxywAq61E8n+G3VsSp2Hp
	hY/Etz9nGpgNl2jQT46h4HwHUotTOXPaD/sYh1lMAp6XqK4L2hKSBGffQDYAW0yJ
	MeKcat0qlJlOvzY1IFvi+hDOAtBAFk7LI9HKtKaRWfl/fg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb9737-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:32:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so79845086d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989164; x=1748593964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN63icDHKIbFtc/MXxoQJaV3/1PeVKuJUchWHtMFzZ0=;
        b=Nw/aBLTq3D6YX6ggRc1oFfz2rAYWnZz68qQ91pUG8bxLX07nL3DfpqDGYM+FRobiLq
         bPZfYNFzo2yVFJP8vviUrn1jS6d79Dp6lJL9jrM4YWnimam8mrqhg4ULSD0N5LH5fL2K
         mpxsd12r9YK9w2d25Q9utOH8pTVjFQf1+1HEbMJJQLZoXrWB7MiHb0VqIZovC/DRxBIn
         jk1lsfCdOACCUYOyYnf9VnX29Nz9CVrmL3AfwB/N16r6Hewzsn99FMPhQfEVXaL259LY
         WPLCzZ2+JiTrG5dHTwU4bT3xg4GvlhFeqfHH+/hW5eCmLF80gvlc5Lz/evwo4dAaPKhe
         K+7g==
X-Forwarded-Encrypted: i=1; AJvYcCVYmdu2AIPhhCVIYLcg6LKoaaX893gjOOy3ejpojchxr3aOCPsJZdR7hnlpMknwSjL0CVpmYL5QusMVj2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM/zjSI8/dWBDpzPLmdJjX3ix/sc/+TYd9k2WQdbTHj+co+hSr
	0TLFnZ9hEMQM3eAbegXdcdjBI0YIZZA3tcb2xmwGlPQG9i94CzDw2FDVNhrBAG2RNHBU6/gkxHX
	uEnuN1zB1/takvaySmEdlSezXAR/U3P5zsMuVa1rFwbF2TI/Bnc25z4boObjBgLjta28=
X-Gm-Gg: ASbGncutFKeaFaEOmUJ2g1iUpour2kAC1Y7PYIl063g5GgNOJJiLKh+5/3qoMT4QVvr
	PZQ+pupSwopFg+LEBqSMGAUH7JOiY6JRYOAjvSZyP9BsXlx7/T/WbjlS9j+3cAOE651SvFmXV0Q
	fMh92lqL+ZG/0BtMX3Anv9Zeb0EZvpQuuY7RwaepJ35x1sUPmKh2vkdPoIh5OBek/E7FTBvpwAD
	AuX07FmxT5nsr8QPWn3yepxKR49f/HH32IunkxkC0EjnoeDoBWVsp5iF7BwE08mPjmypHIJI/fB
	DL/JW3KXxY4S0nGn8RSnIzoqSqG0xplx17nwm08zgRUXNzGLAOtLXDfL4q3fU9gcYK3eIdX3Hwk
	=
X-Received: by 2002:a05:6214:21ef:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa93a29ff3mr32691046d6.4.1747989163925;
        Fri, 23 May 2025 01:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzHTCxZit13oN6zSMGIZl1Fu32GVKPLOoageiYP2PzAGpx1HdKcURrKQQL9zO1TSMpvPVbFQ==
X-Received: by 2002:a05:6214:21ef:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa93a29ff3mr32690846d6.4.1747989163545;
        Fri, 23 May 2025 01:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5521685d1b4sm268277e87.169.2025.05.23.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:32:42 -0700 (PDT)
Date: Fri, 23 May 2025 11:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <pi2ce45jqijxvzchjmg5ze7zpxz6peeyssoybodwen2fh34w7q@jh6i5pubaniz>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
 <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
 <aDAOXo/ujOcefs04@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAOXo/ujOcefs04@FUE-ALEWI-WINX>
X-Proofpoint-ORIG-GUID: jrPvYIYtyGMCapkMPkOJWputfxni13cN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX+HIvzcuApuqn
 eqpyX5JOqCWft9yHt49extODiJuYiOcS3aYf6wbDM8WBApwxN9HQfWg556lUejegj6Gblxw0ymI
 q3c33dd3CNKE2G580tOfUP3DEHg4oj+pPVZIX7+MElwhKAIRoRrdXh0U/GE/kqnBcf54GXjJ49N
 hNidDJNI6w4oj7SWes0FBqajIcnyW+RDNXmYQem6+Kl0QK0O5FlQcAwmed7kg6KzJfL71CIBdx7
 3PPMuCvDtQY61Uos7cRrKTmjI8AATRU5Bd5WH8aco/+Vyh/jw0hnk5WdVKUtuW4Ew2itsYTLcs4
 89Oem1EPHfowEKwCjlj7RHX6+d98wmxnS2c+gwp0vgNI9TiDupcS4XPGdIMhlB9plE5sVaRH6Xc
 6dZAALrM7F25XTRSZSDzcdsDfvp0qRYLjChID61PeEhEa3av5dkROOtmLLabEph+9PVX+RAH
X-Proofpoint-GUID: jrPvYIYtyGMCapkMPkOJWputfxni13cN
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=683032ac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=ygGBFQutPZ-PvdxHU64A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Fri, May 23, 2025 at 07:57:50AM +0200, Alexander Wilhelm wrote:
> Am Thu, May 22, 2025 at 10:09:13PM +0300 schrieb Dmitry Baryshkov:
> > On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> > > The members of QMI header have to be swapped on big endian platforms. Use
> > > __le16 types instead of u16 ones.
> > > 
> > > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > > ---
> > >  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
> > >  drivers/soc/qcom/qmi_interface.c | 6 +++---
> > >  include/linux/soc/qcom/qmi.h     | 6 +++---
> > >  3 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > Just out of curiosity, is there a usecase for running QMI helpers on BE
> > platforms?
> 
> I'm not familiar with modems, but the wireless drivers ath11k and ath12k use the
> QMI helpers while transferring the firmware and boardfile to the module. As an
> example here is the log by probing ath12k device on big endian without a patch:
> 
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: FW Ind register request failed, result: 256, err: 512
>     ath12k_pci 0001:01:00.0: qmi failed to send FW indication QMI:-22
> 
> Similar behavior is seen with ath11k drivers.

Ack, thanks.
-- 
With best wishes
Dmitry
