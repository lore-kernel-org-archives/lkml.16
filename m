Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95C8246774
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440379; cv=none; b=m17vcNsZWjE8F04vlgNXjFGWfBNHGU0P4w73LumS8VLG3vh1YlNXNut3+muOzAYG36Vxkn5tRwoiWZkJHEifBnNGzhwUWppyBp/euihZbZV0gGKMQxgrcLz3dqXsR5oALfCsHazRQ9ZQUFIcBKwF4F5v0Qh6pi8VZ1ipvrpyfAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440379; c=relaxed/simple;
	bh=ZM+bfC5Cy6/BIP9OgPrZkki/Bpj6SNjAkFXoj8Ys+Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNNjFWFCO9zxRxVRRWiYSUrEkZiyv+Fzkq8U5tnwpOEBjutO1NhG2nBA7hIHUnCHtXyKf4RBlxHSx3Y5hXFdLeZLNMNhXmgYoRAtOl+tUWCeosmztzPWCovS5TkbxjZQUDf10UImrYKNGjoyznbDUTZz+MdUUxgVjDCCe6mMowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IcMF8OcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IcMF8OcT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S82RGs010166
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uBOPP2nWIT9/99XuC1utjy9X
	r9ENEyP8GmiGj5aqQeY=; b=IcMF8OcTKzpCpORhkdZ+5HMQxFh8cpXzRL8dh9xq
	vy85syvW/t72U9pzGDYZaEjIibHFwKTEMF0i0+vR7siWRyWVKQ2S/xF6KSbVEAR5
	NSkywzlZatgJAYnomK4F7tQKUeOTnBkqZW28i2eWw8NA0daK3Sz/Z6Aa6pCmKAhx
	VqO+ik7C/3DyJJ7aXSdlpdyg4nIk50K2sUFvr0IDJNObnOJqwBvIO855rdX6njbs
	X9PZjdmjPNWpeyo7sM+kjkIv2JXtJq1ZyvX+2d9oCwAsEkWWbOKLbB8U4Ffl65KH
	We+JpV+Cn2GBGUAbx/GCHEZn7LEJOTQWqM3qlSrnKZICww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjtep1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:52:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab1b8d379so23210306d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440375; x=1749045175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBOPP2nWIT9/99XuC1utjy9Xr9ENEyP8GmiGj5aqQeY=;
        b=q3mmDpaMuecRq58D6w1xD72KPph0TaxfDh8AqwG8lyHCjXkMsJS5QKcegXLwoSGURP
         6cs43rsZU15EH0c/iekJEsxunGOfKh0v18ncoPpqeBBivyYcXPlV0kY4xFGUcnA3Lvs4
         A6kNtJnub4eRgstM/f6sTCSHfjmB8H1WKBrnJvtYPNkNEG2a4/ikAYlFD62H89qfztzO
         M3rCBqKP2eluwS4Ywo0YhsLU+Em4UCPr9sgX4qbSwIydxIHa2mroIfgsb4sfbyLpMRkO
         RPlsKy+KF/H2WoggUFw1bhJuugZbMgNlRC6Fq4SgVzPtcGRv+oq9T9rMHZ5K54M0wlAw
         FMPg==
X-Forwarded-Encrypted: i=1; AJvYcCVVmJNUB2NxwXGje+wuNe0mRb/WPVVMEQqQBYu8OQgTqfnw6Pk2IzIohTyU2muFlEm76h/ZB3bkx6hTobY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXI5Z8AaGBdziOPg1JNORfsS9RCygOaL56yh01U5zE6tlL/RUe
	sa6xX98R8tQWDWYAV3GS+eX1ybH0bX53Nxms0g3amRV3uCzdikrRe0kZXkEIxbXX+BSR3GKNbuY
	tPfnKHMDjQHeHUTNLzo03JsWBWBeRqj5PLzXVSivN+LNFfegPcqJhhL2cq7j9VpmX9J8=
X-Gm-Gg: ASbGncumby0q4Igi7Cg9RrzgAKtGKORaSb6TCmBDnm542HvqhqZd0RPKcgYmEScEt1h
	C3KINygTlHCZyYPbQVRG3bKY1imYO676yC9GWoIAJ5znTCXc7i5WWpvh+9cx7E16n4UVfJ6cMjg
	fQNqwRZM+MHXazNHcRjtKODSzGq4UuzElflHEmgY23zbUDS+TJn3wX/jbwiuycWte9RRP61ETVi
	ydiVHgSQ7teQ0K6hD7TLgTQb7bo/MEVHq3+H9I7j7HqEzPdYGlU2prEqzPsRf1NNdF1iRCQh0ud
	vmoAOPx+My1js4fyrd2XgfJq9lPW6mMtM7GwgFmu9Pi6etOdBMNkVjAQDrGZl1gtwM+wN02Mo5k
	=
X-Received: by 2002:a05:6214:f0d:b0:6fa:c043:7781 with SMTP id 6a1803df08f44-6fac043c742mr27775706d6.6.1748440375240;
        Wed, 28 May 2025 06:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNkR85opKcDfwQLxCDd6W5iPsD1U2otytKAVtAxdS8qF08guHyXNDqm8ewQIw/BFu5tF2iEA==
X-Received: by 2002:a05:6214:f0d:b0:6fa:c043:7781 with SMTP id 6a1803df08f44-6fac043c742mr27775336d6.6.1748440374835;
        Wed, 28 May 2025 06:52:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a5fd9sm291521e87.169.2025.05.28.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:52:54 -0700 (PDT)
Date: Wed, 28 May 2025 16:52:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Message-ID: <o3oipiu2hotkdbihnlpamq3lmbpxrlay5tyvmir7qnbqhrdq6u@d52lzumxexva>
References: <20250527225120.3361663-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527225120.3361663-1-heiko@sntech.de>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68371538 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=A2JJf1eg9WQolHiAK1QA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lfenAXbUKeR4lPDsqtL-4nFN9jmXDDKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMSBTYWx0ZWRfXx58qXha9vuE1
 uhie4LYueR1y2BHHjEqJD/ErvERa38pZdkox4KXHa7D3hqwuiVaB01Em7YWUT0Y5ZeugVPbfCWe
 EQdpix2WPgJ3ssOzVkx7YDIYBbDrXs9yZDGOTRjFCCHgyahPEAnW2BBa40vP8wOSBoilgIQC9A3
 MAFa7MxPQdC7Vh5OaJliU1WZz1N0nTMBS5nZ19e0IrdewySmA39F2efQ1JQr/5l5dC3E8Dkhj4I
 UWSAlWUml0OlGQ9cBbyLDoofsJUtVZDCjz7hqEKcun8PpOW2rdZyCljtGcD9f/7HpCpV9yeNL1f
 5t0YOvwAf2h3iCr12Bj0PTCFJBEGum5dyH+Y9T46Yh216jsHRm9NZxAndzox1zNZWEeMOM8lxsB
 JpI7rrlPTRxZaMfCZzjVaV0wppdnPHSnPzXmH0Et+1siaN9yTkadrL0qn9sLs5afUDCY11iu
X-Proofpoint-GUID: lfenAXbUKeR4lPDsqtL-4nFN9jmXDDKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=966 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280121

On Wed, May 28, 2025 at 12:51:19AM +0200, Heiko Stuebner wrote:
> Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
> calls to clk_disable_unprepare() during probing") removed the mismatched
> clock_disable calls from analogix_dp_probe.
> 
> But that patch was created and sent before
> commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
> from the DP AUX bus") was merged, so couldn't know about this change.
> 
> So in the original patch the last change is
>     if (ret) {
> 	dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_clk;
> +		return ERR_PTR(ret);
>     }
>     disable_irq(dp->irq);
> 
>     return dp;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dp->clock);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
> 
> the analogix_dp_core.c actually now has the runtime-pm handling between
> disable_irq() and return do introducing another goto err_clk_disable there.
> 
> So remove that one too and return an error pointer, to not create build
> breakage.
> 
> Fixes: 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> When I reviewed the original patch, I failed to see that difference :-(
> But I do wonder how dim was able to apply the original patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
