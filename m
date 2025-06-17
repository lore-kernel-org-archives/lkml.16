Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD612F5312;
	Tue, 17 Jun 2025 22:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199297; cv=none; b=qiMVTMSDU7rzOJXGqkyOOoIp4cOwk4tndpO276Kj0jMsul4wjCRTR6KRAbL5TCw0gR79t9HpDV+di7319KOLbqhpa82ZqkVrxHYvYwA8x4fzDAbsVn0xFCR7yC4ooGhnRFfU0rzsSbOqCTgIyRQF7jztAibqm9dIA9ynZuVAxmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199297; c=relaxed/simple;
	bh=2ygcoiPdg5tXbbjhveGnMjSSG6kQpW//H1KxZ2agnv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRUKtUqoVN+A16psdCgZG7q9RTKoIZfNyZyJQ3AaI2+O0duVWf019Csfn0ESRoZs6Yd2hpVeETY9OW9g7sUelx01tbZAjvSZIKdMdRrY3xHXWtstCqftMO+G7crk/0KfWhUkz1p8JGqKlOVngUbE1Gb7lqTaHWdSSxg/kf2FLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bRnDxeEY; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bRnDxeEY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W0OOXNAeUJvkfL1jvOAbJIXmDdUCK0qiD8aREElX9bc=; b=bRnDxeEYmtsxBY/dzVEQPU1g7+
	ybaEFJ+5Qx9x/CkDvIRHJnI3/ZBw+f5Np7a1T/GbvA8DptM/IyP87exa/esIAncJaVSyrJ7AIsEXB
	zp7cY25R5I8JCmbn3tL59sRxarYH/mdnmbe6rA9axu7dgZJ2b0WOL7+6M6K3kih8BewDESCVjI4OD
	MjosC+jV8GuYPv4Hw1Pp6sBmOi6TvFZdBu8aOcNyv1DDwvT06RZg5OlZ5cjKoo54NUHFwOusSG689
	9QRAzefeesRcgpvSqoRwS+kiA7oJlOi8DN31ofoc6oEnrOMudCHvBUvCFRH8K7b+ICr/pdkIYq/B7
	A1U/qVAQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uRemn-0005eV-1B;
	Tue, 17 Jun 2025 23:28:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uReml-0006As-0G;
	Tue, 17 Jun 2025 23:28:07 +0100
Date: Tue, 17 Jun 2025 23:28:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	devarsht@ti.com, linux-kernel@vger.kernel.org,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH] clk: Add clk_determine_rate function call
Message-ID: <aFHr9sVnU3Nx6yh0@shell.armlinux.org.uk>
References: <20250616103527.509999-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616103527.509999-1-j-choudhary@ti.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jun 16, 2025 at 04:05:27PM +0530, Jayesh Choudhary wrote:
> Add a function to determine if a particular rate can be set for a clock
> with its argument being the clock and the desired rate so that it could
> be exposed to other peripherals.
> For example, the display controllers typically has to perform multiple
> checks for supported display resolutions including those related to
> clock rates. The controller has to check this way before it actually
> enables the clock and has to do it multiple times (typically for each
> mode), and therefore using the clk_set_rate when its not needed, does
> not make sense.

So what's up with using clk_round_rate(), which returns the clock rate
that one would actually get if one calls clk_set_rate() with the the
value passed into clk_round_rate() ?

Why is clk_round_rate() not sufficient?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
