Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601E20E703;
	Wed,  7 May 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614190; cv=none; b=l2pisyu9Vk5/OXzymYzz+1YKEOn6BpLFNY7eY0BTCGMwGlN3lSQYhYKcA9nxO9L6zRSoEcbbv9Nd5ofA0axpV0bB3kxGfW8THit12rD7DjeOjJ3EK+NSHo8T1td/kHzhjrV88cN0vNgOCKfh66cUk2aJ3wayLNnkD8WuPyatuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614190; c=relaxed/simple;
	bh=zddcHadgUVHs/mSHdxlU1lAQmGNdaqyxS0d6+FkMJOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lesgPR9VZsGkOMyNsPp7lN1w4498LUoSjIXqiUX7Mv263i/Opx1TiLQ+ZcKFeE03+tdJDDXKEx9mkJBRhfkSF2mn3qyr7dj/zwap10o6XiBWjpFBtTyyiN0SgQ0AUFBe3ioQ/+uCF9EQoRmqIQip/18DYOw8BhBJil+TXT39DKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWtmi4o/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWtmi4o/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CB8C4CEE7;
	Wed,  7 May 2025 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746614189;
	bh=zddcHadgUVHs/mSHdxlU1lAQmGNdaqyxS0d6+FkMJOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWtmi4o/BlZ8ZJJfvKppO0A8x/+gjzpbKBpbKh/XxDuvniVGPEgGI9lGYbRLLAAqG
	 UKbkhEB45s5j71xFhov8Gq6blFP36LqBux5wQ648pFoxOyxZrF6Zcej+bf6YaMat+r
	 jnV0/DM+O/AXUMBZmCJTRX+rgH5Jdm2KuolckHs1jrPGGex7maMH4/iNIT+WyynX2n
	 lQKQ1GYGrzhOVRcOD4crtnLxgTIB1N4x2yh/kB7kHA+YMBQqRelD6t/IfEy0kPmzNX
	 MhbF5fh2pmsmEktaQCG+4c8zJSd3LJTbZUA+pc1tQIyTw6ikChA0UYhfSM6PXukx9B
	 mLe6SCm3ou3cQ==
Date: Wed, 7 May 2025 11:36:24 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for
 the v6.16 merge window
Message-ID: <20250507103624.GI3865826@google.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com>
 <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
 <20250507103317.GH3865826@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507103317.GH3865826@google.com>

On Wed, 07 May 2025, Lee Jones wrote:

> On Sat, 03 May 2025, Mark Brown wrote:
> 
> > On Fri, May 02, 2025 at 08:47:43AM +0100, Lee Jones wrote:
> > > Enjoy!
> > > 
> > > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > > 
> > >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16
> > 
> > You need to specify a separate url and pushurl for the git remote so git
> > generates PRs with a public URL people can use.
> 
> Something strange is going on.  My PR command is as follows:
> 
> git request-pull                                             /
>   v6.15-rc1                                                  /
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git  /
>   ib-mfd-regulator-v6.16
> 
> And the output still defaults to the SSH URL.
> 
> Debugging now.

Ah, gotcha:

~/.gitconfig:
[url "ssh://git@gitolite.kernel.org"]
    insteadOf = https://git.kernel.org
    insteadOf = http://git.kernel.org
    insteadOf = git://git.kernel.org

-- 
Lee Jones [李琼斯]
