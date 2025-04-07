Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com [17.58.6.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC5B14A4C6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028404; cv=none; b=M1MV+SeI+936XwrwqabugKcIp3vBy7LsLcTmsC7IshaFXtPsBCZs7VSXz4xSkoc4ikvJW8VIO2vF4TFcJ6a4NsaNvML7uRxA4hWQKf5HJRcO56BCofFrgvf9XPu0h6NL32i0BhLHVDzFw5ezsVmxwM2Zq+p754KyWVsWfe0cbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028404; c=relaxed/simple;
	bh=g1abDZwvXwceS+Lyb8/fvN1t0E10b7TNUO5oyLG7MSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLQYUlxIj6/YsgXAjnUvc8ZDqH4yJ30hVFDJQcwhpXlUnVw/fh9Qcv7MJeB5Xq+Q745egZ1QbJuArYKzM89gS/ijeOwMohWs/z9MD8K24QXj9LvmY2wKC+CQm5/XuqiFvmwBbRAgUzfOq70T6cF2W/4zhxM5oqaqeb1ENaSND7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=OEQQlaNe; arc=none smtp.client-ip=17.58.6.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="OEQQlaNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=g1abDZwvXwceS+Lyb8/fvN1t0E10b7TNUO5oyLG7MSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=OEQQlaNejqMomDvzKuEMa9mld74Z4AcWzkDYJJg9OfAsr/GQRhp3vg6HqOdZuwcDF
	 0ctEb7B+eYu/04Qr81dBnZ3PKpxkdE3MOvkVl1kPfoe2CKDE9CC83xuyWH2EadfP6p
	 1KOdHKfTEIu4lRcVSEMyIgsL4m4KBKhJ/kQ8albmpCyvVXOj5vGpKJQBWGr6SX29IF
	 0GrAJfy85mQx2P77RrMYVjCVWz47tYlfFqzW/9Iy+01/4wIDsvHpSGuQ/pbreSfKva
	 gTWlvmnfz/6Eo8YpsiKsniVusHc9cAn13nsT0W9g7FLDSVf9h12bxWGI4bSUib2Yhx
	 WXY534tWcr9vQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id 32DFEC8017D;
	Mon,  7 Apr 2025 12:19:59 +0000 (UTC)
Message-ID: <77d7aede-0e4a-4ef7-8b51-4028c1f677f6@icloud.com>
Date: Mon, 7 Apr 2025 20:19:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] errseq: Eliminate special limitation for macro MAX_ERRNO
To: Jeff Layton <jlayton@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250407-improve_errseq-v1-1-7b27cbeb8298@quicinc.com>
 <17f1c39447c3706387d62224018522d4dcbf85bf.camel@kernel.org>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <17f1c39447c3706387d62224018522d4dcbf85bf.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KDwk9knJ_vy9sp_CVpKj25u2FzucHiFh
X-Proofpoint-ORIG-GUID: KDwk9knJ_vy9sp_CVpKj25u2FzucHiFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=340 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504070087

On 2025/4/7 20:05, Jeff Layton wrote:
> Patch looks like it will do the right thing, but why change this? Is

just make errseq implementation more generic.

> there some plan to change the value of MAX_ERRNO that I'm not aware of?

no.

