Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34D27A92E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532787; cv=none; b=o74MhUZ7FTgnmLHbOzwODuBEDAS/y292s1JrAEgTMdDoqYaJ6caS+z1HfpLYWa+tpW/G6ru5U9IxbCp5hEPsciasntKxgCmh0E2+Za65YLcaJD+HmdpzA0+E/B+p+inESCUK6VdQ+3Z3u61x2Kr7q2YZgG2O1ErTH81yjOJaFuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532787; c=relaxed/simple;
	bh=gkGE6ss4b0aF/IRHsr3kmpVOlGRKK34LrFAoHCkqFPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C4N3Jma4Q3mBsg5htyHwKy7AMeYibwjqrTrhMvq+JXzYRDuAjjdyKjjcwnHea33lereQ/niGirDjHOuPykX1BMsKnzqIytV3G0UoAsPG8rOMZ9SX6CDC4wDaOLGvTFVSEjOLoYIU62vQZkExHbfv8k+4A0oZlMuMiRn3ck3plrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F12eTmWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F12eTmWI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5469AML0008567
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 11:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTFgJlZ2gHYRDvXHM37MJXTgO7TLxZmzMBTuRE9JWIc=; b=F12eTmWIEWnIgUS1
	PD0qx2+dd5Kefug6QxnbWU1E6NUsR8+mB/0QHmPxMYoPm3eQqCMgYAUBOsudAbO8
	gSFfqRmf1LA8L7c1/NllbEruaV9tJCrmII3NzxP2KPsw7hF1VZqOwDwF57Oj84cL
	4WIv5oTzSZr0FQ5XioDDANP4I/9zCgOyQSW8E9iGrHB7YclAijKblVdYypi8mesS
	6aPEbSHX6NaIcBj+1cPkUHNE72JrThJv0IKDbzhpKb3rqsFopDeFNgMaXCCMJ9mW
	+X2VoP49dcHy1w3lGRCqAqXwnN0Z1AeeEexVb3q3DDhLCyyprAaZnVoj17XSbcj4
	vzkq5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg23x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:59:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so974538685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746532782; x=1747137582;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTFgJlZ2gHYRDvXHM37MJXTgO7TLxZmzMBTuRE9JWIc=;
        b=DCpzPKvS9OqN73zbi+qcNMVEOdIZiJ/wnbGiAb8hwS1Jp78GNil9SGnUJQu5yrholf
         M1PKqZJFwKcUepJacyEUMGKjpjwfWDSAYujUZLTpgEANT6cRhgU+VEJ4dV+C/NAyhl/c
         VY47r0B6H1k+15+I8heuIBa0Tq2yRSLq3kbqO4saccFKMfTeee+MV+vx3cg1eZqAJHoc
         KGPhI0MThz66NHEGQ2vebGr21+jI+KgoBj1GM2aXFW/QaQseSxDvYV5bQcDkplPEKa3r
         ysu6SekxXUjBG2AtUKdEh1fiLGR5lHaFiytJF9Uo/nZEYu61VVESktcl5vqzgrwuW7tR
         c3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXf7TKsdfEzZfnfLROzBNCvpv9gy9Y+dN70qHADNl0J9VMqhNnXGK8sh+atw7WNoTj2tW8IqJicWVZPh6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/FfLfuVNlgHEIAykHWZkUIyvG95KD/2wB6LfV67wsX6fp3+G
	BZ2JYcmQkqOCt3TDUw5hM2P12X15MbkRXWwZwQyyqna86oB+4MrWKxTlHJiBZZFD1gNMtF2OMGE
	v+yMO/LWGWPXvn7jvcmP98R7LxvkZIsOC5hwC9u6TPX9knnfLfaSLiMjSKDDo1mA=
X-Gm-Gg: ASbGncvgdNxeRW8QCkvtk9GKFC2ewZE534eCER2UoMUVhf4p0ECJVr4Xkdd5qvVgNcx
	kPbKEb3rYT6FHu4tbzo7Fcp7AmWar5UvMKURFXuGK9RJDGnDVsGEX4Guj4CWIUBZjSvsJYmd0aT
	ObxVstBiAZL91p0VS36izxJtpe1lVjZRqYLhzmm00gn0cC5e4/98mqbL9XKAKeJ+KwTPPoUdYI5
	KT1HJsYOEfD+dZot7QHKW9pTRMaeIRo0Uc93AeMmaNaRgkI8HXgmBXno/Bh/ywVZarfHTNYqTc0
	yGl3sL4KHwzGh0oTAqEcvTc9Fs6KuesS7iC6t2fT3K1VpyP17cSglmAIjOjVFXvy+FcwGq8GFa8
	=
X-Received: by 2002:a05:620a:198c:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7caf058fe93mr520904085a.28.1746532782579;
        Tue, 06 May 2025 04:59:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd94CFYawEurg0hfZfGtdKWHF+uRpesgha+HGKI333mbLlDZRfu9bTDIzajHzBOws8ZH1XeA==
X-Received: by 2002:a05:620a:198c:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7caf058fe93mr520901085a.28.1746532782235;
        Tue, 06 May 2025 04:59:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1b4fsm2079645e87.31.2025.05.06.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:59:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alex Gonzalez <alex.gonzalez@digi.com>,
        Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO
 G101EVN010
Message-Id: <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
Date: Tue, 06 May 2025 14:59:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 7RkBj48IgEYd14cscaeVYd8rSvTFYplD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNSBTYWx0ZWRfX8dWNbdL2kDQg
 0iEmBR/SEnwb2n/MTcmNAefi62pYjxPLV8pJkv8SZKW7HF9MRIKNOsg8kCzmH82RajRP26BKwFO
 UJ1X48tiXLEG1k9RWAZM6JisB3Gp1Mvf8oCbH4fDm3AH9VLOnfM0mYM9pfpx793yp3X1jzSKQhT
 42EmfMitpmT1Z+bYzh5g6e3vAK57afw+hG+rHO+PbG8035O70ylU5Ee/b4DfAkcda1SAlE08Skh
 UDvCdftaRh1s+Q24hPJY4asD6t20I41yPSBAmbFTeHrt/apsgpI81rpQpaYU5Zk+HFCNaEd7qFy
 XlZkmHwy4eZqBfDIcMxP33F3bLA2lu9IjajpjsQSDYDT4efyZmS4w63rAnolvVQqZYIB3TIC7SR
 vHgKfdlEkvo32P/vT1lL8be2dLNepBjzVnbuVEvoE7v+w7sFFjG3CLYZmZeovyji2vmIlWYl
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=6819f9af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=H2HuHbmjnKnfmXjmLfEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7RkBj48IgEYd14cscaeVYd8rSvTFYplD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=778 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060115

On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/panel: simple: Update timings for AUO G101EVN010
      commit: d5d283d45c85e774b64100137f34e7d55bfbe45e

Best regards,
-- 
With best wishes
Dmitry


