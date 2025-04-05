Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86061EED8;
	Sat,  5 Apr 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863091; cv=none; b=fVOKd1X07ztyeOxqBnVkTyILWcWtueGsQp9hsvduauMv9yZEaOIpEFJgLpIHEbOsW5whTCbaALL29Lt+Fp/0HlFpAigW1hCS77VeBYbet3kJ6J3It6RpBRaoBr2/iXBJ8hvBbLDpyL/mhWvh2ACnpWCs9VT0xy9PXMwdm3usynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863091; c=relaxed/simple;
	bh=pHS9rgj9jKOtlDClit2+WuZ05wbCL1erGt/di+Sgy8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXY5Ig5y6Lf5VdL7q+1fyX0x0dDyJD+0zeMmsxj4Z1lVXyQuWANC4Yjc7hZSHTy7i9p1qTE07AWe7NnCpHZ1BZcbDFtkj9VpUcVeDHHZow4nmTuByUcChFcioHzpZ5xYRTD5pzT1VoSWa5fE44lnFYblOe0AJztAldrdg6G+hRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=s36N66d3; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="s36N66d3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pHS9rgj9jKOtlDClit2+WuZ05wbCL1erGt/di+Sgy8E=; b=s36N66d3TQmACyBQqzoE8vOusD
	HI99V6a+itAzx/XzYDwk6iR5i3LfhNmusECk139DY49f04UKzsLS1uSIfyKcHBPTu1lcQz8IjJi4D
	f7qb8NUzCAker1S+cUWT0axDeegkwmwv054YYObeNdDEZ5iPELTmbHKfZ3WnvB0FpAh6sIqAPz/gE
	omLsQGlIrmh2LhTt9l6cI+Z/sDKhSulD8JHCtU4SxunPs715nVJThFfFIziIwxbX2ekel0IGsFj1N
	4iwmJGZQT4mraXoxwFwyYSkdBc0o93jxzTQca6Nwj0jT8lP2PcP7vd3GKapeyFd/AACvyF6C/IeDU
	554l+Lsw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1u14Ry-00D929-8C; Sat, 05 Apr 2025 14:24:46 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 44D23BE2DE0; Sat, 05 Apr 2025 16:24:45 +0200 (CEST)
Date: Sat, 5 Apr 2025 16:24:45 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org, Takashi Iwai <tiwai@suse.de>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z_E9LbOiYN5dPpSb@eldamar.lan>
References: <CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
 <878qojypu6.wl-tiwai@suse.de>
 <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
 <87mscw4dst.wl-tiwai@suse.de>
 <Z_AxsuGoaVK9P3L4@eldamar.lan>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
 <Z_DNcG7wp4iPh5NH@eldamar.lan>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4hmi0Afneepe15Ef-kzVZO+uyw5Row+Cooob_QR=DpwQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8x=4hmi0Afneepe15Ef-kzVZO+uyw5Row+Cooob_QR=DpwQg@mail.gmail.com>
X-Debian-User: carnil

Control: tags -1 - moreinfo

On Sat, Apr 05, 2025 at 09:08:38AM -0400, C.D. MacEachern wrote:
> Thanks, running it now, microphone levels working fine now! Testing
> recording and playback, working perfectly.

Many thanks for testing the patch and confirming the fix.

Takashi, assume you will monitor that 8983dc1b66c0 ("ALSA:
hda/realtek: Fix built-in mic on another ASUS VivoBook model") get
backported to all the relevant stable series? TTBOM, it won't apply
cleanly to 6.1.y so Greg or Sasha might not get it down to 6.1.y
witout explicit backport request?

Regards,
Salvatore
