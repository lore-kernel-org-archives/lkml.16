Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD81F542A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751089884; cv=none; b=MVaEQTZhk6wxU34UuKv4KUObn6Hh5vyAL/YzbHnaFIdgt9Vu18N1fxZDhyHrFIhZG3YR6L1eKiNUrK7dWHJbXlUIOeRgkcQ5zOy4/4XU/fWNEXwGIpo3YiZV8/LviOlxMatsDyI7PSpn2TsL6/BbTdZilmRzpJyzUsj8qrOhcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751089884; c=relaxed/simple;
	bh=RNhJKBVlAnROc7YSSE3iH1MaSIGPa6O5wdBUZKA3RYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJJs1yi1AwhsshbxwfeBmXOYyrqanzl3ktdhIfph6SVGLAoBcV85PGLLG6TM8tX463ZrNnnVNc6z1/90hCjplZjNZ2WesXixJenOqoA8oHLHlQnGwnLa9fFabEzReuCz3z5nnWRHHfJOzUH/SGSUa/232IYKkuakvMk1LYPPPUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTbdW4Lo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTbdW4Lo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S3QtTQ029157
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 05:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=; b=XTbdW4LoxUKKcDaU
	26Wb5l2fUjqIpBg+fZ/yA0XeZnqUj7U/PdGjOzHd/auCtAfe4TW9wdWMuTwIAFbs
	jAlfHcRxZu52HrSXBbkp0x5GnVk8FAlDkpAbx5v8+2EIEHl3Qa9vJIPI5NxcHHep
	WWKBU3+THygDYkf/6kMEr8FH24VH1GjAiKzh5UIG0YjH5b13Oc9VwtrAGReVpekS
	P3Q3nUEcZGY/1//W5ICr7i2ZAiY7g7cHRYLN8JoWAX7mUomUG19CWGgw8rYpP9Os
	9HygZAesQmAeF6Uewnlmcfk0lo8wEi6QGuOHoZKCOWX7NUBkns6pWzTDhIl55zmJ
	1CcpJA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fx85aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 05:51:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso48181046d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751089881; x=1751694681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=;
        b=PCKDMawdJ6rbF+9tz/c0SJ7/BuETbFYiIIX7pfBCKNHAPa8XrDJV/CM8gBx3JiYDFn
         vemtRvDlLerlTBnYijwqSv2E7F40WPDKFCwctETkcOLlm4pHvGkcVjrAxOl+RYKAcWcG
         kEtcYZUfwhSkyGXR5Ll6t6y1xLyghlktP+Ho+jpyFaGK5kC2DKfK8sRK17cUClfyEUZx
         xT9yDB8gEujJwJvOrX2OtlwMFlwwI1RHHr08YHxHulNQUmpAsSWt00PBiHscL3DC4GwA
         wFYWNcHGL5WHTPhPPRqfP2KpV44sUls0AxmtDa41dXOudfSiW1gTpXghMVRCKkfuePPc
         xkzw==
X-Forwarded-Encrypted: i=1; AJvYcCXE1c3Mi3Sz9VcONoqIplBTH3zMdqQz3LvoiKilv5pAkgA7yN8F9Sfcpl8GBCEPrMY+Nh26FlsFdT5Uvuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywktd1raKJA3zly1E6QUf+SV/6pD4OiVUwjbWMkZaqieJKmi3p+
	hDNqvFFtM1oDMbPwODNGOaH/PuppZvkQmNQjBCVvWk0bdfKQC3bfGa2sg7dBEjOO8H9Lwd8Hns8
	0t1KMeX+RWXLep6JCBhUtMErLtxr3nuCfYF0hIMt7E+eE5pt/cWQyDHiySuaI+KkK0WQ=
X-Gm-Gg: ASbGnct6TX9r5V6kO5P/oHqslNgHozg35HPmeSmk8Fs1xz+h5H7efNrBdDNahfz7lf6
	UoxYj05GOO1buZ5y6Ct7NBuwjC8MG3ZaN8sW4YhIgE7oQtbNMOZMtP27gVgqIQ9AOhirOTozyku
	9Air0MKErq+3+vR4ft5e0kEcY0YLDcfkL7Jm+F/3a9t0gWWuCfPd4pvYthOIs9g4a0ioZzlUfVI
	RjdoNQ8UDO0Hj078G4+1kkZPMDVqyjIyB0AsilM1DHSgZbrFcd/V8CI+lydiAnCxp/GrtrH5uyk
	e6a7ebEnXt8iWerMWFX8+z5GOuKLjYrTAlMKxjRGtOt9mwvJNlxvAZoVaVxQdBgjEhjVnR6gpW+
	C0E6CyMLf7UyyBmSGKFG0GNaWa35N9iYeMxg=
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d4439179bcmr808812985a.16.1751089880573;
        Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9AFefwJW2wB1sxHCz4/FNU0tIQt/Hnx2l8Xmrunk9knE/K7hKL3txF/JewtO3UUcwRL43Pw==
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d4439179bcmr808810685a.16.1751089880182;
        Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee7365sm7060231fa.77.2025.06.27.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:51:19 -0700 (PDT)
Date: Sat, 28 Jun 2025 08:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <iwultq2bufhlj4tbtzs34ubb43jagw2anwei7yjjqmw5hlg7in@mur3oixqejlh>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
 <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
 <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA0NiBTYWx0ZWRfX5pMrB0mgoouS
 BPbPZUPtufSEJ4IuF2ELoU/0VEK9IfAdAeSBEQeGT5XPA408uM2OGHc6hyWK85bkEK+SDpv5U4F
 Ct5DZYDCnin7Xr4O6Otxq6FOnvSSDHo2jwUsf3An90Mb+hvjt27OHFQ+kb12s8lubbT2cJDF5Hh
 DZb7XfrPn+f2kPJM1EIQgikgdTSvRHi/Xvbb+Lfu6s1xEt6UjHQaI3c6l7RBZVEhZA5jQ+6tpbi
 350gn7331m+AwrrO+TOVywj++vudJoN/dUPgnt9+yvNdIdCv81G0uSoslkhJnM31Pu9o7+RjGZF
 n4HZqS+KPlJo7iNtmu05x3gmM1ras8Xfe5ogTd3fd3/+ThuUaHOiuoPd9ZzHSB8dx4KOz9qidh4
 h3oowlScUGFDGnMbK4mu6+ZmkjoPh3NrUxIyWL3vzmlsylSoBxpvEldvuEf+KGtx9prnpjzP
X-Proofpoint-GUID: L3C3hc9MNFG8TYITS6a42cVy_tReQ3RG
X-Proofpoint-ORIG-GUID: L3C3hc9MNFG8TYITS6a42cVy_tReQ3RG
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=685f82d9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=nvhyJCiy9YraiqoQAlcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280046

On Tue, Jun 24, 2025 at 01:58:47PM +0800, Ling Xu wrote:
> 在 6/23/2025 6:28 PM, Konrad Dybcio 写道:
> > On 6/22/25 3:38 PM, Ling Xu wrote:
> >> The fastrpc driver has support for 5 types of remoteprocs. There are
> >> some products which support GDSP remoteprocs. Add changes to support
> >> GDSP remoteprocs.
> > 
> > Commit messages saying "add changes to support xyz" often indicate
> > the problem or the non-obvious solution is not properly described
> > (which is the case here as well)
> > 
> > [...]
> > 
> 
> Okay, I will change to
> "Add related domain IDS to support GDSP remoteprocs."
> 
> >> +static int fastrpc_get_domain_id(const char *domain)
> >> +{
> >> +	if (strncmp(domain, "adsp", 4) == 0)
> > 
> > if (!strncmp(...)) is the common syntax, although it's obviously
> > not functionally different
> > 
> >> +		return ADSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "cdsp", 4) == 0)
> >> +		return CDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "mdsp", 4) == 0)
> >> +		return MDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "sdsp", 4) == 0)
> >> +		return SDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "gdsp", 4) == 0)
> >> +		return GDSP_DOMAIN_ID;
> > 
> > FWIW, other places call it G*P*DSP
> > 
> In fastrpc, we call it GDSP to match dsp side.
> because in device,the related path for gdsp images are gdsp and gdsp0.
> > [...]
> > 
> >> --- a/include/uapi/misc/fastrpc.h
> >> +++ b/include/uapi/misc/fastrpc.h
> >> @@ -18,6 +18,14 @@
> >>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> >>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
> >>  
> >> +#define ADSP_DOMAIN_ID (0)
> >> +#define MDSP_DOMAIN_ID (1)
> >> +#define SDSP_DOMAIN_ID (2)
> >> +#define CDSP_DOMAIN_ID (3)
> >> +#define GDSP_DOMAIN_ID (4)
> >> +
> >> +#define FASTRPC_DOMAIN_MAX    4
> > 
> > What are these used for now?
> > 
> To get proper domain IDs for fastrpc_rpmsg_probe etc.

These seem to be driver-internal, so they don't need to be exposed to
userspace.

> >>  /**
> >>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
> >>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
> >> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
> >>  };
> >>  
> >>  struct fastrpc_ioctl_capability {
> >> -	__u32 domain;
> >>  	__u32 attribute_id;
> >>  	__u32 capability;   /* dsp capability */
> >> -	__u32 reserved[4];
> >> +	__u32 reserved[5];
> > 
> > This is an ABI break, as the data within structs is well, structured
> 
> this is suggested by Dmitry, I will have a discussion internally.

No, I didn't suggest to break the ABI. I suggested making the domain
field reserved.

> > 
> > Konrad
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry
