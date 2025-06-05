Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D62F5B;
	Thu,  5 Jun 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110789; cv=none; b=uLMc3oMznu9wQAL2JIBwoFUvVf4oi/gi/1qb/2SsHyjjDUVZMdKMPibFnwX6NnmPPNgPt8EI1bkg+OAYgakXOFf3Wc3XzpgEoY+gv5D2kIOd5DkxNq0roGwQ2sIvuV24WV/2Qfrf68EjIguP5xsvY394NIBuqR3k76imG00EXfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110789; c=relaxed/simple;
	bh=2iz0xU6HSrN4K4tK4hEhiPBRQmZaCe79rTHf++duDHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlyBT2pgl7oXODMu4rtDYS9xN9zXGGwOmjP19J9p7rGsYuLOXpJVuSSHR2UEqDVFR1k4b+yyp0QisOFDUZ0n+oDvDVh/n+VeG+GjXpAQWZGHMYrpy3ufXTanzi59mZF9SrKEEuzMECu5C5XEtaF79tUey+yVgMiH11MFDkYI53Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKmO/cgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKmO/cgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9997C4CEE7;
	Thu,  5 Jun 2025 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749110789;
	bh=2iz0xU6HSrN4K4tK4hEhiPBRQmZaCe79rTHf++duDHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKmO/cgTih5V5cwtej6E/eOSdd8IfM2dq4hEQ64rqvF1XNV4O2Kdv3bsek8VhtSwX
	 FUz9a77eJG2BnpptEdaokF+6TjeZ8YF8tTOlDu02OjC7IkGk1BbipUuName+rv1y4m
	 oWp8Ot3S8uamg/bAa/JNKUn0aBJ/0hWLpIQGYaFXrJLZciTOPa9za/ZtbZOv60ig+R
	 cGP75HXbzRmRAmGEUnpokkwk/9dhwUwiNejkjEszVEHtQZKYDBz383+XywHhDvnPtV
	 LzXEqmHBlObHMVg5kmUE4yc6sNntDigJNpCSKEjHJJmRnUHxWU29PH5zWPgP0QURPB
	 HJGR63N5mki4g==
Date: Thu, 5 Jun 2025 10:06:19 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aEFP+wsYCmMgIyhs@lpieralisi>
References: <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi>
 <878qm7ec19.wl-maz@kernel.org>
 <aEB10JC1bwwOJfWh@lpieralisi>
 <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>

On Wed, Jun 04, 2025 at 09:09:27PM +0100, Peter Maydell wrote:

[...]

> > When I said "a separate problem", I meant that, extending secure- tag
> > (that applies to the "status" property only) to cover other PASes is
> > independent from the GICv5 binding *if* we define, for a single DT an eg
> > IRS device per-PAS (with realm-status, root-status, describing what the
> > reg property represents. Is that what secure-status does today ? Does
> > it say "this device MMIO space is secure-only" ?).
> >
> > It does not look like there is much appetite for tagging the reg
> > property either and making it GICv5 specific is a shortcut IMO.
> 
> I think something GICv5 specific is not unreasonable.

We need to define up to 4 interrupt domains (so max 4 frames per
component per frame type: EL3, Secure, Realm, Non-Secure).

Options:

1) Using reg and reg-names, I don't know if reg-names allows us to
   describe all possible resource names and the order does not matter,
   please let me know. Keep in mind that some resources are optional.

   Something like, for an IRS:

   reg-names = "el3-config", "secure-config", "realm-config",
   "non-secure-config", "el3-setlpi", "secure-setlpi", "realm-setlpi",
   "non-secure-setlpi";

   With that, I would remove the description in the reg property and
   just say minItems: 1

   This implicitly means that describing in DT a resource that the
   CPU possibly is not able to reach depending on
   security-state/exception level is OK. AFAICS reg-names achieves
   the same purpose of tagging below, at the end of the day it is
   a means to say eg "if you are non-secure stay away from something
   that does not belong to you".

2) We add a tagged "reg" property for GICv5 ("reg" refers to non-secure):

   reg
   el3-reg
   secure-reg
   realm-reg

3) We add a GICv5 tagged "status" property and define an eg IRS device per
   interrupt-domain ("status" refers to non-secure):

   status
   el3-status
   secure-status
   realm-status

4) Anything else that I have not thought of

What's the best option ? Please let me know, I'd like to repost the
series at v6.16-rc1 with a solution.

Thanks,
Lorenzo
