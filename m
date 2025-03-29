Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2E199FC5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743255962; cv=none; b=uRXWlgOVrYUU2ZzSfIZ+srUepRlwY+QN/F3Ejba0dKqYOfMtTYji4zEndycrp4Yq3T6Q4A+Uh6enSje4MKzUV+59U4lwa1u2uG3N6csWx2kyfPRl3f4sC7h2vu6HZIAJJH+4vrUKmkNsBpfSBXFbKOmoqOMidpYd5BkyqA2DwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743255962; c=relaxed/simple;
	bh=HYdwye3DZdcM677XbFBhxIw6WnNA/O2L05nzuCBKG3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfLK0Dh5+qs9AGCaaR/t6W473Rtw2+n96TBqgM3gZ9BqBr6E7G1Tthm+9feXnidb2Bialun6UwZ4X6Vm5DiggxH4lbqfhn3DgC8eaMyNj6+aDO9pRBI1Wa4cGQzpxR+P+zH5/1cDYLT20x25c9bhWeurAhMMOMkU2ci/M0AK68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wCH8gELH; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wCH8gELH"
Message-ID: <3fb4b232-a0c2-4abe-a85e-2e4d938a22c7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743255959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpsKaScSHv7GrRRXDH8nchWWCagrc+J7SdH8scHXBkA=;
	b=wCH8gELHNGI3n2ux8QZYZAEchSEmxsdpuGiY4IBYA5VtNGhE2QbILw6yGJKQ5GesWesJFA
	3Sv3qMmqyY28js7QLFRhkehoR6a6ulwTlMSK7chAVTi5R+Jt/gn+0AIIF2OCT80lCCaM5l
	2Bgxd8H5BXzZ64ovRNFj4aCOYnQcb5o=
Date: Sat, 29 Mar 2025 19:15:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "j-choudhary@ti.com" <j-choudhary@ti.com>,
 "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "praneeth@ti.com" <praneeth@ti.com>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <8366a3d736f9937667aab024895a59e5947dd4a5.camel@siemens.com>
 <2c0b49a2-7cf3-4432-bab0-1eb110e8e8c2@linux.dev>
 <86d5d285a8467b3fcdadd3cf37ac0e4cbc874626.camel@siemens.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <86d5d285a8467b3fcdadd3cf37ac0e4cbc874626.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Alexander,

On 26/03/25 00:27, Sverdlin, Alexander wrote:
> Hi Aradhya!
> 
> On Thu, 2025-03-20 at 18:54 +0530, Aradhya Bhatia wrote:
>>> I've tried to test the patchset with necessary pre-requisites and DT additions
>>> with a single channel LVDS pannel and while I'm not successful yet, I've also noticed
>>> the following warning:
>>>
>>> tidss 30200000.dss: vp0: Clock rate 24285714 differs over 5% from requested 37000000
> 
> ...
> 
>> While you have mentioned that you did add the prerequisites, could you
>> confirm that you applied the (now older) dependency patch mentioned in
>> the v4 cover-letter[1]?
>> Ideally, you should not observe these concerns if [1] were successfully
>> applied.
>>
>> More importantly, if you are already on latest linux-next, I would
>> request you to use v6 of this OLDI series[2], along with the latest
>> dependency patches[0], as the older dependency patch is simply not
>> applicable on latest kernel anymore! =)
> 
> Thanks for all the hints and links! I can confirm that with linux-next and this
> time all the necessary dependencies applied, I don't see the above warning.
> 

I am glad it worked! Thank you for taking the time out, and testing the
patches!  =)

-- 
Regards
Aradhya

