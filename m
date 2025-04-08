Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A440184524
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133353; cv=none; b=C3B/KDSld6LtXHZU6H/ZS05YxRA8TIFWqAzgyaQJXQe5udvfRV0wjAeqty8QbTWRBPV9/gVnZWO5P9AfEa9MKJxZyWcbrluN/xm5pwAGjcJ+1H5Wl30hBErLQWk5ftWFhtc7G28QSaOsGaYH81t0qP0eKlYurcoPphm4fJWPiEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133353; c=relaxed/simple;
	bh=lZSH7ze5Ucuu3L2NzUpdtIu3DDLXDde8FZu8kseNke8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thr+oVNzYRlCwrYu3PAcysXIRCP7vIBbHPjVbGe+uQgP1aa0qJCllF7JhnV7AGaj3dNnjBzMWadfHyYVxKiHgyOK9RXDC8A3NoumlOtrnnwG1Xe76oUBsn6hLZ6mde1fAtdKPWIMSrKI4bRfwXJ3p5edO7NIhlzRb2riYhH9b8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZhfLgLSv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZhfLgLSv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0D32440E019F;
	Tue,  8 Apr 2025 17:29:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AKN7Xbr8ojdh; Tue,  8 Apr 2025 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744133344; bh=5DWNQzK93XaTxdYYZik/4sGMel1QU30rQIabdejYDt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZhfLgLSvZfAkNZewbI6VWwyi/jsytzekQwvy3+3fH3Qu6/tkJNrgt+aoFUArTJrna
	 06TGbW1qmq6V1HvIepSLL2vSLxqgquWM20bhuY6Nj6Z5Yp7VxWOeNIpAtRb8pwVBdr
	 tlnPhitm8G6pkyw4WoKkzF1afMv9iPn7k9FYwJeNki2N9b6YVGZCkWCePDmwrHUWjT
	 6xLxA++089yOCRe/z4jS4GkvKUsmabtmgeibejW0YNElhB7oIMLUPbJ7zBGn3Xkg5y
	 DW9ApsTZTIc+ZxtL20guSeS0eBDP/WXLCFyw74Gta2oLNM6oi1hJBSI1TPu+2Me73b
	 ae7ynkSG/ataJ0eWipXilLsq5ViWJiyRFJ9sCK3hDVbIJJXknOhkW8wnhNZICJqu47
	 /g967A1dA5hRBXPhZfcsapHL4WlMUwk9NKMs0SnzJIJJCmElh/+Q9bvm9c/Qz/A8yo
	 Po1W1Bf1G7PxYWdB3rvpJRqsxvl4lCEevLuEdXYwSgvNC40Ve3nFWIrQ/Wmw6wiXhR
	 RVhExO0Y1K0ldTyihuN1HtxT24KnEwwMbGCqaZ6XRZjifvO2IL/p8VKCCk95Xat35x
	 klcoGd7sqhKti8NoQTbZ1P97TB4461uSHc8BfasUvhYWsnOkk48HJuZM5IKX4kS71M
	 CeQytyS72v+Zx6232Wa2kmI0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A813640E016D;
	Tue,  8 Apr 2025 17:28:55 +0000 (UTC)
Date: Tue, 8 Apr 2025 19:28:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>,
	Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250408172854.GDZ_Vc1r4SuP2Ng_t_@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <alpine.DEB.2.21.2504081107390.29566@angie.orcam.me.uk>
 <20250408103137.GAZ_T7CfnHx7cgU7CA@fat_crate.local>
 <alpine.DEB.2.21.2504081137400.29566@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2504081137400.29566@angie.orcam.me.uk>

On Tue, Apr 08, 2025 at 01:29:40PM +0100, Maciej W. Rozycki wrote:
>  Hehe...  But seriously, consuming energy is not by itself wrong, energy 
> is plentiful in the universe and gets used all the time whether humankind 
> contributes to it or not.  The issue is using dirty sources.  And that's 
> not exactly individual people's problem, it's not us personally who are to 
> build clean power stations.  Which does happen already, so we're moving in 
> the right direction.  I would be more concerned of the various industrial 
> contributors to global warming whose purpose isn't electricity production.

Oh, ofc. But we have to start somewhere. And 0.000...1% here and 0.000...1%
there helps. Considering what hw options we have currently, there's absolutely
0 need and sense to keep such machines alive.

I'm even disassembling my old test boxes because they're simply not worth it.
They almost never catch an issue and testing on them is simply waste of time
and, well, energy.

>  Plus we still need heating anyway, at least in some places, so why not 
> having one that runs Linux? ;)

You can always get a big fat modern box - it heats even more but you'll
actually get something done with it.

:-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
