Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729E7082D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858541; cv=none; b=WrjMVFsMkwZ4iYvaIn+QsjDO6pPhUKHp2KzHQLKIzgJJCWW+VjWvwGQMCYwBsJEXVAp5oMJ2oE6E1Ywua5PAY37DoozE9xIX+4qe2IVljgC2Tt0lhXXZ8quLJIUSZNBIf5tPr9uC8/tJDrMqA8ZGTMeR9f4ZBCFC5EHEit5EQ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858541; c=relaxed/simple;
	bh=b8yxOLz3itoPVMHIUj1lDeX2lgNzolCvPGDhxYDwRrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep5yIrSuVQR6afE+lOV7i/c7sTkzMMHJ/gK/lT4RN+64t13QCPxKr8Ff3AvKV7NksaA7ugaIITIxbOQARUJuExsnVL6lJBOvHFzNxLlwnLzgQKqaGHD3oeKuQNyEWCqZbrGTelqPtu2HvpdyM4v8/Z91eWrBNvxl48NdUXP5bg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6se8KO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6se8KO0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9bf7T032165
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SA1b2FqscZ3dd+sTCEB1l6E1
	olktAuoHppHFOkrPQBM=; b=D6se8KO0T7tYhZqkyqQMQ0WTxByBg8BB5lAiVUkE
	yc6sU8w9nAe2iat0N15feU0yX0/YkzHMJAyL7S34IoRHCNCmHHKH7ySoqS4jdFsO
	6/hR0g6VQtJ6X7sSXoEM90/7gXd8DvJsLhFdVjjEyJ5RRWZhO7rwBeviJLXl369+
	HpBeJLdB1VAl8C1SLCjHdRkYEQyS8ymAbb7ZY422ShpK2QbqAFG/ZW/mg2HtGtbG
	jpKjvbZqHphZfziSjtQu9Fx5azvJj5urmU86IpH9rW4jN4qkt3q9fq/W8hhgHqRf
	h1iNH1FyruMmBpwukSu+VnK1ScfmM6SoDNuN0pgekGorhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevgwfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:42:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e703so913634685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858538; x=1746463338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA1b2FqscZ3dd+sTCEB1l6E1olktAuoHppHFOkrPQBM=;
        b=DQxRmOkN+dmqUu6HCD/NTxgJ+nQgL5TbEKqDQzMHiblHbZKM+vPGkj/9nzSj+UhIcF
         mWcZAi2YcHugMjM98dOgowX2Wi9nEhM/PFpMCBp+lT5knhC1Ha/GGy05Legctp4mTo/L
         nVNVRylgLCuaEuNQAz38erdOu2NLdXYEzUocu6ytC4EOjHSKwWfZxza57q3Hl82tU4q5
         9tjleEG5W1hLfz7UXBqPABP5OG6s9CdXURImPVPC1zhT4Iv72siKqORXeIR4kC12DPfc
         31dFlulb/vVGw1IXgFaZd03KZoXVGoqgba4ruicD47P/hVzwqJC8933Xs/hSVNojS4u/
         VwLA==
X-Forwarded-Encrypted: i=1; AJvYcCWKiLzKAvLV69lfVnsQ1CkLyFGzwDNNwxVPQQwuT9nR9IfC/ApLn3m4r9zfcD5iYn/GGIraHABvH5qBEq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXYxasn4iZfUlYbEpwUM3Nn2+uSlCJERLxbD0g3NaQnB9ZABY
	4ktLL5TJirUDivF/XP64/1zCNhxjm2C+M3tLHIOdZUh4V1HkrWQtPkybh1B9YN4YHc5CqHf5ZkA
	cIievppiORWk8uUwWaiXKqn9w6u9o2zyjCa3nKP4ZPHKlNebHpx+/IIrXBogk+Ls=
X-Gm-Gg: ASbGncs48MORb9CuJGcxsKJ40LXD9BxhR4FIGbM+k6qxUuXL9NM7uDeDexlHjHKfR+z
	AGLysdAF3ucAdQ7nYpWvybd7wIf1f7afUI3bM+PkM8oFs2ixN5qDOeSQTl7WlsJ3Pne4z/CTfZd
	nzD1Y3dXUeBhSzAA4AVCpQ4sX9k6M+q4EFwkyRmII7+TfIwjQufcsE39oxwFq3WvGTRHLU72xND
	P07oa4eU9E+7GS5pYIsHzrBjUpR+tX9mGWsaIVBBzLuT6I6v4IhaGU0btKQPnjWE88vME3zlKLo
	e7IkvbAzOftZodBvvb1JqAMfOKds6Ptf1mk6Lln9PFeQdF1BVHKqOPdin1SaN5/7xge6NiAsmvE
	=
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr1867395185a.6.1745858537997;
        Mon, 28 Apr 2025 09:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBW/Vx29UTQcwpbCDmnpl0iK+JMJuOp/J7yoryQoJh3VlwyHraZogA3RxkMTk+g2S1NCTfg==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr1867389185a.6.1745858537507;
        Mon, 28 Apr 2025 09:42:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a837bsm20918801fa.65.2025.04.28.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:42:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:42:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
Message-ID: <7bcw2dunz4oulx5t7kf4di6bd6cnujlxph5jo53dpynyi3l5mo@tmtutjcmbjlv>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
 <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _BZMp9IzqnDC6kR7-WjVVjYLUuETpJ2P
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680fafeb cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=5IJ03Ze1T5poNUfmoa0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _BZMp9IzqnDC6kR7-WjVVjYLUuETpJ2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNiBTYWx0ZWRfX8kiRfIPBqjfr VuAoe1SL8anYz7t7N+XwaLLYzE8ABjgX+IjlrwcSH95shVvDaf0KM/tq68oXOI7sNhSBdcEzNJ+ ku3XubM9M/enFpOQILdvZ6Hxz03XWUubH52ioElymoU2rW5aKRMMMyIAlNTm1DbciZ8vpWbWfVQ
 Ac3VJZskb+q2baLPzjv6EsX9lEdcIJOc2e25Vp0GJXzy7Y2xCVFC+Ltnijn6+NAyMoywmyMvRQL jrWBFqeyxsjVHwpTVY3Jb/7iko4IcXYOOXykZ/D9YRGQDiiS1iZdkvrAIMdLGR0LU6MFeus9ZB+ 1CJ9ihMA2lnNqsDR9A3Kd1wkh1h5PtKiWNGjOsyj/82RRrUqkAUut4BpEsUKAjADxJBV7BMGtty
 6hxi+YAnWmDoDJSuyj4IyqAY+irHC+vxpQrt0bsotHjEYdURE/bRg4ivI2hTgGK5xpcAvxRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280136

On Tue, Apr 15, 2025 at 12:10:06PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:52, Maxime Ripard wrote:
> > Hi,
> > 
> > On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
> > > +/**
> > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > + */
> > > +struct drm_connector_cec {
> > > +	/**
> > > +	 * @mutex: protects all fields in this structure.
> > > +	 */
> > > +	struct mutex mutex;
> > > +
> > > +	/**
> > > +	 * @funcs: CEC Control Functions
> > > +	 */
> > > +	const struct drm_connector_cec_funcs *funcs;
> > > +
> > > +	/**
> > > +	 * @data: CEC implementation-specific data
> > > +	 */
> > > +	void *data;
> > 
> > Is there a reason we don't just skip that data? The only user I'm seeing
> > so far are the helpers, and they only put the cec_adapter pointer in
> > there.
> > 
> > Can't we pass the connector to CEC and make the adapter part of drm_connector_cec?
> 
> It will be either cec_notifier or cec_adapter +
> drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but then I
> thought that a void pointer makes more sense. It allows us to make CEC data
> helper-specific. For example, cec-pin might store platform callbacks here.
> DP CEC might need to store AUX pointer, etc.

Maxime, gracious ping. I'd like to resolve these pending items.

As I wrote, I think a void pointer makes more sense. Another option
might be to have a union of corresponding per-backend data. WDYT?

-- 
With best wishes
Dmitry
