Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC9EC2
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748047150; cv=none; b=RoTKnRuvsl4JBaqjDa1WKAU4uMUHUZIWRu62/tMYpkHHQJSSnURoO6D+ttNOMd4Au7YRpkFmp2kjM1LBS6l/aQb+NkSaksHB9zZznMMeyfB9bNe7MiN4+oTDoFlfGdaMbVo2j3mki57kJEdpiDN2Fp1mBZ5yVjmheIqmawzJEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748047150; c=relaxed/simple;
	bh=eZJhfG4GQEbheRNzPJqjew7h3U5/FwPPw2DvymoVaNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1jcKPPHRNQFJEnANuzQbEEVhvvOrOpnucGnhIpS2qDnnsGOHkzx8Uv/xJgo9BJaPZ3pnVIw9i406q7dQebl1lCKbzIh8tilhlGo1Jd1Fr17E6wis8AZu+AVQG7SGBJnv46/DbRiOZV1IhHZL3G23LEOHVpgLDwzS5g7O9gNp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8yqTAM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8yqTAM+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAYQ0b013629
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vK52ezr41m56pzYTcI0iDmKN
	jEm58wnfieVUi6ZhcI4=; b=Y8yqTAM+LBpDePLDPuK6Kgbu3VpZeikBlUDj3fpD
	R9msi4z1eaQ/jgr+TALv8uoYjGKArQtAIzTFc+wXHwpUNWE1WPlhMoFBWDupC/Mg
	HusLeg+QB221wtPcxdp4Q8KQDzRxBm7TjTJvcgOmNS6jpAwRjC3eFjLTsGMQZI8e
	j3KGXVP9+daGUfrj6zMGD+wW8Fyx6uORNC3f+q+Mzd8vmyQd4VdQGrkDs/MXeKfT
	nZouNLmj+Lttlka+kZ+lcf5cMLHCgUNpDI3y1K6gey1LeRJJLhKcDROk9MBj88eB
	JsGhsfn1SqP/VDIhZOh42iZ6DuVD7I9K+bKLOCKT69SAWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5kqjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:39:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso5418366d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748047140; x=1748651940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vK52ezr41m56pzYTcI0iDmKNjEm58wnfieVUi6ZhcI4=;
        b=b6W9QaXbiFt+jomHe0Dih8S8uSUWV84CybqJXFUSJ99D4rL6xANCZRihNzzKEIBNom
         rDsPR9PFIqX+xDXoK8r6HkliSvfxuJV8JEjaDus6jnrguVwzFFCjjiQ7hsje7A70gpYe
         UpVjSPX7p59BpEOAUizEtXvFsWk0z2oESyxk2KQb8u50DVmYO2YamwJMdyS4fxY7AzQj
         LMHu4vNTTzIr5t9ltMSzOinQ0H80vY4L9wUmVqxbYQkRJC8dMymoJ6ZIX6r3Bd0btwjF
         gVnoyNW/vO2FEEEpguvAyhluxn2yiOiqBQ8VfHw2N0UismhhYn6zXlaZNP70UxkDM9zK
         Q7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXaH5WQW7wfFWPXjmEdJJYqxK3ewZw26TYlhM9zQZzB1cJrv3QsEVsEbmbdxrcmvAAS1R0jyUY589chT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziOeI5bOBtIGocwr1UCyVWKvPV+9qWfD30W8NzMu7VyhhvYKzU
	aibhg6XoclKifAYUTiHWzszKGbDVdXxKKRXh4g5+hgJ+MjCw+8iS1xEjV4O/uRIIP67tLIgA65S
	qaS0k07Noc1pg2CqupjwlQHpjGUv8ILlQXPg0zrm/fS4GWpz2cb7K9Wa3QoDEre2XTLU=
X-Gm-Gg: ASbGncvzlpyUrLszE3BDNvVdZIdMXk9gli3jA7MAGGQeak8fjWgz8uQpQR5ADYx1D0/
	SXArwWFfUUWTJaVi+ZyhXl00hsWhVfZtXUbTme92WCN9jAngtjpQLJcVOGR3lIljMmVaRcP33ej
	rdBu7xorP6L9Oy0/vPY+tCuRlQyxKXLrNiTJB1Ll6YbjIB5I7ZXooMZgvhPijPQMPtKS7KIf6Gj
	yMDFyUjVSqATvDy9FKEyfLxHb04AxPPDt2/16hKb4Ktuk75oKCCZ+z+55bDRz1Ud/IsxCdBeOlt
	PwgYNX7jdVi2vJiSEkHaGRd1wYN21Anett2l9KB8Ytnw70XBYhvq66QKBH5fU95cPnw/l+na3os
	=
X-Received: by 2002:a05:6214:234e:b0:6f5:10b5:cd2d with SMTP id 6a1803df08f44-6fa9cfff184mr25328966d6.7.1748047139927;
        Fri, 23 May 2025 17:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGySTqWoJN9ojniz47O1K1FNUlMzOMDATGsvhq/eKMLX8kRbKGpceDFLEaIhr005Dc3Vh1DEQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:10b5:cd2d with SMTP id 6a1803df08f44-6fa9cfff184mr25328686d6.7.1748047139612;
        Fri, 23 May 2025 17:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8787sm38943541fa.77.2025.05.23.17.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:38:58 -0700 (PDT)
Date: Sat, 24 May 2025 03:38:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: make use of driver_private
Message-ID: <ghhu3fypfqls5wazqy6snttfi7eemsjwvgx3z2b4qt5ov2na2e@gp7qlz4gevgp>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-2-m.felsch@pengutronix.de>
 <20250514224515.GM23592@pendragon.ideasonboard.com>
 <20250514230452.622hktklws6kka2y@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514230452.622hktklws6kka2y@pengutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwNCBTYWx0ZWRfXweRc8+Wcd6az
 Yy3vT/Wy1I9mr+AgzhBhGUl2Hnk48Tfz+qCjD7clOkJIRXIOwZ7wiKcyY/JQvOnC9JUoyFGoVI4
 OtRkEv42Am+zDtcj0gi3AnzyfLNSdKWpMs2VlXLBrgygBaNR5O8RVznUabSJtVXYjKi/uCjBcY4
 oXiljDznwW4opspHXqT3R6NwaFIglhfGINeeXH4PnKxoA0iSFdpS1gVm6G5WKEX4yk0Qo9oxidC
 Bn8cKuD2J9iLH8LBM1D0UzqTMqiCt8eL6/9QDfKK5GeA1ynNQUZ4pqgLKnE+giU75saxhe2u+Uh
 eyU0YNY92BHkaykXpaE5zpTupXvhxujiF9K8Z1KPKMka0pKP5xYxioj/F+z0YRD6ggU6Kh5nniH
 am1xrFgbnRQXRxInpUti3GlkUNSg3y1wme/PLG/cJ0yRqRAK7LytzBtEUb0iH5YAocjPGAE0
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=68311525 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=I8cxGwhVmaP2LlvBdBMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fKnJrA5SvTzUeEcZUphE46d7S26ij8K3
X-Proofpoint-ORIG-GUID: fKnJrA5SvTzUeEcZUphE46d7S26ij8K3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=643 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240004

On Thu, May 15, 2025 at 01:04:52AM +0200, Marco Felsch wrote:
> Hi Laurent,
> 
> On 25-05-15, Laurent Pinchart wrote:
> > Hi Marco,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 15, 2025 at 12:24:51AM +0200, Marco Felsch wrote:
> > > Make use of the drm_bridge::driver_private data instead of
> > > container_of() wrapper.
> > 
> > I suppose this is a personal preference, but I like usage of
> > container_of() better. In my opinion it conveys better that struct
> > fsl_ldb "unherits" from struct drm_bridge.
> 
> Yes, we can drop this patch if container_of() or to_fsl_ldb() is
> preferred. I just saw the driver_private field and why not making use of
> it since we do that a lot, same is true for container_of :)

container_of() generally is a more preferred form, because it provides
type safety. It doesn't perform blind casts. Using driver_data involves
using void pointer, which can be cast to any structure pointer. It is
easy to make hard-to-notice mistakes.

-- 
With best wishes
Dmitry
