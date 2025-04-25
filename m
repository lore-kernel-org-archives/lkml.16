Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D71F8BCB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602182; cv=none; b=WxCBKy4a4x9SN5t5IJFQXo1YiC7uvPPFiiELkpyr+fDHGlSfhpbKcEOMkWAl2xkRA7Jv9J+ocndztmB2jpSnBJ7AS5sQDEe4xC5qb8DCDNAzPZsLHrD6G5hPerQXOehqPYig8x3VL9WsU4GHGSY6BpIBjdG9h4TnfRfEsGGESnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602182; c=relaxed/simple;
	bh=UXBn5EKDEcylQ3JvkMKEMbRtvwMjr4YFKPUwt6mIqCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCJPVrnFBXLomArMQBwEGOLmPeSoLyamu6Yv1j8Awgy1t4eh1W1TBEweipxaa/gtajZhLbXXrNBXlbpibq35F2Z2J50B7WoLxe/V5x/gRX6aCdl31faobx2V8r9BbqavjCqYm5RNGzdLplnNRUxlWVqTReprZ7rtubEox7KDQGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtqHv9R9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtqHv9R9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJu7E001348
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1I3Mn6qvcpM5bV5KzICKpYfI
	XWtjURj6RGv9EIv6etk=; b=gtqHv9R99Zk4v0XenWDKf/Aqlp2I3wQQP5GkBrMa
	e0Eq6LutVOng/k/2a/e9Yymk7iZl3hi080TwHm/KD4haNn9QH0/+O42y7R+1IDeZ
	6PiJLX6ItoZ6yEp3p3H5JVOjzLWqgMUv9H4XPQHDNHcpNJKASiinS4fQv9VeMwaI
	CBK8HssSui6KjTktWFtEfvJkfRCr38Kl7FN+BgmhS3OZg1d6dO37m9YA5anCIat+
	jDCIv0A6DdLnKwsirpfuY4FwxCCZ72FsqZPx1e94vaGOhcbJ/P8Fj//k6eXap01B
	uWOk9g1nikEksKDiL3lXrNUaAH1/0BT/Da72Yjmsy/4A1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3huja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so508276585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602178; x=1746206978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I3Mn6qvcpM5bV5KzICKpYfIXWtjURj6RGv9EIv6etk=;
        b=pHb3Is8m5/IHN75ZMME+obO/ANs58UwYPBnA20vXKuQXgIsRJBaTKKvkPXifNYJwgt
         g1xOr8lvhKLtx18wVVibw4LUweYZXB8N5WwJwaVAMlGSge9V4d7tI/tSknZewcDS4cJR
         tlNyIlo8zh1nWKVpxaDW3dcLb9r47IbBkWAJhVY1aeWdLH0aND/aI3N6HZUcot7WYcgM
         67wxgp46jOHFSf7UyrC7AISchsNVxoov6OOHDZ8tC0c3f5Il12hMeRw56h3vzXDJqHP0
         81GJQbTkgGvbsk8SsaPYOBEeEaClY2J7jd6gT/5SvobPCza3rBQnpQS0Ct28rvzf3fis
         +mdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3+4tIWic45wKt0hfRFytu3qLWKWnXf6Scw6HNWyr48GWcoxNUpTnriog78j16Xo3foOUeUPMTLAjxec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wW+BJoktgEpOLAfu31PxHy+dQzMl9h0wI7eZaGAsgnWMbcxr
	1o42NmzKpUA0UaKE066/ZZcWLWVUchz8HRlDmJoLIy1PwEvCph1jNx9QrVKfjNrzE8cuhYjJUnK
	UYflZ0B8dLLg3nxy0GFXup4nTu5bCYGYU5RuybbQwcE1djzuT7YQqIOmrqkTmKXk=
X-Gm-Gg: ASbGncst67PUTKRCpQ4NXEhWo+CHTIMXwyst/BNwAd2RhrtL64Xw9Vd6ipUUrWY8zOp
	G/ccbjpRm4FyegDJNZFbPbpaGZEEGi+FhOVHF6SkKN+eew9bN0r3me+ANcli7mgJ8ihZZ+fby6n
	qAu3Pr6WZCHarPul5CPjr4q6NQ3M1hIKoDJPs1OGy2mj+6Lm1OxqXaHyzRn5wzURajbW2zjyMli
	aUmHEtI2DV77GFAO2Mwgr2AMQZ6uVw0/bjFqTNF9zIcVUDdw+FPeQCYsFDOl1PXmjFxAjObtN3U
	5TjfA9zi4QxbTN5Ggok6J+XVccWYXMysOujmZrglcm7zQh/CyIO0nEa8u/Dd9WNfd3ppXAbrylY
	=
X-Received: by 2002:a05:620a:2b8e:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c9607cfbc1mr587858985a.52.1745602177902;
        Fri, 25 Apr 2025 10:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLeqfY0EODr6yyjD1N0AwEtnVsrJuvizRria8y8RjiZAy1KPkjGP/p+VwiY9/KyGUT7aGNTA==
X-Received: by 2002:a05:620a:2b8e:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c9607cfbc1mr587855485a.52.1745602177613;
        Fri, 25 Apr 2025 10:29:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3d948sm681707e87.99.2025.04.25.10.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:29:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:29:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <oxemmzhfy4cnv7nlsdzbyijwceqzu5beefkqbezu2apwypfgoz@ihd67ny2e27v>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX58P7ejNIQXgv PLidWmb5gw/nUudoC6H4AmLR4ILQyaLdD9emmHlMtAFikZFKb9GdCXAcn8Ki6sWHV0fTWTfoFs0 uF201NlIuEu5jYZ2pyR0snW7/HzNA2aNmAMXiZxLCH6x9h3K4CTXlnRNZ46fn9161x26wYPHaWi
 NjkaEhKk8qvFRRcglYgn8MH4RpWPvrfiSEnonxYT5mpLXpQzHjR6M5umEIgQJwh9sihlrJ9TqJu jwpOnFH3qnem+qX1jhbGBialGvl7+nnvZ95jBQnTRwh/jaDMYiKr+JZ9hSN5Nx2XYAGy9+0R818 eoKmJZBkvo+YdP3tz0hxAjqPCMZIDhpyGfgZYY0zs0lL/WUlTzeUkHwK4Iq4F8vp9tXrjcY2f2F
 xXvfD680IqaCwap2yUJW0bhYXiF3wO1vYtsOO94kqbDc3hn7tVJGziTekB+s4U9zkvZT8M3+
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bc683 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ufNsiQDimQ8jVCMmRIFW5MNqWQlfb7E5
X-Proofpoint-GUID: ufNsiQDimQ8jVCMmRIFW5MNqWQlfb7E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:44PM +0530, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry and described more about the field in commit
>    text.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
