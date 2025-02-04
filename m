Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16125A623
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706752; cv=none; b=nA7J3AzptLb7N6kZ3SAW6ByelzVItwIYeE3gj7Gn1cHKBgM9NKGcPpEKlgXE9m+G6cGT9IQ/VjecS2dc30fWGsoUl8qc/+9qJ6jrq3JlIPsFR0u1QLEuQYebwDYWD7LCTSrLd95AGJzM9ngQjLap05BMS1+blkHSPgHIVAGsdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706752; c=relaxed/simple;
	bh=AdiCSBVxOlqqPu63Ecqn2BMpitnFHB0e8Nufu41CaSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f57tQjhm+FrL6ZymsBGVByygqlU8m/3hDY2ykRm9s10bCqgF7ariSccwpJE2mF2x6NWfiOnSs+U9pzfynehfyymYaznUe8rjivCtViWy6drfGR3O5oLLrQqmlFRvzawtRe8kHMXn/51bF94EM2xyczn22JWjymhs8CGan+4j+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=k0Lk2dt5; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="k0Lk2dt5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Fmw5l029853
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 16:05:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kvudDYNA6wlrXTEXWyFY+dUGifGX+rW9X2OSemddMtI=; b=
	k0Lk2dt5Qs4DXNpEMJzqEj1oHDrbswsowjau75vxjg66bfwdO0qy0D+mZTxhgkCH
	ZfI389NJX0VySQ7rFAPjEoey0Aq9ZxVSlLsTX/aka4szIYeIJkJEz6ehWShqnwfx
	dMh4I/lcHqtem/NI0yH4+SZ2hdz9E/WudbfgtiCvhuVh5xlyRP9ZowpzcDFmi/jO
	VmchrbHc0a3wVwR6LDdME3zPzGtCSGP8kLNbtXt7jVdACRrK+YRvUH3RXjepdn4O
	DB0nZHnUmjj2K8IncqT5GKhvSn1KTH2Vug3q0PP1dvk1jaAj6J/uGx5leZlT7Kr6
	gbUCXGCdYhsRUh9Bn6lJlg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53m1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 16:05:50 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 22:05:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 22:05:48 +0000
Received: from [141.131.145.81] (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2B0C5820248;
	Tue,  4 Feb 2025 22:05:47 +0000 (UTC)
Message-ID: <3cf81195-80e2-4506-9c16-12998a42984a@opensource.cirrus.com>
Date: Tue, 4 Feb 2025 16:05:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] firmware: cs_dsp: Add ability to load multiple
 coefficient files
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-4-ftreven@opensource.cirrus.com>
 <Z6Hnp7ipO5s1+auC@opensource.cirrus.com>
Content-Language: en-US
From: Fredrik Treven <ftreven@opensource.cirrus.com>
In-Reply-To: <Z6Hnp7ipO5s1+auC@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IxOfeaLxWBUzrJhYvINpgKn4xSTSEZgi
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a28f3e cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=G8G4Rjoq71L23QwWqRcA:9 a=QEXdDO2ut3YA:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: IxOfeaLxWBUzrJhYvINpgKn4xSTSEZgi
X-Proofpoint-Spam-Reason: safe

On 2/4/25 04:10, Charles Keepax wrote:
> On Fri, Jan 31, 2025 at 01:56:34PM -0600, Fred Treven wrote:
>> Add cs_dsp_power_up_multiple() which accepts an array of
>> cs_dsp_coeff_desc firmware-filename pairs to load.
>>
>> This enables the user to load more than one tuning file
>> along with the associated firmware.
>>
>> Change cs_dsp_power_up() to make use of the new function
>> with a single coefficient file.
>>
>> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
>> ---
> 
> Can't say I love loading multiple bin files, feels like a tooling
> issue, but I understand you guys have become fairly dependent on
> it and the fallout isn't too bad in the code so:
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Thanks,
> Charles

I agree, and it is technically possible to combine the bin files into one.
We have strongly suggested doing this to consumers of this driver, but
they are adamantly against it, sighting the fact that they want to
maintain the coefficient files separately on a per-algorithm basis.

Thanks for your understanding,
Fred
