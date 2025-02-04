Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0625CDF1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663585; cv=none; b=BtwV33J2fLiZDsw71CZNNb19gGwJ4aiBzvqgq+4BLkXkXrHZheqjzjZIz0pRZc8xEacQMjTY7TkKvtPT6eTnw5vc0jSKkmBcdUozby4dfw9oAHQyabcopInqPmZ9tXhgdZonNvnKAfVJ/Gqjj5rHEqqVpBsXJF0MypPowqYdhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663585; c=relaxed/simple;
	bh=C9YDScluW0ynmRsCyflXNbsC2eCZ/Z4sqNtX4Rstnc0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeC3eRZrfeBPokC0BN6Gsx4Ethxx/zeAH/B+Dqwfi1U11Q2enoczbz6tmd6gXX2urtBgkGTDDhIcF+WhopTN2Bg/2eaZA5efJLUKMJajPRv5oa9nCzf96ISjemDG53aF846u70x7TqxPZTL1mi/Vc9/FOmIgM9spaDAoeYvWPVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eGoJ8CG/; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eGoJ8CG/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5146q2C8015513
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:06:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NvX23zqwjUIC2hmVmB
	BGe2xyDtlSc9jiGzK3GBos954=; b=eGoJ8CG/wWkAHNJooSuJXHmTQGbqJl05v7
	kGcwlI/rPN0PNsfm4iFs4YlgOCLItR1A6ujQwGrpkTZ537dcFtk0ItP2NBYLaBYn
	kxszhexWUF0u7jZiQgCloMORyV2ZINNh17M17jHyVzGwEqD4kEwplyY51C4lCnaO
	IofRn9DbIND6BAmjSh5TMUoFCiJCJUSpxiPnocAoSNiehEn1pf7rfBQ2XUWyf0L8
	+Ad7VRE3QQPaq0RMMg0XlAOHvq6+WtDCSqtCev14hreaiokmUPVb7Cgt7nMSTZAC
	Iwpz2TcHQYUSdKhqBJIvm2ix3KnxGHLzVAf94NmC0spAdqJUL1IQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw52qg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:06:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 10:06:06 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 10:06:06 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E47B6820270;
	Tue,  4 Feb 2025 10:06:05 +0000 (UTC)
Date: Tue, 4 Feb 2025 10:06:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fred Treven <ftreven@opensource.cirrus.com>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] firmware: cs_dsp: Check for valid num_regs in
 cs_dsp_wseq_multi_write()
Message-ID: <Z6HmjEBIOfQYomXc@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-3-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131195639.1784933-3-ftreven@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: q_L681N0gwMX3eBXbD_5B_TNJRnVhW_E
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a1e69e cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=SYdUqKl3WrJMBqUcNvUA:9 a=CjuIK1q_8ugA:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: q_L681N0gwMX3eBXbD_5B_TNJRnVhW_E
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 31, 2025 at 01:56:33PM -0600, Fred Treven wrote:
> If a value of 0 or below is passed into cs_dsp_wseq_multi_write()
> the function will never enter its for loop.
> 
> Verify that num_regs passed into the function is valid
> and throw a user-visible error if not.
> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---
>  drivers/firmware/cirrus/cs_dsp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 56315b0b5583..aacf6960d1ea 100644
> --- a/drivers/firmware/cirrus/cs_dsp.c
> +++ b/drivers/firmware/cirrus/cs_dsp.c
> @@ -3743,6 +3743,11 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
>  {
>  	int i, ret;
>  
> +	if (num_regs <= 0) {
> +		cs_dsp_err(dsp, "Invalid number of regs: %d\n", num_regs);
> +		return -EINVAL;
> +	}
> +

This feels a little defensive, do we really need to check for
this? Normally num_regs is going to come from an ARRAY_SIZE or
something.

Thanks,
Charles
