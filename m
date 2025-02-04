Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CC2B9BB;
	Tue,  4 Feb 2025 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706097; cv=none; b=ULKicDes6COqfhCttZbCXQpHVGT0HeCHVfaiFGUizeBvYjgyJXxPaqQwNpdIHwFo6QSTWC37pDA9F3/ZsXUyrpksEGpkLbi/5h/lzfywnWdUPDbRStt7ACIOO4u60Tywo2PVTMOzWx2ymE9kqbHGGfx0ZK25oZ2cigj28awoXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706097; c=relaxed/simple;
	bh=ehHCPJY0FnfRz7IYPv4nIQr6fu4kmOIOhoAW2H17STg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oJZzrgvOtVQ384XVertl+gf8LfAaNtV8uYdXtaORCPhyvZ2vnGFlXEi8Ee/yzvS9MYvtDmqbjZAE1IeZL264Aj8Ir10BQdQtygjwiTqf5fqf05OVmDf4eysJN3Ndb3Ou2xy34Tm2zdSPtUkWtEi/ifAKLJGh5Gj3G/klNslnRes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aeuGydGI; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aeuGydGI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FmQUb029185;
	Tue, 4 Feb 2025 15:54:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mBD5qOEoUg520WYHfMX/nY2QK9RRTXpTe2sdVDdtZ+A=; b=
	aeuGydGI12cY3C6G+NWFOIBbTgUcBBKmpgQz3rix1eYUu77iMmslivT1B8O6YXk1
	t9uczjkrnEifyIa3S89UmWiAs1buh538C4rNSfXnBOye+7agB/R/3rSO+ld3UPxY
	Dltkj86zXVTuSRBgeMSryV4YizV0lf9AGEO754wBAjcnaJRp+VjkzhyijXRl3T59
	F2bJzI2WfeaIn6RM/vXONIZEOck6B+jP3r6d0AAxJpF+v3srgJFe3nUK50vrgRhf
	ahhJotCq6c39UTXo91RuVMu0vTXP94ITKSYgVWVMwooXc/grDv/+npW1ukOY1qs0
	Y3mtmTbK/vImy6IBpUTr9A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53kpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:54:38 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 21:54:35 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 21:54:30 +0000
Received: from [141.131.145.81] (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 33383820248;
	Tue,  4 Feb 2025 21:54:29 +0000 (UTC)
Message-ID: <2112e5e6-618b-41d3-ba8d-168d4a72f501@opensource.cirrus.com>
Date: Tue, 4 Feb 2025 15:54:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: cs40l26: Support I2S streaming to CS40L26
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        "David
 Rhodes" <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-7-ftreven@opensource.cirrus.com>
 <a8a9fb40-ec8e-4e65-8de7-b9f3c708a45e@sirena.org.uk>
From: Fredrik Treven <ftreven@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <a8a9fb40-ec8e-4e65-8de7-b9f3c708a45e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VzFtPqeD9r4gGhlI7v1cA64p_YRVASl2
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a28c9e cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=CqQn1REhnQTjMiyCtTwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VzFtPqeD9r4gGhlI7v1cA64p_YRVASl2
X-Proofpoint-Spam-Reason: safe

On 2/3/25 06:23, Mark Brown wrote:
> On Fri, Jan 31, 2025 at 01:56:37PM -0600, Fred Treven wrote:
>> Introduce codec support for Cirrus Logic Device CS40L26.
>>
>> The ASoC driver enables I2S streaming to the device.
> 
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

Thanks for catching this, Mark. I made a mistake when sending the email
since the patchset touches multiple subsystems. I accidentally only
sent each patch to the maintainers of that specific subsystem rather
than grouping them all together. I will do a resend to correct this.

Best regards,
Fred
