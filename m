Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA02DC78E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003104; cv=none; b=XToj2DN2YRazMwnMtY85qBjEtScWrbb5NsmUDV2LZ2BTUALXzLgsAYCP47JihDGTNl1cf1ba9DHRP35jWDFv/8xX9UNUPmtTm2yBMubEuMJomZshV6WS0DZvBTUiPp+QHqVikWZ8R1CoVYuF0b61Xf12e9knQ7Lqyn4cIIddExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003104; c=relaxed/simple;
	bh=+ukcY9Uz2AZwtZ68dyBujts0qhXFtak2XbG6PuD9ITc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNB+Hu/72owk/wCpGubKrmqy3s0XuTzo26NZGAnilTSCOFcDdiJxOhLB+udI5UOE8VEfHpgYL6ZRh5d2s31izcxPkiBFIEVar2yEhqLnc9jI42PVGwv+yObXoNdRupSQbwMq7U64uXfE5iEu0TWTlPOyC3BCerphERJCSbLQgb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TNu8orOv; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TNu8orOv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8GD8iADsizFhGDNZ/ZNaL/JWIzc9hg98Nf1McXX3ZhY=; b=TNu8orOviKyKi1Nq00fTveWOCw
	/Dj5RYLwN79mk2Yqy+zBlyAIi+GzbB9zHP4OrZwjgEnUZuQgiHty3Lfcx8sbX1iKerpGYPYdUU3ux
	41r3IOkQ5f0NS3jDExMqx1TU00QUr+H//1J1iSRTFMFr4QkInXZUHYvUYmlbIx7sL9suqXoYK3BCJ
	i53A+tk+1+WvYf6mghQnKuKrSLki0zhhprHa6kN/sO+XRqvb353Gaa/1eKTvDDzgy7IXEg+brf71z
	BLQCK83boPnqloXiVW9A2WmSvi/z100Pp6K0dmo/JR2Qa/MpbInUruP5QhUra3g4roqMKXkJNtBJg
	03jti8Ag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA3AE-0000000DkK7-48ae;
	Wed, 30 Apr 2025 08:51:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 540FD300642; Wed, 30 Apr 2025 10:51:34 +0200 (CEST)
Date: Wed, 30 Apr 2025 10:51:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
	"Saarinen, Jani" <jani.saarinen@intel.com>,
	"De Marchi, Lucas" <lucas.demarchi@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	"hughd@google.com" <hughd@google.com>
Subject: Re: [REGRESSION] x86/efi: Make efi_enter/leave_mm() use the
 use_/unuse_temporary_mm() machinery (linux-next)
Message-ID: <20250430085134.GI4439@noisy.programming.kicks-ass.net>
References: <SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <SJ1PR11MB61293655E9386DC0FBD263F4B9852@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87selrwdct.fsf@intel.com>
 <20250429182904.GL4198@noisy.programming.kicks-ass.net>
 <SJ1PR11MB61297D70878E228810F735A9B9832@SJ1PR11MB6129.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB61297D70878E228810F735A9B9832@SJ1PR11MB6129.namprd11.prod.outlook.com>

On Wed, Apr 30, 2025 at 08:47:43AM +0000, Borah, Chaitanya Kumar wrote:
> 
> 
> > -----Original Message-----
> > From: Peter Zijlstra <peterz@infradead.org>
> > Sent: Tuesday, April 29, 2025 11:59 PM
> > To: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > luto@kernel.org; intel-gfx@lists.freedesktop.org; intel-
> > xe@lists.freedesktop.org; Kurmi, Suresh Kumar
> > <suresh.kumar.kurmi@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>;
> > De Marchi, Lucas <lucas.demarchi@intel.com>; linux-kernel@vger.kernel.org;
> > Ingo Molnar <mingo@kernel.org>
> > Subject: Re: [REGRESSION] x86/efi: Make efi_enter/leave_mm() use the
> > use_/unuse_temporary_mm() machinery (linux-next)
> > 
> > On Tue, Apr 29, 2025 at 12:01:22PM +0300, Jani Nikula wrote:
> > > On Thu, 24 Apr 2025, "Borah, Chaitanya Kumar"
> > <chaitanya.kumar.borah@intel.com> wrote:
> > > > +Andy, Ingo
> > > >
> > > > Friendly reminder.
> > > > Issue is still seen on latest linux-next runs.
> > > >
> > > > https://intel-gfx-ci.01.org/tree/linux-next/next-20250424/bat-rpls-4
> > > > /boot0.txt
> > > >
> > > > Regards
> > > >
> > > > Chaitanya
> > >
> > > Andy, Ingo -
> > >
> > > Commit e7021e2fe0b4 ("x86/efi: Make efi_enter/leave_mm() use the
> > > use_/unuse_temporary_mm() machinery") on linux-next regresses as
> > > reported by Chaitanya
> > >
> > > Please look into it.
> > 
> > Does your kernel include the below?
> 
> This change has not yet landed in linux-next. However, making local change on top of next-20250429 seems to help us.
> 
> Important to note that we don't CONFIG_DEBUG_VM=y as mentioned by Hugh.
> 
> Any idea when this lands in linux-next?

This is the top commit in tip/x86/alternatives and should already be in
-next, Ingo, any idea what is going wrong?
