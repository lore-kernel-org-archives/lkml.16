Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060EA2F2D;
	Tue,  3 Jun 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748969680; cv=none; b=EeDxvPXNI4mPUX/lMaEcgEqqjpBwgQaHKNMAMulNmZ8GB/WWQ4+vQqROnEXX4mfgjQMLYuAAQaWdYM7cqAKKwSgxwsbVDHLJaabKT/UbRhK5W8qVqP6Z2WUN92LTBqaXn9Q3fSB9y7OEOCxSIKgxEh4oq8BmtoW3SvNxFKYb6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748969680; c=relaxed/simple;
	bh=v1gSOUSa/yuBcyqHMjmBJtV13fLkxndWisCuM7m1CY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsCLgSQ0lIyjKG88LP41/nXYSVDzj9NLlRfIEflLBbqhNGcUi1EZ8BwQCuYch/PjUapUfb/bnTGBslUnV7nwFUkLr6anYluxiPhxg6fdBAgthWq1v8cMlySfzPBiy9s38Zkx+aPhYVfFLRSd8ypKeWYqVPD1xG89vaIyJjuhCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN/1mcWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN/1mcWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DD2C4CEED;
	Tue,  3 Jun 2025 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748969679;
	bh=v1gSOUSa/yuBcyqHMjmBJtV13fLkxndWisCuM7m1CY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FN/1mcWK7Q9gz2YciYhXJUD+mkO4RMfAVUp9ry75R7kOt+4xZpQ9BMx2qzAyi86k2
	 vx4UP92/yUOVNd7nYOwzH8lysobtnL/te7If+sNfnfAc6RLv8KEuuBnbdieBqxvOfG
	 4t7DqUdcnFD5JDPXmhMFZkM0JXqz0YJw2lvykoboYghhD8RBiaXa0pb5oWxivApyuE
	 1E0LuCqz0++IgeTwxEELpseM47Nr07RpQm/haDLOQAxVB9fxb2FhGuKtqlfLd9ih+q
	 6NhrS4AgqbD4ckgqJZBsBPTSEKDCr2lqR00uQbkH5LA6FeJeZVPnYIyfJNsaUC4U5A
	 UZsBUHecxwgHQ==
Date: Tue, 3 Jun 2025 18:54:30 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, andre.przywara@arm.com,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aD8oxsyuvLre2pY+@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <aD8adnQWcII5XO2J@lpieralisi>
 <CAFEAcA9sdrykbVLntW35fo0MgV2VNXnLUFa4AM=Aw34bOBprYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9sdrykbVLntW35fo0MgV2VNXnLUFa4AM=Aw34bOBprYQ@mail.gmail.com>

On Tue, Jun 03, 2025 at 05:04:33PM +0100, Peter Maydell wrote:
> On Tue, 3 Jun 2025 at 16:53, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > Specifically, for IRS/ITS frames then - what the current schema does is
> > correct, namely, it does _not_ spell out whether the IRS/ITS config
> > frame is NS/S/Realm/Root interrupt domain, that's information that the
> > client implicitly assumes.
> >
> > Are we OK with this approach ? This would leave open the possibility
> > of having a DT per security-state.
> >
> > If in the DT schema I define eg reg -> "IRS NS config frame" by
> > construction the binding can't be used for anything else.
> >
> > Please let me know if we are in agreement on this matter.
> 
> This would break the QEMU virt board -> EL3 guest firmware ->
> EL1 Linux flow. We need a binding which lets us optionally
> specify "oh by the way here is where the other non-NS frames are".

Do we "need" a binding ? Or, it is a nice-have to help configure
QEmu (and other SW components, eg bootwrapper/TF-A, etc that decided
to re-use DT for their own consumption) ?

And even so, why can't we have a DT per security state as-per Rob's
reply ?

Given that only the "status" property is tagged with secure- today,
may I ask please how does this work ?

What's "EL3 guest firmware" ? Does it use the secure-status property to
detect that the respective device is secure/non-secure ?

And why does it have to be the same dtb we are passing to the OS client ?

> I don't have a strong view on the specific syntax.

I do because I don't want to revisit this later ;-)

Thanks,
Lorenzo
