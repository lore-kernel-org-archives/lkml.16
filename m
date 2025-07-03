Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9A2BEC32
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578070; cv=none; b=NE2hHhOAucv0uxL+ALlqVvrEtyt18I3WdP+DS/xNou4nWcZwPU86uA7brb+CCmD/QI1GKnH8Vy0mNEUD5GAfEVeI1sYBnVswLv3167QICd0gk+8aDKqIoV5GLE6zMOfehVKYFC1N+U06lTW1N3WTzhRDlR+AAY/RLsGxaaToQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578070; c=relaxed/simple;
	bh=hsKqc1H3xGcl+DxIItk2mPeela+BueStEwEV1bhT4OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxlD4834HxT37umhEOP2lEDoDh81uFt3i8OX8C6jmux0fJvbAO2nr5lhcrONtwC4rRn/aGQoI9dOqYnxUXUdtGcD1rNAW3MaOz4NTYPtN0su5XAzUQZEwRKCBpeFyielwhBaKQIYXdX+VS9Lzyopm9tYUO6jYxebOKqNwW5t7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGrvMhL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGrvMhL0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HKjip005469
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 21:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8EhHwVKYpVrPJqxIdjJWt6i
	mKVtstqw6FBfSw5Dfcs=; b=BGrvMhL0TDNFCs2LhwEFqzu7QOyx7f+cCW2mp+kZ
	0wLWqk+5N17jvzzu1Ejzhf6b5Rn5C4e8oNlufBfaxIEAiv6ngFCB8Uoui1q2PqP7
	larACg6xkL6YsWwjNraGORUubtDCBCWV/64XJ5Yg8dVetIFaNAO10I/WdIYmNkoY
	ZhvNxY5PnPdLW3+AYQrEYb8Ftu6+WtnUYzQ9zMhK3jSzheM04/qjbaVX2g97YAin
	KLdDNnC+7V7hW4zi1gbXwYC2uza1NUhPNB0YI0EWgdJczDQ/35bUTDtLe+y4gaVW
	7Ul3qtUlNrw3LTZ0km0RYzuTt3fjoGcN8jZ606Mm+xYJpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmhkyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:27:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so66320685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578067; x=1752182867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=;
        b=b8e4FgS9JumTMOoYHMF5nL32pbdydBq/luPtxwpnv1GGRXCGffbQYOEV+MeVKRjXnT
         qyDR0krW3TrT+uxvZhXUvAQpreGju3qHL939AYzJ+d5UBrhvkIzC0+hXSqoIPKqXd2nX
         O9Bf9BMHomI1vNxtMqTrHdKzJGe9HAyquJZRjxJS/fX8C0d2UVaTMqIeDcd5EQsIhjSK
         t1+ktXJwkxy2b8chYscXnFuu3SFzJsFLLaj4hI0YNZIhzvH+OIY+GCjsVKQym4WTtPcC
         NXEnU3Hw7mNX5+2L3IEz3wd+EjENf3v2V6r3NlBU5Es/up91BdJjTjTSERNwGycvg1HX
         NCZA==
X-Forwarded-Encrypted: i=1; AJvYcCWxVAa6g57y240poy8k3QrSA4wYJo9khWMHaJjc2iCrAIOUIxIUtA5qA4MyltNR34EThjj+2AWvuVcqiGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFsjSDy/+TBMYAvCz5LUOFGnw8AaT2HVK+zOXvb7QZEk1+0Mhg
	mbpu07uKBBLpBtoZrfL5ZwdeyUCvxS4I98ilEMtiaGL4gcnrXclWtf7QDaX+nxf7Avn8SsjuHzf
	r/61I7RIshyRkpCE217uxDGhRdSK9S06fBa93MyO21VqYD2CCqPTOsAxlLIAzW+8IWL0=
X-Gm-Gg: ASbGncvXTq/9bIsE9mSHAY7D8y5vBvwddPSVDLOCVztI1S/qBH0bQvUIvrJRproCDo9
	CN/+cmR8z/NumJCsvEgoD3q0VggImHCDW8JPuPIVuTLpPn87CZoJoyfJsujc/btOYR+fcTHKrby
	a4Aqj0zEmIctyP9IDsivJp6JpXlj9ZlgZlWMS5QpxSvDTTolE5QsKrnHHkwTAntjaF6PykGNQmC
	DVKJxlPU+Hf8u43wZE1YwBGWSrBH/8eYjZ+r7k0oxLn8ArEr/n8epEC30J6/EIZI66oeY/cyQUP
	A76Bp9Nv6OvshuDpd6HfT8/lKr0hpvRT3j4eJOxYrx7uT+AAQYSs+y98q6kS5clPGZKcVJsa/Hr
	7Z/AX3YXrzRJ0EL4aMkfnm5iICjA+qbtihbs=
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2891685a.18.1751578066811;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJrZqqPZZas9zZzBzoVxAUKC2qdaPz2216jh1dVtgBGxiblPPM6KkbjiAzq0lqA6zcxM0YQ==
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2888085a.18.1751578066366;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm72675e87.123.2025.07.03.14.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:27:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
Message-ID: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703125027.311109-3-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6866f5d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=nJWoAq30JnpefaDr-ZMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: rDLYPmqyd1Hd_9Z7L3HG6QK3Nu-LT7PG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NiBTYWx0ZWRfX3LxRXzDUy6p7
 Zf06MPBnzQ/sErJHwoEEtd/oppzrwqZVP6DIc3XnwOHuk4diApzgFSRBjYLyNWmVLUsMELbhMX2
 ehQIMmnJPEwCXs64j5cm+Bf4cdH9iOzFlX53ebdZiu/tKmlMWtGvRJ+JoHT94Zqz/Hey/YCQ3XH
 WW0RcTjm2gFCE/xvBASXlhDNytjnSFdFFNV2NXeQH37V2+s+pDy60TvjNPnpCkfY8qZQ6az26Zm
 8qHRzIN2IVLTI/HXF/i3yHlMTdO3zKVGUf1O9TwzTdtsHXSqjJO2lHmsxuD9HxaI8t2rCFHZVo9
 9HuEtkYq77OC2IkkZD+GLYYPVDHz2fApaZjDcumjN+In9QIpfgu9Kr1uVFF2ONpOSQ/1TqXJUBH
 /UuzHGb7EZ3k4Rem6PmDKfRke8fp5+X9nDgYfr9JY57uAOQ2uYQtcADVz87lHS1mdYCMGR2L
X-Proofpoint-GUID: rDLYPmqyd1Hd_9Z7L3HG6QK3Nu-LT7PG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=764
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030176

On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
> 
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
