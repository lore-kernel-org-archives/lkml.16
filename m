Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D83C26
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748996190; cv=none; b=kEueAXJgsmYqbHiNPvk63P5tyskzVD1POleE5GsUdcdLq50NUR8ObHbHkOju1J7EQQlTaYsD6dogPLAflb8XK5QNLSYduBqyyyml2wxogsi1R0XXyX/GwkB/acmSTtQxvdRg6+e2twkhxcC/3kbua13b1kYGSGwtFOlNjaEmWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748996190; c=relaxed/simple;
	bh=H5Iv+afUbDl9O4brq6c2Vj+PYtnojaNeSn8MWY0pwaw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q3CzfCER7LZtRfB3YXLiKbf3trNVC8qqZy3fgEvFLiC7S6by7QraoMXOejyLZ1SE+MgQQAkMQY+zeTCXZXGq0CTet5ZWpSuH7nbzWq/I/2InB79AgJssPgs4yiEZjGamx/WAPLeo7Q//orK7km2vrrjOyUEVU55sa2aikNRTwEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=m0qbe8HZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="m0qbe8HZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB1AC4CEED;
	Wed,  4 Jun 2025 00:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748996190;
	bh=H5Iv+afUbDl9O4brq6c2Vj+PYtnojaNeSn8MWY0pwaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m0qbe8HZDq8J5M1jsxNjwRJC/7BY9mOIlJkpOy5Z3VW+r7ViU5RRaM3bR2T48KLUw
	 Zcs6vZVJie/svJskIgkSErEC7OTcRz36ZclRw/n5XayYwODjoEE8v/P+xuqkCss2MZ
	 1WOhKgetS8JXC9x7+aRxZ66s2anjMzPNYWIPtq2w=
Date: Tue, 3 Jun 2025 17:16:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Max Kellermann <max.kellermann@ionos.com>, song@kernel.org,
 joel.granados@kernel.org, dianders@chromium.org, cminyard@mvista.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kernel/rcu/tree_stall: add
 /sys/kernel/rcu_stall_count
Message-Id: <20250603171628.695542215c05af8727dc57a0@linux-foundation.org>
In-Reply-To: <47196e67-6533-4015-95db-63a76c1c0c5c@linux.ibm.com>
References: <20250504180831.4190860-1-max.kellermann@ionos.com>
	<20250504180831.4190860-3-max.kellermann@ionos.com>
	<47196e67-6533-4015-95db-63a76c1c0c5c@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 22:09:30 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> =
wrote:

> Hello Andrew,
>=20
> > +#endif
> > +
> >   		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gp=
s);
> >   		if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
> >   			pr_err("INFO: %s detected stall, but suppressed full report due to=
 a stuck CSD-lock.\n", rcu_state.name);
>=20
> It seems like this patch was not applied properly to the upstream tree.
>=20
> Out of the three hunks in this patch, only the first one is applied; the=
=20
> second
> and third hunks are missing.
>=20
> commit 2536c5c7d6ae5e1d844aa21f28b326b5e7f815ef
> Author: Max Kellermann <max.kellermann@ionos.com>
> Date:=A0=A0 Sun May 4 20:08:31 2025 +0200
>=20
>  =A0=A0=A0 kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count
>=20
>  =A0=A0=A0 Expose a simple counter to userspace for monitoring tools.

OK.  iirc there was quite a lot of churn and conflicts here :)

Please send a fixup against latest -linus?
