Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379941FF1B3;
	Wed,  5 Feb 2025 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784396; cv=none; b=WPqHyGnKEHufa9K71UC8vf9k/DGbbNxftHBDguZGIrfW3SBdM2rb5MoaYU6kh1p82pe2KWpeRYUX+pQ2FIcJ9p6ObBpvvZK0vkYKnLqrZc8trcq7RexMiBfzCQIpsKajpQDn9dv8TiE3gJiBRgJpnTiCMux1HmxgHBYqioUC5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784396; c=relaxed/simple;
	bh=1+pjZX0yI9VGx4g/jArQXgMJDFPmVY4mV4iNBwxFLzM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al6Vj/WxNlk+raVv7RFUlxPLRHIh9Gthq/fgiRq5cpfIFz5Ukv4dUKL3paJqJsHoJUKFP6T87lzLPXU14WlK56qKLuIcqpO897lGVsoSoCYphv7qrWpW4vblHCOKtEno+ieB9c/G2bZsiNweSC3E9kTTUebBlmh2/IcIdNC0sVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d7/N4yp8; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d7/N4yp8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515IaGGk002905;
	Wed, 5 Feb 2025 13:39:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Gll7V5YWZGjjh4jNat
	GfF8hrFl9HCpALYIBVlqjYL58=; b=d7/N4yp8BjFx6/YQW2eIyoRtTb24U+cy9B
	DfczJHy6EDs+Gpv0NLCGizb0RQ6o0RZDieVuLIJeL8kp+5XHraBxhNLc2jqsB7Le
	9+397/S/v+ucGUuHILFfGpa8xcMT8CT8RMotcLQdqQ4+DUcaSYqQ7Ercgi7/EAOE
	L7+Cirn12Cav8mP+SZSQlJV0nKUKZFRu65j4bPg/9JuFiCWH5Haf//AxVqJgrEjM
	D2JzSYC/vx15dXKFq30q854jgdepF18rM+yPC8I2aI9mzoi3g9bScnQxV1KcfWvs
	lTAx9sa2PBSD71RicguhWnGf0NZFHaIkF6bGmT3yqDzWHG1gXT9g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4x3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 13:39:46 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 19:39:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 19:39:44 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 3D1FF822563;
	Wed,  5 Feb 2025 19:39:44 +0000 (UTC)
Date: Wed, 5 Feb 2025 19:39:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: arizona/madera: use fsleep() in up/down DAPM event
 delays.
Message-ID: <Z6O+f9nsGLcvYrHj@opensource.cirrus.com>
References: <20250205160849.500306-1-vitalyr@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250205160849.500306-1-vitalyr@opensource.cirrus.com>
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a3be82 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=IdwRCrQQKRYHaIMh1wcA:9 a=CjuIK1q_8ugA:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: S1YYpSjcjYlhB9SsyIk807Z9UBPAob84
X-Proofpoint-GUID: S1YYpSjcjYlhB9SsyIk807Z9UBPAob84
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 05, 2025 at 04:08:46PM +0000, Vitaly Rodionov wrote:
> Using `fsleep` instead of `msleep` resolves some customer complaints
> regarding the precision of up/down DAPM event timing. `fsleep()`
> automatically selects the appropriate sleep function, making the delay
> time more predictable.
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
