Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5921C5D44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101445; cv=none; b=lzWSFVKkQ7V9DEGnpJGqX4aN+uu5J4iuWiGg0kbeKqm3pgxgYJQAV6M36lP4/2Bh/JOUPiZUkNtnt0O85vtFryirOluRiX1wMWqJwTkEHDUNg8WmdvyUyW5wyjQdprOGLSUhIgV8hrRg7rrrFhyfyYM0QxaA71vVE1gUfW5DXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101445; c=relaxed/simple;
	bh=hVETiLE9zmo8JA2aFgbYABkBW11PW5ijv1TZHyWo/HI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=T11pgK7vSdABEkDrHgCafBLAtWSfh7HaCbh2Jpce+Xp2r6MQjJkIoQ6GvGzstibe8JKYZ733RGl5CMqAwXGg3sNmgnwKqeZk3UzhA5eXoYHU8ylnNpUuDXYFLGUbyR+rn4psGVQk1HkrZgH+g7FUAp/Aya7U6OHumMHx3c7btw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xZFH1bod; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xZFH1bod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D137C4CEE5;
	Thu, 27 Mar 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743101444;
	bh=hVETiLE9zmo8JA2aFgbYABkBW11PW5ijv1TZHyWo/HI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xZFH1bodakJ5hEOIGI7USLu9RBN11k/52lYlCC5lR7xpikwLBskDYPxiWQbDPkCnF
	 FYlPeJ4QI46gGsZkl/wkqxGS/At/nJ5tFyCTHF9kf53nGrpZzFaq4YX+kDukZBU3BS
	 wvFaxfQwqmqwRxnLY6shDHnDQRBTWJ5FImfjfO8I=
Date: Thu, 27 Mar 2025 11:50:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: T Pratham <t-pratham@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kamlesh Gurudasani <kamlesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib: scatterlist: Fix sg_split_phys to preserve
 original scatterlist offsets
Message-Id: <20250327115043.fb46442c7e7fafc12295a8fd@linux-foundation.org>
In-Reply-To: <41fd2bb3-7115-42c3-8ee5-e8e9e54fa86b@ti.com>
References: <20250319111437.1969903-1-t-pratham@ti.com>
	<20250319184605.809fc9ce3b169478102b9313@linux-foundation.org>
	<7647126a-5986-4a2c-9bb0-9efb0ff9c131@ti.com>
	<41fd2bb3-7115-42c3-8ee5-e8e9e54fa86b@ti.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Mar 2025 14:13:02 +0530 T Pratham <t-pratham@ti.com> wrote:

> >> Is this merely from code inspection, or is this issues known to have
> >> observable runtime effects?
> >>
> >> If the latter, please provide a complete description.
> > Hi,
> >
> > I am using this function in a crypto driver that I'm currently
> > developing (not yet sent to mailing list). During testing, it was
> > observed that the output scatterlists (except the first one) contained
> > incorrect garbage data.
> >
> > I narrowed this issue down to the call of sg_split(). Upon debugging
> > inside this function, I found that this resetting of offset is the cause
> > of the problem, causing the subsequent scatterlists to point to
> > incorrect memory locations in a page. By removing this code, I am
> > obtaining expected data in all the split output scatterlists. Thus, this
> > was indeed causing observable runtime effects!
> >
> > Regards
> > T Pratham <t-pratham@ti.com>
> 
> Hi Andrew,
> 
> Do you need the above details to be incorporated into the commit message
> and be resent? Kindly let me know.

I pasted it into the changelog.

I also added cc:stable, as this might be affecting other drivers,
whether in-tree or out-of-tree.
