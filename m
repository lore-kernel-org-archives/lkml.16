Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9E818C011
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021262; cv=none; b=au2N5ZO9VjKOCYDSjVHt66BwmydwEoiheiSgZ+NQlA70Q0rOjm6+4QBDL7L78sBs4EZo/kU87+2noeIBJ6DS6Ttd6+cWHM6iUwHVjpLgZBUmdVsnsBEZ5VNB6sEXzwiOeka/ISWUwAo7kAV37RIFR06DR7uwiRiCvjpK8vswOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021262; c=relaxed/simple;
	bh=UX9OZhcnhcNzoqUQz9+KX55OzNsT07DmDs9dne+IrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFKRLN6Ihw7V+l+clqT7cldUx45ARVLpirwmEQOeAyKtK5LFeYJOMSha+VGkwU5Vx0X9wiBqVeXN3O3cJJ7OedQiTPR1FJUNOTlhp7beM6q1XLgQMPCMmk5RJ1X7W00vnACdA0s62+hax9YEwaYzhepYTD1D9EU2g2jel7qfFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cI6R9VFS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cI6R9VFS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCXuvF001325
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BVf8E7Hm0j7X/OZWTJXCmK0q
	4KOUyKl7xvwHfOg/+ZQ=; b=cI6R9VFS7p77NVjciGQsr62WTLBi9NhIpbe/t49O
	6RWfC2bamhuC3sE1aIxspGBb5vTebhyUmrkLdQuiaHnCn9Dq0e2E6GMD3VDXwsjJ
	6M7KsuNwcHDN8NUzFZI5o5rx10e4xoexn08LpLdHMOnr+N8q+MExfGPmpD3For5w
	duqCE5PKoPvehCiMl2vEEWmYd6Up3SMPMWPcHX5yZaVzv2qRAM3vX418qko7tWF9
	tv70jVPjAMRzssTadWp7j44WOKB84PuErxYTm128i6lRiTTLo1JZVApNgNbgOYdJ
	oEtp/ft4hpajzDcrd6Beae7kZCNDtvLSDTtOxZd++2oqJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts2r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:27:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so11452085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021259; x=1748626059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVf8E7Hm0j7X/OZWTJXCmK0q4KOUyKl7xvwHfOg/+ZQ=;
        b=S24b9GecB1yR04soNDDTizht7VJPdv73YYsUMtw9KbhTun5TBSGhKyzxDrLVPU09Mw
         O7GrgEkpKggmIW5q/t5K3q7ExMOyxyPtoqF73D4sxpdkImsc/kRs0e8zSshhmzV2oceM
         HKQgyNE1f2YvEOqAovRkgDtNx1Py2b6PTCvJgJBGuTYhut2KHDPRvvkoBSBg/4LsOUFX
         nSLNi4Ko10vugR0lEnyVmGKBz0AWhhdsn5zIX2Sb6YShcTRP4M4pbb8Lx7sg+vNx/nUZ
         8cUi9oqGE+Ep0ScDT91hIOAZxeQ1606XbSs9HarDFNrN0Pg+aqxMSXMhyg8g2DB/32h6
         Ptbw==
X-Forwarded-Encrypted: i=1; AJvYcCVO9vYlva45VMlxYsg2jSWxqX4HMJnqnd/woFUHgFrJ/ZtBYDOxXHMVixnDkGVgEltFEHr9M+8VMYSulFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRmgTQoqPWh3nFd03ktpP7Up/IicXhXaQBsf3J4cMclwsaa+Z
	CxMyNSRjX3BM5r/YfYIwQiY2FzjSSBf2m6dqkp5pTKB2xqr39CprzeDYjX2TSBto4RPHeu5Uwit
	ITiHXaYGJn8QeS6o+lN+9xmBOhWa5eWJtRnYIUe4dZIGoNpmjOwnw7XMhY2NHs0ge8Lw=
X-Gm-Gg: ASbGncvsoiy9fq0C3Pdkqc6NnL4bvd/Gz70aldvDqNLjOEeV6ZOZYUJamuQu5+quGGD
	EUYuxignZ5WrYKIYpwlyZiZO0riFHcc528CERSsSguvcleYM1Sq+vTf8/FY5576Ei/p/MaOXRgA
	o9T7WrhtIQ5vX2yoBsDEZmsL7aVk83c6RJZ/RgT9O761+nlolhogVi8n9tvnK1lfjm/SuT8Wnef
	stKk4Tes9Cacp8kwuGPcYVB/LkX1kBNscS6ykUSP+njrYOQZ01Jqs07DD2vtdqXPU5bWRNSz1eQ
	q/UqMzSIjBj7fE6Z8dASV0Cp4HVoMsThN+UG917zNRNzGlFVICDvyKOS19RMMwZdflzoSr48y5g
	=
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10150885a.21.1748021258978;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4v4FFYt2KJcqNPAHKwwKQS5uP0VM4a7TB6GLuNQGEXytudQve/yAzT3dTU2seJ6C3/uT+A==
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10147185a.21.1748021258637;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280d820443sm35986171fa.7.2025.05.23.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:27:37 -0700 (PDT)
Date: Fri, 23 May 2025 20:27:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
Message-ID: <wbpucxl3kf7kmob6bbhexivtgrsn5ehgh7zfuebx2vxjcg46ws@gfhdgi7yd24o>
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830b00b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZT9l893yBoyBf-nb0IA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: igz0J24WqtMLNYU020DmCiNy8KMkEjVN
X-Proofpoint-GUID: igz0J24WqtMLNYU020DmCiNy8KMkEjVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfXwqudnM2dZUWW
 NAP7gFTjLBCKXQO9X7xZp6Qrt3IWzt5xE+p3hSMBoii125b0tE1eN3DGpii5dz6ve0G87O3rxky
 AZokzah3RHGWqoJBvr7mCsEqxRtz4zv7YOQZH1ZUwqXHfYwUjQ078IRvkNkCz8RhiB7rFhYR5fh
 j9v51GgJeogmJUw6vai2CdcGFJQdZZLqAUYM5cENyJfEUZG3i2fr/dILhhvV14Up4elJzqc8AYg
 5uU1bbWS6MXpoBYsHvLEKsY755syt4HQzj8eDdr8RiQZEA5eIa+54Nck0Bt7ysxbNG2dqkiPfEs
 tCWMrdj6vxwHNLpL9SSmayIv7PNpJ0Da4EVRp9vBvwDKSIYvmnfU1XyCHejAyMXAZos2ZHLszz+
 n9vJwvUm1Tt4vA1M82nWC/6w0UasCsUY3Z6f+Dvzhc0Isv8knTsp8MGvNTduxpJnqrGYHEnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230159

On Fri, May 23, 2025 at 10:53:17AM +0200, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
