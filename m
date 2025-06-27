Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510E19F422
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045555; cv=none; b=VFggcQWhhbg9jAtiW97aWRf61QNLDfse0Cm6UFVHLtPkaIWAzkQ5bhPe71Axc+jnNYYMMtXHkn6m8ziNyfUDL7Z3v4THqzg6r/0tYZ8H8mQPXyWFpzFtOjWoP/bHmnIv3GpqIZ2nYibbMAqPhdfnZX1npegY4ud02Vu2hzNln7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045555; c=relaxed/simple;
	bh=JnJoioaeQPUEUWJtCDCX9PdA9dB7so9HZ3moGzT2vTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I36Nul/VVodjTYHjGkJm6pbdEhqHjmsiE3eo20LCZGPW1lbSmCqI7dOSz8Idtb8t/YMSTx1xaGGaIsxa1mRX9SYnO3ROUXswQiy2NzOzbvPTRPcRKYHrwWyHPkqRzOKTtOQxBHNg66xMgf3dhjYzmGWAXfEWZQagWqKJKgqW7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPJdqn44; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPJdqn44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751045554; x=1782581554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JnJoioaeQPUEUWJtCDCX9PdA9dB7so9HZ3moGzT2vTM=;
  b=JPJdqn44g3v9lfjP/tKx2TnmZsmy1lMktK2xCt8qiu9bhoKHXqnd+8K1
   c2g1QNcCDGjSVBVg/pDkC7futLCFLwEzN2do4SJiOWQ+I9lEqttSqj+Za
   glEsCYJd9/1pFagfW52hHAd6ALrZac6Qx8DQSwWJVdPkVVdt/lTS9wDac
   4siQ1CplwsalJkugb0ZVojx+jbc0xrws2vdBeTl+BI5gNQXBRhXnY0JOF
   oo2/ikMRXpXe3i/WcUi2dCn92FFw92a0DZtJueWcVHdDJl3NE+munH1Ik
   utMmNtJb6HoqtIndkxbmrwtczM0XXrvGbKiZChdvd2S2rb8c2b9tyD/gP
   Q==;
X-CSE-ConnectionGUID: IcvUnNDcSGquD2rdxj0eRQ==
X-CSE-MsgGUID: o89PnJ0OTw2t0jmMeGzomA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53516290"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53516290"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 10:32:33 -0700
X-CSE-ConnectionGUID: 0AbqSp5kS12vgkd2n9sVNw==
X-CSE-MsgGUID: tko0eDXqQTG94z9BaX4ZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158591632"
Received: from opintica-mobl1 (HELO stinkbox) ([10.245.245.146])
  by orviesa005.jf.intel.com with SMTP; 27 Jun 2025 10:32:29 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 27 Jun 2025 20:32:28 +0300
Date: Fri, 27 Jun 2025 20:32:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matt Wagantall <mattw@codeaurora.org>,
	Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] drm/i915/ddi: prefer read_poll_timeout() over
 readx_poll_timeout()
Message-ID: <aF7VrBSZQVlaSN6-@intel.com>
References: <cover.1751023767.git.jani.nikula@intel.com>
 <59bcc15dd4debf00ee0c7b430a3b701462ac9de7.1751023767.git.jani.nikula@intel.com>
 <aF6UOCLdO0fGHGA9@intel.com>
 <f922ec0a42855e17228d3f22d7291b389abe2df0@intel.com>
 <aF67cxjlfWiWMx-4@intel.com>
 <1b5d73351eda2d86437a597673bd892baf90fafa@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b5d73351eda2d86437a597673bd892baf90fafa@intel.com>
X-Patchwork-Hint: comment

On Fri, Jun 27, 2025 at 07:26:22PM +0300, Jani Nikula wrote:
> On Fri, 27 Jun 2025, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Jun 27, 2025 at 04:34:23PM +0300, Jani Nikula wrote:
> >> Internally the macro has:
> >> 
> >> #define read_poll_timeout(op, val, cond, sleep_us, timeout_us, \
> >> 				sleep_before_read, args...) \
> >> 
> >> ...
> >> 
> >> 		(val) = op(args); \
> >> 
> >> So you do need to provide an lvalue val, and you need to be able to add
> >> () after op. I think GCC allows not passing varargs. IOW you'd need to
> >> implement another macro (which could be used to implement the existing
> >> one, but not the other way round).
> >
> > Just get rid of the 'args' and 'val' and it'll work just fine.
> > Then it'll be almost identical to wait_for() (basically just missing the
> > increasing backoff stuff).
> >
> > AFAICS this thing was originally added just for reading a single
> > register and checking some bit/etc, so the name made some sense.
> > But now we're abusing it for all kinds of random things, so even
> > the name no longer makes that much sense.
> 
> Yeah, evolution not intelligent design.
> 
> > So I think just something like this would work fine for us:
> 
> LGTM, with the _atomic version for completeness.

The other differences between wait_for() and read_poll_timeout()
I see are:

- read_poll_timeout() always evaluates 'cond' at least twice.
  For some things I think it would make sense to omit 'op'
  entirely so we don't have to introduce pointless variables
  in the caller (eg. poll_timeout(, pipe_scanline_is_moving(...), ...))

  but the double evaluation of 'cond' there is not desirable.
  Should be an easy change to make read_poll_timeout() more
  like wait_for() and stash the return value into a variable.

- ktime_get() vs. ktime_get_raw(). I suppose it doesn't really
  matter too much which is used?

- 'op' and 'cond' are evaluated twice during the same iteration of
  the loop for the timeout case in read_poll_timeout(). wait_for()
  is a bit more optimal here by sampling the timeout first, then
  doing the 'op'+'cond', and finally checking whether the timeout
  happened.

  I suppose optimizing the timeout case isn't very critical. Though
  the code would be a bit less repetitive, with the caveat that we
  need an extra variable for the timeout result.

- wait_for() has an explicit compiler barrier to make sure 'cond'
  and the timeout evaluation aren't reordered. Though I think it's
  in the wrong spot for the cases where 'op' is the one that samples
  the thing that 'cond' checks.

  However I *think* ktime_get() being a function call should be enough
  to prevent that reordering from happening?

I guess I'll see what I can cook up to make this stuff
more agreeable...

-- 
Ville Syrjälä
Intel
