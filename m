Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985A1D54F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417665; cv=none; b=Qoqrj9n1yhyrvNEODsnVvg4b1Kd0jqWMqA4i6i48nNfPeErTKEitwMgdhUPX5yM/BqXhu+v2pG78kwg2NMV9vs0PESE5Yp9vIVMYx5gJjgqp6IqZax8Lh5W7q+JflQCdXxdx7r30/RwoegQnp5p/xQLsfxMa1wdWPJnjsgtTKwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417665; c=relaxed/simple;
	bh=CigLereCZe6ocaLo3SuKk8vwfiZ20m04vzD/+v2lvgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcK4W63V66gP8yB3jAV37lTdduPTKepHdV3qQXoInDFJKi+usuI+Ck1ezmp5Q+UD46oi8S7Kw5DeS1aQHP/LLRtnlnrUIsCvEBfVhLzFqgjvMef2ih/ltPSBZJcu7ZGgfub1VVQvdiWMLe4F6aXzTnYQi0veUQi4N2xCMvWDE40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZNaFjfw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZNaFjfw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E41C4CEE3;
	Fri, 20 Jun 2025 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417664;
	bh=CigLereCZe6ocaLo3SuKk8vwfiZ20m04vzD/+v2lvgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZNaFjfwQxegOrI76Gf9If9HUoK7T+Wenvq/WDhWA2mTXLdhVVQqRdkgj237Nh14N
	 KI7OJIQiyFGV5mGB2KAh5u1gZstoJ24Zhmat6zhRR0dX5w+3boEn0vrD95xqzXDYor
	 fq36Aa7xp7zdAIRu7nV7ki52fofqqq5U8qjH66Nw0lV+A9I13C6g+T+s/bPr4Yu1BK
	 5YnwiNGAv+f8w1D2Ul1eIn7TjN1n4C2Zc0Uturc2FOcL4gn+GeWGzFVpBSqXCFHBqF
	 0fS2hq6NreYau7AXaHwIDTp3Vn5KeiAGpt/H5IJ+hrSjho+SW8I5WEDDe0PAkHq2r2
	 LKPyS+0GkGSug==
Date: Fri, 20 Jun 2025 11:42:28 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <szadjbcldmcirdtgiv6wowqumlk4cbthb37f3e42lzcbt4tnla@ilp4m6quqk4b>
References: <20250612175515.3251-1-spasswolf@web.de>
 <vvorpevngfle6budlgqhmj3f25lb77czzyvd5aa6jil7zkaqgp@weanygri324r>
 <11898dd756020687c2016a37af3c948b350bdbbc.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3jubu2pejz6gje7k"
Content-Disposition: inline
In-Reply-To: <11898dd756020687c2016a37af3c948b350bdbbc.camel@web.de>


--3jubu2pejz6gje7k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 04:09:04PM +0200, Bert Karwatzki wrote:
> Am Donnerstag, dem 19.06.2025 um 13:50 +0200 schrieb Joel Granados:
> > Hey Bert
> >=20
> > Thx for the report.
> >=20
> > I just tested on my https://git.kernel.org/pub/scm/linux/kernel/git/sys=
ctl/sysctl.git/log/?h=3Dsysctl-next
> > and can't see the issue. Maybe its something that I'm missing in the
> > configuration. Do you happen to have your the .config that you used?
=2E..
> > > +#endif
> > >  };
> > > =20
> > >  int __init sysctl_init_bases(void)
> > >=20
> > >=20
> > > Bert Karwatzki
>=20
> I'm running next-20250617 (but I'll also try your sysctl-next branch) wit=
h PREEMPT_RT=3Dy, my current theory is that
> the init_rtmutex_sysctl() is corrupting the rbtree (if I remove init_rtmu=
tex_sysctl() everything works
> (with the same .config)), and in the process=A0removes the overflow{uid,g=
id} files.

I think that the error occurs when the register gets called several
times for the same path, returns an error resulting in a undefined
state. I see that rtmutex.c is included from 4 files, I also see that the
registration happens 4 times.

I just did not understand what was being done in my initial patch. The
fix is to put the sysctl registration in some "main" file (rtmutx_api?)
and to keep the max_lock_depth variable there as well (like it was
originally)


This is my proposal, Does it solve your issue?


diff --git i/include/linux/rtmutex.h w/include/linux/rtmutex.h
index dc9a51cda97c..fa9f1021541e 100644
--- i/include/linux/rtmutex.h
+++ w/include/linux/rtmutex.h
@@ -18,6 +18,8 @@
 #include <linux/rbtree_types.h>
 #include <linux/spinlock_types_raw.h>
=20
+extern int max_lock_depth;
+
 struct rt_mutex_base {
 	raw_spinlock_t		wait_lock;
 	struct rb_root_cached   waiters;
diff --git i/kernel/locking/rtmutex.c w/kernel/locking/rtmutex.c
index 705a0e0fd72a..c80902eacd79 100644
--- i/kernel/locking/rtmutex.c
+++ w/kernel/locking/rtmutex.c
@@ -29,29 +29,6 @@
 #include "rtmutex_common.h"
 #include "lock_events.h"
=20
-/*
- * Max number of times we'll walk the boosting chain:
- */
-static int max_lock_depth =3D 1024;
-
-static const struct ctl_table rtmutex_sysctl_table[] =3D {
-	{
-		.procname	=3D "max_lock_depth",
-		.data		=3D &max_lock_depth,
-		.maxlen		=3D sizeof(int),
-		.mode		=3D 0644,
-		.proc_handler	=3D proc_dointvec,
-	},
-};
-
-static int __init init_rtmutex_sysctl(void)
-{
-	register_sysctl_init("kernel", rtmutex_sysctl_table);
-	return 0;
-}
-
-subsys_initcall(init_rtmutex_sysctl);
-
 #ifndef WW_RT
 # define build_ww_mutex()	(false)
 # define ww_container_of(rtm)	NULL
diff --git i/kernel/locking/rtmutex_api.c w/kernel/locking/rtmutex_api.c
index 9e00ea0e5cfa..4fa1acceaebb 100644
--- i/kernel/locking/rtmutex_api.c
+++ w/kernel/locking/rtmutex_api.c
@@ -8,6 +8,30 @@
 #define RT_MUTEX_BUILD_MUTEX
 #include "rtmutex.c"
=20
+/*
+ * Max number of times we'll walk the boosting chain:
+ */
+int max_lock_depth =3D 1024;
+
+static const struct ctl_table rtmutex_sysctl_table[] =3D {
+	{
+		.procname	=3D "max_lock_depth",
+		.data		=3D &max_lock_depth,
+		.maxlen		=3D sizeof(int),
+		.mode		=3D 0644,
+		.proc_handler	=3D proc_dointvec,
+	},
+};
+
+static int __init init_rtmutex_sysctl(void)
+{
+	printk("registering rtmutex");
+	register_sysctl_init("kernel", rtmutex_sysctl_table);
+	return 0;
+}
+
+subsys_initcall(init_rtmutex_sysctl);
+
 /*
  * Debug aware fast / slowpath lock,trylock,unlock
  *


--=20

Joel Granados

--3jubu2pejz6gje7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhVLQQACgkQupfNUreW
QU9wfQv9EEs98fDOojiKBdSXxhA9PkvERiDG3zo9aQsiZUaFZkmQm/zfsBgWK+Ej
gFWF+t68/HiNYLLRf/iAvEEtJgdng2hO7yD2W5OyZKFz1RyplABWm84VUR+F7WhW
LMiayPU9+IWQk9LnKdFG+xa0sUcht2CO1XXBbt1ijq5mq/xG4ZnlL4BrVrfbgGuJ
TpP7FL9zanS2nDWFTb4ZkSEgFQOHzEERgRA0lqfg52hgPkmdpBNjw7H4JSaoq2ps
T4hdcVGtK4QKlAswgBXiTko7jPGiBlwhRB4wRRMs2RoGl8jIKqioxZWTp2n1A2kj
Aevj/LcRzrLhzohgyZLnNEaFu767jA2Zx3kXDUgT2tjD+iG4FMOOgtGXSYrrGUZC
hF/lvY7ZW9ZPJxDm1cvGvJ9OfJHCmFDnFRzi/ev9Ux/NMJ8p8/AD0o+z9aaOittu
/J4x/zHrzm8soVKmdKoTHOoxgMHXls2qmYyf572TpR83IxfLHlZUv3psyG6hLd9G
pDVPCMD0
=7Pzx
-----END PGP SIGNATURE-----

--3jubu2pejz6gje7k--
