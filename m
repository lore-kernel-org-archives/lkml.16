Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB720D500
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231902; cv=none; b=NlMWjKevX2ek4yz4aEW0HGw7vwKb9YHajoQir/zJI3f/ZppLhgJ51xnwaGYDW079fZQ1oo1VS/vDv1sEnfei3T39r/+SeJVD+UNZsv7Asd24zTK3JMF9VSOP1rJ7mc5FoPPgWYY9zt4lBTBwLEwhQa2QPpS/+aEHj8mtTll74Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231902; c=relaxed/simple;
	bh=QHaPZuunfEL/BpuzNrYBwWhaKnockJX6CUDjOyAHmZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN2GM1+2emhKm6jVeMqtT/jxEHjhvnARDrufRMjSw7fRTw5TUGBhN3lm7leMnFOq1gMTqM9C7egZ0QiyHtuDxT0cl9qBsFQ5uhiOcCEjislLkDMu016AhTgt+Cnpy4mjdoswb0pF4SXZPP9RiyKCkHD7ApA0xWhKTXe0GJOpIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZEO4fjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZEO4fjE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNM3Q8006133
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=; b=NZEO4fjE/Qd8/mpU
	y0f1EkTCGoOWVGQ6vBo1IJqhucb+LQzGBFNZhruo/s6P/qmOF2ajSrWJ5jBqJcjC
	RZ3bdE/skeTsAKONIF8vQT7wzBW/+Y2wRYbz5MO+4ib9ZBTfdqw+j+ctgbUrgTUy
	GLbaP7jVGRbn37AEeEvQUleKRzf6AGsw7c56Tp5FsPCbftkteLiIBViQRaWr5YgV
	nHDZ4Vn/GhOyk91uTRSz1hSID6V8e81Juu5ROH1jxYnvyAdUFrFWBdJ/NCP45GoB
	0tBSV8LDYGnbln9oiTL7hWDx7VBxVGRzjOydepbrBZD7tbhoeGewCgX6YrCGd8XS
	kOsp7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svbxfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:38:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so319535085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745231898; x=1745836698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=;
        b=QzZXmnwpPO3lrWWoOwXPJgARwPu299SpMmlJPfvGBsiv2ltm72XCJ/HdLuB/ZG8fur
         LnVVqtWethqRDIHtlHl1rNlWnpTe4ZRQ+hYHrv8VOQ5F7ERCsMmWE4jwMp7xlVLCJht3
         8wwWJ86exwM4bOCbGxce7Em2uaJX0sq7DU6NrBcznFtcMomVFapU2pvWLVNKJ3mrqe0f
         cEpSv5gwd0099eut4Yv6FimRgs0vG2UJ9iaIyv2ocTau4jcoJ+9gQJptE1eK8Ksf+ZHI
         bYxlgG6ljByKJemGk0EvoXoZ4J5znb+tju26zGEWh2VQ+xBAiZ3vM/w6smaIyXxyoItk
         fmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0YuTzjHU5e2xzqXrIWuAeOegzk8bOEhGNVzuIYEZVuFVTI16ikZMcjiOeqjnhb0eHjIMzgH0xjhBxiCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQjQnacCspmPrNXfZf26GMy7F3zq7MmjQ3DnVweP+m6altkQQO
	0Sn/R7AAzNr+6syj5aGRtOdbQeot29JNWdfEvPJhZlPh8H96FtN2tREnSpQyOb9mBPUt1dmW0ia
	+RuD91KuaJJm9b0sIjT/oVhFkBqRkaK2Bkqsc1nix6ZaZqsX1KG29WQPGBVXvlvI=
X-Gm-Gg: ASbGncvaohCKFO+VUoZixTH1ruNKEEX2si/d50iyp1MAR/yn13J1gelanlQ22mlCtu3
	pqGgwEux4aMxP3cKp7DTH405nKw4WWeNfoB9ATu4jImXg0HCYokx7qFVXZNNUS9MX065wxqNPJL
	VdMtZGFKPk0p5FVPb78T2w5G7/jtZIMqNx8QOkAGgeYcruJ1+hT6/gkA7u/NHW1SM7rbx0ZRK9/
	fU+ohZ1Romj473VYUKm4ilxUPt4TMeHEo9K6KTun5L95+mgNDKPfEXCfPkBp8YUEvl3Awm2vEhP
	uWSJzKNoEYP7ollZs7+/7He41mJQxZRFlHS1R+lf9nnBFIj/pNbZ8VX0Zig401u8Ydy6EMuxxPo
	=
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977322485a.45.1745231897657;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqPUXrAc6wUNlI+xH5WJujuF+vftFUpOnZDrS8FepNMUuNFAq0kE7F9gbhkQeBqGJT7gvqbw==
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977319285a.45.1745231897191;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e536c2bsm890524e87.31.2025.04.21.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:38:16 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:38:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Message-ID: <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
X-Proofpoint-GUID: aw9_SkOloGGVNp1pvs9waTEHjRBQOpId
X-Proofpoint-ORIG-GUID: aw9_SkOloGGVNp1pvs9waTEHjRBQOpId
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6806201b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=_T3S15piZknK-H0ZweEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210082

On Mon, Apr 21, 2025 at 04:04:16AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.

Why? What is the rationale?

> 
> Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b78e209861c23d934e1b9fd743606..e552a9af578e48cfd854a228a4d91e4fa04bf29d 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
>  	edge->mbox_client.knows_txdone = true;
>  	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>  	if (IS_ERR(edge->mbox_chan)) {
> -		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
> +		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
>  			ret = PTR_ERR(edge->mbox_chan);
>  			goto put_node;
>  		}
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
