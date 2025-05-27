Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7381E32B7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376613; cv=none; b=GCY5WWE6TXovQ8eT14fH+sYByrXEiSkjDYNigU+ru7jpnjLakpgOs2wtQlzbrxxntWM/0r32Z7ttczGLSmIQrCPVmU61BdbrXFAKRKhFQGXAl3Whi/q+RroLQymKk8bx3g4CllJpLqu3QU9VVIB/Z9FYSaYg256Lqherh3zMKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376613; c=relaxed/simple;
	bh=IWBV2ktAqzAjrqRxbRkFaFfM0kM/pNr0pSGYb55asf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pr88XK8kYNVlXa3EAkHyuYhOzeQEqPUBkcijBCdBR6IprRFceLoA+nAimPYnDFroHTXjNRUlkC8NRS0r2/KHdK2itJyjvX06vjtyIOj8M1y683dK4AsL/pwlX4iie1mPl93U8/l+Fv2n0uQ7pE1nr0VAFUAj17DkefqD/TU3U2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QoGYhMc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QoGYhMc2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54REM5Cv013944
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Owj/q8MDW3oPRgGhPL0R31xjnGlGRt67klQ5Pu9VTE=; b=QoGYhMc2QWhZHVSw
	3+jKYxeyS2N1XJEPxdEh12SxYKMuFic1745D8mju4/HW4Z9qpgvA+zGC8n15Brxw
	EBRU75cQFcyMYWBIKkP4KhLQyR92xH2vcYg4TVTZgsgP714PS3xI9qdzdEj0oLUV
	6qn29wOdSOHXK+VS6sArIbkZiFIcUKsW7ZDcGPEM8g+V2BuHxwaowkw5Ne6FMC3I
	d4VzIKurce+QUC5q1YaUKc+I70td5vGRmBBbXTk+VERwwCslfqm8uAl9SNjXMito
	p9aajEFix9KeKDmaojIaq467By0yYGCzcL08vooa1evu3Jra5xwPtbSaM3WibGf2
	1q5rug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549g41j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990722so612495085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376610; x=1748981410;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Owj/q8MDW3oPRgGhPL0R31xjnGlGRt67klQ5Pu9VTE=;
        b=D5ZvAvZTn1w4w9iR5f3SQN0NH496vWrEcv+/B8KSXYgytiRZius5GopLrAFUHe/Jsm
         YlRgDHsbDAe+eaGdm3vse7SjrFaIp5Dla7B2rAhVP2XibejBA1mEfsSJyz4l08/GXoff
         Z34WJsRSZxk7QjEF5n/+E7ESBefl07e6FMvznJN69PvPtNzAsK+GwM07v/+HkcOnp5E1
         H1QdXL+aS/i6MU5DPKSXVCLbr4Usv30OLVa2fyzf8MbaCI3JHiBgKdoP05XK8uOFr+qj
         7f4H1jE03zPfN42eHQDOPJvIX7BUKFUX1JHVh4g7dlSJfimU1IKKyg6vJt1sYgTIFAva
         bVMg==
X-Forwarded-Encrypted: i=1; AJvYcCW0srh5I1JHJ4GMVJ+q+35A1VmEXffoWMFL7j1fJYsDfN7d7Ro/8GpYyVYbmxCAabwUH2MJvau/3Whq/8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHy4+vP/WRBq0fAT+zrumzlJkKzZvJNykWefq4se1YDDVmgQq
	EjT1pJ66dj7UzDR7W6r79ATkGp374CP4vzxPfwCwoCfyC488Pq3fgXVeoX6/aeEjaLAF7RBi6ma
	agjkn5B62zvhiQcaA+6f8a61ol+dy4cZU/Uzq8jfNlEE5i1bmCMVLJ0f6rjDUCvdfsuE=
X-Gm-Gg: ASbGnctnr4i621/DyXCxgU++T+7S1R57fQXgmWhs64h//FSPhVSUTADY4Eyd1N95ufY
	XAGH9TO1xqZgndPCSsBoXiUq3Q15FNwd80u1pnJ8dv5FhA5j9thhkSxsM/JLWe1lCNAF5UzR5CF
	9odRp8u5/GhRxgS2c2o4511xVm5Yy0nriM0Fr4z20kYl0IJXccO9egHtzCODxFEDe+5kg3lrjz5
	MzFh3xNOQ3UmydwtQuJRFTFKG35UvuYElfLBntlkUHIb8zbTKYeMfC3uM15J7s+cZ+mn5bz05vJ
	AO1sMez0KrSfEO6PAvZ6vuKOKBvNo+jX0kbbsCXwat3CcoPCQrcVZ27DaLwASPjwozho2WgHepM
	=
X-Received: by 2002:a05:6214:2025:b0:6e6:65a6:79a4 with SMTP id 6a1803df08f44-6fa9d35b343mr214911856d6.44.1748376609940;
        Tue, 27 May 2025 13:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERinI+Jx/0rl1f1e9a7mxHigY8cprXWibM54aGl5SogMthMUkckg1NTLlEEnP3qiZxr5LPTQ==
X-Received: by 2002:a05:6214:2025:b0:6e6:65a6:79a4 with SMTP id 6a1803df08f44-6fa9d35b343mr214911476d6.44.1748376609413;
        Tue, 27 May 2025 13:10:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6340594bsm8643491fa.4.2025.05.27.13.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:10:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
References: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Subject: Re: [PATCH] drm/connector: only call HDMI audio helper plugged cb
 if non-null
Message-Id: <174837660819.602917.1928145236467232695.b4-ty@oss.qualcomm.com>
Date: Tue, 27 May 2025 23:10:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: mJXOauXuHeXGTU2cV3Syyd8W7FfuVn7i
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68361c22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=3R2PNEn0RuH7tX0IixoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2OSBTYWx0ZWRfX72R2GADyFtAS
 YhR5JREmo3iskyS9x/WIbWE6JfQGxQSc51ubC3D0JALOMNSwZzkhqzXMCLKpY1zyvZwMSgtVCib
 uu8fMBvhrsV+KAuw4qEWZ7lr8Ii9atQvuVygTqCj0E0SN17v/ne15Vjo22wcAlA4Frs8EZSCU8O
 OUSwt6hCR+Q4Gx9WQKAVIz21DBmNetOWDFQxx508al+Sm6LeFOEiDUK9I9MRCNA2cH5v73NOTGO
 Oy9Z90joOO+voAF8rxvCufBuiYljpC8yrTVgv3JKyszD5AgDREPdaDstdN8AExK15Lvi1FBNhyQ
 y1Ba1oA/Q7E4R7U1nKquliyJDH+u7e3ZxHm+lTTvF2nS+kY9uSOPfD3ujDfVJvEU0nRSmaLGYSB
 yDl7OIzyohCA7Jn5jgS08+DvZYDelSqzV8vFFy4CCTh+2OheeOeiNP2KCdy1cmWgp6psHHRY
X-Proofpoint-ORIG-GUID: mJXOauXuHeXGTU2cV3Syyd8W7FfuVn7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=907 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270169

On Tue, 27 May 2025 19:57:08 +0200, Nicolas Frattaroli wrote:
> On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
> with NULL as the callback function and codec_dev, as seen in its
> hdmi_remove function.
> 
> The HDMI audio helper then happily tries calling said null function
> pointer, and produces an Oops as a result.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/connector: only call HDMI audio helper plugged cb if non-null
      commit: be9b3f9a54101c19226c25ba7163d291183777a0

Best regards,
-- 
With best wishes
Dmitry


