Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9521B8F6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023073; cv=none; b=O0WWktvk+1D4d7LqGEaEJ/Dh12c6k2yelfOycBLpx6OWgFIAtD/IqqwI7b356oUvHLESwzo5e5tcqiCIibFFMLezd9Ky8J/O6Aqpp/TYwgADcRDhXnTue+rNVSCG7XkqseMj2OW4sAGXOFGClByDpDWNs7YMcArUSUSRD6YYNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023073; c=relaxed/simple;
	bh=rS4JiRRDodTQxUGGyvj3N5RMtvNKe9VqQw6VZxlU2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqpsyGMEDjJArgn88RmCictF2/QZ+UFK9uPzQRIt/rb99rzICMt3SzDu6Zp9eQec0YKenJpDUVHsMv5BjbwubZryQmw0Pb+K3/+cPwGPabdr4ScFK3f7zar8LogFWWEtZmSM1KX2nC5qcr5pg92CbvzjSuT0l+YPFATSxV7N8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WaD0a/mv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WaD0a/mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95780C4CEE7;
	Wed,  4 Jun 2025 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749023073;
	bh=rS4JiRRDodTQxUGGyvj3N5RMtvNKe9VqQw6VZxlU2Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaD0a/mvWfIyFxA73vUJIsGE+SIUMbiJ0g+OHDVU+irwHJiEZ3eTdg2GVDH1SBoNx
	 xo5xZQqZFD7h2NXKOx4SqLjjuZ0bEH+GExX/SSqYJUq+K3Vx4l651kL/ZfKi8OX8Du
	 6TlM6tjKZhIlX9f8m9VggBQYkuBWamDv9G8PUMDY=
Date: Wed, 4 Jun 2025 09:44:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
Cc: Andre Przywara <andre.przywara@arm.com>, cve@kernel.org,
	linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <2025060418-reappoint-outward-d414@gregkh>
References: <2025050824-CVE-2025-37832-e235@gregkh>
 <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
 <2025053006-multitask-profanity-3590@gregkh>
 <2025053010-legible-destiny-23d3@gregkh>
 <805e1a14-7f07-47f0-ba86-f326e4ecea01@suse.com>
 <20250602135141.0b332772@donnerap.manchester.arm.com>
 <4b34814a-355a-49cf-8cc0-73cf843ed560@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b34814a-355a-49cf-8cc0-73cf843ed560@suse.com>

On Mon, Jun 02, 2025 at 06:28:31PM +0200, Giovanni Gherdovich wrote:
> Hello,
> 
> On Mon Jun 2, 2025 14:51, Andre Przywara wrote:
> > 
> > Hi,
> > 
> > I don't think this qualifies as a CVE, the issue was more theoretical. But
> > I don't have much experience with what deserves a CVE and what not, so I
> > can just present some insights:
> > 
> > > > > On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:
> > > > > > On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
> > > > > > > A KASAN enabled kernel reports an out-of-bounds access when handling the
> > > > > > > nvmem cell in the sun50i cpufreq driver:
> > > > > > > [...]
> > > > > > 
> > > > > > The invalid data that may be read comes from a ROM in the SoC,
> > > > > > programmed by the vendor, and is only used to configure CPU frequency
> > > > > > and voltage in the cpufreq framework.
> > 
> > So "potentially invalid data read from the ROM" is an issue the we have
> > regardless, this patch doesn't change that. And you cannot put arbitrary
> > voltages or frequencies in the OTP fuses, the value read is just used to
> > select one of the OPPs defined in the DT. If you want to attack the
> > system by heavily overclocking or baking it with a high voltage, you can
> > just change the limits in the DT. Not sure if that's easier or harder than
> > accessing the hardware, though.
> 
> I see. Right, my initial comment regarding the ROM content was missing
> the core of the problem.
> 
> > But more importantly, looking at this particular patch: This effectively
> > limits the access size of the value we read from the SID OTP driver, from
> > always 4 bytes to what the DT says, typically 2 bytes. But we actually
> > mask the value in the code anyway later at the moment, so the upper 16
> > bits are always discarded.
> > Which means that as it stands at the moment, there is no real change in
> > what values are used. I just did the change as it was clearly incorrect,
> > and I wanted to prevent any issues, in case of code changes later.
> 
> Ok, thanks for clarifying that in the present form, the code behaves
> the same before and after the fix (the upper 16 bits discarded
> anyway). Your fix improves the code and makes it future-proof.
> 
> Greg:
> 
> given this information, and Andre (developer of the change) saying at the
> beginning of his message that he thinks the bug shouldn't be a CVE, do
> you think the CVE can be revoked?

Now revoked, thanks!

greg k-h
