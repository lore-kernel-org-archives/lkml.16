Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DB2FF486;
	Wed,  2 Jul 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470061; cv=none; b=IqYZ1TZnM5QLhX1YqcGvavvaUlEQu9dFYUd6lvi16KjCdTepVwb1Qh2KOdJcyu/SewqXHkyS+NuErt2rpgPPzLBmhPxr2vy6Jl+npVsN+g5EXqz31B+BVVQyUICHhcA4M2CRJ4EPLOE+YdxyXGdv0PI5gKnbPNFYCpTiHOkRbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470061; c=relaxed/simple;
	bh=6KvIge49r5snh7gndMfZcMfLJSzGS4Dc2J/eMqnXO68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NcT8hYu09y5hNVML/LOMWtrVAzVwrtyLwzsb1rO/lYZF4v8tzT8tNl2mguLgILSYx+kDEV91Z8y7i7TqjJIoJ2dT1Aw0cdQE4Pm1b/TxNnQ6aamic388VzbGXlrmJcQq2k9qweO2G5u0V7RN1HTl5vzmduHQE/oc5IKNuuN//rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUIUlGKP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUIUlGKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E97FC4CEFE;
	Wed,  2 Jul 2025 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470060;
	bh=6KvIge49r5snh7gndMfZcMfLJSzGS4Dc2J/eMqnXO68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WUIUlGKPDC1UYK1RMFmzRc3I6dMek19QJdLNgr/yI8JIoTn41uu9LPDdN1NNeYDZR
	 274GxD6TzO4JzCgD4gkMh9p5rpCpb6svsUwpA/WLScclrm1zBHGVnT7wOoxnS2m5hA
	 c+j8hNJrgzEjT2YuVPIsfVrhnnd0SljdpBQM1Jtb9ycgqHpDPywStVPYxfHm9hvbJh
	 tCX7Vz4MZcWlAPoujopEN877dkg1T138HOAUMzT8FZXtfjdjh5if14CIfrInggDEgF
	 XUrR3CUljULhEvdYWds4QsWrEUjnreNR+w5F4LpLD/r/VyUfCaxh0wGSANNR21PAWs
	 KpTLHDcDF2Ikw==
From: Lee Jones <lee@kernel.org>
To: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
In-Reply-To: <20250626154544.324724-1-andriy.shevchenko@linux.intel.com>
References: <20250626154544.324724-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: madera: Don't use "proxy" headers
Message-Id: <175147005917.3041856.2074175436473048155.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 26 Jun 2025 18:45:44 +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: madera: Don't use "proxy" headers
      commit: dfac47877802c8bd8e0e802648b7151421139204

--
Lee Jones [李琼斯]

