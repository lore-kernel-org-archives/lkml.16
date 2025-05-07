Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC701DA60F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638549; cv=none; b=YnWhGAQ57QUsCtn5vYxPGxUBSS6mnBrk+8BraNZADkPPZgvXsNVnmwP8JFcPvPpxs2nmu+J5s05/RbE142amqzu4msmcEy35QsZdxBO8J23VrdlnkVUdXU0OZu4pNWh8IMj6spO70bDzmXG5bYwWD0Ei2D0sS6AFX9t/hgt5hUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638549; c=relaxed/simple;
	bh=anqOEdhhZRANM9jEiZS6cy6TPdsv/8NPv0Sqp7cKB30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHpoZp4yLA+t0kiUDtcTHbNavxBroJ6eUNJFe3GT1WlrxoRzp3e5gTYhCabB7jiPnCoqTaMJgWOwrN7G7KMlLcUW30qDoT5/SUdfFTGPvKHq/Sa0H9lnh6XeNYebppPhXCgw8COEwlRUWrsq1IhDpK5p+xiu5HMzv7zha81Iqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=iAgW+CoA; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="iAgW+CoA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=DGwF+sCKYFLJFj1kpcCuagfnDB0QbComp1z6c97B6lw=; b=iAgW+CoAIahiifH2
	JRHnkhoeyW/ONugmr8AXNsfFwoPNNORbCWPNWWbM88FWdzOCcRDx1X6tzXOx6lesKi9pC76nGZwrP
	u6zbIi5pTJeJ5XZMiiptCNd7G3HCxGosqDqm1FXIypLUPznKXu/9oHvwf3z5bYD4zYhrdCMSMaTo3
	WcN+RHwMy9byrdZWrIP8cBF658fGkEX04O/qrlw5NPpsKsjQSbhVg+q2gVeJie7INE/SQpHoJo+2v
	IoiAiaclLWDGRD0rtHPo+L3p+3356ll1Jc6ihoHyVvi25ZrsoQp7Pcf1m4zqGelc1UaB2BrCnPREW
	mC49A8pHn7zePtgBTw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uCiTO-002EZk-33;
	Wed, 07 May 2025 17:22:22 +0000
Date: Wed, 7 May 2025 17:22:22 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: questions about smu_mode2_reset_is_support and
 smu_v13_0_init_display_count
Message-ID: <aBuWzlWN5uJqsV90@gallifrey>
References: <aBqqCmYICO_C0nLT@gallifrey>
 <DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 17:21:56 up 10 days,  1:35,  1 user,  load average: 0.15, 0.07, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Feng, Kenneth (Kenneth.Feng@amd.com) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hello Dave,

Hi Kenneth,
  Thanks for the reply.

> smu_v13_0_init_display_count() is obsolete on smu13 series. It will be removed.
> Secondly, with cod evolving, all of below can be removed as well.
>   sienna_cichlid_is_mode2_reset_supported,
>   aldebaran_is_mode2_reset_supported,
>   smu_v13_0_6_is_mode2_reset_supported

Great, I've sent a series to delete all those, see 20250507170145.102508-1-linux@treblig.org

Dave

> Thanks.
> 
> 
> 
> -----Original Message-----
> From: Dr. David Alan Gilbert <linux@treblig.org>
> Sent: Wednesday, May 7, 2025 8:32 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: questions about smu_mode2_reset_is_support and smu_v13_0_init_display_count
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi,
>   I noticed two functions that are unused but I wasn't sure what to do with them:
> 
> smu_v13_0_init_display_count() isn't called/wired up, where as the
> v11 version is wired up:
> 
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
>      3574:      .init_display_count = smu_v11_0_init_display_count,
> 
> so is v13 really unused or should it be wired up in a similar way?
> 
> secondly, smu_mode2_reset_is_support() is uncalled, but it's the only caller through the mode2_reset_is_support() function pointer; so if smu_mode2_reset_is_support() was deleted, does it then make sense to clean up all of
>   sienna_cichlid_is_mode2_reset_supported,
>   aldebaran_is_mode2_reset_supported,
>   smu_v13_0_6_is_mode2_reset_supported
> 
> which that function pointer is sett to.
> 
> Thanks in advance,
> 
> Dave
> 
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
