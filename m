Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F47A21A450;
	Tue,  4 Feb 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703452; cv=none; b=r3pOITWzeX7sbihMCna0zR0fd2ExKNsI3DYQKsQvtsiwFoXLiZHLS5SQkoK26jf4q45Qt0Nwu2qIsNava667Bl61eTT8p10mD7lWWN3b6VecxywkJhDipnySI7xiH6KA+BuMjJeZtamF8LxA+XEi8Wlo0MKXdai+MBGChgeEFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703452; c=relaxed/simple;
	bh=jEngrJE9RHfqacg2O19w5lrzHckP4YHctNfZ8O8gt9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rTvW0Kutp1dKqNI3DRQWcN8gWhx7x2JU1oM2xx1gt820Zto+5zOEYAL5hJgikqLneH1EOXBWCkPvVU33Kgz6k+P3LNFTVlZ7hmApQHesozJY4pS3rz6uN7cLvIG2TuhJ5bmpAD7CMttivqgBxQYqkWiqgz/sGI8xacEHcoZPwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AFBE892009C; Tue,  4 Feb 2025 22:10:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id ACB8592009B;
	Tue,  4 Feb 2025 21:10:48 +0000 (GMT)
Date: Tue, 4 Feb 2025 21:10:48 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: Julian Vetter <julian@outer-limits.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] alpha: Remove IO memcpy and memset
In-Reply-To: <3fa5f9d2-e40e-4360-80a7-6bdd96312503@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2502042110040.41663@angie.orcam.me.uk>
References: <20250203154216.172040-1-julian@outer-limits.org> <20250203154216.172040-2-julian@outer-limits.org> <3fa5f9d2-e40e-4360-80a7-6bdd96312503@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Feb 2025, Arnd Bergmann wrote:

> > Recently new IO memcpy were added in libs/iomem_copy.c. So, remove the
> > alpha specific implementations and use the ones from the lib code.
> >
> > Signed-off-by: Julian Vetter <julian@outer-limits.org>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

 NAK, see my comment for v1.

  Maciej
