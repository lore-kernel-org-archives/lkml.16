Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4241F4CB1;
	Thu,  3 Apr 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691077; cv=none; b=MMvClMvddA4nyigViMTzfSRdoEWyucm9sJcseKT5IhFjdpXWeFeUKAnPbAl33QJaYRviQVHsQjBsrslOW9+xDf4qZOA5qlnNa/1qNxtsg63rI4hZxNpjpKrULC5V/v0DhrWZscmRwW0nu5+IJKZUGkAw4Kd27NfG4arjDfG8r1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691077; c=relaxed/simple;
	bh=HwJlTt/e0qaK+PhaHQ1s/8UlFlBGWC9KoWIgqNb5+0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsjsBb/D6nJE9VdSP5gngo8W7jG2Xozxfv+8x7sJxgXtW08PeKEi7Eocb9o0HlTRtXgP/fLX2yCA/CT376ITBO/dlAbyiA6JHbzjdd9xqvLiwOF3EFMVkOhMgl6GsZTsCqyyAU9s7p4aPwl5opWYOoAB8iuJ2NCBik2VQiNomsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7fnG9L6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7fnG9L6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146E1C4CEE3;
	Thu,  3 Apr 2025 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743691077;
	bh=HwJlTt/e0qaK+PhaHQ1s/8UlFlBGWC9KoWIgqNb5+0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7fnG9L61AcTg5asIweNwtN59M2R1LZjVkrqxDDvY8s8Iudgdv2CnDs8j8NRJA0LH
	 GnWBRapes85/eDUZbAf1jgMs0kgMPgIT6yGz+Yg54xkzXJrkr5IMMCPxj9Kryirlw5
	 JLXn8dj/z6cZwsHECZCsDGvrveEd9oWnQOj3nrq6+ad+mxUQ4FaOa/+Ae0lOdwwWqR
	 1YSnMjWhSfcD+mXJ0nGzq8y1VwDzjrynHIBptYzndo4G5LPn7tEaL1TnRvz5SiEO69
	 dRi+M0PYq6+RTNyxPONilRMt++JeAXrLgW60m7/r549GgjlCDRVxMuV+2HaP8VCvJ9
	 hRsPcxKhX6ETg==
Date: Thu, 3 Apr 2025 07:37:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Alessandro Carminati <acarmina@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
References: <202504011011.jyZ6NtXx-lkp@intel.com>
 <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
 <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>

On Thu, Apr 03, 2025 at 05:35:51PM +0800, Tiezhu Yang wrote:
> On 04/02/2025 03:45 AM, Josh Poimboeuf wrote:
> > On Tue, Apr 01, 2025 at 12:38:37PM +0800, Philip Li wrote:
> > > On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
> > > > commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
> > > > config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
> > > > compiler: loongarch64-linux-gcc (GCC) 14.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > > > > drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
> > 
> > Tiezhu, this looks like a loongarch GCC bug with asm goto, or am I
> > confused?  See analysis below.
> 
> This is related with GCC optimization "-fshrink-wrap" which is default y
> on LoongArch, use "-fno-shrink-wrap" can avoid such issues, like this:

As I showed, it looks like an actual runtime bug, not an objtool false
positive.  Disabling it only for CONFIG_OBJTOOLonly wouldn't fix that.

-- 
Josh
