Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5741E5206
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313538; cv=none; b=hVm6/xxuW7ijkqB/MZHA+cq9gi0u5uHmSkZrO06uj1MjBFYbs40q9r/gGqwflhVYzwjLddTysYlEqyf2ehhxWJc9HIkxLW7I/rlHDD/aI3+jJ0jt8nnrGcokmxUFPcrr9scQWc+MonyJvQxIMAseojitV2cmzWhmz6Y8IijHRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313538; c=relaxed/simple;
	bh=rz9Tzr+vZlT+glj40N3g9qTGSp8OJX+74pMLnslaq0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZDXHhgLf0cqr4/guT9reIoSfXa4Xyule45qX8f64W/ThZYIK46RpkHrQAuZE4MPxKD1oPVufbT+51rmqVTpkP/3CzZIrAninmfVa491PPv9OgNjbtPpm/ivXcrTHOdieTpJH6EmhN66Zi8qU8+tvA7yGLtR4FWo0Ej9xUPwBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3UBY8Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3UBY8Ky"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGDmJU000644
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8DC/ULaxKHJNAWyjnCUleasg
	vjglrf6X9u3PGKsISlg=; b=T3UBY8Kygit4NGggSoZNBrJdpQgE4LhTQkIRWHFg
	xkf6jgmejro++jMKsqaEqVLrD8EfcefvdfXt7R8CsTgQu0VIHgwP9XUVc0L/aD0/
	GvLDbuQnkZZABhrV4DRoLyVdlawi4+KUFMPLHJmLrlUXSf3EL2mzANiPQt+GA+n4
	TwNhCwG51Pr/BeuF7va1WmCZqvTsyoed8wgPzxbb0/DFWXJRqku1RIUjRZ25o++x
	1slSfFKEbagMFxOEB1akI0Iu3B9RLYzD1Re0XbPEgSjZKh9mu3Cbw/Xa44irJ6NQ
	a1R6iznbOzcM3g5eRr8sxxTZ6jMWnbbd+1hzo+ZktNZQXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd303pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:32:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so217208585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313535; x=1744918335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DC/ULaxKHJNAWyjnCUleasgvjglrf6X9u3PGKsISlg=;
        b=PpJQM/i5BfacStfFargjUZOP9bSBNgG4qLXy6NqItviPAffiL48yTHJe7AUOgmDQfH
         snvV2aa6cb2qXoU3aDBuEBvnAnQrZBsq0LT8qsaqbvtIzGkuPZXJywyiFr6N/MBVE5cd
         3v/IK0VVBToLdot6DvHKJZgVWyUPJpW5O/a53KFZ8FH/8Bj4yqM8mR1goGI5WyYGZk5X
         HVlsj0e6xc3gNIoK2OnatQhAKbT2uVMuQF+TkFIEwFJGO7ckVAGqQCVZMCUXPdNf4kSk
         dR5mfGp5kM4FtKcMLko7pF78wAjokoz27m6iJeW6exoJw5DnxXwYmoJjF272OzZ3+XKO
         fjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCfkIqyVweBy+o9D9kISbwX0ZYumQe3NSrqnSkzGt6mBIaAqP9L8pXVG17eDk1pbIrucJeSEVBdED7vKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0caTqjSqUBLuXqul8OwPeimBe4VXWGzaocxeKX6v6kB2qx45j
	X4ZSDxEP7muznTopCAWesHC50RjSjgM8YmJE3CSLYTJ0ajaZgjjZRrdpu5HRktSEvjxyKfKaki5
	jRb/rfR+DJRMr28/BiMeG4RHZX5OO8GrkimGEzBheeQ1qsBSj8bWOfBkt1JFXbUQ=
X-Gm-Gg: ASbGnctmy5nKMQPmuH9BKB657JmcrWTk0CM6F5yjrG6yuLGFXXubCTngbKZA+2Lj7Iy
	hpBr78NUdNt0vwHTm57Ul/DIDzBOSuNQ6Bx8QvowOWVzFmmY8RniZjWq0mKhV4B5c2iPc/dvm7Y
	6lI8T4qNeBT7Kzj7A23QKwmytYlGrH4mU/zxEylo42+W/NcLdh7Djh0U/WPTwi9si9f9yCdhyOU
	KcMzAhJd6En44Ox36VaLrZz9tWUJsBlTsjKMBVdJYXD3/y8CAg8XI8opi17mbdOrx1iD2MtzBuE
	7/2zqrXcDLbhFSkzl+vfrvJupcGrdVJKjcfN6CYUZ3A83sxkHW5fB/5BJqr6rpCn+hPO3+lyMMQ
	=
X-Received: by 2002:a05:620a:468c:b0:7c7:a5f5:61be with SMTP id af79cd13be357-7c7af0e2b87mr33265485a.32.1744313535711;
        Thu, 10 Apr 2025 12:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlVMlr0hl8Yh87KvoA7HWiOyYF1t30gdG7pSQ/S3ZJUQqhzyZ6eV3mA6i9O7Jrazwr8gRtA==
X-Received: by 2002:a05:620a:468c:b0:7c7:a5f5:61be with SMTP id af79cd13be357-7c7af0e2b87mr33261585a.32.1744313535330;
        Thu, 10 Apr 2025 12:32:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123259sm227317e87.15.2025.04.10.12.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:32:14 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:32:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
        simona.vetter@ffwll.ch, robdclark@gmail.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, lumag@kernel.org,
        quic_abhinavk@quicinc.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
Message-ID: <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409061543.311184-2-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: aOlpMurvSrP-0h-QrhdLelnynTYAyNqb
X-Proofpoint-GUID: aOlpMurvSrP-0h-QrhdLelnynTYAyNqb
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f81cc0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=Y-6xsq27O-P2zhJ8F8cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=640 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141

On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Use LLVM to build.

Why?

>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
