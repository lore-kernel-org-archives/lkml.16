Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2FD227BA4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115385; cv=none; b=rgL9l1sixTBPQstgGPKcmKH9Q8cYkIlh9Cjj6xQ89lnRAYlLr1BMxP0IxEfGgUZi2OS+utVVqf95tGvPJP/PpmWtI/NfSDp6zSBpqlFBVM3q2osHN+02xk0Vh+i10w1bb6RJp7NGLh/7P1mUIruifenmmpE+ltzka8kRwGaE1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115385; c=relaxed/simple;
	bh=fMFpWnIjQCZbGxVynWhw/NR1OLrMkyW6C6CcMGny/QY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LfxyuWVoi2OnSXKO1lkeMFs9z92LU7l3DzTidEAhuS0o4QjpM4wjnGBUc7CZIQs2Lw92yk/d2yz9hyIjZDbaEhGh1dPg40fzIlIO70ozE6KG3TwwPI4QxVVCeibEdVhNhllIFqxYOU37j6KU/hx+zHb37xg7v46jA16GFoizWjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9455992009C; Tue,  8 Apr 2025 14:29:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8D0D892009B;
	Tue,  8 Apr 2025 13:29:40 +0100 (BST)
Date: Tue, 8 Apr 2025 13:29:40 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Borislav Petkov <bp@alien8.de>
cc: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>, 
    Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, 
    Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
In-Reply-To: <20250408103137.GAZ_T7CfnHx7cgU7CA@fat_crate.local>
Message-ID: <alpine.DEB.2.21.2504081137400.29566@angie.orcam.me.uk>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com> <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local> <alpine.DEB.2.21.2504081107390.29566@angie.orcam.me.uk> <20250408103137.GAZ_T7CfnHx7cgU7CA@fat_crate.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Apr 2025, Borislav Petkov wrote:

> >  C'mon, these are good room heaters with nice extra side effects. ;)
> 
> Maybe we should intentionally prevent booting Linux on such machines and make
> this our community's contribution in the fight against global warming!

 Hehe...  But seriously, consuming energy is not by itself wrong, energy 
is plentiful in the universe and gets used all the time whether humankind 
contributes to it or not.  The issue is using dirty sources.  And that's 
not exactly individual people's problem, it's not us personally who are to 
build clean power stations.  Which does happen already, so we're moving in 
the right direction.  I would be more concerned of the various industrial 
contributors to global warming whose purpose isn't electricity production.

 Plus we still need heating anyway, at least in some places, so why not 
having one that runs Linux? ;)

 FWIW,

  Maciej
