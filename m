Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA21624DF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289419; cv=none; b=qucptFc65DK/JD57KA4S1+0+KLyL8klbaeNH05UFB6m5k5fMT682pI11VW6QnegjBsJPF2MNFpaRdPCzN+uHNoHArpilF8wG34tg/ANkAbDLLLnzrlFH28+0clp/P0zPnIwiysxoZMUDYXOWycxm+totGjdMSadCR1QNSBrrj0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289419; c=relaxed/simple;
	bh=rZDEFDSJGeYqHUOh75OO0ircfG8oajzfkaU8hU0ShWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXh6HN9eipcaxIkQN6hXh4iEnXJAa5k5Qb9V1Q8DxUvvGlHPSEuDY/8z1pPJsgg74IkKUgUK4Nk9cUo3D6R2opqzq/BeFz7XKiZlxoLYqGTqHNStEHtvbNQFEsD/DHtOO7stxbL7kjhZcZVnFmVj5Nu5bbV6YdTuort79TIeLpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 21 Apr 2025 22:36:46 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: [PATCH] kexec: Include kernel-end even without crashkernel
Message-ID: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzde7snpamx2jdcs"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--nzde7snpamx2jdcs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] kexec: Include kernel-end even without crashkernel
MIME-Version: 1.0

Certain versions of kexec don't even work without kernel-end being
added to the device-tree. Add it even if crash-kernel is disabled.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/kexec/core.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 00e9c267b912f..7b5958c37f702 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -22,6 +22,8 @@
 #include <asm/setup.h>
 #include <asm/firmware.h>
=20
+#define cpu_to_be_ulong __PASTE(cpu_to_be, BITS_PER_LONG)
+
 #ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
@@ -136,17 +138,10 @@ int __init overlaps_crashkernel(unsigned long start, =
unsigned long size)
 }
=20
 /* Values we need to export to the second kernel via the device tree. */
-static phys_addr_t kernel_end;
 static phys_addr_t crashk_base;
 static phys_addr_t crashk_size;
 static unsigned long long mem_limit;
=20
-static struct property kernel_end_prop =3D {
-	.name =3D "linux,kernel-end",
-	.length =3D sizeof(phys_addr_t),
-	.value =3D &kernel_end,
-};
-
 static struct property crashk_base_prop =3D {
 	.name =3D "linux,crashkernel-base",
 	.length =3D sizeof(phys_addr_t),
@@ -165,8 +160,6 @@ static struct property memory_limit_prop =3D {
 	.value =3D &mem_limit,
 };
=20
-#define cpu_to_be_ulong	__PASTE(cpu_to_be, BITS_PER_LONG)
-
 static void __init export_crashk_values(struct device_node *node)
 {
 	/* There might be existing crash kernel properties, but we can't
@@ -190,6 +183,15 @@ static void __init export_crashk_values(struct device_=
node *node)
 	mem_limit =3D cpu_to_be_ulong(memory_limit);
 	of_update_property(node, &memory_limit_prop);
 }
+#endif /* CONFIG_CRASH_RESERVE */
+
+static phys_addr_t kernel_end;
+
+static struct property kernel_end_prop =3D {
+	.name =3D "linux,kernel-end",
+	.length =3D sizeof(phys_addr_t),
+	.value =3D &kernel_end,
+};
=20
 static int __init kexec_setup(void)
 {
@@ -200,16 +202,17 @@ static int __init kexec_setup(void)
 		return -ENOENT;
=20
 	/* remove any stale properties so ours can be found */
-	of_remove_property(node, of_find_property(node, kernel_end_prop.name, NUL=
L));
+	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
+						  NULL));
=20
 	/* information needed by userspace when using default_machine_kexec */
 	kernel_end =3D cpu_to_be_ulong(__pa(_end));
 	of_add_property(node, &kernel_end_prop);
=20
+#ifdef CONFIG_CRASH_RESERVE
 	export_crashk_values(node);
-
+#endif
 	of_node_put(node);
 	return 0;
 }
 late_initcall(kexec_setup);
-#endif /* CONFIG_CRASH_RESERVE */
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--nzde7snpamx2jdcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAL4ACgkQXVpXxyQr
Is/Rdw//aZ/gDOUiLOgJS8j1ko2eGjIzxYlBW03r8PuxmJYsvyE2NQafHwyBcZIW
7LgYOCArrlqW8hJJN0bU9fPEqgb/pbsQZWdNlGQlgXL/Q6mmQCunEzdPiyXCuduf
kZZKYy6J0h4uxcA3r9zlPbwfePgC279IS3cHWDhQW9+KX/1VatTgQCa9ouMaBuLm
l4QZfLU8lBkZhUT6uZ9xk5977s0uUN++30VTNujVAgW8jFQmkmoScVuj40GsdnuL
MMi1Q7PQSgsM9sjAtTczAo6b5VWysSc4cqZFbZYRPk72E+heGptKxngVo84It7a1
jFozTTQycO9jp8x4k6ootp4xmn+yM2x5LqAfXy9lwE5QCRG1PjSQJsXupWGW3bMT
URa3zqNySf3yhmCxi0pHXhU0ZNhUpFX7IwfMEouZR8qcqOCarZ9PXNXp7dordh/L
Lpi9MEJx8HZG46+TxFAK1QGwv3hY7K1L7yAGwt7IPr/tR8dDXFn1FN0AJ+pPkmiN
IJ7UGlNZliwvr4CzB7CjH2hwi528tXfoBgR2xp9cKUuEnweyFKXPtCpcYRI4Z6xq
lDzmRTBk2u/Re/uXzziLOPciUUxjNTEl0lEuJ9pHNAtcHD+4dh0u07sGEopWlf6h
oZtck4zNVZQh6ak+nvXuf44c5RDqvYaQkclumtE6GBzFpjZeh+g=
=oqyi
-----END PGP SIGNATURE-----

--nzde7snpamx2jdcs--
