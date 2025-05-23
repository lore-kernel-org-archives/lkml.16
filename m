Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E461531F0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029338; cv=none; b=QIuoh4oCJGXU5KWdavI7DMBkgb8qrgltaBGs+QDQ5agydICFWeiLIIey2nxlRFMzPNUR307UT8pDyLnQrfll0VUlXGENRZJIeLpJ3Peyh79jHMz8ZCeA5+IXDbvnvDT5wS8nmyQkjEwcN3bdUDbM2rV9E95jZSsIx8J22c4XA4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029338; c=relaxed/simple;
	bh=vggqRB8K93h/m3cLIrF81JSPM1zQ3Hx9nwM19BYafhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XL8AhrwQI3LMJ+cPdUq7rwir24aPosxibR9fYUDCtvyoW0p2VPh4oXS3G6HE7CaD5SupMQDE3VsnS9U4daSPXb+f5yVeLOH/JuP1OuUtAcmZi8ach5nGk1x/ruo5odhKsB73lVQ3W80XbAXzmjxJiz0HWFm4CRqUi2SM08d63o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1O7VeWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1O7VeWc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAaiCP013519
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDD8GO02V6xisZvlrexGxwobQQAXnk3SkEUC/8wzeJ4=; b=G1O7VeWcf0aMeNX9
	pvSRtOwpkX4xqzzI2UsHomt54kNwd9dYjxzXQ20gQjs6Vb+gFmuxxyP27kLoWcch
	GPJ7Hu5xTh3cpdy8JScSkc2J5gg+BAcKiJsYYPoCRDD66WIz31ajrgwRDhzRJwZ9
	5pedIktCpyqS96szL/MVzxmM1y8MeoVb22z7oMdRrGDnctvloLyRI2/Vf/4mc507
	jwkFZEq+FBobA1aDf14M9sEjJKVPuDjS6hPS+HC2ifuJx5/xRugMD9QMrVAHHd5Z
	Ef5kOjf9BWnlDM4oA+gO2KcWDG2OSqqM7FTMHf5FUxcLnnmjYYGKL9dVwjECg3Fz
	Khn1pw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5k9ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:42:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2c8929757so354406d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029334; x=1748634134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDD8GO02V6xisZvlrexGxwobQQAXnk3SkEUC/8wzeJ4=;
        b=Q1GiNb5VKzA8/uGr3LrePSKHw6KjINixzGrCFWoo31kKrr91MOKk/5yWlyofiLNZ9w
         P+7LR1Ht5EcpzOVIJh3+FG9FZ3q+J4l3sujBRWXOPpoewgBK41htwytr+zFKiL6Ro6ZB
         znC85rWckX2i/Mhfb+45P9dH4DRrkAukmaD5l2DVVxWZoyKasks3fSV+nCj0eyMhGHgU
         yKgshA5iYYHGGMtArwMT+hG9r8Kh+ettk3hidOqxo4OfgVk23l3QTHttz8pIwKNIBrbJ
         oeQ3v5BFv/AfFZ3ml/oCPFbqr4S+XPey+pJGWvSlk1+H01nqe5KS/7GnfeadC9m/Zq5f
         x9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh4Sk7/8m6XMghXom3/dLwT13kd/6acK5uQEKY0DQVLekWGpSppkh7UQequc9DivQ7PXkEYjQPGIz1s8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjY9JDH6JzEtqVy17B68oUrgVz3srkGaHA1LD1CgYeNTaCK9nQ
	78yNyk6sW7+0dC4o5JUteteg21epoJstW4bi7XIOnz5qdBmwTK6FJtFWpj031EyvJLoFMK4pzQu
	kWstUzqczvV8Hb4AKdhpUE/9UX9anzji6wff4bMoyamS3exh/1XRjo7D8FUwL1EVoAXs=
X-Gm-Gg: ASbGncviTtW6HePegwqkjRLOuh+ZXOv81xyjJAHcvRMHIRZBd603U8xQQ1sDq2LSPpG
	IrC6MXbQS/ShBKNuhFcYcqlSmYA+pRu3N5on6np9OuTK+M3kEmeTQHvH9JAgxS7eWqHYJj0HEV0
	Uvtl2dyTIWJBryPWa+LOwfKtIaOfpe3INWxNpJv3l1z3HO/uLh+r1h3cn/4Ve5Nf2tfaVuPIlfe
	gZKZUx3bJeSCCG2Vt4XMLQrEvbUuspQgCH1ooLVvD8r1KiTM5NI5TFERudyiga9STenqBBeI9xe
	jHpCxKfxhoW6QMSuFgI0w5OrKRH19+sB6ZWKqEpLtrKl+txXx72VziINpmmS8QlRGQ==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr3864376d6.8.1748029334668;
        Fri, 23 May 2025 12:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEakNeqD7PjHCb2lw3PkVQBGbw2mv8vCsbXcVbucJNPHi/LLt7DhFiJHbVdrvpunQbrFKGGPg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr3864236d6.8.1748029334246;
        Fri, 23 May 2025 12:42:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4b6d18sm1268078866b.153.2025.05.23.12.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:42:13 -0700 (PDT)
Message-ID: <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
Date: Fri, 23 May 2025 21:42:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use
 of_genpd_sync_state()
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Johan Hovold <johan@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Michal Simek <michal.simek@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-10-ulf.hansson@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523134025.75130-10-ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4MCBTYWx0ZWRfXxrajQoLSHxw+
 h4RYJyR7j4PQRSHYAkdfAa2rwgIxwWYUZG1PYbJCgr0bAGwgC8HsJhSloSSegKeljKKKW3Mv+BM
 gC3zDQXqYYRteQujXoSh5hYdsYStKneHZ8IJR9sjnir3Urcq0hILUp/idkoq/GfF867/WUE3CwX
 5m9Q3SPkcKIijVSvOkDebpEA1OYTYDreu7Nf1if4n2+DwbGVHh0Yl37JMTTcULcs+UkP5yx6BM+
 8Op21uP2OSH1fGXqN8uX3Vy49Y66wMARwE1AivgRlUqFxBXv2CCeQfmZh4r5pIuJZ+cfFvziorV
 0j12R0BK2MJRN8HqEBAbhw9MabHxV7C7UWAy/qzkR2kZTNNqXeB2k3utqqL/2+etBZ+343pf3mE
 bfg3ZPqeUbbysKvbSXgQtkyuT+RwjgsYYs0gj9PYVYKNjwPn6yHTj9EnDUjH1laErvb2esTF
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=6830cf97 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=_nM6lhH5BCRQepSfEGgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kiM_-rn15WbwThZJoudfrmx4u2QTwTn3
X-Proofpoint-ORIG-GUID: kiM_-rn15WbwThZJoudfrmx4u2QTwTn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230180

On 5/23/25 3:40 PM, Ulf Hansson wrote:
> To make sure genpd tries to power off unused PM domains, let's call
> of_genpd_sync_state() from our own ->sync_state() callback.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

note: the subject is wrong - this driver is rpmpd, the other
one is rpm*h*pd (patch 10 has the correct subject)

Konrad
