Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C09288C0F;
	Mon, 19 May 2025 17:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677478; cv=none; b=W3agbsP4NwuN1XStSEIfx9JQT+vdQBXgt/Zbck/TksiigmuREsl2lXGxpvJooeVrVE7/xfkIJvqlp8NJJdwADPjBX57OazBVU/np0TZlsz9eXubrLvRs83bREfOkI3dOYuLpaz2JObEkPN0lHUNx5RBM9YF7SqYpQpGEeQRgo64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677478; c=relaxed/simple;
	bh=FSMOL2taXKj18VsO0IhhIry3rTgFnRDi/+4edXoR/kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g60oCtM895sIXDTT4RoJeMBnNA7UzXkIaat/awJboc6gW39A/RisPeZjJIlqFjLHWjqEdlYmn/jb56e/VT5xxigLTFkxKJ1NvO2AtaCuq1BaNq4WOl8qkOrOmSmkdIqCB9nh62yMLO06mQeIxEPl8KZ8qT4t2PC+wb8NgLXAI34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfOCVcsO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfOCVcsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0606C4CEE4;
	Mon, 19 May 2025 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747677475;
	bh=FSMOL2taXKj18VsO0IhhIry3rTgFnRDi/+4edXoR/kk=;
	h=Date:From:To:Cc:Subject:From;
	b=EfOCVcsOe7JGHXCWM8Zex9z0BVAOo/qxfvpiNLMHY4EMaa4/GvM9bbZRb7V+1CB3r
	 rQWFrcABefGl2XWVLInQmS1vs3tOu3ZSyAkCiegJ8lR0Hwz/hNKZmnEQ4byIEzOBoe
	 BNyfOsEWiQj70PUQpEklf3JrdBBZm8+OlxKCf2lUs/LaKds0OJuqu9qxaWUYeppNLw
	 SEvHcHO2Xz2l3Q+uI3/Pj4w1Zl8s/v2ihyrmvwDMOh6yhub4Ur3r2e/VmT5PFka0mx
	 BgoXu53JUSEQmiw02O2wqf1Iyg5gSW42PvpbwUppKwA/J+MOzh1wx+bstux04OaQFx
	 mQEfjJVfnoTYw==
Date: Mon, 19 May 2025 13:57:52 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.5 uploaded (and a note about older toolchains)
Message-ID: <20250519175752.GA1041767@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.5 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 20.x
series is no longer supported.

Additionally, I have rebuilt and reuploaded the latest stable version of LLVM
13 through 19 to avoid linking against libxml2. Some distributions (such as
Arch Linux) have updated to libxml2 2.14.x, which includes an ABI bump to
libxml2.so.16, breaking all versions of these toolchains. This should not make
much of a difference for the kernel, as I do not believe we use anything within
the toolchain that requires libxml2, but if anyone notices anything, please let
me know so we can discuss adding it back.

Cheers,
Nathan
