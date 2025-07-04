Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918862D640A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630351; cv=none; b=d/Pt7ErStmbC27X7EGeZFvPThzxdA1FV6BRVQO5japRo9aWbCX8BPp5SVTKZD9uBqTzXj0zRbRj2lwN0wxVqYPLBT7OFi3KdUQDENKUohx1I98kW4+WlbUbeUnnCbZfskxEbV4iMhcGT1avzKv5llMUxqG9sELVU09qjcmzJjWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630351; c=relaxed/simple;
	bh=p5XdvK5gQteG+3d+D+Dd/ElOWPl/rbmH6W2URxWTVc8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oNGACL7m7cikRyrJp6ZT2J2ZC2PgJ4j1gRl98WBUVH9SAinVmEyZOhTWHeAhdb2MYQROVYCTOQOwE9r4iURgOKhwuSkCfKVZ6GfRCIBmjd6rtb4Q/hogBypOYOubFXP60fPZzu9xiSyRAk6a89/ARuQjrhVqI/yhYXNSFGNJ2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=EJwn1uq7; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="EJwn1uq7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=p5XdvK5gQteG+3d+D+Dd/ElOWPl/rbmH6W2URxWTVc8=;
	t=1751630349; x=1752839949; b=EJwn1uq7MpMZSkl/ArusLEn9Wx8IXay8+LBnmRQc7b9Kb4C
	VM9kYDcvFPxTTOsUMSiwrURXwW/ix+Lrdv8eDCBmXw+KR/2xXp7Lz09u4GVHdfRhbLkK7KwrJMEdX
	M5rLhKlbn3XmJsbW8zoAKaRe8JmyM2UMK98jphe14YK7KjK5Z8Id9r23TCCn4/YrVYPLJ0HIpMXKE
	vDe3U97whVfsv/4Q7Lo3jiERHT0RhR/3Hcm7vtnI54vfWaVxS4HzPSav2BDVuggU4zULc/Qy3XBwh
	5PMarfkIFezwcdLobNK7UMHS0z4/D6KW/k/PoI2OqJa60xy2t8mscapL1ZGnlH3A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uXf4E-00000006oKn-1wUV;
	Fri, 04 Jul 2025 13:58:58 +0200
Message-ID: <98d145e6dd8e216a3f7e146ad4e401724c3d669b.camel@sipsolutions.net>
Subject: Re: [PATCH 21/23] um: ptrace: Use USER_REGSET_NOTE_TYPE() to
 specify regset note names
From: Johannes Berg <johannes@sipsolutions.net>
To: Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>,  "H. Peter Anvin"	 <hpa@zytor.com>, Oleg
 Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>, linux-um@lists.infradead.org, x86@kernel.org
Date: Fri, 04 Jul 2025 13:58:57 +0200
In-Reply-To: <20250701135616.29630-22-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
	 <20250701135616.29630-22-Dave.Martin@arm.com>
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

On Tue, 2025-07-01 at 14:56 +0100, Dave Martin wrote:
> Instead of having the core code guess the note name for each regset,
> use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.
>=20

Seems to work according to the test in the cover letter. Since it's part
of a larger series and this patch doesn't build by itself, I'll assume
you want to take them all together through some other tree, so:

Acked-by: Johannes Berg <johannes@sipsolutions.net>
Tested-by: Johannes Berg <johannes@sipsolutions.net>

johannes
