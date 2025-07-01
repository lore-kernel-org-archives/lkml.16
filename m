Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502F2797AA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381892; cv=none; b=TS+CZvjmxQ/wZEFiWZ3w15CsLBR55ej0HY+rCswjRjl6FMJzInlciAQRNylO6Yu4EK9DxksEsCgHfdMsmYH59wB67buhh4K0wnrWUKaUEJ66SQ2ztyj+rhNu65yfstuTg7Z/Y+rr4uAThinOOpsAycVCtMgG5fU0GQ5B7YDqQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381892; c=relaxed/simple;
	bh=4GU+SucA8xO5x9jGSJw4NepXwe+RzMW6HINk1NQxuTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPLcSythNRVTEBPgubFgU73PqonxjfGwx553YrJQnyUt7TEOE9k9du9nAvJ3vIPbfOoHxpAdBb3aoc7FxuI0adGF9hjhR2HvqHkczkSaeErSbhVsADuKw8AXT1Hl94lIh30z3oxcyc/sRk5xjvJNU07y2DUOVJzoFncrhx8bpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=UyQDF4xW; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="UyQDF4xW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=cLdKwBjdtMYs1S3eoRSM/jaCM07jbCHMulV+8woZtEs=; b=UyQDF4xW4kC8zfR4
	wLDsQIkicUozIWHZqxh4eXGyTVoWeddBud/Aw1oZIOXf1FxMtMskJQPb0oLHFQojONqWN0CDuqd8j
	6YZDH1AQG/9LjiLgCi01kp+pxrqO6Y5GF+lB9eWqYI6VVCVt5KP642AcXWkDl7lPJxq9GkDT37UMT
	v26mQawoTDXrlY2MJdh5zANnh9RLKeVZcl9d95jFm6OoRCiahnjuq/ktq0bMBzZa7yl/oJf3XOJQE
	WoDn9ihsll9E1E8bq3L8mUFWdlXZA6xkZdfGzgcjFAziqfNDaj4HzIRfDJZsiRTnjRGRto+zS1OGu
	h16Bc0oD0W+qgtjjxg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uWcQw-00DKOM-1o;
	Tue, 01 Jul 2025 14:58:06 +0000
Date: Tue, 1 Jul 2025 14:58:06 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: lee@kernel.org
Cc: kernel.org@treblig.org, arnd@arndb.de, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pcf50633-input - Remove
Message-ID: <aGP3fvnDpYqzQlYU@gallifrey>
References: <20250629212820.319584-1-linux@treblig.org>
 <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 14:57:04 up 64 days, 23:10,  1 user,  load average: 0.11, 0.06, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

Lee:

* Dmitry Torokhov (dmitry.torokhov@gmail.com) wrote:
> On Sun, Jun 29, 2025 at 10:28:20PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The pcf50633 was used as part of the OpenMoko devices but
> > the support for its main chip was recently removed in:
> > commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> > 
> > Remove the input code.
> > 
> > This was originally posted as a set of pcf50633 removals in March,
> > and is the only major component that hasn't been picked up.
> > https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Applied, thank you.

I see Dmitry has got that into -next, so I've posted a patch to take
out the pcf50633 header which is the last bit left.

Dave

> -- 
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
