Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C125C713
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188142; cv=none; b=Z84RJA6eFmSjedzsNadwJU0Fjtg0baVM+k+NgLr2L3quXiyXS4i5erIcByheRH71zFKsS76nxAnaZiGyupp+lvL/a0B0Lh+57NoBYJmdEFlrOTCI0780wleBfIoqk6Ubqm6nqYVfgA+9gXpO5KzndyKMQBeU6qwtkrBmQ7ebX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188142; c=relaxed/simple;
	bh=wjw41zvgUIfYI/mRsk7N+N+xsW9FgyoIykppZtT305c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfxtAs4CQJX35vjBjti4kwHTZUk6BYXUi/wEulHfmYNzl2DAdeeJRJk9JZ0Z46Xaj3zPVXbMhHyZH/NKS+CP4uCeTAwzfzSRXvw8c8J0dw9fZjlXFehetIiAG8kJOqVStnRJQ5WuIS+ZzONuaCPFCVIlilpUthbMNVktlLPqu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u2R0Y-0006q1-Od; Wed, 09 Apr 2025 10:42:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u2R0Y-0044fu-0m;
	Wed, 09 Apr 2025 10:42:06 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u2R0Y-008OSL-0O;
	Wed, 09 Apr 2025 10:42:06 +0200
Date: Wed, 9 Apr 2025 10:42:06 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	kernel@pengutronix.de, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: soc-core: fix bitclock-master and frame-master
 present check
Message-ID: <20250409084206.4bfvsoeyz46j66e3@pengutronix.de>
References: <20250325213455.3952361-1-m.felsch@pengutronix.de>
 <7d202e65-0d02-4600-b832-595a759577c8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d202e65-0d02-4600-b832-595a759577c8@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-03-26, Mark Brown wrote:
> On Tue, Mar 25, 2025 at 10:34:53PM +0100, Marco Felsch wrote:
> > To check for a none boolean property of_property_present() should be
> > used instead of of_property_read_bool(). The later returns a warning
> > since commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used
> > on non-boolean properties").
> 
> This doesn't apply against current code, please check and resend.

I've seen that Geert already posted a patch which was applied. Therefore
no need to resend, thanks.

Regards,
  Marco
