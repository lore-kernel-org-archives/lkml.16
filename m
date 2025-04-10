Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C2381A3;
	Thu, 10 Apr 2025 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272157; cv=none; b=rJ4UZn7nkjQxhD4pNtKScrOC+miCS6QEJBg/r76glr7T2+3kH/1+iElLK9gnIU5+xnx0unZjfdy0Xhi5z/Ex4i/Va5eGVmvU++7CVBfQFFrYKfBfFsDQZpOsFkGNfay4BNH9JCuFQ9uuwGMPoA4NvsI7FYtZoCPUh8bpMG/e6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272157; c=relaxed/simple;
	bh=FqsQ/mYhFu7t1FoIrEwny3QHUYvXb566G8N8Z42Mbs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvhQoIo3yNWoB7KNjEYBTDlLcOPrfsKBgPd10ZNPb7aeZjSbx9riijgXLh0m2mqiGxUVP8jfmbm6omie/mXR4RqoKBd+SmXZMHnDA++bvdUtanE2oNKbH37fiDOIGVoaxFWXFeHe7SRPapyeS7LmZQsaVOoEOIYjvKdRweKNCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwur5bLq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwur5bLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB65C4CEDD;
	Thu, 10 Apr 2025 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744272157;
	bh=FqsQ/mYhFu7t1FoIrEwny3QHUYvXb566G8N8Z42Mbs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwur5bLq9O7t1p/zAhYTqgQawZNcM74MfsiJojMkUBO+e6ctBrO1h64GI2qRORN67
	 xBdwWb2kmPtKrcPpso6wEPH2dJgDHAJhQoWSCCdoDviCEMw71KlhcD0EcppxpMAvW3
	 uJRFPIszwOzrj0BXUCQsg+/6fmmVaM0VtAx5ORmTQwqQwG/ESYvRkVu1l4NhRyNCTL
	 7+5LhcPoKopK7CKY2j/5/fGjvZhlcE2ANez5xzOrmgucyB94r1yAGcCc1XEDEn5vdz
	 Gwf0rV13rdQkrcdxtvgF1nB/1IMdBevh8z1aSFckqbUcoe//Jgd9UsRyHEt4p4Ausz
	 NxWvIEoln8kYQ==
Date: Thu, 10 Apr 2025 09:02:33 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] Support ROHM Scalable PMIC family
Message-ID: <20250410080233.GO372032@google.com>
References: <cover.1742802856.git.mazziesaccount@gmail.com>
 <20250404154355.GH372032@google.com>
 <ddd8882f-05b6-40f0-9a26-ab21d9644364@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddd8882f-05b6-40f0-9a26-ab21d9644364@gmail.com>

On Tue, 08 Apr 2025, Matti Vaittinen wrote:

> On 04/04/2025 18:43, Lee Jones wrote:
> > On Mon, 24 Mar 2025, Matti Vaittinen wrote:
> > 
> > > Support ROHM BD96802, BD96805 and BD96806 PMICs
> > > 
> > > The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
> > > to the digital interface. Main difference is voltage tuning range.
> > > Supporting BD96805 with BD96801 drivers is mostly just a matter of being
> > > able to differentiate the PMICs (done based on the devicetree
> > > compatible) and then providing separate voltage tables.
> > > 
> > > The ROHM BD96802 [3] is a companion PMIC which is intended to be used to
> > > provide more capacity on systems where the BD96801 alone is not
> > > sufficient. Startup sequence of these PMICs can be synchronized in
> > > hardware level, and there seems to be some mechanisms which allow
> > > delivering the companion PMIC (BD96802) status to the main PMIC
> > > (BD96801/BD96805). This patch series does treat the companion PMIC(s) as
> > > individual PMICs and allows using them from software point of view as a
> > > stand alone ICs. From the digital point of view, the BD96802 is a subset
> > > of BD96801, providing only buck1 and buck2 regulators. Please see the
> > > data sheet
> > > 
> > > The ROHM BD96806 [4] is similar to the BD96802, except that it does also
> > > provide different voltage tuning ranges.
> > > 
> > > This series adds basic voltage monitoring and control as well as a
> > > watchdog support for these PMICs using the BD96801 drivers.
> > > 
> > > Similarly to the BD96801, these PMICs too have a few configurations
> > > which can only be done when the PMIC is in STBY state. Similarly to the
> > > BD96801, doing these configurations isn't supported by the driver. The
> > > original BD96801 RFC [5] driver should be able to cover those
> > > configurations, if modified to support these models.
> > > 
> > > [1]: ROHM BD96801 data sheet:
> > > https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96801qxx-c-e.pdf
> > > [2]: ROHM BD96805 data sheet:
> > > https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96805qxx-c-e.pdf
> > > [3]: ROHM BD96802 data sheet:
> > > https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96802qxx-c-e.pdf
> > > [4]: ROHM BD96806 data sheet:
> > > https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96806qxx-c-e.pdf
> > > [5]: Original BD96801 RFC:
> > > https://lore.kernel.org/all/cover.1712058690.git.mazziesaccount@gmail.com/
> > > 
> > > Revision history:
> > > 
> > > v1 => v2: MFD driver changes after review by Lee
> > >   - Use enum for chip type instead of picking the data directly from the
> > >     of_match_data.
> > >   - rename "chip data" variable 'cd' to more widely used 'ddata'.
> > >   link to v1:
> > >    https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/
> 
> > 
> > The MFD stuff looks okay to me now.
> > 
> > Let me know when everything else is ready to go.
> > 
> 
> I'll treat this as an ACK for the V3. Please, let me know if that's not
> Okay.

Acks are tricky because another maintainer might (have have in the past)
assume that they can apply the set with my blessing, this is not the
case.  I used to use `Acked-for-MFD-by: <me>`, but these ended up being
merged.  *face palm*

Anyway, no harm done this time around I think.

-- 
Lee Jones [李琼斯]
