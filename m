Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C03347DD;
	Sun, 22 Jun 2025 21:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628473; cv=none; b=W9r2xwI221HgJX1FJoflFazZViViInu+4WlB3YrxVpc2WKuD1uEta4cG/g9vH9m1InG+cmfaRTQ8cHYBCU+5DUsAqbRVusGvWNExhTBMOF9ySpNZyoIuHMsjN0q3DhVYHTD9uDydzT4z/pHKGfyP1pUQ56kV9PUE7p8OEOigvl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628473; c=relaxed/simple;
	bh=LQrIN+geecZWTNDisR2vl++YpvOGXO+4QUOlTJNrNTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cdvDP54+J80Kb/Dgea7jNBzVkA/ZADSWa28qhgrW+/T1zJjB0kc0mfhkTOIP5WtqDVtgMyMHlUciNk4FKX1mZc09IGxl2Qmttw3eX6t3s6etengb9vqk2TJBtP3KDRPSho0JJTwr5Qi029i1aqSNdrfRnakzE33ceYMWndL8SRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg6TPwab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg6TPwab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75214C4CEE3;
	Sun, 22 Jun 2025 21:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750628473;
	bh=LQrIN+geecZWTNDisR2vl++YpvOGXO+4QUOlTJNrNTo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dg6TPwabIow8q3puHzCNxj5ZRBMz/0A5ZDR9W/k1aN96iLUPwgaHwcAlHVw4iUrvr
	 mzm52XU6QHnxgEDc9sIupKZNp7UHRLSHL4NwzROqQcnNz5pyf0tbJEnuZlDj46dFri
	 rtCYQFSyqhp7i7epxP8Vjs540hjfHhHivBX41AMAUJGUnqSPf5t8Ww99iTE35Ng2Jd
	 1EJLQg4pWyhS+srGqUFFwJ085yO1lhJ9ERPFj22aRUtgde/TFop4JeXS8fvDi0WAtn
	 oUhAfAAPrLc/BW6DgYOQTsC9ZjGoBBQ8aaeBSIs38/pAdDLdelvRS30+DKQDMtE/jQ
	 dcPMcI+jOsiJQ==
Date: Sun, 22 Jun 2025 23:41:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] docs: conf.py: several coding style fixes
Message-ID: <20250622234109.1aecc840@foz.lan>
In-Reply-To: <87zfdza43l.fsf@trenco.lwn.net>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
	<063c106d96e86ca30c3266f7819f30b7247881ed.1750571906.git.mchehab+huawei@kernel.org>
	<87zfdza43l.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 22 Jun 2025 14:55:26 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > conf.py is missing a SPDX header and doesn't really have
> > a proper python coding style. It also has an obsolete
> > commented LaTeX syntax that doesn't work anymore.
> >
> > Clean it up a little bit with some help from autolints
> > and manual adjustments.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/conf.py | 351 +++++++++++++++++++++---------------------
> >  1 file changed, 172 insertions(+), 179 deletions(-)  
> 
> This file is definitely getting out of hand...:)

Yes. I almost removed all commented code to make it a little more
palatable.

> I notice a lot of the changes are just from 'single quotes' to "double
> quotes".  That adds a lot of churn; is there a reason for it?

Those churns are from black/autopep8, which also addressed other 
coding style issues(*).

I don't mind much about using either single or double quote, but
having a standard is a good thing. At the plus side, as C uses 
double quotes for strings this is closer to the kernel coding style.

So, I opted to merge such changes from the lint tools.

(*) I didn't blidnly accept all coding style changes from linters,
    dropping the ones that would make the final code worse.

Thanks,
Mauro
