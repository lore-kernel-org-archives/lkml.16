Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4FF1F2B83;
	Tue, 22 Apr 2025 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318511; cv=none; b=FPL7LYp50fJTA1H/b+t44T9VFNgjCL9C1F0biG8C0gn+nNfWqTztTW56buJyMLSL3ajfOtdsOVDiiQxtEP0J5/m4HXe4WYRVdV/oZ9cNyvGP/F38nua304C0aJAEVP2g08qrJsz5lLfpIEMgsmRQE5UYOxAUlx9uO5lNJNmcSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318511; c=relaxed/simple;
	bh=E7jJl3pOgy/SFZyxcaFNH2HJMXve7HqgzZcCrYSV+mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXS1vQy1mMcHNlpFAevoxy5azjOYWDlBi73WgoSmST/6Fq23iyNrTPlfMxPH1KVRoDeujhfZgyIs8s4dLqqBODVtiRUJTd1wsjUG+5Y0kqFLzzI17WZmoJO19fZG/wRRgQImvnCPubTPTGQYTnQb8YHkVgmkThF5KC+W2cRq5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3/XYOYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3/XYOYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB7AC4CEEC;
	Tue, 22 Apr 2025 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745318510;
	bh=E7jJl3pOgy/SFZyxcaFNH2HJMXve7HqgzZcCrYSV+mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3/XYOYPAiir29P1eGSzb5RwyFnYBEqV46mf1/jdzKdA1pCkZ0OcqF1YuMlgOYm5Q
	 CoMX57eL1aFdE5QkKXObGRuNSrfjQkjjcOpl58YGbXV0aKh6VechwDjLX45v0//Zh6
	 qmMkX8r0vDhNuz2x0UXavbtrTsdSxo2LxsvjOKeDrDqMIoj54Op0wZuGwVqvZ6hQQN
	 zdICWq2ACdiuAtNiXQWgYuW8tjU0NHcxzGbSrbeuvVQeqSWvUKAt1NPl1xQsZDj1k4
	 SgjwLColOdUV/zPrhtwoE/Tw4o26//NNzPEfavUziyckO1xeFpu5CrjRG0kf+uWf1v
	 CDqt7AH+xYSnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7B4V-000000004sL-2yOU;
	Tue, 22 Apr 2025 12:41:48 +0200
Date: Tue, 22 Apr 2025 12:41:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAdya5rephGNP_Tw@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
 <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>

On Thu, Apr 17, 2025 at 03:41:56PM +0100, Sudeep Holla wrote:
> On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> > On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> > > On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > > > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > > 
> > > > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > > > +{
> > > > > > +	struct scmi_revision_info *rev = &info->version;
> > > > > > +	const char *compatible = NULL;
> > > > > > +	struct device_node *root;
> > > > > > +
> > > > > > +	root = of_find_node_by_path("/");
> > > > > > +	if (root) {
> > > > > > +		of_property_read_string(root, "compatible", &compatible);
> > > > > 
> > > > > Looks like you still only allow matching on the most specific compatible
> > > > > string.
> > > > > 
> > > > > As we discussed in the RFC thread, this will result in one quirk entry
> > > > > for each machine in a SoC family in case the issue is not machine
> > > > > specific.
> 
> Agreed, but we can predict that. You can infer just from the current state
> of affairs. Today all machines based on soc X may need the quirk but the
> firmware may vary across machines with same SoC.

Sure, I was just highlighting this limitation in the current
implementation...

> > > I was referring to the need to match on other compatible strings than
> > > the most specific one. For the ThinkPad T14s the strings are:
> > > 
> > > 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> > > 	"qcom,x1e78100", "qcom,x1e80100"
> > > 
> > > Here you most certainly would not want to match on
> > > "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> > > of the SoC compatibles.

...and the fact that even if you want to avoid matching on SoC
compatible, the current implementation seems to be too limited to allow
matching on machine compatibles generally (i.e. given that there may be
variants of a particular machine).

We may not even need this for the FC quirk, this was just a general
observation.

> > > of_machine_is_compatible() can be used to match on any compatible
> > > string, but not sure if that fits with your current implementation.
> > > 
> 
> I was thinking about the same when I looked at the code. Using it is
> more elegant IMO.

It would be more flexible, even if you never intend to accept any quirks
that matches for an entire SoC.

> > ...moreover this kind of carpet-quirking that hides the issue on any possible
> > fw version gives ZERO incentives to the aforementioned vendor to fix its
> > firmware...(or it fw-release process)...

If a vendor truly only cares about some other OS then perhaps this
argument isn't that strong and we'll just increase our own maintenance
burden.

> > Indeed, cross posting from your other mail thread, as of now we cannot
> > even be sure if the Vendor has somehow already updated the SCMI-related
> > firmware NEITHER we can be sure about this in the future since it has not
> > even confirmed how they are (or they will) be handling the Impl_Version field...
> > 
> > Having said that, I would add that in this specific case (FC quirk) since the
> > only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
> > is having working FCs and, since it's clear that our lovely vendor wont
> > certainly break this other lovely OS way of working with SCMI, MAYBE it could
> > be safe to just apply the quirk to this Vendor forever no matter what the
> > platform or FW version will be in the future...(so not using compats at all)

My understanding is that the version has been bumped now albeit for
other reasons than fixing this particular bug. And since enabling FC for
these messages should be safe we will probably be able to match on
vendor/impl_version here.

Sibi is looking into this and should be able to provide an answer
shortly.

Johan
