Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3529711A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019608; cv=none; b=hlKP3l4Zoa1lF9sGJ6Qq1k/IrKLmehXfgHXPDR3eE7WuoIJw36U5l0fqO+aufJRpNFVSrd941ZQ0lxev1Z1IE02JYuDUr+hm32RuWsQj+uetew8Ga83mxRbfbYImAQOsagw12cj/5nRnQAtR0VSyQe1RqI3vPgdCXxYTAzaBpYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019608; c=relaxed/simple;
	bh=PqAUDpTHg12/haxztSOdHwLW4aW3aRIP8fiQ1P4X6jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEVjxJ810T1Yfz5zEyO/zAp2+htvYXwFgR0Ax1kWCf+j50PYoIQEpPXWjnyDsdw8tEEWM3iajlxMNTxD++Q5REU+8fDPIOoETa495WizUhnRvRwieMFXyX96uweaV1OEwNbu5tm5Q7NGIEzXOCz4RohGIQ/PeIkbFJLtIUeoVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RodJLXA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodJLXA7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NDKs1f024757
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maOR1rPHKMjhU6q4YVbFSzEd
	jGLm86V7mh+z2Dssfhk=; b=RodJLXA7sxKKqUjE7fZ1XL8GGX5MZDuJodF3bNjV
	+hBLj/uhAA9Aaxbc7VEGvBPlHkRTYN8TpgwfDdMGgYu+9syM/t4JerfrgxDosajl
	VHJkJaGGS848/wrQjLJarXprVSKC/8Fn4F81gViF192SAP/+juDbU9jCt4cZvRVC
	to6DXaz2FK9PoVNmY9k16l74amWNEK1N3OlH6x+Th+IQL1U4ac9a6+sQCRahNh7b
	tVoTtayd2cj+QgZhRFrXnXwlAByXS7VDe66fk3fCR/1os6m4QMc/QdPfQaGN0ZX/
	u+wWy/xpMkh2TH5CoUVn7C6edA6obfN3CA3q40EC2UMlMQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52kyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:00:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso1042586d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019604; x=1748624404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maOR1rPHKMjhU6q4YVbFSzEdjGLm86V7mh+z2Dssfhk=;
        b=F1st8KRu6ZpMgFLpDP8SmQvyYAWhVtshaWwED+BGaz3deYcsICtIHnlpToCcjso3mK
         n+KIZa1z0Q7cppGMvYFELAbJpQXTzw6YUe6jOsISBWuot/AoPGvzoWaKSpLK3IrXiy+d
         59IYd4enQhh9RXJeSyZQZreF0jbl+eQm2DKz3V88VnKKv/IDsnTr0j/NZuNRoYVKob+g
         vUzKLzI4bkqVxj5B7IjwEk9kOOZnTg+bz3AiGMp/rpiQYxvudZP8rw8ukXMRHUIYaa4L
         sDNyQ2BzGhpPDgbU3B03V3JdcXmfulysyU1bxoJikzZDLH+6s1oCr5zYFo7EE9YHdLNC
         uxhA==
X-Forwarded-Encrypted: i=1; AJvYcCUBT3RzCd8XjWve1WcrrlEkloWesR5jlZqOncjAPccKKQJAeUCwwczz0uSTYpseXS1bbaWT9GugWYEMTGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfbET8B1R6gWKX2PpF4XmUoivgDKDdsqZBICKddcbBpt6fbhm
	14VNYkCR4U3AodZuyqzrzgHwOIZwidkM8j3iMkqWDx0K7SseCVieAAK8lJ04pp2ZotX/s42Iial
	u+tq46bccRbiKhkxcN75dJt/+Vcs1GK8Wr01PX9w6LXEzEB070cdeQplfKgq+LPNoN7I=
X-Gm-Gg: ASbGncs3+Dv/oXkPvdqCruyM1Pahj77wZdrb24mlcN7fohfQDBkMwwCPsse69s2kgwS
	cnZrmkhko1ptkDCZ3rqVHwvHRiPIH/Fz/3CD31kbE+qlUygMK2FTB/uI9Tu+7EKPaN0jJLc6Qot
	KfToG0DD2DYLBe7U45ZAmilU+7XWQKKqyLrcn8YreUpJZ5AdH7Y58xYBcp+DwZZGC7PwiT2d66f
	UhUeXCsARRNGJ0iYKEvIiH+TFlpNUhTfEMwm27oUyMqF+iFUeWg7/oTUXCpf26LuNjsmOObd88S
	UsZmYX7IVqlb0bxCBltZxdD3D9SwNmb4Y/rxb0rZqo7djQrtveA0Bt8imY3UMjP0FjLnapFtMlg
	=
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id 6a1803df08f44-6fa9cff2ef4mr5010246d6.2.1748019604276;
        Fri, 23 May 2025 10:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYdw0GZtJvLCfXO1X8zZftyGhiXHFblI6F3g2GPsnCAihhW1dYilfd6/MVO03PSiywr0fMA==
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id 6a1803df08f44-6fa9cff2ef4mr5009886d6.2.1748019603916;
        Fri, 23 May 2025 10:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f3666fsm3935508e87.104.2025.05.23.10.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:00:03 -0700 (PDT)
Date: Fri, 23 May 2025 20:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-Proofpoint-GUID: a_lMqiNl2PUmvYJTNjWiLDi0eBViO2st
X-Proofpoint-ORIG-GUID: a_lMqiNl2PUmvYJTNjWiLDi0eBViO2st
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NSBTYWx0ZWRfXx18kzBAudqMK
 qRSnq2mAFA8ill6IPGHucXlhXQ5EyRehfAlcuE348P8HjORH8V8WkFzxWT8tl1KUvCgmIX45vVi
 hdrFtiF5MPDaA8+HWCKlir+njxGBy4DwZ1YDZ7HUfWUMzadK6q9jBqGEnJty7Yjpvp3Qp3c90BQ
 DLBXqM9ZnUq5VQbkWjqAorm22yBOYLb1rV5d7S8QCqLt4P8jiAevfbJV7iQTR0JvdL6I0UNtxU6
 ppI7VEs/8JDaINy2Z/xVko3MVqGuqcMAH3Es2EGRcKWw2/1ePZQRenubG6Ac/ZxYrLpJq3EoW7K
 IvlQKi2AP5MMrRe5q3Kdbn9hJu6tmUjgZ52aUEF4QMu6hZk6PJL6whJTh2vG0av8x2X5QgDAYHx
 9NZDdv9CuaS/KgM5U3uNZaOfOjZM9ppDNeq9eRMbqnWcgsjiOnK8r2od236rCqcvGoFMX9Lx
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830a995 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dkGs_W1-f6rb9hiwgxYA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=348 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230155

On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies

You are not the author of this patch. Why did you drop authorshop
information when picking it up and resending?

> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

-- 
With best wishes
Dmitry
