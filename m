Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC99B660
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218502; cv=none; b=R8nHRGDbV9N7fXqpuOf3phe5FnG2VoPS5g/+7msg9c/v/zdVEWZXRk/Rn7EVDvj7Lm4fFcvmpPpF7WRo/9HLb/B/dgRRQbGn4b9EZQELHZTYGXNW57Oe2O3gGgd4QV8hiqN6RufWb3D/39I1hszdz4yNroVLKaVhW2fwNDz71Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218502; c=relaxed/simple;
	bh=u70glR2UEmzItmyN6REyOgqKg3pb7US0C9mLJNx/q18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRlWk/9qzUcrnRqHQZahdoPsATAwKjWvst7KJveKLHAxWUAAUAACgTw2QP08gTEw/sCccc9duXlhLGkvjbPD81hteHvcAHtRjyuJa2j7hpJRxVDYylxDzaRLzgo5bLA9sHZVeUoU8tePo0OI/58Kh4sw8d06xpN96RkLZA1IXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TEWonGKt; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TEWonGKt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gtx3o8dcGeO/6AUCFD231MpneLoHeRc9yP5W8S80c2Y=; b=TEWonGKtr7iU0YzBjiCbPAyHdz
	/z4JDys4dJBXdN6Bu22gIQNcDPmTmZ7KdRqCyZeQTz/ig9u4EeFNxz/o0E3FBs8a06yc2EBu2OE+3
	S8aca/RfDsLjstCMmiDr/W5aCJTeeYxF/satyuGXXcoYiZvyiEHF6o1lZzqLj3b677IyAbgrI2k3k
	yMMhRYGf0C+dNWixP6y4t7GAqVxyzQqVL0NwSCnJMtToAcZnUXJLOe3sG6yR4gwP7SWtkrCAFP4Mo
	2R6p/jWZeI1dbCOl8zKvxHzYCmYK7I9lKSHAa01tgyu7UMOHw588n/BfVtyvqpb0D1IORl6kfyI7f
	WF/aM6LA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdO23-000uyg-BX; Thu, 30 Jan 2025 07:28:13 +0100
Message-ID: <4c132168-8622-406f-9a4e-97a094771739@igalia.com>
Date: Thu, 30 Jan 2025 15:28:09 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] sched_ext: Print core event count in scx_central
 scheduler
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-12-changwoo@igalia.com>
 <Z5fnpo7-jAna0ZhW@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5fnpo7-jAna0ZhW@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:08, Tejun Heo wrote:
> On Sun, Jan 26, 2025 at 07:16:14PM +0900, Changwoo Min wrote:
>> Modify the scx_central scheduler to print the core event counter
>> every second.
> 
> Can you add it to scx_qmap too? That's used as the dumping ground for all
> the niche features, so it'd be nice to have an example there too.

Sure, I will add the event dump feature to monitor_timerfn() in scx_qmap.

Regards,
Changwoo Min
