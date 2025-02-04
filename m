Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5D1FFC7F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663439; cv=none; b=jfU7R5fxjmMMjpNI4YNXhB8Gw6EXDKMoR7FdwPBCIEOfaYYfbrhK4RUQahOqyJMfotLXry/qE9xeURhfajLVJIW0ms2p+nUfeYQE8Y2S4T8gwuQy6bKsG3YtIY6DQJSNFqqLZ94BfOr85dP7oAURQXJ61PVqBbfjfHcjnEzpq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663439; c=relaxed/simple;
	bh=6DuDzct7+xvboH6MUpN03RHBdW7vfqUR9j5SJqIWudQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AG+aebybEGTYwjMlbCOKZWo3tnoy8U8kzDbf4jnY1tORHSdjSnmndrw/rXNa6vw4ckEMY0bQRFvjI9XzvcwmuBmFaq19eeS8Tz1+l57KvO+IGb/NZg6aeHGiC3Jeo75NfWlUgCf9tLNKKJdUg6I7fjrxWBpk1KTx4xq51LZwvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CNJhFilq; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CNJhFilq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5146q2C1015513
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:03:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Gt8xOJ0mSQyNSK2wtr
	N/+vbeIDt+sHV55EHYEd/6i64=; b=CNJhFilqq6gLFRj6j3rLL4B+u1tkghCueP
	ypWsMd5uNMtFRQG1ZcN5/9Z50SmYy8hIXGOSv7N/xiwdeRs5M3ruJ/wOwcOU49Qj
	DZyHkUxpw6vVk34xeHoMZEVxcgQbxQri/pCtIs804v23gFmQg7UbYbGVlJ6K/YPU
	f0Wsbd7Inx9XNAwuNpGWtXZTggFE6I4hZNprxA15+NRTspIejGq3xnBLhLbKmHW2
	A0oIk+6qM1Ey91+OsByWHn5LgMeT2iCOq917y/+6v0a1w82pwFLBHF4Rbv0+P5gN
	AHXMLebiUiApd8K0eLCR3DGqGbzSI/VlVB4qc+XiQZeIadkvmBJg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw52qdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:03:50 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 10:03:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 10:03:48 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D644182026C;
	Tue,  4 Feb 2025 10:03:47 +0000 (UTC)
Date: Tue, 4 Feb 2025 10:03:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fred Treven <ftreven@opensource.cirrus.com>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] firmware: cs_dsp: Fix error checking in wseq_write()
Message-ID: <Z6HmAvLwpwmmXd3U@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-2-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131195639.1784933-2-ftreven@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: C2PUhipE51wMDh-VmaFDQdO2-rJ0VWsA
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a1e606 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=GMewpXodn5kSIrv_U3UA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: C2PUhipE51wMDh-VmaFDQdO2-rJ0VWsA
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 31, 2025 at 01:56:32PM -0600, Fred Treven wrote:
> cs_dsp_coeff_write_ctrl() may return a non-zero value (1)
> upon success. Change error checking in the write sequencer
> code such that it checks for negative errnos rather than
> any non-zero value when using this function.
> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
