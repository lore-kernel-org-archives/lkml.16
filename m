Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEDD1392;
	Sat,  5 Apr 2025 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743834487; cv=none; b=ikuNDWYciatbSYrtuUU9XLmUoVZfaMK4Z+XPwoH5tv+PeRrDHCKJo/1DF/P4UyS3eGZ3yJimNFCqWY3biEDcG/I2HXFrudks8hWRnmG7utgJqS2jfXHPJk/4sq6r42221+OTpILULPLwyB8rREwtbWT+SZ9N3Sk4RGcObUJu/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743834487; c=relaxed/simple;
	bh=omm0Ls/6vklF36yaMha6lrBPyckd6jHpcmMD0zuB/J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YazrOg6qAsD7xOrLRjE++XU+EVxW1PVpgvcZBHRy9tg3aP8YaiAHVUKx8SnGeCwn7lOHNlPRsvV9Rr6JsW24RP02mSRRJ+gWKm7gJgB8CSaCl3np/TaKm0UqFi8LzIO9pKqgJXaXbJlJXCw064aRF4LORlsMttvZjV8i0ExZmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=m2kCyu4r; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="m2kCyu4r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=omm0Ls/6vklF36yaMha6lrBPyckd6jHpcmMD0zuB/J0=; b=m2kCyu4rPZbg3lR6pU9jM4LtDd
	VH1u0h3OFczpRKmmGtEwAB8z9X3xeLUgWUsTf6m90TMXX8oWbEOUTIeLg7DDTSvN0w6p3UXAR3FXP
	LrHRITLwZ1ljVtgxOYeNOtQcq0bp5TDry4vU+UvgKtTRm2OAy/4JYQmUOLntrQD2efjJnfYMk7Sue
	ui7ORZmnnqOyfRXDYB/ByOf2w9XohxFxijwbp9o5NAvtRFCPCPOp3cd6KUtt14TzcVDS8hGfZwxcg
	wLw7h8P4cNR0pN2uebZshElyrTOc7yF+b2e6x2YP3dZcx6uvoVcmgS+tH4kSM4w0DmBpQo7W45+sd
	XV1Wrdmg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1u0x0b-00Crg4-P9; Sat, 05 Apr 2025 06:28:01 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id D21E9BE2DE0; Sat, 05 Apr 2025 08:28:00 +0200 (CEST)
Date: Sat, 5 Apr 2025 08:28:00 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org
Cc: Takashi Iwai <tiwai@suse.de>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z_DNcG7wp4iPh5NH@eldamar.lan>
References: <Z-ct2D6uIN1f6UbL@eldamar.lan>
 <87zfh43uti.wl-tiwai@suse.de>
 <CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
 <878qojypu6.wl-tiwai@suse.de>
 <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <87mscw4dst.wl-tiwai@suse.de>
 <Z_AxsuGoaVK9P3L4@eldamar.lan>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
X-Debian-User: carnil

Hi Graig,

On Fri, Apr 04, 2025 at 08:19:52PM -0400, C.D. MacEachern wrote:
> Which of the files from there am I downloading and trying to install?

it is the
linux-image-6.1.0-0.a.test-amd64-unsigned_6.1.129-1a~test_amd64.deb
package for just the patched kernel image package.

Thanks for trying it out.

Regards,
Salvatore
