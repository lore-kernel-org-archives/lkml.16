Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343AF253345
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719814; cv=none; b=Q1ZoI5mUz4EyPuwKZaAK9e3KsGGSlXwQYBLWsUkKJa0t/aPDc4PMMlqkkiKqm7s2ZEvuKtD2dD+B6pJtC8nFZMf9VWffVoPppnFdgw9JTtJmGU+BrlBJXjvYi2m2m8DzXYKm3OJ+qM2qKtdHjv//rvEYD0VHfmKv52IykK+BnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719814; c=relaxed/simple;
	bh=NzmU7hUg2Eo9/PsDhUTmxOxWwQEJfzbQTEsxuA5Gf3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UstbVLyGO2gb9TIpgHcv4UiJkyj2FNVhah6PxHqn3lG5RyPkgJnikX7o0e/AaVqKt11bWiijk2ZGnQ9ZwwnngvoORfZa5GFkQTnI8g8Om6dYpBizmq2N2MxjTX/IC5VorUoVmc6ePIPy8pB1mAszEfza3tgz/6bVpW52vkEhdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6IX57+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6IX57+9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cR9U012935
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 15:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qgSggGoSaaTirxIIz6qw++gt
	kKF/4TziWlI+/J26LMQ=; b=R6IX57+9Bdp42AF8utBZnwKLJTClTorOMjHZqc8F
	M4sh7MaMf5ZFvrhK3LiB2oJULsk1ekp0HYpQbvGD4xuVnqWVKHGloHjcNUTaysjl
	BYcVxMj2s0sOW2As9Tam496OJFmqsmnrAJffax2WQ0Dl/wjySe4LiOFfGUULDkMP
	qasYUs2W3K1Fug2bkCahhoFz6T3uuTt1L1SYej0w+yH2kG4kHNC/YmjKmaY6UEHZ
	r80k0g2ibD3LBjVlNzGgd7w1QFUmDO2Te0kYAWzEaxfIwfbXdpf61VNK0g8gfCCQ
	a2+f1OJFv+WRJFPcNHwaiRD79vQZPybMgrEayuwEL/MTsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52s1bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:56:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990722so217760885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746719810; x=1747324610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgSggGoSaaTirxIIz6qw++gtkKF/4TziWlI+/J26LMQ=;
        b=pIblMVn9HTsegFj9ZySUYmJaFwdbiYakcYuZdnCbz3D3hiIRskZxvJSJoelPyJdb5v
         RwfXK45hm4j7+wSuGu4Hyha+GLrP2r7EQ0HNNM0rODVuBZSn91jiKk4zINZobXsoit6t
         E0xgJ+6LaNIgc36bV03Pqw6yrGsTszWDjLqLHb6suCDEHDB5c5LBV3JfkUjM0WVT8hKf
         yluDgNcxr17ZIfnDdKIUg4GgOHHoPkfOQZ22H6NzaCHGfs20BGjYYHeq34O2fhh+Dx1t
         gWs0ASZKa8gMZqfWWvXsyLIjf/14T0EVP6JCRXuPpVIeWoYtVt/hSymzfqSGeiqTIkdB
         Hq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVd9m9q8OGB1FyRN08yc9rdIZLPMcqp6sY3ze7ji858ihQRCkX8bgA+aDLFZsLc4Sp7jK37kl2M2O/mfzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgVWwFYz2AokUz1OvBz4w7+HyxjjK8tTkOW0fVyriiGRsSjW5
	6ZkonqJ+MA0vmOk5QS6TOrMsfnu3TEAe886pJTSgg28TgvbPcZh0/4oaUmGPGQRLqlC51x6Wn/x
	POJBBPP2GgTdlIS978kg5okWRsNYDuP+otEXUpNq09PQthtvtVR9j/fEsM2EaOS0=
X-Gm-Gg: ASbGnctVKL4VpqKTWTuNkNLh1v5EHNXqym9Ng0EvnZphWo269KdqqxoT0OyvDkCmdPP
	HWqT3DKZ5fq0Xi6JVEjxgJSbpMzjsHg5xeeI6DnzLAFuvoJI4SeVkha4ZKGpQY0tEvh5KvVsNwx
	Ruobz+sy+CXWOpSZ2zFzTZ+CuRLRfpIp5yuPGTLNSzcYkEenTgE5krbp1EWQgo7d4OHQayEfaU2
	G/+8Zx3HJ/EU/83KElUg4ydMhl8GtO8pQKFREV8t4e6RI7B0s5njs5BjsHpUo+cOajo3SRLlY4Z
	rlsupJGOb2zvrSgu84AmdegCjWlGu16L3McBGa+AA+1VjOMYwlq/rPwGouqFTVirADZZJXXOVsI
	=
X-Received: by 2002:a05:620a:2545:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7cd010d00bcmr29271585a.1.1746719810470;
        Thu, 08 May 2025 08:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixeUJkkheEBcJbAWAvr37gbzvb0W5SgmK9smwf2A0ARB5ynnsyLO90GAT6o8F0rk31GEZPQ==
X-Received: by 2002:a05:620a:2545:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7cd010d00bcmr29268285a.1.1746719810075;
        Thu, 08 May 2025 08:56:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd0esm5453e87.6.2025.05.08.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:56:49 -0700 (PDT)
Date: Thu, 8 May 2025 18:56:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <s5fd3txerbwgzzgqnoovkffmijgub5dxfucqqskhdqyjqzkbyl@5cyycrfmubup>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
 <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzOCBTYWx0ZWRfXzgp/0iCIOJue
 UHa6OcDuwHzyE9WQmI9WrfSJ6rfRF++DyaBfyCoEPocaA6BSQ6FEDOrAvjOVfc6X5l8cIxm66hj
 ViFubG4Avib+9P3Ni3wMZdlEeIIULtTQqhFsp1Bp+rKaQ5Kb4iHJ6hlReV+Mr8brRSQzvfEN8B/
 a413edj3sD2A5SPIamnv0DLb5k9FK+cnr2HfTbVtFp/IssX2oWXwC0NlBf/zVWBR9oJmyPWn7mY
 q1L6Js73ASVgUTq0v6HoweSZfsvBD+ctB7RfOgTf19GvyLaNUFjcmTCG+rS7vjqwf9WLZc07ycD
 fdgapqxGe0LBynNsHEE1IVcC6gIzjCS5OmRssHpXFlLF/gnLPObnMIXE5FfM9LZ0sFhGipzUDg3
 iHkBJbmpZFWGYOqvnD81Rd4ZrorpHc+iuQdaBkVA8fFN3wM7S7i0e+iRv7h/HFsaxTViYS0p
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cd443 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vRdO2_t4T5B777FPuRAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yskfBz15U5i6y93oh12cMBI5jefA1MI1
X-Proofpoint-GUID: yskfBz15U5i6y93oh12cMBI5jefA1MI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080138

On Thu, May 08, 2025 at 09:07:03PM +0530, Mukesh Ojha wrote:
> On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> > > Add the subpartfeature offset field to the socinfo structure
> > > which came for version 21 of socinfo structure.
> > > 
> > > Subpart_feat_offset is subpart like camera, display, etc.,
> > > and its internal feature available on a bin.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > >  - Added debugfs entry and described more about the field in commit.
> > > 
> > >  drivers/soc/qcom/socinfo.c       | 6 ++++++
> > >  include/linux/soc/qcom/socinfo.h | 2 ++
> > >  2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > > index 5800ebf9ceea..bac1485f1b27 100644
> > > --- a/drivers/soc/qcom/socinfo.c
> > > +++ b/drivers/soc/qcom/socinfo.c
> > > @@ -154,6 +154,7 @@ struct socinfo_params {
> > >  	u32 boot_cluster;
> > >  	u32 boot_core;
> > >  	u32 raw_package_type;
> > > +	u32 nsubpart_feat_array_offset;
> > >  };
> > >  
> > >  struct smem_image_version {
> > > @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
> > >  			   &qcom_socinfo->info.fmt);
> > >  
> > >  	switch (qcom_socinfo->info.fmt) {
> > > +	case SOCINFO_VERSION(0, 21):
> > > +		qcom_socinfo->info.nsubpart_feat_array_offset =
> > > +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> > > +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> > > +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
> > 
> > An offset into what? If this provides additional data, then the data
> > should be visible in the debugfs. Not sure, what's the point in dumping
> > the offset here.
> 
> offset into info(struct socinfo) object.
> 
> I agree to you and I said the same in first version this is just offset
> and does not provide any debug info we would look from userspace.  For
> parity with other fields I did it for all newly added fields.
> I have dropped it in latest patch.

I'd rather see the decoded structure that is being pointed by this
offset.

-- 
With best wishes
Dmitry
