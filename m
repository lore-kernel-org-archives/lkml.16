Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2B1993B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698708; cv=pass; b=l3TR8rkoyW/QGEWhDAEnPdC5wgh6CoWacf8kxvYajX+gmachL95qcNIAXWdH2pFgK66YLssouWRGzihFqzTbSTMPmd2R5awhbxnqDX1gyz96Kor+MpsVuN6tAVcXWIesc7AxvdljTKKbBNp8PvlrNJ5U4V4kOIVakIXDNG+HBCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698708; c=relaxed/simple;
	bh=Q/TMkhi8y1e9ijpsRKB4JlkB+S/rT+eASlPnYM3Tfu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4OErZirydcydlRtyIcT7TwTneSotbl/msLM9Aq7AwkZrOZkJYFrSJist7GWTllh4SEwmeDGjfdGunsicDU78bARoWqGlP9zp1Mqw6V+F+zObXtMDpq8mU0zSe7DR2VlImJpsFjOcha0mxsFtwaA289Hu5vTeyvvnsQxb153ucI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=XhC+NBXF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="XhC+NBXF"
ARC-Seal: i=1; a=rsa-sha256; t=1743698682; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ev7SOfIo5MTVsozdcKGfAEIvt1DNP+r9LfacLlm/4NcJw614QpGhQ4uLicY00mX5D0mN42g/j778nDvPJj+p8Z7dkjrYpWpUP/dKRvFYFGGbg4cTIF0BCqMDOt+On3MQhEC6rfLEbznrJbM15X3/ojHLo4EwzzyeO30j8GRkK04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743698682; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N7UCSqkMfcD/hHO+KVrVJ/JhAvTyYZXoXsMPi+AmOSI=; 
	b=YWyuB/ZYhpS3TXZUQdunJyWdaU7BeDOYKlwIVt9vRobtwzBgcVUhekQ5o24G4Vy+2FzwAieduX5h25/VP0XcYBfy31YXVWLaeMV3ETNUrfCEJcOVrpiijVOn357ztUSktxg9qedyIFEseR06HtZ4bUeSGP0ydMjOHxDZn1jHSZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743698682;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=N7UCSqkMfcD/hHO+KVrVJ/JhAvTyYZXoXsMPi+AmOSI=;
	b=XhC+NBXFSFaRkStnuA9cfb/kHdhfoaIXKa4UIJZ2iWHlapWFLn9355k1IXLMIp2v
	0+H7YxrSTulR+AvhJHIY7jU0AVsau6kt+YPSku3N0DNPfHGKXp4B6MVqd5ckwYKeraW
	LCbKqjgALw3v3OPvmBtl5h4E6m0CRWRs5tOab+SE=
Received: by mx.zohomail.com with SMTPS id 1743698680293265.56072010267394;
	Thu, 3 Apr 2025 09:44:40 -0700 (PDT)
Message-ID: <4ca36f29-9a5d-4585-8699-f4e78dc7266e@collabora.com>
Date: Thu, 3 Apr 2025 19:44:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
 <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
 <6e796751-86f3-42e5-b0a6-3a3602d3af13@amd.com>
 <975582a3-313b-4989-aac2-c3b309ba55b6@collabora.com>
 <6fb21077-c254-49a7-97fd-64c87322ea43@gmail.com>
 <885bf81e-0aa4-4fe7-af81-a4a4485474b7@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <885bf81e-0aa4-4fe7-af81-a4a4485474b7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/3/25 06:28, Huang, Honglei1 wrote:
> 
> Hi Dmitry:
> 
> Really sorry for missed this comment. Yes it can be done in UMD,
> actually the interval tree is used with the MMU notifier normally,
> it is for preventing create same MMU notifier for overlapped areas.
> Cause this version patch set doesn't have MMU notifier, removing
> interval tree is reasonable.
> 
> Hi Demi:
> Adding interval tree can make virtio userptr has robust check, it can be
> done in UMD. And for AMD userptr driver, it is a SVM type driver, it has
> both interval tree and MMU notifier but userptr memory is moveable in
> it. No interval tree for Intel i386, not sure about the Intel XE driver.
> 
> Maybe I can remove the interval tree in next version.

Great, thanks for the clarification. And no need to be sorry, it happens
to everyone on the ML :D

-- 
Best regards,
Dmitry
