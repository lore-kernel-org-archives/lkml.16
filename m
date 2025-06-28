Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C74D8CE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751099709; cv=none; b=htcxBxqs8uOKaHz+xreeBPfPnPXSPakNJ9YthTpjXib9uHuxohLFuWlel+TdYd28PDiBz+TOFVQFCUmHOjqYRxa0zFWpbOjXXCnY0XG2y+86+nhWeZuanHr4hx6dLwly7+ypcvPtX/ykxjTL1bY1JuTS1kTNHb0+mnrJChoTQGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751099709; c=relaxed/simple;
	bh=cqt83ZxI7bSjprmT0OacHDBmZdcH3AKRjRwAruUGXT4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=d0jU3pjTVH7Jws/Cf4DiKJBFp47Rc0gaqndklTInzQXGKbYIqKSVJEM4zc6q81vVjg4kVlI7kKKGZuCAxzy1ZBn+5AKIam+kiD/w33vgZltb8m7O/pcErb7WctN8zVzRv0X8i8snlKzkmfq8X72MXJj/yjh1zc6cb2dVqSJag/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 621802A7F4D;
	Sat, 28 Jun 2025 10:35:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zk40X_0Amk9y; Sat, 28 Jun 2025 10:35:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C7CB22A7F4E;
	Sat, 28 Jun 2025 10:35:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EXTuODoUP_TT; Sat, 28 Jun 2025 10:35:00 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A63E72A7F4D;
	Sat, 28 Jun 2025 10:35:00 +0200 (CEST)
Date: Sat, 28 Jun 2025 10:35:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux@weissschuh.net
Message-ID: <1837899202.21230.1751099700585.JavaMail.zimbra@nod.at>
In-Reply-To: <20250408115823.1358597-1-richard@nod.at>
References: <20250408115823.1358597-1-richard@nod.at>
Subject: Re: [PATCH] Docs/ABI: Fix sysfs-kernel-address_bits path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: Docs/ABI: Fix sysfs-kernel-address_bits path
Thread-Index: TNxI10WWt7tRX8sPUJDcy8arP5Pq0Q==

----- Urspr=C3=BCngliche Mail -----
> Von: "richard" <richard@nod.at>
> An: "linux-kernel" <linux-kernel@vger.kernel.org>
> CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux@weissschuh.n=
et, "richard" <richard@nod.at>
> Gesendet: Dienstag, 8. April 2025 13:58:21
> Betreff: [PATCH] Docs/ABI: Fix sysfs-kernel-address_bits path

> It's address_bits, not address_bit.
>=20
> Fixes: 00142bfd5a91 ("kernels/ksysfs.c: export kernel address bits")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Documentation/ABI/testing/sysfs-kernel-address_bits | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-kernel-address_bits
> b/Documentation/ABI/testing/sysfs-kernel-address_bits
> index 5d09ff84d4d6..3b72e48086aa 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-address_bits
> +++ b/Documentation/ABI/testing/sysfs-kernel-address_bits
> @@ -1,4 +1,4 @@
> -What:=09=09/sys/kernel/address_bit
> +What:=09=09/sys/kernel/address_bits
> Date:=09=09May 2023
> KernelVersion:=096.3
> Contact:=09Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> --
> 2.48.1

*kind ping*
