Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954F4B1E64
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428777; cv=none; b=VVLpduZs6iJp89UMds65Y3T4bAS8h86C6CsUXnNOe2f6pUXlIJAigULk0j8XWl5xXB/HODW6WT7CvAUb4zaIwCB3ikhX20kRn7z0rRanG8mtjSX6S2VgWbzhSsgeswMfhe0+AHbxu+5eB7gU0gl2L9XSw9h0detjk0vobwOfNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428777; c=relaxed/simple;
	bh=LVuaiTp20syS5Jj/a611Zn9Dlo+rVHJ7CFcy7TG20ak=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lEnjJ9l99lPUEPNfPtTVVGq9SF3295RGncfIrFfL0ktn1grZK+xZtPEbltt84yaRIokap00MD/zFcYX+GhrzdqUQBBnC69IJgi8SZdtFYYH/8Hjhdn/K6OYmDjgKKS8l1OTI7AgpRfO6yVEdFLBxBWwnvUK4bcAw+ulKRaweCgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=n72lMRxO; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="n72lMRxO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gGT5pthvSUph4XpQ+w+Neiot6JZF3Y5PpDbA9BAlAHU=; b=n72lMRxOetXDj57OpbJeSKA/HW
	dX9gjwyEw7CFVZHPROidORSuz8b1xB66ZcA+4nWJP38JEg5D0BK+dn0UqWjxpDs5apGyxyO8rapUg
	a4aGqLptJZsvkZtVCswm76GNKBcWjrb3HBc8i6iyzd6ybuOrAYHXUaDEJYrt8+4ttqW+iAqHuBSUq
	KuIkBfYcoMUDdPvFUk/4xpuhBz45sErKAw+ZnR5VP5xQMBJ2kyUAT8wb/7/G0tI898V30EX8LjJUH
	yLlJeZk0bdhLTX0iorBsK93n//rzci9vRKYSn1mZAhpufV4bxJnygW9tBDCT0WoE3t4hp4+iy+/SL
	6Gi7nSFQ==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1xD-009FB6-DN; Fri, 16 May 2025 22:52:50 +0200
Message-ID: <686e48cd-1985-4868-bc0c-2eb31bacd07c@igalia.com>
Date: Fri, 16 May 2025 17:52:46 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH 4/5] tools headers: Synchronize prctl.h ABI header
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-5-bigeasy@linutronix.de>
Content-Language: en-US
In-Reply-To: <20250516160339.1022507-5-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
> The prctl.h ABI header was slightly updated during the development of
> the interface. In particular the "immutable" parameter became a bit in
> the option argument.
> 
> Synchronize prctl.h ABI header again and make use of the definition in
> the testsuite.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

After fixing the s/immutable/flags and FH_FLAG_IMMUTABLE issues:

Reviewed-by: André Almeida <andrealmeid@igalia.com>
