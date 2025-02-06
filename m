Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACC155757;
	Thu,  6 Feb 2025 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873972; cv=none; b=SqbILMs4U6nuyqn6etTqcP8AYms09GXTAqcW1Nuv4ZsMYMy6k7jLIf4Exol8iLfVvMQSAzhQRXjqdJN9dtZ8weZpDBxu8PpzT+B53Zl9rZFkluR4nrwRxheXWVdi0AcxsCLvDY0iWVimgTg9l6QLt152hwaVF/ZwK2eQ1lfHcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873972; c=relaxed/simple;
	bh=tE1MQSssWRPkyAdKF+cx2AexR3VCxsTGGA+pMOq6590=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekFn3a9ssZeJ/SaqUm9hqrdso7hpqdUnuryMCj6n/YFSN39XfJdrvze7OgaJbriSguvVV23Ca08+pBu4OmQ/7ypLJX7tWJohmawZxCEHaQ3HENWT9ygmHb9/cyfP2o2zQlqa7pVjzWEaQ6SEwsosw0mIfj/yzRQFbrFSsFAABKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HduQn2eS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HduQn2eS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42420C4CEDD;
	Thu,  6 Feb 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873971;
	bh=tE1MQSssWRPkyAdKF+cx2AexR3VCxsTGGA+pMOq6590=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HduQn2eSwfu1X8WAhqGAhVSKoAKdX/WFlcReTW04EakWFYD6Fa+TCanQX+yFynXnX
	 Ia3x/hwCL8tckRlG6v9iMUvpA8Uv4l15M4577fY9C2hRZEuL2S67OpJ8slLsCnDaTe
	 WvkBSYLIS4A4gbhQnBlg/ST8Mo7bt/xaqr7aGGGRD9JxVVIJCbO+dGGAnh/U9zclXp
	 H825igQZ8LUqxPfnPGDjunZlaresd8EO3sd4YO2C3d/Tkv99XzL7pmxTsrkSRkr0l9
	 kfsxftgqPmq0sC3wjws6X+lKQjOTMAZn8Aiu+tmdw+/TymScPL3kqD2SC9TFUCvJDE
	 5jCDWOgyoN1Eg==
Date: Thu, 6 Feb 2025 12:32:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206203249.GC1237@sol.localdomain>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-quench-entrench-09bed8c8c823@spud>

On Wed, Feb 05, 2025 at 04:05:08PM +0000, Conor Dooley wrote:
> The 1.0.0 Vector crypto spec states:
> 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> 	or application ("V") base Vector Extension. All of the other
> 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> 	application ("V") base Vector Extension.

As previously discussed, the above paragraph incorrectly lists the set of crypto
extensions that require support for 64-bit elements.  I have fixed this in the
latest RISC-V ISA manual.  It looks like this patch would still do the same
thing either way, since it actually just checks that vector is available in some
form.  But this is not the best version of the manual to quote from.

- Eric
