Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A21DF988
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694596; cv=none; b=SHulNxdY8jqxDDa/O69kYXReWVU6SKN4j+CtNXgdj50yc/ntmqUwG3JnDr6qUyIVZdyaaMxZrFW+E0wytnae5nr3saTTgS5NLn5N6Kf4VUJPtpxdM80IpvpjwyOvU3M557eo5chzQMWlTKE7LoGD1kAOHQRfyrI6iUEyYZ9N6Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694596; c=relaxed/simple;
	bh=07l3WctL9NqhfdN89XZmqkm5zTdk90Q/ztrcy/DErjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZXDNKIV60bIKEDwhhgopzrihmmrVpNoaCCq7tAa94kYZI2W5WvpXJpzUBI2pGwUm2DGEi0kM0mhmSYuPUZz02YRj4hmiheeFL+IFLBuPcvotx/Xzs3QHMBu++qdLwDAP/SlrAa7ujYwVjhfEISx2MKA+fniBvcB2ZenrAQ/RwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVfY67VW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVfY67VW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92973C4CEE2;
	Sat, 26 Apr 2025 19:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745694596;
	bh=07l3WctL9NqhfdN89XZmqkm5zTdk90Q/ztrcy/DErjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVfY67VWhCVqlpe7m2m9BJZW2pOZWxvq9m7gF6cpOJC+vZijOXds7YNWbZ8+8wBvK
	 v0gjXTJEl6up/BuqExzotOfQNrcXc/iSM12njyAUxBde+8Eggt3fT+zKp8fTm6tuJg
	 PqZcKEa/R/OEzNXAO+yXnU6NhDVPIpDthVGKhEvfVRk+4pGzH/5SzmMqyuTgw06Net
	 2QKbaK8Jk0J2yQtumpT3m2LmZs6und/oVXYc2A3uUnU4wd5IXdmNpOFcvbYSDKcFti
	 t0C5fSSHVbnxYk09jk/DjG8CzVR9FPjIaAhbJGXXFKVxVxysfDBpTOKlMWy2bDoXHd
	 +ZfFc3/gEW3qQ==
Date: Sat, 26 Apr 2025 21:09:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA0vft1cPuvzdZvJ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> CMOV is missing not just on old Socket 5/7 CPUs (Pentium MMX, AMD K6, 
> Cyrix MII) but also newer embedded Via C3, Geode GX and 
> Vortex86DX/MX/EX/DX2. The replacement Nehemiah (2003), GeodeLX (2005) 
> and Vortex86DX3/EX2 (2015!) have CMOV, but the old ones were sold 
> alongside them for years, and some of the 586-class Vortex86 products 
> are still commercially available.

Very few (if any) of the commercially available products will run 
modern 6.16+ kernels, right?

Note that the real danger the 32-bit x86 kernel is going to be facing 
in 2-5 years is total removal due to lack of development interest, but 
I think we can support 686+ reasonably far into the future, and can 
keep it tested reasonably - while covering like 99%+ of the currently 
available 32-bit-only x86 products on the market. The fewer variants, 
the better.

Thanks,

	Ingo
