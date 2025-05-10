Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60281A8F98
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746908598; cv=none; b=uDlgy7nbu9zUmejQs8y9q9ZJYEwkVMlxd0uEmLBROz8PMR5VFCsZUqAO010sqwI5Bu170rUbgH06+UitWJiqOjqCqAG06SeYJ4JxKV2cZkNw3RCRFia8zEsbaRG6R6joUvWoQLxnZqJHFkLRBuxBK3KEcv4StPlV54zkugFdMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746908598; c=relaxed/simple;
	bh=qN8bxgxXw/JuWHM04aEiViparQk0BL3VhD4k6jWlljc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uqQqNB02VaWg2QR0V+qA8fyQf3bGfOYVWvTzmZpx6Z9a6+oC25muC4+CTi8rYOcZsJ35dsgvxC6n8q4wVKP5GfThOl48/MAAts9KRZwzHllak52WR9P8+O/s5/Bh89TFfYW8uVYU6KYvGbmgnaXj8VZTgTilCA1upErL4SX3QX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s40o9nMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s40o9nMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA08C4CEE2;
	Sat, 10 May 2025 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746908598;
	bh=qN8bxgxXw/JuWHM04aEiViparQk0BL3VhD4k6jWlljc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s40o9nMsFQmhbOPFNIZ/u6gd36d4LIHxbQW/N5Dzi9Yn1sJFcIl99PtdBU+NMPfDL
	 s+jzksdcbPJTYJTu/vyHpiZ4EbcyJYDLBm8zM83PiocUjT4g4GmGhoFZwPcHn/BFUk
	 Cv3/3YBiW6CH9yQevuZwt1wgh0q+TmANOWU/j7jI=
Date: Sat, 10 May 2025 13:23:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Boian Bonev <bbonev@devuan.org>
Cc: linux-kernel@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Yang
 Yang <yang.yang29@zte.com.cn>, Wang Yaxin <wang.yaxin@zte.com.cn>, Kun
 Jiang <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>
Subject: Re: Bug 220102 - struct taskstats breaks backward compatibility
 since version 15
Message-Id: <20250510132316.3719945330c9d0ebed86f8c9@linux-foundation.org>
In-Reply-To: <d48f4302ac09d9539242a324ec4d0917fede6a71.camel@devuan.org>
References: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
	<20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
	<d48f4302ac09d9539242a324ec4d0917fede6a71.camel@devuan.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 10 May 2025 14:45:31 +0300 Boian Bonev <bbonev@devuan.org> wrote:

> On Fri, 2025-05-09 at 14:17 -0700, Andrew Morton wrote:
> > Yes, please send along the patch.=A0 Include the suitable Fixes: and we
> > can backport this into the affected -stable kernels.
> >=20
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D220102
>=20
> My patch was attached in the bugzilla above.

We barely use bugzilla at all for kernel development.  I think I wish
that kernel bugzilla was simply shut down, replaced with a page to help
people to email their bug reports.

> I also see that Wang Yaxin
> <wang.yaxin@zte.com.cn> has already sent a different but working
> patch...

Cool.  Except I cannot find that patch.  Help?

