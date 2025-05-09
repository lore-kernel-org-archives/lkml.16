Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185A27A132
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785301; cv=none; b=HydJtMnNBTw0YVeswfeQCEtQos04wyiMxXe2TJfHANfFFDkruOXUzl9YdUKvlQZsE6IYpsx1s+6r1H4TVnUkfdoZ3Z7pT8M11dH+g01fRyUpsdI6L3ptJM1FkfmnANNX3pM6W/Rr+r7l1LPvTRvne2qxbSQXSTmWdHJ3XH0LAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785301; c=relaxed/simple;
	bh=6Edi4Saka9uZVABrUNnM8GokpFXAeKJWdXQ00dDysX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW+n+nZYoCEZatzbf72oJYG4cx3aJncPjLvYukz1EvCOxB0+eXJtngmFwjNZYZhJqlpsno0j/bAjGnZzuEWuotIby5BMbdHzFpZtODYgi/fx3EV++llK3IdpA72p73Eyg7EHMVxP9t5ICd7Hz3f8nt8ASUiBuuet5/MaG7cti6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BWBVuuc/; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BWBVuuc/"
Date: Fri, 9 May 2025 03:08:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746785296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0tEuRYMoDCTnsJpQSrq3lm5BTz1PR7T1PtpA+L2h/K0=;
	b=BWBVuuc/0d2OhfeoN9XXfXMbSP7bCet97/T63EwJRuZ1y9eHr34VHdmDGF9SxI7P/1TMiq
	DAQOFuov9KNgqj+ue1n6vcFLgvnriyXL4NF/5cRsiNZpe4lfbGRe/zRur7XQYX4e+hzxiH
	eRQtrVdF070zBkcgl1l6l7ca7JLZNlk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring  (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <aB3UBSQYtTveKPlh@linux.dev>
References: <20250508210009.428998-1-scott@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508210009.428998-1-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT

Hey D Scott,

On Thu, May 08, 2025 at 02:00:09PM -0700, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>

Overall looks good, still needs an entry in Documentation/arch/arm64/silicon-errata.rst
which Marc noted in v2.

With that addressed:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver
