Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865E4C6C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211047; cv=none; b=ND00t1m4TcnBppQ160j2uCdk5/g1Gptyq2qXP4ecRqpPcl+FQ0TILJgR+KXkr9yEj1658HdaThMMx82ZNExg7CGxx0x/+yuftQE4Wh3h56U312DnvI0Gt3H5VR40CFxGJY8eUuv37zqlijQ94r/j/lwBpLaX5Mf52FnEsRznWq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211047; c=relaxed/simple;
	bh=S7mfk1HdTzLSLmpVIW7q3D+ovdCW9ja16x7BWEHeXk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNKBVxvSDp63Oq4hY3FnHMOSkCYwmCO3oz7o8JoFNiuNMNVRMY5sf2HGWnUBYu2FL04x6gZPU2holYzJ+MhAas3adOfgQ5D/yH8vaFmcrtxgcuJgAg0DpEdw8FJoA4lVVgJ1Wy2r74ffC1K/34m9GkQ5+k5ajb0Y2bjJZ3V+EWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af522.dynamic.kabel-deutschland.de [95.90.245.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B9FB061E6479A;
	Wed, 14 May 2025 10:23:45 +0200 (CEST)
Message-ID: <12cc81d5-f134-4460-9139-754a69821f12@molgen.mpg.de>
Date: Wed, 14 May 2025 10:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff: firmware
 crashed!
To: Jamie <jamie@stimulussoft.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
References: <5aa2dae4-94ba-45cb-b138-bb40c89a85eb@molgen.mpg.de>
 <486e9f27-3b03-4317-a1fc-1bd92235db1c@molgen.mpg.de>
 <90a764d0-c230-43bb-b7e5-189544839f8d@quicinc.com>
 <e2e58098-4589-4ae4-bc38-6b009823b071@molgen.mpg.de>
 <82b9e966-5e12-4a13-98d4-0ffa88505f97@molgen.mpg.de>
 <1909038a-bde9-4def-bcb8-0f67bff5c62d@stimulussoft.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1909038a-bde9-4def-bcb8-0f67bff5c62d@stimulussoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Jamie,


Am 14.05.25 um 10:19 schrieb Jamie:
> Check your voltages. In my case, my voltage settings were wrong.

Where did you do this? In the system firmware?

> After adjusting them, the drivers started working again.
Then it’s a different problem. I am using a Dell XPS 13 9360 laptop, and 
I didn’t fiddle with any voltages. Even if Linux’ power management 
behavior changed, it’s hard to pinpoint a possible regression, as I have 
no reproducer.


Kind regards,

Paul
