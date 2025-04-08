Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6425FA26;
	Tue,  8 Apr 2025 07:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096195; cv=none; b=fOPy/d3k0PDdZ5s+kSnr7/tYUvDT5fsP1soiIAtGBvQoKulFyvA0irWptI08A/Ht5gANOG9aTWGMyeku8dgYSPATaD/fneEXrYWOliyOnckVvWdvui4JnOHoyHZKCepUgbvuwYRXYZB1jywz7dBS+snbk8AMjcKoWAcKiijR5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096195; c=relaxed/simple;
	bh=/sJ/o1RT3knUIms6vniTsTj4eZSX251vKaMc5Y5zJTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diB578EjENUIK8/m2FNYoL2pssFH+Kt/B6b8yZZJE+vuFWMryhroGREqgZx7WWR+O2+ahsu2vlNkB9tAayCGwrFEG9cCsLES5I05BqCGlg4tp6rBAwtBpmvN82BFE90VfKIT9oN0RX/qj+0nskveYJeUkqa6l9nAdzLT5ZuexI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXJhyEEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXJhyEEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E783C4CEE5;
	Tue,  8 Apr 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744096195;
	bh=/sJ/o1RT3knUIms6vniTsTj4eZSX251vKaMc5Y5zJTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXJhyEEi5E76JHjySCjt5VT3TtCKTzxf1CdveOLdnOBm8T8RWH8otR4Ssk/ZetZGi
	 rpTkA8zgZtQAf5Bd2/HwT+fgslfRXjAa0lPZFX3Y3kGKbHgScXqO3M9BAH/FU/g6ht
	 fB36kWhByqz7kcy+ppYFFurUVGjePdsfrrlWYG42jknZyV5VO5o/ik0/vB4vBo1KTA
	 o+HGonS+eOcDSiok/WLEHTqu8IrD45w9mrw+wnIbFeKO29h7NMF8dWzewuUL8TJ/ed
	 JP+AmVFnoh6+bV688T2SkHyUkvJr2EERJ/CDEDmdlohbLTqSnHfSKcKV0e8X7kdnEK
	 9AzHzpOIbRZBg==
Date: Tue, 8 Apr 2025 09:09:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_TLvoBDmCRRy12t@gmail.com>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org>
 <Z_Qdn_WYAalNAHOi@gmail.com>
 <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>
 <20250407214624.GEZ_RHsCPSfyM4r56w@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407214624.GEZ_RHsCPSfyM4r56w@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Apr 07, 2025 at 01:56:57PM -0500, Mario Limonciello wrote:
> > Boris, your thoughts please?
> 
> Right, how hard would it be to decode those as much as possible without
> having users go look somewhere first?
> 
> I mean, we can always go look somewhere for more info but for starters we
> should display as much useful information as possible.

Yeah, and I also have an admittedly selfish reason to ask for this: I 
have a Zen 15h system that is at times unreliable and will 
spontaneously reboot, and I'd *love* to see whether this reboot-reason 
register gives me any further insight as to the root cause. :-) 15h 
appears to be the family when this feature was introduced?

Having it printed early straight on bootup in decoded text is very 
useful for another reason as well: if a system is unreliable it might 
not make it to userspace to run any tooling ...

But I think a more structured sysfs entry would be useful as well in 
addition to the bootup printout (for the raw value if nothing else), if 
any sysadmin tooling wants to pick up on this register.

Thanks,

	Ingo
