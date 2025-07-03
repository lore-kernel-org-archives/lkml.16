Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02FA2E2F12
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543475; cv=none; b=BnxHmee0lgSAJRr9KkbFfEQLieX9OY4OHwrn0m1X1Bde4hCsH3hZnfDCEdRxkfWHRm5vM+wSN4olk+bV/CJs5NzzJlKVWlS0Fd+Gp/m7+vNIPW8YABS0/H71/ZngV49ju3DcEE1gIO8bdLX6EVaEGqKk63tVM4GkDAGqAG89dn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543475; c=relaxed/simple;
	bh=5S0mdemkoC7q/w4FyIRSqhpE9eXxERbVRTGGJZmB354=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RrYwhu2J2sBTH2JM8W5MAYoDfzV5dg4rokPxmNL6KpFolTCHL1mF0EBpq+xx4pkjF0isrWtSJKXXHUEMNjpAQZL64+48kMC4lJD1+x0jK6MsICVulF9e2HgfNRGRX9RzCR3JoBLpxYXNt6bNtAp2TJZNeZUGTY7PefTo6l6753Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqjMPZNC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqjMPZNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751543474; x=1783079474;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=5S0mdemkoC7q/w4FyIRSqhpE9eXxERbVRTGGJZmB354=;
  b=nqjMPZNCPKyFu4Pju8G8M70Mz/CQOXz9p24yX+wwrcc03PHnTXZ1Q33E
   w+cpavkrLhyoMS9WQeISblj59Dfdx2v2f+3gBqcZKy4GtN03lrz3yDeaH
   CW+8EgsNOpOVzk+7noVjjGut1naV/KM/quQiHpLOueYuKDdFQ3ZnMIPuj
   iMiPxkpF48xdAWVFEBsTNP7eN0MCD8GsiRU2rnCOrPg5i8Pq5SkEjbrw1
   BJcYGDIgN0XyDg7fZb0XuGVLh7oDG4gEUpGxrsJbHtGl8ZzFS/IL3QgvN
   B3/eJajHJK5/AoCZIT8yp3LmtcbMuw3v7ks4rLRxbSVDNojDqxVHZ19FV
   A==;
X-CSE-ConnectionGUID: OD9Rw0B9QCyQJe8lgS8veQ==
X-CSE-MsgGUID: jzmhBIxgRlGG/Y+gOKu4ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64561567"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="64561567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:51:13 -0700
X-CSE-ConnectionGUID: PjNPTA6ZS++YtS/PcVkdRg==
X-CSE-MsgGUID: Ij/O88I9S+2t9l2xo/PkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153760255"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:51:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Dibin Moolakadan
 Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>, Imre Deak
 <imre.deak@intel.com>, David Laight <david.laight.linux@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Matt Wagantall
 <mattw@codeaurora.org>, Dejin Zheng <zhengdejin5@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/4] iopoll: Generalize read_poll_timeout() into
 poll_timeout_us()
In-Reply-To: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
Date: Thu, 03 Jul 2025 14:51:05 +0300
Message-ID: <a27948e7e468cf76f13ebb241df77f44a59c1811@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> While read_poll_timeout() & co. were originally introduced just
> for simple I/O usage scenarios they have since been generalized to
> be useful in more cases.
>
> However the interface is very cumbersome to use in the general case.
> Attempt to make it more flexible by combining the 'op', 'var' and
> 'args' parameter into just a single 'op' that the caller can fully
> specify.
>
> For example i915 has one case where one might currently
> have to write something like:
> 	ret =3D read_poll_timeout(drm_dp_dpcd_read_byte, err,
> 				err || (status & mask),
> 				0 * 1000, 200 * 1000, false,
> 				aux, DP_FEC_STATUS, &status);
> which is practically illegible, but with the adjusted macro
> we do:
> 	ret =3D poll_timeout_us(err =3D drm_dp_dpcd_read_byte(aux, DP_FEC_STATUS=
, &status),
> 			      err || (status & mask),
> 			      0 * 1000, 200 * 1000, false);
> which much easier to understand.
>
> One could even combine the 'op' and 'cond'  parameters into
> one, but that might make the caller a bit too unwieldly with
> assignments and checks being done on the same statement.

I think it's better like this, with separate op and cond.

It might be worth mentioning this patch should have no functional
changes to the existing read_poll_timeout*() users.

> This makes poll_timeout_us() closer to the i915 __wait_for()
> macro, with the main difference being that __wait_for() uses
> expenential backoff as opposed to the fixed polling interval
> used by poll_timeout_us(). Eventually we might be able to switch
> (at least most of) i915 to use poll_timeout_us().
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.co=
m>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Matt Wagantall <mattw@codeaurora.org>
> Cc: Dejin Zheng <zhengdejin5@gmail.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  include/linux/iopoll.h | 110 +++++++++++++++++++++++++++++------------
>  1 file changed, 78 insertions(+), 32 deletions(-)
>
> diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
> index 91324c331a4b..0d8186d3df03 100644
> --- a/include/linux/iopoll.h
> +++ b/include/linux/iopoll.h
> @@ -14,41 +14,38 @@
>  #include <linux/io.h>
>=20=20
>  /**
> - * read_poll_timeout - Periodically poll an address until a condition is
> - *			met or a timeout occurs
> - * @op: accessor function (takes @args as its arguments)
> - * @val: Variable to read the value into
> - * @cond: Break condition (usually involving @val)
> - * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops).=
 Please
> - *            read usleep_range() function description for details and
> + * poll_timeout_us - Periodically poll and perform an operaion until

*operation

> + *                   a condition is met or a timeout occurs
> + *
> + * @op: Operation
> + * @cond: Break condition
> + * @sleep_us: Maximum time to sleep between operations in us (0 tight-lo=
ops).
> + *            Please read usleep_range() function description for detail=
s and
>   *            limitations.

Side note, I've sent a patch [1] to switch from usleep_range() to
fsleep(), which is perhaps better for the longer waits. But the patch at
hand is much more important to us than that.

[1] https://lore.kernel.org/r/20250626145119.2048423-1-jani.nikula@intel.com

>   * @timeout_us: Timeout in us, 0 means never timeout
> - * @sleep_before_read: if it is true, sleep @sleep_us before read.
> - * @args: arguments for @op poll
> + * @sleep_before_op: if it is true, sleep @sleep_us before operation.
>   *
>   * When available, you'll probably want to use one of the specialized
>   * macros defined below rather than this macro directly.
>   *
> - * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
> - * case, the last read value at @args is stored in @val. Must not
> + * Returns: 0 on success and -ETIMEDOUT upon a timeout. Must not
>   * be called from atomic context if sleep_us or timeout_us are used.
>   */
> -#define read_poll_timeout(op, val, cond, sleep_us, timeout_us, \
> -				sleep_before_read, args...) \
> +#define poll_timeout_us(op, cond, sleep_us, timeout_us, sleep_before_op)=
 \
>  ({ \
>  	u64 __timeout_us =3D (timeout_us); \
>  	unsigned long __sleep_us =3D (sleep_us); \
>  	ktime_t __timeout =3D ktime_add_us(ktime_get(), __timeout_us); \
>  	might_sleep_if((__sleep_us) !=3D 0); \
> -	if (sleep_before_read && __sleep_us) \
> +	if ((sleep_before_op) && __sleep_us) \
>  		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
>  	for (;;) { \
> -		(val) =3D op(args); \
> +		op; \
>  		if (cond) \
>  			break; \
>  		if (__timeout_us && \
>  		    ktime_compare(ktime_get(), __timeout) > 0) { \
> -			(val) =3D op(args); \
> +			op; \
>  			break; \
>  		} \
>  		if (__sleep_us) \
> @@ -59,17 +56,16 @@
>  })
>=20=20
>  /**
> - * read_poll_timeout_atomic - Periodically poll an address until a condi=
tion is
> - * 				met or a timeout occurs
> - * @op: accessor function (takes @args as its arguments)
> - * @val: Variable to read the value into
> - * @cond: Break condition (usually involving @val)
> - * @delay_us: Time to udelay between reads in us (0 tight-loops). Please
> - *            read udelay() function description for details and
> + * poll_timeout_us_atomic - Periodically poll and perform an operaion un=
til
> + *                          a condition is met or a timeout occurs
> + *
> + * @op: Operation
> + * @cond: Break condition
> + * @sleep_us: Maximum time to sleep between operations in us (0 tight-lo=
ops).
> + *            Please read usleep_range() function description for detail=
s and
>   *            limitations.
>   * @timeout_us: Timeout in us, 0 means never timeout
> - * @delay_before_read: if it is true, delay @delay_us before read.
> - * @args: arguments for @op poll
> + * @delay_before_op: if it is true, delay @delay_us before operation.
>   *
>   * This macro does not rely on timekeeping.  Hence it is safe to call ev=
en when
>   * timekeeping is suspended, at the expense of an underestimation of wal=
l clock
> @@ -78,27 +74,26 @@
>   * When available, you'll probably want to use one of the specialized
>   * macros defined below rather than this macro directly.
>   *
> - * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
> - * case, the last read value at @args is stored in @val.
> + * Returns: 0 on success and -ETIMEDOUT upon a timeout.
>   */
> -#define read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, \
> -					delay_before_read, args...) \
> +#define poll_timeout_us_atomic(op, cond, delay_us, timeout_us, \
> +			       delay_before_op) \

There's a sleep_us/delay_us mismatch in kernel-doc and macro args.

Arguably it should remain delay for the _atomic() variants.

>  ({ \
>  	u64 __timeout_us =3D (timeout_us); \
>  	s64 __left_ns =3D __timeout_us * NSEC_PER_USEC; \
>  	unsigned long __delay_us =3D (delay_us); \
>  	u64 __delay_ns =3D __delay_us * NSEC_PER_USEC; \
> -	if (delay_before_read && __delay_us) { \
> +	if ((delay_before_op) && __delay_us) { \
>  		udelay(__delay_us); \
>  		if (__timeout_us) \
>  			__left_ns -=3D __delay_ns; \
>  	} \
>  	for (;;) { \
> -		(val) =3D op(args); \
> +		op; \
>  		if (cond) \
>  			break; \
>  		if (__timeout_us && __left_ns < 0) { \
> -			(val) =3D op(args); \
> +			op; \
>  			break; \
>  		} \
>  		if (__delay_us) { \
> @@ -113,6 +108,57 @@
>  	(cond) ? 0 : -ETIMEDOUT; \
>  })
>=20=20
> +/**
> + * read_poll_timeout - Periodically poll an address until a condition is
> + *                     met or a timeout occurs
> + * @op: accessor function (takes @args as its arguments)
> + * @val: Variable to read the value into
> + * @cond: Break condition (usually involving @val)
> + * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops).=
 Please
> + *            read usleep_range() function description for details and
> + *            limitations.
> + * @timeout_us: Timeout in us, 0 means never timeout
> + * @sleep_before_read: if it is true, sleep @sleep_us before read.
> + * @args: arguments for @op poll
> + *
> + * When available, you'll probably want to use one of the specialized
> + * macros defined below rather than this macro directly.
> + *
> + * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
> + * case, the last read value at @args is stored in @val. Must not
> + * be called from atomic context if sleep_us or timeout_us are used.
> + */
> +#define read_poll_timeout(op, val, cond, sleep_us, timeout_us, \
> +			  sleep_before_read, args...) \
> +	poll_timeout_us((val) =3D op(args), cond, sleep_us, timeout_us, sleep_b=
efore_read)
> +
> +/**
> + * read_poll_timeout_atomic - Periodically poll an address until a condi=
tion is
> + *                            met or a timeout occurs
> + * @op: accessor function (takes @args as its arguments)
> + * @val: Variable to read the value into
> + * @cond: Break condition (usually involving @val)
> + * @delay_us: Time to udelay between reads in us (0 tight-loops). Please
> + *            read udelay() function description for details and
> + *            limitations.
> + * @timeout_us: Timeout in us, 0 means never timeout
> + * @delay_before_read: if it is true, delay @delay_us before read.
> + * @args: arguments for @op poll
> + *
> + * This macro does not rely on timekeeping.  Hence it is safe to call ev=
en when
> + * timekeeping is suspended, at the expense of an underestimation of wal=
l clock
> + * time, which is rather minimal with a non-zero delay_us.
> + *
> + * When available, you'll probably want to use one of the specialized
> + * macros defined below rather than this macro directly.
> + *
> + * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
> + * case, the last read value at @args is stored in @val.
> + */
> +#define read_poll_timeout_atomic(op, val, cond, sleep_us, timeout_us, \
> +				 sleep_before_read, args...) \
> +	poll_timeout_us_atomic((val) =3D op(args), cond, sleep_us, timeout_us, =
sleep_before_read)

Ditto about delay_us/sleep_us.

With the nitpicks fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +
>  /**
>   * readx_poll_timeout - Periodically poll an address until a condition i=
s met or a timeout occurs
>   * @op: accessor function (takes @addr as its only argument)

--=20
Jani Nikula, Intel
