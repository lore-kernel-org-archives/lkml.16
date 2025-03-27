Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592311AA1E0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743118849; cv=none; b=hvBakFmjB7uEuEMjLXH685A2JKcDeFek7zuObxSTzlv1F/gkrOjuXGB1gJHcNA6nrJBNxOz+uES9CELQ311jMOcTDvwR0S3sobyuhsdats3pEaW7WH9KvrCr5m/DiYefSV7LuOB0aFFu8/Y8d3wOPLouynE/oOYd5mYekEm43tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743118849; c=relaxed/simple;
	bh=4mZ5loR1n2RQh8haFBL1ne3Pd5C5k/X3Gfa2nHEbdsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKyzPo9rVbmVDVyz6ZKGyNM7/vSrji5swNHQwXIldBAcirr5+qQA3FpBVgzEvpw7pBbyJZb9WQBwpluGhMYOaIugda58ZvTVX2Nut8Y0z1cRhDq1N3Z6qaqM9Jia/3tJfWdp6XTNzhpdoxwNI9fPBfY18Nt8CHC++EMU2EHCZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ayjKaoAi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ayjKaoAi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C09F40E021E;
	Thu, 27 Mar 2025 23:40:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Uq__qQZ0tv6C; Thu, 27 Mar 2025 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743118836; bh=oI4FPLSsvMMsGRjS5/ggg98WeoNDTnygYAZClij+M2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayjKaoAimU1Qh3vhMGTkuh1VGezcWowXkZItJLNZlqnp+wiGcjQOA3grRzEQ0hyRp
	 +cUNb/kK9TwA5XS0WIDrcmSlDp1qUER4OZKUKcDESSmF5EPBPG1Pd/GM743cagxyV1
	 hjB5RntRpyEF4+eLhvzXune5Mwre1mtrndwlBKXbQUxgNhqGmq1SbmbnRJu6zMdeAa
	 G6D77A0vatZIPxYJhCmgpZGm8+0p1lDLMXX9V9G56Xc6y8n7e4d5DUp5C/ATOxpded
	 WQJWNrpE20l9CdyemKqJrH/A3OMQ4UBb9a2bKVU3Gis5gBBZo9mpn+G2n9+DbJ6pg5
	 +60ZrBOHTnxnlH1mCkROzT5HJ+8ELV4zTFXNgEES4+W82rfmeLlIl5uea/7XqU6jYy
	 LOtii/s+OaJA2DJLHfykYQ6+bEm1I6g4IipcBEqjFJRm8Hd0OB8xIUpdx6ZDmeA9+i
	 AXjfP4ZldbpdzY6DSas4uqIsGjfhHZDCvkC8kxKH4eldeV0Cpprg4giBWFAI0fhxFy
	 I7xXbK+5a8l17TjeyJqtpIKTumhkqE3mNIi3uudY7ztoikhStTgR4sD0HttYqqLNsv
	 0ZA3I0M22KQ2JALmfwI4ZJ6Z2gJ4fI6RLAdsBBD5aJvSov49rjv1rmLJ9bHKIwcLhz
	 L1nCVfHkWu68Gq55gOOx/7mc=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52D0940E0169;
	Thu, 27 Mar 2025 23:40:28 +0000 (UTC)
Date: Fri, 28 Mar 2025 00:40:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: boris.ostrovsky@oracle.com
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <20250327234021.GEZ-Xh5TM0GCqvwScL@fat_crate.local>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
 <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>

On Thu, Mar 27, 2025 at 05:44:32PM -0400, boris.ostrovsky@oracle.com wrote:
> Will resend.

No need to resend - I'll sort it out.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
