Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8335433D9;
	Fri, 13 Jun 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821666; cv=none; b=Wtt41loHIye2nmBTGTTnTbqBCGhjzvlhsV18LL/+GKYK9zViteEsF5QTnnTEMu+zVCUv5766WZA/AUlQbHu+PSoaQ0UACx+3XTStxlcSmVyDeNVD6M5DLREDj+BZm4oiinAKo6knLkbp5gU7h/ZI9yW1d7DPA16DRvrYdSG6+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821666; c=relaxed/simple;
	bh=uzy5GqfUsyqIep2S8drEsES47umffhUM1sHkUOvIGa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fLkV8kzcyILF51IWxDywMARFgz01PEpV3in3TpIvFN/Of3ezwHUqKFMKulsuUU6KJzbuZVS0dVXZroneB7hzU7zpLLiVn3MVnpZW1Z9ndoviorbItmOQX6Mkobfn94oNVL3IFi+wMt2OaqS1PWgdVn8Zj6AzOl6qN7Ddsh9MhhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWT8AaSO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWT8AaSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B383C4CEE3;
	Fri, 13 Jun 2025 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821666;
	bh=uzy5GqfUsyqIep2S8drEsES47umffhUM1sHkUOvIGa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TWT8AaSOktG+1WNHC/Vt4obvRUA3JRup7wz0ojnQy+MR0YhCtxPm5IjK0WtUxldqy
	 AY06pSm7yZWbcgQZoibXStHhKpUqvc2uPh7v2Gm5YKtDc5Yu9R9CpMKmjr+PhNQkUS
	 FQH43G7+6+Fl5Tj7RPjAx7E8M6WVQ8vqytViipVzwzSKbimXWP+xJ6e2drt/RLg609
	 sxIFB5YJ/tHueaUyFGb99kgw+tyfdkqM+xqTee0y4OG4w1LE6ppTK4EFK7rg/nhL0C
	 4Y/S+Uj5Km1oyVVBQ4AORaEDrFkFPvpXdpZjDZ0vfpIaIiOOh1C+fW+74Bd5AAaym6
	 HQDXoP88RC/HA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250521-cros-ec-mfd-chctl-probe-v1-1-6ebfe3a6efa7@weissschuh.net>
References: <20250521-cros-ec-mfd-chctl-probe-v1-1-6ebfe3a6efa7@weissschuh.net>
Subject: Re: (subset) [PATCH] mfd: cros_ec: Separate charge-control probing
 from USB-PD
Message-Id: <174982166492.895388.4152735458034344826.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Wed, 21 May 2025 16:42:51 +0200, Thomas Weißschuh wrote:
> The charge-control subsystem in the ChromeOS EC is not strictly tied to
> its USB-PD subsystem.
> Since commit 7613bc0d116a ("mfd: cros_ec: Don't load charger with UCSI")
> the presence of EC_FEATURE_UCSI_PPM would inhibit the probing of the
> charge-control driver.
> Furthermore recent versions of the EC firmware in Framework laptops
> hard-disable EC_FEATURE_USB_PD to avoid probing cros-usbpd-charger,
> which then also breaks cros-charge-control.
> 
> [...]

Applied, thanks!

[1/1] mfd: cros_ec: Separate charge-control probing from USB-PD
      commit: 4752d35dd84ac911b041ef3a53c6d8a32003c26d

--
Lee Jones [李琼斯]

