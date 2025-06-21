Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281EF1426C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521136; cv=none; b=O0Iyty1QsvlS14jYEgn1gryAwFZOIVjcY7tdGHLiSFz4hz/MSW2GgethX33wopsFAv8EnOl6DdCqmY9SwD25i7DVbevPc5J1fxOeWlsv0H848OionL+SzZmO3zF8/w3zficS//wuK89qXd6iJt9idky5ahTjzXFV52lK169rMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521136; c=relaxed/simple;
	bh=VLhYJJvwC1sREIFtKWid5tXS4FQzHm1yGiA8zdVyCtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsw6xk1aYxAO+1vkcVJdFGONifl23y133pPi5iX+VXVs0pR2cYXQxFEsWLuyBOS123I3tm2JFOqlm6zHbqjG+CGbQfIpbipopWL6joPlIDcIt2jiGqZDt6pWurBBY1TJv3EWGKcNquRIkk8/RZ8fAn+7QBcsJpmMbb/lGGDh5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHF+xY4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHF+xY4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54191C4CEEF;
	Sat, 21 Jun 2025 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521135;
	bh=VLhYJJvwC1sREIFtKWid5tXS4FQzHm1yGiA8zdVyCtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hHF+xY4A8stbK7vvN8JxRfCB6vYxmNBO5GgI38945Y5S7mfh7qxVVuToCVqSg1KO8
	 btQD/Z+3Zntfojljq/NHKzNPdNRVJDFp9GhOEdsPdVwdnVzsHFA3z3QiQKenc8gBSg
	 ZAVBkUwVI1VP1fCiW5XWOROWic5FBl/rjU436T/xmH7kqYtQFgJuE0dXqmBPCg8yxa
	 dKOZ833Yqs6Jw8R0Y61toZAGWQ+KORe7KrNs23wo90gDWd4KHgZa+JVcXv7np8H50W
	 l7fFHFY/Od8/cO1aL+7oCipM2/KsDlvAaFixkpXUEO1Wb3iMVfjgBZ+x2KsBaoccrh
	 fisj3d/Lx+KtA==
Message-ID: <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org>
Date: Sat, 21 Jun 2025 10:52:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMDGPU - Regression: Black screen due to commit
 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Walt Holman <waltholman09@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: mario.limonciello@amd.com, alexander.deucher@amd.com
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/21/25 10:18 AM, Walt Holman wrote:
> Hello,
> 
> With the latest drm fixes this week on 6.16-rc2, I am experiencing a
> black screen instead of the sddm greeter and the GPU appears to be
> locked up. I can ssh into the laptop and reboot it, but that's about
> it. I have bisected the commit to commit id:
> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
> commit, the system works as normal. The hardware is an Asus Rog
> Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm able
> to test patches etc.. if need be.

Hi there,

By chance do you have an OLED panel?  If so can you please try the patch 
attached to this bug?

https://gitlab.freedesktop.org/drm/amd/-/issues/4338

Thanks,

> 
> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
> commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
> Author: Mario Limonciello <mario.limonciello@amd.com>
> Date:   Thu May 29 09:46:32 2025 -0500
> 
>      drm/amd/display: Export full brightness range to userspace
> 
>      [WHY]
>      Userspace currently is offered a range from 0-0xFF but the PWM is
>      programmed from 0-0xFFFF.  This can be limiting to some software
>      that wants to apply greater granularity.
> 
>      [HOW]
>      Convert internally to firmware values only when mapping custom
>      brightness curves because these are in 0-0xFF range. Advertise full
>      PWM range to userspace.
> 
>      Cc: Mario Limonciello <mario.limonciello@amd.com>
>      Cc: Alex Deucher <alexander.deucher@amd.com>
>      Reviewed-by: Roman Li <roman.li@amd.com>
>      Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>      Signed-off-by: Alex Hung <alex.hung@amd.com>
>      Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>      (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302fdd3e5)
>      Cc: stable@vger.kernel.org
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
> +++++++++++++++++++++++++++--------------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 

