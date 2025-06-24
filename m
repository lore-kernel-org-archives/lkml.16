Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9841D63C0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808735; cv=none; b=MpdxWHPzLScnr4RZFyGhJ11NzmpQdHE9jFIesGpwPtaE8wI9CmrmI1NcxcgD8xsmXXz7Nz+vbrFKxOshjExDSrQvgAG5kAFMOI2QNBinF8k/r/gLW3AVBlInyQ0IekPyM5izxVsiLuV/645fIgj5YndJVNnxaQsiXPA5lAe3rI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808735; c=relaxed/simple;
	bh=w6IhdpIk3yS3go6uegQbi6+YJCp+vgrPMBUABWk0SK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYvPrG1gqCjNnNtR3x+gfInvwmjk4JYkKo3YjBpqzB2Au1SO2cW5yj3eWggOYPLpX1fXFb0NFs4cvjNON5Vrw8Xsp4QyeyFelk5LhfRgCN+UMGAuFuUYeomw776+ewv7pcYyEpdfBZDVqRmkiynSug9FlbyT569S81r6fYhFeK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7wbS7Yy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7wbS7Yy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODGYg1008956
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WAJsPIbRnjXmAo6ZjZnEWFmI
	vAfVjWJKXaneql+iv3g=; b=M7wbS7YyipqfWrl5JiHqR3dDLD5shJHyYP0Ub18m
	vvQG8JIPVswpSQ1FWIPxRUIIoUXIHz1PRBJklmKRVAxhBVkMbZoiTD3XNVa6cdKp
	+kgX0QwZSLlPrJKrzdqTt1WOmt4MZ69f1q15S8bAQn3xQ1baEVGG1q98PoCvX6XL
	eBgWV2kwekufllI2O++xAYNFdNlrGIRo6JLYb4H1uNUGADvVkIIZpKuJgVMuQtVR
	gWPdFqMRtQFrNrqlNo9h57C4JlEo3NQP8E1nHXN0S5HD+05vb9kj/fQGY2I+PpFx
	IfW0CsWGk/3lvjMaSy1QnMOMCbojQZEikXX6bTOxH7NpBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqjf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:45:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so894242185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750808731; x=1751413531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAJsPIbRnjXmAo6ZjZnEWFmIvAfVjWJKXaneql+iv3g=;
        b=FJC1/nc6PrglopZgngjhXTjuKI7ePtj4ORlWCQDNf8gmS3h6UOPHlOr4svSma3qeCq
         /c7t+gQfxS2mMn92q0HSUXkR+fc7wSoPkg1/2oPDvqvYM6X+K07y7Uiz4tUhXOYoytPz
         9ffpnZFgiYwu7aGT6926kBPAeBgwZ1LR78pLlzFdi217N5oNMyMVBHRvo0+AjD+C1eNf
         COMgDai4ir24PULEH83SPvHnS0KSDaaF79DoFF4rPgPhWVSS+65kW5SQp47KVhOoP4jw
         KSHyMWZsd+JxqH3yre2R/o22yshW6QXsbdgPwpZCvrf0Y7a0+KSANJI8CN4CIKDT+eW3
         jRFw==
X-Forwarded-Encrypted: i=1; AJvYcCVYOzHnc6pibz2PzHT0YI4OQzQmymBGzjmOSwqujk5RypTG0mW0m4ZHm5Sy7rzc9hT62B3amwNSzMpQ1sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+7/6+g/63i0khgDP3YPOtSKGrNuJ1gLDmebJ/ZJStzihFaxk
	aiF3ifzU/PPPQAp4HIkDufQtoBRa1Lx24/MTXTVNnb9fYnyNesZ4xlDSVzXQAPMdFanEK80Dwky
	fi1nYGNBZ5ShOVA9sUE1GlEpqkY7Ua8SFl+ak34KE6Aqruxuo12FH4THdlYrQMoRBPRg=
X-Gm-Gg: ASbGncu/6EfL0reXJh9ApUXdZFD+iilm5/O6t67J5cz2PWwNticli4K2203LnXSldpz
	EA3ImIMRSc2uUK3EznpO4OGxBUkZUO6EekGGej0ps8+pb31CPT9NRQMvX4oPMcH71eU4jBEmS5I
	aQgTmX+Q3tYPzNqcat1mF20ST0WF3AoW1SxIdKh0hD8lpbO7yW6Zo2qGY6o9aHR7swuVuHltTvZ
	HUKFyXolLFI2CNW3kju3ZcYeqJbLytrIP0bo4ZpWD8SfKZihvFVYzIIZ7Gztw/36+7D92gyzkiI
	XLPL2DNkNS2iA9LhspDW1rX6POZ9VId34vzAUe0qb79YgBWJbBnAWkZPN3/05ovMXxHZB2vwZjL
	yg8bQONjSndp85kxfNB6cGi258VYDIvqY3yI=
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d429738b3dmr140731485a.42.1750808731315;
        Tue, 24 Jun 2025 16:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgF4lKMv9pFTpq+Z5gqbHVZeWYlPV4tLNkOFjao+Almo/kU34/QQnWnyKwCR8y/LNKFMM9dA==
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d429738b3dmr140728485a.42.1750808730822;
        Tue, 24 Jun 2025 16:45:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d2e38sm1978871e87.240.2025.06.24.16.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:45:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 02:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062434-reviving-grumble-1e53@gregkh>
X-Proofpoint-GUID: UhkzyCsWDjs0Dct-nQBe2h3JsnwEQzfe
X-Proofpoint-ORIG-GUID: UhkzyCsWDjs0Dct-nQBe2h3JsnwEQzfe
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b389c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=_JTX4_t6f0o1SzS_BCQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4OSBTYWx0ZWRfX8pEHGw7ifrF/
 VypYbBVADh5Q2i7WY6cToNHrPUzmMZAQc8vu0pbQqzS1HpV9A2r//6nO/1mr9k80OwsE+8eiod7
 OurIcE4zrEIBdpkYGm+KKNDdbGpl8P1Ka5bXHdF4K+RVJUqTdtZNJQdpcdNu0h58JOcY7fxD0ab
 i5tViYJWGmDEAiL3modp+bgo8egnYle/cEyb7hIPL0GjENHhmfVNh5rvmB3vjergBt2FIVFpvUw
 rYfBU5fe8Kv3wmHpCWVpKmWMoen1I3dUP8heQm5uFo4RCRPHzuC5WAGlPRz0Qe/oo8x5FRupHVi
 aSDFGd7zXcsF1z83yPXCBVqP+MB9zwuAQwDnwpphCu99eJsmbn4+a5BLRhjJAI8dH5TIXI42w+u
 2cgyaNvGD7xq2fYx3QS8a1K5CV89tGl60iTzV8asGbAuiGh7JoBpJ4mQ0W2bTOpDjIERrlUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240189

On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
> On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> > On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > > channel specific resources are initialized, followed by
> > > > of_platform_populate, which triggers context bank probing. This
> > > > sequence can cause issues as applications might open the device
> > > > node before channel resources are initialized or the session is
> > > > available, leading to problems. For example, spin_lock is initialized
> > > > after the device node creation, but it is used in device_open,
> > > > potentially before initialization. Move device registration after
> > > > channel resource initialization in fastrpc_rpmsg_probe.
> > > 
> > > You've moved device init, however there is still a possibility for the
> > > context devices to be created, but not bound to the driver (because all
> > > the probings are async). I think instead we should drop the extra
> > > platform driver layer and create and set up corresponding devices
> > > manually. For example, see how it is handled in
> > > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > > can use OF nodes and iommus instead.
> > 
> > Is this a real platform device?  If so, why do you need a second
> > platform driver, what makes this so unique?  If this isn't a platform
> > device, then why not just use the faux bus instead?
> > 
> > It seems that "number of sessions" is a DT property, is that something
> > that is really defined by the hardware?  Or is it just a virtual thing
> > that people are abusing in the DT?

Purely software value.

> > 
> > And if you really have all these sessions, why not make them real
> > devices, wouldn't that make things simpler?
> 
> Oh wait, these are "fake" platform devices under the parent (i.e. real)
> platform device.  That's not good, please don't do that, use the faux
> bus code now instead to properly handle this.  Attempting to create a
> device when open() is called is really really odd...

The driver doesn't created devices during open(). It creates them
earlier, then another driver probes an populates the data. I suggest to
follow Tegra approach, remove the sub-driver completely and instead of
calling of_platform_populate() create necessary devices manually and set
corresponding IOMMU configuration from the main driver's probe path.

-- 
With best wishes
Dmitry
