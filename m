Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDAD1C6FE8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622838; cv=none; b=C1dIATTN3JbmuKg4RQ3VemboS32BKomDPA6QPzKYou6hGqpERgN0MXRQjLXstJm5yk+tgwJmFXDVCWT2sUwmnx/X+qw832bE+x8GPvJ/EzUajGXL8OTDWtC2LIF90aCBSioz9h8vuPKKPh/z9ZMzUPNr8+Hn4WAKjUzYBw5HSjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622838; c=relaxed/simple;
	bh=/bLJrvclZOkbWx6KYa3dHosgr8pdwwAJZTB1U1woF5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlrVhBYD+5NBTToLE9zui14MiXvxlIMzGpzhDUBbLpWpP88XPgUVUuJy6S7a94AVDajMk8OW44YAFm2B1w0Dxi9FjWWYKQhJgWwKpc6jpYpkMyc+sHRcF4vU2PMsn3vdepoFl3RP0gA184uZ6ynBI2JIPU50Ul2xTrOCsvinQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcweAjVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcweAjVD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAhHo0031510
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=dcweAjVDE/LjqPwp
	oTZoLRzOpQtI1JYDCMartltY2c5NB7YMlo/dTDRPndvS7pd9PPQfhgSBch3PEh4H
	oc5W8IPBmxXc8y9f0eJegWB4pykMBiCEZN8j+v7aGdrixd7VyGS2/kjhy0zo0QqA
	XUgfiq0u1OrBVtwV/38j7YZVZ/qTbTyZsx+lQ9ewM1baMS0WsetNFx0znDmQ5qfz
	BRdtzazkc4/gCaP/Gb9+EA695ygVe/1eKNTHi32s/wCYmY4odDJHX8u9qVCsOZJk
	9jXkDDFD0qe9Gq1ZUFCJmTcOm/GSbItFs5zFtondN5eTlNacUbBVYKOzoLNvsXQH
	LTVIag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk1t8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:33:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742aa6581caso1792856b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622822; x=1749227622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=;
        b=k6oyMqdsmmAwgiBHDhfzbYAAUuYRNwoczSTUEH7tNixcz/QncKi/W3JQsN6POswKrL
         Q+mNcvjfAnpT21b6iGpLFleXb1jEO/s6RVAQg/QL2qHQMRps3QtC942pDko0jKNA09T5
         M45Phu68uXfUjG4Vk9NRYcsyWzHqrBMfBsjUOeBjUHE8XVkN0wuyHSfLowbzUYGxvrhe
         QoQxwJHO6jjUmtYjuj44/PnC4YBHlHebtF5h0TsAc2/vpDF5Bibmk2OD3OOY2QdG5V0z
         5nl6QebGKRjbLnGbD5cG72HqGny+2lk67BT00lJrHDpX5OvhhOOjHrMRxw8/39LTIpio
         5OdA==
X-Forwarded-Encrypted: i=1; AJvYcCUjz2iW48uRh6xMMaf3Fh4mysH4vWEAraWLJk2Fc4yfN/S0D2tA2CbB7Ghg5UIwBaCuGgIcBJJ07bSmwyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL07pKCmhVNCDmA+h0OWGiKL3GFcjv6mKByL70YsbfMrZTGuJ5
	OxOBg5+TYV/SE6JP0WjsT9bVD4C5r3ABuTDcSafhTXCWUhp2/JKOBY3tMCb+spU+qVnB41/ccVA
	BIYTLCU2N0cOARq+7jGnoTTlHZQwDAdOmzAU1dYMpGQbHDGMwPZ9pTU8nRdukhKqTyz4=
X-Gm-Gg: ASbGncsCFsGycoB0dqZ+cGJAyV4sWwsSM2NgXt18pHiiCCIu17tA7SemzjhCzWqD8Zf
	fAWtVaUnStp05wddHLS059yrdsU+o/eA0i1B887xd5M4tYAo+XjFqlUodJBE+ipLHydeMPMlbDm
	1+uiIDxbXtyKg3j/RxSORySYut02RHiHx4HlhPw+NQkt8VpenM7lW0Yb4bN1i1kVIOQy0Gxxirs
	V3cskQW49Ade2oy43BLqaK/wB3thvDMwUIwm6KsdFIABC4X84zgWaF96J/4AR6s/Ms8kZSvKIMd
	XfnZe0k02BHLqs41ocUwb7BbGNulo+2Rs1vFDBcZSNKib7zcZ6kxWTrm/x6CrA==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832885b3a.2.1748622822622;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqNwQxZU0xTr2WITGJuLCEWHrD4jd+DcWqKzqx8uZbn4MTH/bomjNfm/KY2N3fVJbrV50ng==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832859b3a.2.1748622822240;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab820sm3347905b3a.60.2025.05.30.09.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:33:41 -0700 (PDT)
Message-ID: <34a9bf5e-34f1-46ee-bebb-96bca551768c@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:33:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839ddf1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=YifSY7n-Kb6RBMa0OVQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ibp05G25NB1L-HimXGacZajbqi4M3TZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX3WiVNOYf7s7t
 jh943wcYXN9UbvSPVyKIK1EhuRmCDoat5As9M8yp1d1IVUNbk4kLXSRb77sOlnp7XdA4V+Ed+0R
 53DqRwnDMvtC8wN4PUjCdWpLAEn1kZe0oQo7kyswX7fm2bLtpN0khstgfwcFFUzipZWuxU9wtvI
 gvkq50QlLUFLxR1sxhkxzBuq+PpOG7K7+iinzhixMWMeMiLS+SO5wjBRmvVs1uharGs1Q63wJH3
 9vblU/2xee38mKmQa63QGk4EctndlfqAO2jgbIHDB/mXqXsoYnxVIQ1XmtFpmOkayFAD+rH8ry/
 EssCgkVBP+xkiqfkL4FeVdwMEdrrVsS8Qgn/1O9wUl8zUV0aOiMm3IzeaRAbvRuOeoejLS8dcra
 Z2C6Or9pV1CNU29ng8zEbrLsURGiuSFIJntnkfopto8RrMSRjUFc1ndS8rmHgDMtztjCruCC
X-Proofpoint-GUID: ibp05G25NB1L-HimXGacZajbqi4M3TZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=859 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300147

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> -	version = rocket_pc_read(core, VERSION);
> -	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
> +	version = rocket_pc_readl(core, VERSION);
> +	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;

This seems weird.  Feels like an eariler patch introduced a "bug" and 
you are fixing it here.  If so, then shouldn't the origional patch be 
updated?

> +static int
> +rocket_copy_tasks(struct drm_device *dev,
> +		  struct drm_file *file_priv,
> +		  struct drm_rocket_job *job,
> +		  struct rocket_job *rjob)
> +{
> +	struct drm_rocket_task *tasks;
> +	int ret = 0;
> +	int i;
> +
> +	rjob->task_count = job->task_count;
> +
> +	if (!rjob->task_count)
> +		return 0;
> +
> +	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
> +	if (!tasks) {
> +		ret = -ENOMEM;
> +		drm_dbg(dev, "Failed to allocate incoming tasks\n");
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(tasks,
> +			   (void __user *)(uintptr_t)job->tasks,

u64_to_user_ptr() ?

Same thing down in rocket_ioctl_submit_job()


