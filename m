Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9B270569
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785177; cv=none; b=LkuKWXjyFD0ixHHY8mfU9LSslBOCkUr5usVNVDM1TCPEnd87rPEQJJ6nPJfzvhYzd/bZUMBuCxk1bKITryg4M8cL7shCijRq9PkIxPOrKXtP2LT0l4ZRCWkylXbSEiKrjte/zPiq4lAbvtdw12Au4+c4A0yAwlBxF7NdxlBCOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785177; c=relaxed/simple;
	bh=2iPVjI2JMMIkbC1wnE7KPfvysHeq4yjharWuJvAZfag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDPK7I6fWub5atQHb8ZPVKhno7Znyzve9BW3K/2zyIhu+IY8O9huQgOBG39ElGClnBx20HmUaPRHiCrC3CWw1ybWoOqi14h3GOMuY2lP5lvjhmWsBBcz2MkFMJH+kgcj7GOUkaF+CCSGpu+64Nce5z7Pm3yncEnZhDmT4HpdYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjixQ+So; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjixQ+So"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493Cxfq010634
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 10:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9cgawicPr1IJlvTgmxtP8ZjX
	/oSYhm5D5Bhw/WPNgnY=; b=fjixQ+SohhpU5xvwQ7b6p1QxRNmFZkkH4gIpJLd3
	vFbL1v3h2xAQdTBUBm+QHehE9uu9//9qGSRke2/HUHHqap6Vdqqx4AhjbcAkUm3h
	H/TPPj3OTrz3uXIxtUy5rVdJjS3vnI9ZnMpZoM/LGq3A7oUJOyWjSbzIo0Agr1yI
	1k8XI0wq9dDDdwRr/RAMONltIb4TwL0uNTb/BpPaobtACpREjK+vpeGilox2e3po
	gL6DIzdXkEsu13NnvpM6PTUZVGeZzHKOC49fMp2Wb2p5lEw4Eo+yapfbljaWElIK
	gNtmgYkqL3onNQ79Dou3EeQ46bn2SoriHMIyGoRJR2TAcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmm87a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:06:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-309e8dc1e21so2967240a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746785173; x=1747389973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cgawicPr1IJlvTgmxtP8ZjX/oSYhm5D5Bhw/WPNgnY=;
        b=gy+8mUdOWLLD3Q9dWvqeNRA5QWxT2xl1sEVB8gDSKLUGuNH1yRP2hyulEmC3rKyrlZ
         oXk+SePZ7NPEMb56AMaUvIyfwIo5e8XbET//XLtRwV3RwYL65CccAvynoI7ifeUiOKGU
         lR/f86hYVmoC0SNJ9HbEdPn/ydLczuuPK/NVxr2fuejI3Iw2OOOGT7dbhYkt7vrks9Op
         AoVDu0dXkgMB8kUl6+zA9t/8m7+ff9yEwQo5pkTk1Tx9gikvUe5UiDVPeaiWqOlJpbye
         zUqgECtTrk+RjmnZVPq7h89StO4KaXGaosdcg+GQLxZhfZ12lKyewOQSLyJ+FW79YIkN
         2JoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnQ+apM7SglVcofdPdu3Fp89QYwcHxaC+5KGD50sW4+sHivK0DTNmDpZ/SyE3faeQDpg93dKc6hwlLHis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD19BSDrCQd+97u8kFPrm218qV/24mh3PASw7DsmiphsrFc04/
	LWqgzx7Ik3EzVnK75bK96sZkMheWZk96ES/+nL6wwQflmDgshlyEVh6Cvsda9oklfmTOT/T/LoY
	FAuWvIZTlcAAQAgTT3+r2R7hucF8aFh8qchJDIO6RRkWuQpQmp88Awnp55g1BPJM=
X-Gm-Gg: ASbGncuCr6tm6f6ra757CHWz2rW9h5GKkYj0O7teS1MLuo3ATC1aCes96eVdRXNATCt
	NdZMGVjtl9KueQdVjSYonziYVlKaMYUmaU1OoGroHpdMmzCvkwujsK+gWZGO+obKbDT+JEaC3wD
	0169akCk5WMlmBFZYLWbtjzt7zbFmCP2tlyyBDihTNkq6ExHljh7r/s0dHYxIDUaqMcXvE5eJCK
	0RYJzUqRfjwsdaK/GlIQu1yYkTgk5VqHf6dFgETp1XpYCbP9yxOALdPhsJUYOjqR43bZVdB4HT/
	n6KwDHgAMFUsiKoLE8gvZULZQCAWKAqimdeY2A0=
X-Received: by 2002:a17:90b:2f84:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30c4011c2camr4315700a91.15.1746785173075;
        Fri, 09 May 2025 03:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH250FvnpxbtXSQ21p4lHFBiXq38OwV7gXcJ61cEP5I646CZCVB3NJnb8uIcgxLhmeXhtmW3g==
X-Received: by 2002:a17:90b:2f84:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30c4011c2camr4315670a91.15.1746785172607;
        Fri, 09 May 2025 03:06:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e760acsm1458746a91.47.2025.05.09.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:06:12 -0700 (PDT)
Date: Fri, 9 May 2025 15:36:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
 <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
 <s5fd3txerbwgzzgqnoovkffmijgub5dxfucqqskhdqyjqzkbyl@5cyycrfmubup>
 <aBzgaKSspA0Af0sZ@hu-mojha-hyd.qualcomm.com>
 <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681dd396 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=n4EBUbhx65UTRA3-c0oA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wZDZNGZnptwtfId4uLE_V_FxocrPXFcT
X-Proofpoint-GUID: wZDZNGZnptwtfId4uLE_V_FxocrPXFcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5NiBTYWx0ZWRfX2V9plUUuSZCe
 NkaZSV40+R5zXqgVOxcxtiI6avM6Y/cKmu6sdLNuHVWk/sep9cmJ8Cbs/a4okcOPr8gQgKYuSVA
 G5xF0Jh8h2lm6fo5nJ/wNWsL2ooQxcgB4WX/ll3wuF92pFaIurKa4tjWWgd25b0QhdEW2LrI1yN
 3lG/qEC2+xxzZHGHVKNjxhbvGuoA5be3oOqo7IVdoxwoAPXtnykEVewBQELUDp5x62ki+cg1oUr
 E6it57p+sVWEQ0aqW8lOhag2VJLLKHFlANq7f0pIrs2CDVwUVSPihoXxBR8pTT48z+vMdhgVV6V
 0JE2W2H/+2Xzkt70nmOfawW3uoDlG5/ZNIwYY3hQl889O4t2yuTbQuh1++gX25m5OlF31iUz4j6
 JfDd2jCRrxHy5iPQSWJNNLyQa50oOdB/GEiu4z6JBv0Iy7nfL1Qd9hAJJFUvoZLrnVfTrDQ/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090096

On Thu, May 08, 2025 at 08:01:44PM +0200, Konrad Dybcio wrote:
> On 5/8/25 6:48 PM, Mukesh Ojha wrote:
> > On Thu, May 08, 2025 at 06:56:47PM +0300, Dmitry Baryshkov wrote:
> >> On Thu, May 08, 2025 at 09:07:03PM +0530, Mukesh Ojha wrote:
> >>> On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
> >>>> On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> >>>>> Add the subpartfeature offset field to the socinfo structure
> >>>>> which came for version 21 of socinfo structure.
> >>>>>
> >>>>> Subpart_feat_offset is subpart like camera, display, etc.,
> >>>>> and its internal feature available on a bin.
> >>>>>
> >>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>>  - Added debugfs entry and described more about the field in commit.
> >>>>>
> >>>>>  drivers/soc/qcom/socinfo.c       | 6 ++++++
> >>>>>  include/linux/soc/qcom/socinfo.h | 2 ++
> >>>>>  2 files changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> >>>>> index 5800ebf9ceea..bac1485f1b27 100644
> >>>>> --- a/drivers/soc/qcom/socinfo.c
> >>>>> +++ b/drivers/soc/qcom/socinfo.c
> >>>>> @@ -154,6 +154,7 @@ struct socinfo_params {
> >>>>>  	u32 boot_cluster;
> >>>>>  	u32 boot_core;
> >>>>>  	u32 raw_package_type;
> >>>>> +	u32 nsubpart_feat_array_offset;
> >>>>>  };
> >>>>>  
> >>>>>  struct smem_image_version {
> >>>>> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
> >>>>>  			   &qcom_socinfo->info.fmt);
> >>>>>  
> >>>>>  	switch (qcom_socinfo->info.fmt) {
> >>>>> +	case SOCINFO_VERSION(0, 21):
> >>>>> +		qcom_socinfo->info.nsubpart_feat_array_offset =
> >>>>> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> >>>>> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> >>>>> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
> >>>>
> >>>> An offset into what? If this provides additional data, then the data
> >>>> should be visible in the debugfs. Not sure, what's the point in dumping
> >>>> the offset here.
> >>>
> >>> offset into info(struct socinfo) object.
> >>>
> >>> I agree to you and I said the same in first version this is just offset
> >>> and does not provide any debug info we would look from userspace.  For
> >>> parity with other fields I did it for all newly added fields.
> >>> I have dropped it in latest patch.
> >>
> >> I'd rather see the decoded structure that is being pointed by this
> >> offset.
> > 
> > You mean info + info->nsubpart_feat_array_offset ? 
> > 
> > There is more to it which I don't want to mention as they are not
> > upstreamed yet and unrelated to this change.
> > 
> > data = info + (offset + (part * sizeof(u32)));
> > 
> > e.g., Here, part is a enum represents camera, display etc., and data
> > represents their feature presents. Since, part is not upstream yet I
> > don't feel we should expose this information to debugfs. We could always
> > add them in debugfs when such things are standardized and upstreamed.
> 
> That's what Dmitry's saying - just add support for them

We definitely add support for this in the future.  In the meantime, does
the absence of the support prevent this socinfo field from being merged?
Without it, there could be inconsistencies between the boot firmware and
Linux for the SM8750 platform.

-Mukesh

> 
> Konrad
