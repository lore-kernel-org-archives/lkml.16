Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E312E5B;
	Sat, 26 Apr 2025 05:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644478; cv=none; b=ePlFTQb0HlPeERr+6qqX2xyGhJ9+jlD5Mfo3i7PcFXJRMYEAT7+g2Rgm5j0V04EMm3ju5hvwWM2K40vDt8sRvl8Ufu9exAKTQt8MPILtWy7HGy7TafUMC9WLyC0BE2AAZWpMAh7L9/iFHC+3sfJxfKfRyUJ6nKmhu/63LXG3Vxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644478; c=relaxed/simple;
	bh=RCBf3GzGsYj/CeMHwTfZdaedwCkpz0A4tsIXkQsHtB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN83HB5TiY82eGvsYO0NY7XkAA/jRJXasrrt/l36LM6ZPh3aGKgxKTuGHTBXRdKiXFCmo2two03ZAoCqW4IywYe2ouoF5MqZzRz/B5HXjKi7URuBlzD6zs6x8PfwzCR/UtI6PdrugspZdbMLXVMwPPbnBrRP5EX2AWGqsWbYPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 53Q5ENxP008271;
	Sat, 26 Apr 2025 07:14:23 +0200
Date: Sat, 26 Apr 2025 07:14:23 +0200
From: Willy Tarreau <w@1wt.eu>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
Message-ID: <20250426051423.GA8239@1wt.eu>
References: <20250426041212.4141152-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426041212.4141152-1-daniel@0x0f.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

On Sat, Apr 26, 2025 at 01:12:12PM +0900, Daniel Palmer wrote:
> From: Daniel Palmer <daniel@thingy.jp>
> 
> Add nolibc support for m68k. Should be helpful for nommu where
> linking libc can bloat even hello world to the point where you get
> an OOM just trying to load it.

Nice, thank you! Could you please also add support for it to
tools/testing/selftests/nolibc/ and verify that it works ? We
heavily rely on it to make sure we don't break nolibc along
changes. You may possible have to add a few ifndef, as I don't
think we've ever had a nommu platform yet. If you face too many
failures or just difficulties, please let us know so that we can
figure together a suitable solution.

Thanks,
Willy
