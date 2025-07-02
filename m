Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA01420DD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447996; cv=none; b=ZMEOwaimM6cZtfvRgUN01DbrwjKKArhzXSc9VNM65Pdago3l1kyxeqqCtwU1Kt8wP+69fqDLMwdncZPX1GvvCbzwK0cEhTt+XeqVeBvJ9eBqt3XUoAqGNOjMRCjRzOGrof56aSnYIYdXJwMpyxlgwu1HkfKrYhiUC+L9Y6HegSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447996; c=relaxed/simple;
	bh=OGpPrJM/fEZP9T92ybsZeFMmbRlmdnrcXhUYy5PWX4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HK/Qr4WOcI655sbc4d2aPH8KWCoyausrNg1golG41MTik57wBM7hLycaeVtKTt63zFi8QIMIbyNnBRdqkrt2lrl/gLM9jPR2YcnTM8ivqskoQHjJb7dh201c8B3lL9YYjMIGl8Yi+9fofYzCN8IL/BVHh5mtetBzmy95onsrsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 6DA2B1074E6;
	Wed,  2 Jul 2025 09:19:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 5345A32;
	Wed,  2 Jul 2025 09:19:46 +0000 (UTC)
Message-ID: <f543013af300995880a3370bbbeef15a5669345d.camel@perches.com>
Subject: Re: [PATCH v3] checkpatch: Check for missing sentinels in ID arrays
From: Joe Perches <joe@perches.com>
To: Brian Norris <briannorris@chromium.org>, Andy Whitcroft
 <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 02 Jul 2025 02:19:45 -0700
In-Reply-To: <20250701183537.501225-1-briannorris@chromium.org>
References: <20250701183537.501225-1-briannorris@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: knmcx7rtzyyoqao75w5qyrrctbkjb31d
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 5345A32
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18cw340+/Z9tLFNEJB3tbpVlpGjWl/pnt0=
X-HE-Tag: 1751447986-735800
X-HE-Meta: U2FsdGVkX1+ZU7/k34frzU4Y1h4Qk0jmyWeKlX0Hn7lBt0nV3iQtS6EsOLF2hQZQlwmuSlM2i4E8xFpL1ifw5P59gMa4hVfMQbB2GwK8rZwsGG4pR3po9GGLjBhmlmHGUJ9EqWZxzuYm/6pIb7e2ghLSQbtmYtLyGwUC3t9I3oJZZN15a0N+OwOurSjUYTjuUwSyhkT7v+lIw+UFYEGMHyt6z4PC9bIMRZC81ugtPNA2g6gyzSFydJwCL3TDW/8e+gJGoc9SmnS0ENRNUPXqdlrwkl4p0E6fapjsP+Bxk1hR8FZnT2zbGR6f+EOOEsi8

On Tue, 2025-07-01 at 11:34 -0700, Brian Norris wrote:
> All of the ID tables based on <linux/mod_devicetable.h> (of_device_id,
> pci_device_id, ...) require their arrays to end in an empty sentinel
> value. That's usually spelled with an empty initializer entry (e.g.,
> "{}"), but also sometimes with explicit 0 entries, field initializers
> (e.g., '.id =3D ""'), or even a macro entry (like PCMCIA_DEVICE_NULL).
>=20
> Without a sentinel, device-matching code may read out of bounds.
>=20
> I've found a number of such bugs in driver reviews, and we even
> occasionally commit one to the tree. See commit 5751eee5c620 ("i2c:
> nomadik: Add missing sentinel to match table") for example.
>=20
> Teach checkpatch to find these ID tables, and complain if it looks like
> there wasn't a sentinel value.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -685,6 +685,64 @@ our $tracing_logging_tags =3D qr{(?xi:
>  	[\.\!:\s]*
>  )};
> =20
> +# Device ID types from include/linux/mod_devicetable.h.
> +our $dev_id_types =3D qr{(?x:

[ a long list ...]

> +)_device_id};

This list seems unmaintainable.

Does something like '\b[a-z]\w*_device_id\b'
match too many other non-sentinal uses?

$ git grep -P -o -h '\b\w+_device_id\b' -- '*.[ch]' | sort | uniq | wc -l
288

> @@ -7678,6 +7736,30 @@ sub process {
[]
> +# Check that *_device_id tables have sentinel entries.
> +		if (defined $stat && $line =3D~ /struct $dev_id_types .*\[\] =3D \{/) =
{

Spacing isn't guaranteed so perhaps

$line =3D~ /struct\s+$dev_id_types\s+\w+\s*\[\s*\]\s*=3D\s*\{/

