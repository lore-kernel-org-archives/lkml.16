Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E0221D90
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718632; cv=none; b=ihEgcg7roP89fvjbnvwgUUfpFYem9XCn35ryv3luxWHxjXUcDmHAWmGUIAHbmAe5CdtbgEtMLRzfnxLu1bLL+apxUcVW3WY2CaTlboyPu3QB2CwOXit2RucczR2i1PkPzrE/4Im2/NJg/wvFwPYxPlZNTAgdLyuZxVjbKnerSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718632; c=relaxed/simple;
	bh=KIJoKuXbOWQ1OYetx9oJLxCS+VoWimRs1SlFvXoImcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+KuE6UvdWvXbBRdSA1Ccn35R1QgTkcryTdB6HqZYU9HvwjYKYlGG8U6c5OyBU+11DTAcKXLrawHbxjTdUC0yZmpQe7E10ZeUANafOCP+W07OUVeNqzF4Tv0t70ZdpFqJzbKKusXqeBGpCBSBs48uOHJW74FJhJ6Hl7gnrqxMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmRlHQwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmRlHQwD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489c4qS012301
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 15:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RmEnv08TV/oKkS/GPCZOm8Rd
	6FwX+L2I8PDAwGfsX1A=; b=WmRlHQwDqi5iLO38gGkdi6rirq/iXBIX33sgmsK5
	cTGYryP5wysPFs7id6Mse8LgJEgZr7VLUGCiC3k9tUYGzvxCFDrqExwx1Pct2Zl1
	gxNQcF9bKRgral28ZDRYf3qFe7Pc5oqrEAUOyvlAsBvePKau5rsIYd+Q4M7l8k17
	ol6a4X62DlnVoNLMUyd9f+WZZ1pJmiwshs9bQ4yGcrHbOKrNYVbr7VxgO0k0o+eu
	vJiSAPDNTAHq4ygZVyShFzuCBxCNrtCmK9FIzaYYjsVmiaw1mL1DF7xCd9ESJGmo
	DW0Q7W/v1gFm1JyKl5UdY5AkQht2ketff+HjnoWNn+Wl5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52ryun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:37:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742229c8d8eso416375b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718629; x=1747323429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmEnv08TV/oKkS/GPCZOm8Rd6FwX+L2I8PDAwGfsX1A=;
        b=nYiwA1ZshF2K7m9G0cldfoqj+Y22whNWPI2CuD4fiT0tcrn72tBSr8Oxp5nd4yTE6b
         m0gtlXrmwlQUzDrOGbWYljRyMbn/A32fovDc5io8aeLmiBNZrxx1CnTX7Nqhq/eRPYha
         8pitrtmHQ8QWwEeugQVhEgqVX7XT4C33+sJo48qSbHGqxPH5E9PO38lcxyLq5sd+x3Zp
         TBoeaMaTT3NumYWDR25h0+iaO9tYz2Xq6DYzwC4vmHVpgfbLKatQNTjAMNLkSzNDBRlB
         s49c6a/jX2zkOXcUZ95XKpRqoAdqmMsZboDrp9HeCaZynWOxCupsOC+QzdMLeesAz7Hi
         W8pw==
X-Forwarded-Encrypted: i=1; AJvYcCWWdPqTpwvagJs0B345XSnhyasar1IRlDoWJY9I+zSmcjtcA5uKAWw8LONGVz2l48I+uEF1w3COotT2LDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO3mqw4wBzkidT1wZGFNH8E9iOQ9PFIq7Ivhk6g9i7CQO5b1eY
	2kW/EgiC1pvUrgkfesIRr8sr34nFIacga+8URMwckkXKxYgHuxkiBkUCa7WIMnBuFiJOEBFoocB
	bvnCJluKb5Vak0E2CMOwx9kebAnjAx01Yl0dsYGh0AFzyEnG8btqZ2FMf6I3zWyY=
X-Gm-Gg: ASbGncuE/nTiGTEMKazVm2xDc4mDil8ABSIl3pP2RW4R8zVJZiJki/LKoHksSrL9IH4
	BjZZ0cyzbwjRdYNOzcoA6BtWNSYTrTESfLQnwv1sGjSQYtBF2H7boMM7pnwToEntAHuOWg2wK3o
	qsdNk17wFn1hhzDh6yZXS5blIMNaPQUiD8wsfbFxVvn/1WbLGd7nprzORJ9EFfNJfJOJJmU4jfq
	wCCQlklBx57UGR+tb27R3WWbHyVgEX/EqIhB38oqpwf1ARtqTzfwMxdNmFeHQ1AwtUCYUqHZoEP
	fa55CDriKBSYbbKV7gaC3g94mALj15nzmxN7uug=
X-Received: by 2002:aa7:8190:0:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-740aa33c770mr4023673b3a.7.1746718628744;
        Thu, 08 May 2025 08:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBuHs8eff+nm/YQYKx7SCqM7aiZdpEv9rjxEoFtDm6bDzLVik9n2O/69qr3z1oRa7Rjfte4w==
X-Received: by 2002:aa7:8190:0:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-740aa33c770mr4023641b3a.7.1746718628305;
        Thu, 08 May 2025 08:37:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a97de2sm119972b3a.175.2025.05.08.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:37:07 -0700 (PDT)
Date: Thu, 8 May 2025 21:07:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNiBTYWx0ZWRfX4CaNZlpR71vi
 kEY9nNYuIcmzFSlPL4lKAl53dk/Rcb2HSL58gO8zglbK1YkGfqgRHuNZ459sCTNvH8q1pnMRfn6
 CTzby2EmSaOf2huuHT1omi1Y1vpiUSm5cHsCG9cfsZe3Ec87Jl1VuZmanm1RYFoqyqvGBMUq/Xh
 /IvUWHSmgQzw0ph8iLOOd9dGc5ne9lqVDUUXU8YBV9JOFgpjD9GDSRqeMADo1b7Rl3mVuYu/RHM
 0nnp2aElYDQgWTi6XbAZ9En6HXABqMCOCwFd2X8yL/CG87RpV8v8FfgPxTlEATNzlCDU/IV5Wl7
 wIlV4rjyWb1FDkla3cwuV6KmdC/TLqqIVdo3+ak/NWhLrLR9DaTa9md0SKhPMsG5gt/YBlK5yde
 5VrekvnfmxEIWllW7XGwPUCVHJMJg0oxi64q+tAoOZNwZpajV+werPbt17cTdLKzTOsAeo8r
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681ccfa5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=tTqnaQ_goHMJMu8gR3YA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Mcm_GmFoIMB6zcdeD1yQPAuxrj6e80qZ
X-Proofpoint-GUID: Mcm_GmFoIMB6zcdeD1yQPAuxrj6e80qZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080136

On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> > Add the subpartfeature offset field to the socinfo structure
> > which came for version 21 of socinfo structure.
> > 
> > Subpart_feat_offset is subpart like camera, display, etc.,
> > and its internal feature available on a bin.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Added debugfs entry and described more about the field in commit.
> > 
> >  drivers/soc/qcom/socinfo.c       | 6 ++++++
> >  include/linux/soc/qcom/socinfo.h | 2 ++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > index 5800ebf9ceea..bac1485f1b27 100644
> > --- a/drivers/soc/qcom/socinfo.c
> > +++ b/drivers/soc/qcom/socinfo.c
> > @@ -154,6 +154,7 @@ struct socinfo_params {
> >  	u32 boot_cluster;
> >  	u32 boot_core;
> >  	u32 raw_package_type;
> > +	u32 nsubpart_feat_array_offset;
> >  };
> >  
> >  struct smem_image_version {
> > @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
> >  			   &qcom_socinfo->info.fmt);
> >  
> >  	switch (qcom_socinfo->info.fmt) {
> > +	case SOCINFO_VERSION(0, 21):
> > +		qcom_socinfo->info.nsubpart_feat_array_offset =
> > +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> > +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> > +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
> 
> An offset into what? If this provides additional data, then the data
> should be visible in the debugfs. Not sure, what's the point in dumping
> the offset here.

offset into info(struct socinfo) object.

I agree to you and I said the same in first version this is just offset
and does not provide any debug info we would look from userspace.  For
parity with other fields I did it for all newly added fields.
I have dropped it in latest patch.

-Mukesh

