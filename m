Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154F2F30
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748721452; cv=none; b=HmuXhHDVZEIdlfxdXu2pvJu1DD/Rb63h43LXpDcg5Ei2Op5X56mssCRKReoM2fJxvKrniVpp5LzZEGTge6ACWGgfigGWceelmAYxR5BTb57bPHQukLn8AJwAtsgpoALHITmwBU7mbNlP7hFejBaDGHIemKbOjFqz2ESrWXEygWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748721452; c=relaxed/simple;
	bh=M3i+4OcDsZH71nEu3YTnsxuCeQlL0OwHKJ/yMTCoIY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDxpWZ1XQTnfbLwZoi50iWav5k4AlDd2owzpORnHHdYrpdDmYChAhw+J74z933U8qzTlMcuCfQhP+kC3P0TV3c/6ukxuwY4TwfpQzKyQMTNIcWO8+YZh0ls5x5ik2tjeuWi5gsnEvg2lfVl8SVkZnU+txR/iOFanyfgpG3vjm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MFk95CpK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MFk95CpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1BAC4CEE3;
	Sat, 31 May 2025 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748721451;
	bh=M3i+4OcDsZH71nEu3YTnsxuCeQlL0OwHKJ/yMTCoIY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFk95CpKgXK8bS8jOnInI0OtUUkCtqVgUF3SK6RafmggS8SGtVFYV2oD8R0UfUnP+
	 g/aQMtiEI7xoh0q8C6mI5ydeeJB3I25Q/P7AuCnGWynHNuztljalPvItH9lMVr/P3J
	 cKBczeEA0W5aNUDEJ/z7/L6RwzNSOWFixMvHah8g=
Date: Sat, 31 May 2025 15:57:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250531-evasive-sensible-malkoha-a98b40@lemur>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>

On Sat, May 31, 2025 at 11:20:20AM -0700, Linus Torvalds wrote:
> You have this: f8b59a0f90a2 Merge tag 'driver-core-6.16-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core

For the record, this object came in through this push:
https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/plain/m?id=7df025cb5c2a034128abf8b6d064c4c17cddff65

There is a push signature on it, which does verify:

    gpg: Signature made Sat 31 May 2025 11:04:02 AM EDT
    gpg:                using EDDSA key 523E475E4448ED8757479D21362B0BDE39E424BB
    gpg: Good signature from "Kees Cook <kees@outflux.net>"

-K
