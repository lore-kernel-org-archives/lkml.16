Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC8190664
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518158; cv=none; b=l3sftEbijvpPC183iYXAoTwdT+njeKObMrmmjgRXpSci2jUpWu6dg7iYOIZXGwkcxVNWoQpMfAP8LDVIZ8ww9IB/5abbn9hRraYqbKL3JatvtyQvxfoKzkR99Vx83cwP14MgvOzgwiZFfy1iAjXQCemoGSrFWccXVIKXu4bTAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518158; c=relaxed/simple;
	bh=RMXCNVnKb9aYW1ozX7V+7SVL7ZawQ8uYx55JsA5Vy0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZtMH7g0yVvvuWkd628xM88fMIsMaV2DL/WpGIU629qcjwNTiTPAYeTLyG9GXKo5aesm5T2hEW8z4E9lrnyMwvVMC0+3VDmlhBVwCV/jeUztubtRvAhp0JFL7izIisq5Qk0NHfXykc/vzhpYDqQ4WOuqFQB2DFbxNJolEK/erds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk9qpiHs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk9qpiHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D90C4CEE3;
	Thu, 24 Apr 2025 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745518156;
	bh=RMXCNVnKb9aYW1ozX7V+7SVL7ZawQ8uYx55JsA5Vy0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bk9qpiHshY2y0X3dZVEnhukusxcS1gUoa1aqXT/MgeXPTKhbKhDxVP75Zep99wVIE
	 ns/GKMTJ0Pc03EIO/NOyHCzjoggFfn4H4id+B2xbfvho+l5OZgy2HPlf5KiFXVKjSv
	 kwWs0xUZ52sp+6r9jjshraU5j8JoN/xdhFUZv++LHl+fVlIlSVXIN2Nk3edZnWgi5T
	 DdMBtfFFx6AJDciuCHAMPFBQbrLddaB4+KsYU/6R9JK7ikBunWTpQ82TUkpI/OMr5G
	 exdU6Jkdhnl+EQSECDKLAy+VF6Oa+jX6uIMQjstV0YaPwz0/odGM9xzn1X4qdGxvi+
	 FOeNM6PznK2Vw==
Date: Thu, 24 Apr 2025 20:09:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH PoC 00/11] x86: strict separation of startup code
Message-ID: <aAp-SThmX5PcsrWU@gmail.com>
References: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> This is a proof-of-concept series that implements a strict separation
> between startup code and ordinary code, where startup code is built in a
> way that tolerates being invoked from the initial 1:1 mapping of memory.
> 
> The current approach of emitting this code into .head.text and checking
> for absolute relocations in that section is not 100% safe, and produces
> diagnostics that are sometimes difficult to interpret.
> 
> Instead, rely on symbol prefixes, similar to how this is implemented for
> the EFI stub and for the startup code in the arm64 port. This ensures
> that startup code can only call other startup code, unless a special
> symbol alias is emitted that exposes a non-startup routine to the
> startup code.

So when startup code accidentally references non-startup symbols 
outside the __pi namespace, we get a build/link error, right?

> This is somewhat intrusive, as there are many data objects that are 
> referenced both by startup code and by ordinary code, and an alias 
> needs to be emitted for each of those.

Yeah, but this should make it ultimately safe(r): every object is 
either local to the startup code, or has been 'exported' intentionally 
to the startup code.

> This ultimately allows the .head.text section to be dropped entirely, 
> as it no longer has a special significance. Instead, code that only 
> executes at boot is emitted into .init.text as it should.
> 
> This series is presented for discussion only - defconfig should build
> and run correctly, but allmodconfig will likely need the last patch
> omitted. 

No fundamental objections from me.

Thanks,

	Ingo
