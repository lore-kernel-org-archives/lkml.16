Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25ED1F4183
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942874; cv=none; b=JKSZLy9qbcwsZjW5PpKv1RUlbSoi4jmDPqWfXG8B9+RxG80/Yuy+k/nniuq3PNhorTcfitwZxCOPt08hKVY133e4IsUzSKrv2qC6drg5kNTtGIfIvc2qwMOQuEgWbHkeqlXQEjm1g6rtYS00vQMfQaTVIDcqDQuslx5JYc6vTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942874; c=relaxed/simple;
	bh=jmHlCqKNq2WHT2cZbCuD2XZc2TyCvZE1BO63HZmYygg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7hHqb6EKQGipExGXOTDYBo43ivF+oSRKMkFuAcseUIaIGQoPNd52zfOh0R244F2USF6NNaN2EpWJM4LL76BQxXFoeJ9Y2N0g+e0fVSgFIYVn7eHQp/yaNoO6nUFxmKgxGn3eR6xHjD7jX5aWvW6R18mgEqlFnXF3aDDiwLGLEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=UkJoBaRz; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="UkJoBaRz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=RmqmaHjfOHDWMG8YNPufVL+CETwYqVo6tGEj5rdHEwk=; b=UkJoBaRzHvAAMvRp
	6xTXBoEIFEKBWyK0Hpup9iwxSuine12Ns80l/qRPVKxt0KC7FrB/h+tvz0vf6uVv7oq41gCAAiSZy
	uIICuoy9jOszoO3ybLy7KYxcOOKvndsGqG7/ylDsva08VK2P4NgfPU9qfGABN0twcxXR8mZRQLhDy
	uL7A7MeVJFhAp0/5oCcBxlEWDHrbAo2wJohavwRFIvOwPm/z5ykMKG1AfEVacdmUDRdBEqEL3ajcR
	7g8znGXX8bh+V+48l3K3CMts+hGRMrS5t1QbQyRLAkVdhvmbLzkSinDhuZJHlagYaZsuUYl8Q3CWO
	piArc1E5iS6aV0u2bQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tgQTX-00EHvA-2b;
	Fri, 07 Feb 2025 15:41:03 +0000
Date: Fri, 7 Feb 2025 15:41:03 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: max8997 cleanup bug?
Message-ID: <Z6Ypj8Uob6kt23zF@gallifrey>
References: <Z6KxrcQz0JsQJ9nP@gallifrey>
 <20250207085807.GE7593@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207085807.GE7593@google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:40:07 up 275 days,  2:54,  1 user,  load average: 0.20, 0.07,
 0.02
User-Agent: Mutt/2.2.12 (2023-09-09)

* Lee Jones (lee@kernel.org) wrote:
> On Wed, 05 Feb 2025, Dr. David Alan Gilbert wrote:
> 
> > Hi Lee,
> >   I noticed that:
> >    drivers/mfd/max8997-irq.c    max8997_irq_exit
> > isn't called anywhere and was about to send a deadcode patch,
> > but I'm thinking it's actually a bug and it should be called.
> > 
> >   Looking at the max8998, it has basically the same function,
> > and it calls it from an error path in it's max8998_i2c_probe.
> > There's no equivalent call in max8997's probe.
> > 
> >   To me it looks like it probably goes after the 'err_i2c_haptic:'
> > label, but I don't know the code and as far as I know I don't
> > have one of the devices.
> > 
> >   Any thoughts?
> 
> I would convert to devm_request_threaded_irq() and remove it.

OK, however I don't have one of the devices, so couldn't test
it if I tried a big rework like that.
So I'd probably leave it personally.

Dave

> -- 
> Lee Jones [李琼斯]
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
