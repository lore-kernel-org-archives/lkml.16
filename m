Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D923BE
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750618100; cv=none; b=Y8DWBKKxJtX2hq2QnVBoZar+Ryal8bF/0/8dxzLW3uD3egXiUUC6wS/NYDpuT1dKuRIK67TFE/9Ovg0+nolEiCazcaQsyFekDw8ATvicnjnrC4jctkuuC8NVKE2sTlcebO8BCo17GAXV2xVAi4wsspDWl2KHooOuy0s5ewjZY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750618100; c=relaxed/simple;
	bh=BeFCmiexWtXDWj0JyuSEEstUnBHLQ6oqRi6Y+iYqq8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8v1zyRErxuPSQlvZ4Qjb4EMYie5IHhAGrHWxYlUdLFxNhba3irW14dZA3G1mX42WyWsYWuVMU3bo4rebqh2dvTFzo76p0nWu3hLAlX1AUKlXbE0K/tDZnsJOP7BRCFmv/JpzLUJU9z+ZrUWAhmXLNwoGA2t+v1i287VCRAK6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=soA1+CDj; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="soA1+CDj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BeFCmiexWtXDWj0JyuSEEstUnBHLQ6oqRi6Y+iYqq8s=; b=soA1+CDjd7eXcoY5q5ES03zzKI
	2QTi+9lWKmY/5piWbvwlxTS/jXjAX6WRvoAUg6CKijG1a6lEHSrqgk4MmhxVoYDv0uox9ScF2MebG
	oKAgDTxYfbYSGmMpIqrGVEKOvcwCNYXaV1yXjuVxR2jlSxr9Su4QC+JidT/HhP/K4BGDjt2V7P8Ep
	qGg/FSQTYRVFY7is48y+68vRfqRmwDwLrYEg1a0dmUrOddUi5drPhboMZ8mNbGYjFe0e/pIz2XyjS
	nA4TnxuY4WfMX2qZYI/RuANtU4gIGRrm2jiq0Yhu6X6o2at+ZmccXMqtQKuzlKZ8OUUmG6znq4J2L
	sYcmgppg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTPjj-0000000FZLt-0bK3;
	Sun, 22 Jun 2025 18:48:15 +0000
Date: Sun, 22 Jun 2025 19:48:15 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Cc: hubcap@omnibond.com, martin@omnibond.com, devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
Message-ID: <20250622184815.GW1880847@ZenIV>
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad wrote:

> > Replace sprintf() with snprintf() for copying the debug string
> > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > the maximum size to ensure safe formatting and prevent memory
> > corruption in edge cases.

Out of curiosity - have you actually looked at the format used there?
