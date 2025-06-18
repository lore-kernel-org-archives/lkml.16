Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EE260576
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280946; cv=none; b=R37oNsh0RJMhnmUfKpAxWFpurK5evjamiZDW8wuhhFq+/r0pP3Qx6yEh6BbXTTUNlyCFqB1gAFj1Erxyzz82JGtNhjG7YdIaBHgPZTCCVZTotmzM09xlPFK22AfnYp+EwCFBN9PdUsicUfDJkeORcKbJYkx9PH+dA9SX9J4HaAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280946; c=relaxed/simple;
	bh=Sz6aQbaQwZIG9liuFsaksla45UWFZygI4wPqJGpKwFw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tFsmI8GG92fVjKlgnSJhMc+2ImZFupaCQdSky18ZBDJ4LSetz1ud4xoBrp+TW21OJFmozyNx490pK+ObluMCvIwZnqCnXbxTEFtEzDI7JEdZoUBO7iBq4UT/mR6TBmgD8V940QogC6IhMPsCqpXjUJwvyiXVOJOT/45ZLEQQ52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=XEMaxdj7; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="XEMaxdj7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Sz6aQbaQwZIG9liuFsaksla45UWFZygI4wPqJGpKwFw=;
	t=1750280944; x=1751490544; b=XEMaxdj7ehLh7VfQYEOLQl84rpJ1P8StYXlylo76JOtjKiC
	r8ePWBcd+UU51CVgeB2t/AbeNPOlqZUvWIUgatCjMKm8odvEjbD/PyKyjqzldVREGqZ1ppeTW/Box
	Fq+4kVM++pNJX4uANeKlmwz3dEJ8BHPVwqS+uCt8pRIeM4Ql8u2Xb/gPwTLriHh5qiBwggzYIohxv
	ZNtG/moiLwXvDmAvdysL6CfVLervLzbgCCldbwToc2RIk1JwzevkuH081nRiYR2l9mNgGJaYSuGVb
	fTr+/5SqI9U8aG/x816kUkmUHWLybOOiCiL7HxmdFoRJKVQgPsTbRiMwZ5hJRvZw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uS01j-0000000GyqB-3MMy;
	Wed, 18 Jun 2025 23:09:01 +0200
Message-ID: <8bdd635e6b8ba42b16f355f9d4ee67d5c2f8b47e.camel@sipsolutions.net>
Subject: Re: [PATCH] scripts: gdb: move MNT_* constants to gdb-parsed
From: Johannes Berg <johannes@sipsolutions.net>
To: Stephen Brennan <stephen.s.brennan@oracle.com>, 
	linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Benjamin
 Berg <benjamin.berg@intel.com>
Date: Wed, 18 Jun 2025 23:08:58 +0200
In-Reply-To: <a01d8c8e-21b7-488d-8fa2-0a8710bc1e9a@oracle.com>
References: <20250618134629.25700-2-johannes@sipsolutions.net>
	 <a01d8c8e-21b7-488d-8fa2-0a8710bc1e9a@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2025-06-18 at 14:06 -0700, Stephen Brennan wrote:
> On 6/18/25 06:46, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> >=20
> > Since these are now no longer defines, but in an enum.
> >=20
> > Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
> > Reviewed-by: Benjamin Berg <benjamin.berg@intel.com>
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>=20
> The exact same change was already submitted and discussed here:
>=20
> https://lore.kernel.org/all/20250601055027.3661480-1-tony.ambardar@gmail.=
com/

Oh, I missed that, sorry.

> I don't know what tree this would go through, so I can't tell whether it
> was picked up or not. But I think there's consensus that it's a good
> fix, and several folks have written or reviewed the change.

It looks like previously Andrew picked up patches to this which is why I
Cc'ed him, but I'm perfectly happy for that other patch (or mine) to
take any path available :)

johannes
