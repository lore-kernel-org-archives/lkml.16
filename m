Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99B1FFC7F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663859; cv=none; b=sFti6Pa9phZUGrD5rpp5/fWW/oNT/LiJMCcAuc+PZ2qx+xIelPKC0C4ruqY46RX4pU4HkYKOL6HRlwgdJB5ATjw0SEavAUTonHBlpBpuWv2Q7e+QhdFjZcbbC2ejGfJv9dIyCHZKr+zyxbcL1oVhjcY54p+3Rof+bR+tBGcIn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663859; c=relaxed/simple;
	bh=Fw8NgxQcD9fVEfAoVkfELKPE0IKk9RktuiYWdSMwr7I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFkTZkqaTVXNHK2oWFtwne4EzV8LkAdpH6x4kYCMx8kcc43mONxCvswfNrxFBHT3WH6k48vpEp43kSMOuVGtrF3kekQKkBu2CxVKgvx9uGB48nNxjxETUE/rLLsS7yqMTZIdZVKngXvC1ppYN/5Qkt7rf7WoXF9mmX1OnMA1HAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pj7Ur9BS; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pj7Ur9BS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5144vBVS028367
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:10:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0O0kLXPr6xKpIy9qQM
	Rtdvps2/lNIvp6qmAIZzVh23c=; b=Pj7Ur9BS3AozYSZJrMZD+h7huNOlxmg5qk
	DU9RofNeUJa1XbKYHOQGotyu9vwF/fa8X8NGVPH6q+04vNUoDbf95ZiMHxDnIm5K
	h7wn7/EYQL7Bu1c+ewEmITfnswoMXjkJmf7KDCzly3N9vttgzaHS6lztir2pMMhy
	Uev2/a1mp8kM32tx65dmGum7KV4f//3z8YXqTz4XvwaC4ygEBWfrOxE82EmNOqeN
	MYzA5cPBcIFdzYXpq4MAWq3tZenb3lehAXbVUVq5qdz8Swb8GkihAIFkFMuCkzK2
	6UoPqtu3Ys2yh+ZsJx6Vd3lUSrq1fXjbMT3HKrrNDIq0rvCwA2Cw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm2uce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:10:49 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 10:10:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 10:10:48 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 10EE182026C;
	Tue,  4 Feb 2025 10:10:48 +0000 (UTC)
Date: Tue, 4 Feb 2025 10:10:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fred Treven <ftreven@opensource.cirrus.com>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] firmware: cs_dsp: Add ability to load multiple
 coefficient files
Message-ID: <Z6Hnp7ipO5s1+auC@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-4-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131195639.1784933-4-ftreven@opensource.cirrus.com>
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a1e7a9 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=TtFAky43XH_HMBXrFugA:9 a=CjuIK1q_8ugA:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: Scs4br6wXik_uNSv7hluDSseY0LUim4J
X-Proofpoint-GUID: Scs4br6wXik_uNSv7hluDSseY0LUim4J
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 31, 2025 at 01:56:34PM -0600, Fred Treven wrote:
> Add cs_dsp_power_up_multiple() which accepts an array of
> cs_dsp_coeff_desc firmware-filename pairs to load.
> 
> This enables the user to load more than one tuning file
> along with the associated firmware.
> 
> Change cs_dsp_power_up() to make use of the new function
> with a single coefficient file.
> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---

Can't say I love loading multiple bin files, feels like a tooling
issue, but I understand you guys have become fairly dependent on
it and the fallout isn't too bad in the code so:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
