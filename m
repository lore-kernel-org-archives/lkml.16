Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB15381C4;
	Fri,  6 Jun 2025 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231050; cv=none; b=J6epEtE9XoF2aaH9Brr4SzrgJqvtMU5jFG5c0fJkS5kqcmu6SG30uuLlKmzbmY28C5GgGeYexR6ycyFHHvcTbholy5xVQnlfi22iprBg4zqoKPSsX+zsUYIkaDMj6ayyyszuvXimy/P8EaptyGCFYjhpPFhICs71NaLSPYiB1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231050; c=relaxed/simple;
	bh=vtruwHAZP8jmnD7e7b3tX0idebIT4rs+90lUDZ5HlpU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AqWHKR/ZXPjH2hoF8san573QJIRjSLOBPWHWgiS6rN7M4pjCHeAlFBMAzhMhiCIerF4UH2ETI7Omk+RvAREahcDCdpHbamVv1DcXYWPPiGAXA3Gv5cl3Ia9hn9ATTPPXHVdV4PY7Hv7wuU2rnAiD2bnGyq5FfaUijooJzEzOXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=JZC64LVX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fG9GmERv; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="JZC64LVX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fG9GmERv"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 86B3511400BA;
	Fri,  6 Jun 2025 13:30:46 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Fri, 06 Jun 2025 13:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749231046;
	 x=1749317446; bh=CxdpNWHLhJQTJYp3lPIgeA/cQMR7pKQl5v7aS7fdBik=; b=
	JZC64LVXZ8/jaa6a5GyMkx5tXFpXykYPZbyEDB2G8WSn5TRpUN8CqdeKFacu/2Hq
	B1rB1onnam2g+j1oAk6fK/Nz3+eVT9ygbQzug6WCFpSCZ8bdAtvPPNcAUci3aAvj
	CAk8e5Ec0VOT57N18yAyGgTEnzXWLP8K4ovfwC63bv/OhnbBNQ4E3WXhpXgN+ZxN
	w858qIh/3Uw89LRePceyVF9qLuJzhEULSxkoFxL/9ITCc8YmxnkBI/QroeURJemP
	6leUtimspsw7BMLxBVuWitf73lW3jg14nxmCUEzhSL0VuOoz/9JiVEBdnXbrSvOr
	oA6CLu+NM/iJLI1Y0QfreA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749231046; x=
	1749317446; bh=CxdpNWHLhJQTJYp3lPIgeA/cQMR7pKQl5v7aS7fdBik=; b=f
	G9GmERvIJyoHD3bS/Uf3Ighsn46oYATf4LNqZhUD8BsyaMvAdP+pGUcKiy56D6W/
	xeeThvFtqqDzP96fa92rgYPqd4CieOT2JRzF3VKJLCbWbXgfHbCkY9MAfei17tsM
	V4k4aRXGYacvnZY4KyIWoacy57wh0+VQ7XWHarftb5ZxrQuHKC4M7PVSrrp10r8S
	G2yYGxJhmXp9m889FRoVi7hFF9qYyGzeNlUE9fcBsPKdObhNrRVR6Isxyqqznqi1
	a+sZHgBTp1+uPWljxKiStrXtIf2Uu2ddYwkjWKv+koSJ0cGCRfXBtXw3a5HlL6SX
	BACCuTtkD6Q/DiY45MSCw==
X-ME-Sender: <xms:xSVDaCrH-gIoSAXnolxC-NwFfBIRedIY8bEfcO-IxX5zQ03kgI87RA>
    <xme:xSVDaAqlZOK-74z8v4c7OdU9BCr0ZiWm95i-f1tQMD1OAt_hIMwlBSLOa04FAB9en
    VyzSstjicarWJpYT5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpeehveetgfdvuedthfef
    hfevjefgtefhgffgteduhfevuddvjefguefhvedtjefhkeenucffohhmrghinhepghhith
    dqshgtmhdrtghomhdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrg
    hilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthho
    pehhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtoh
    hmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrd
    hinhhtvghlrdgtohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlheslh
    hishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegtohhrsggvthes
    lhifnhdrnhgvth
X-ME-Proxy: <xmx:xSVDaHOZuZlLRYP92PTRgTgoxwSMWaMEFUrbGuOaobQwmMcJFN5Brg>
    <xmx:xSVDaB4Uy6iA4UnnpQHilQwZxX3BY5jK_rNA0fLCIlU-ivE6QAwdHA>
    <xmx:xSVDaB5Jdh6gtY7L4QFMMnT4aw42iIHpWVlN_YhpdZ8j_v-0rOpsnQ>
    <xmx:xSVDaBiynCru4kenoYzwuo1FguuMDxeKoa8oIKYu-dhaNjKGjCV1hg>
    <xmx:xiVDaCDAwFpvv1UA5MWfUTlGuFtM1SEhWSwkHhL10BC93O3wuLzvNYfA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6162A2CE0063; Fri,  6 Jun 2025 13:30:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Fri, 06 Jun 2025 13:30:25 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
In-Reply-To: <202506062319.F0IpDxF6-lkp@intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <202506062319.F0IpDxF6-lkp@intel.com>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, Jun 6, 2025, at 11:58 AM, kernel test robot wrote:
> Hi Mark,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on next-20250606]
> [cannot apply to v6.15]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    
> https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Move-Lenovo-files-into-lenovo-subdir/20250605-013934
> base:   linus/master
> patch link:    
> https://lore.kernel.org/r/20250604173702.3025074-1-mpearson-lenovo%40squebb.ca
> patch subject: [PATCH v2] platform/x86: Move Lenovo files into lenovo 
> subdir
> config: x86_64-randconfig-078-20250606 
> (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/platform/x86/lenovo/think-lmi.c: In function 'certificate_store':
>>> drivers/platform/x86/lenovo/think-lmi.c:661:47: warning: '%s' directive argument is null [-Wformat-overflow=]
>      661 |                 return kasprintf(GFP_KERNEL, "%s,%s", arg1, 
> arg2);
>          |                                               ^~
>    drivers/platform/x86/lenovo/think-lmi.c:657:50: warning: '%s' 
> directive argument is null [-Wformat-overflow=]
>      657 |                 return kasprintf(GFP_KERNEL, "%s,%s,%s",
>          |                                                  ^~
>
>
> vim +661 drivers/platform/x86/lenovo/think-lmi.c
>
> 640a5fa50a42b9 drivers/platform/x86/think-lmi.c Mark Pearson 2021-11-17 
>  652  
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  653  static char *cert_command(struct tlmi_pwd_setting *setting, const 
> char *arg1, const char *arg2)
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  654  {
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  655  	/* Prepend with SVC or SMC if multicert supported */
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  656  	if (tlmi_priv.pwdcfg.core.password_mode >= 
> TLMI_PWDCFG_MODE_MULTICERT)
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  657  		return kasprintf(GFP_KERNEL, "%s,%s,%s",
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  658  				 setting == tlmi_priv.pwd_admin ? "SVC" : "SMC",
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  659  				 arg1, arg2);
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  660  	else
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> @661  		return kasprintf(GFP_KERNEL, "%s,%s", arg1, arg2);
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  662  }
> 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
>  663  
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I'm unable to reproduce this issue with a W=1 build and I think it's a false positive.

Am I safe to ignore this report?

Mark
