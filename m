Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA582D023;
	Wed, 30 Apr 2025 01:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976498; cv=none; b=lvA6bq4EUOoD0DRu9V3v1i7tKXKBtkJYhIp3kYJ0Pq+Osf20wdwYha9RTygcoaGNU2keCsceyiUEPT3ASpWG40s/ov+7RMpcJFSgQz/rC9Ur4Z3kI+5uNxSEW3VlxylAJpqxhVT3/gGjviC7kKWzVCadBZGPeWdWQRkPGfa9ZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976498; c=relaxed/simple;
	bh=ntH6lrczdAWMTRwtBoswHZd4LyjHIvQX6oZyBYCwWTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dm/ocwjfyGmId7RW3oV+XGoNKvUPkNR+HbKJbgg3yEUeXQiFKYQCtD5sHrJ7l1BZ+XU8rv50ZmpqFwsbFoGa6ZUqb2+pYfo/EmI9Wv/8j6Ftu02o+505PAXPaa4/YbptccmN1gnGsh5EitLlEXqQkq5sALzn8EnXBkjMwmuU5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpQ8sPk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpQ8sPk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D465C4CEE3;
	Wed, 30 Apr 2025 01:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745976498;
	bh=ntH6lrczdAWMTRwtBoswHZd4LyjHIvQX6oZyBYCwWTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpQ8sPk4qewrb0pDNixRVXn3RvWNLEFhT34fs+piE5Ar78/cSkyBIfy6pGyPug3st
	 vpfQQ6W2Ot3VAjjHh8Ko91YtpeMXNr3MDeFhweMXBFrqT4veE3foNlQEc1FTcnE0NK
	 XGvss9frrrxBD88UQ+Wewg/+oB6j+6AdNBQdgu2nxTuqTMwYB52+5iGV5QzrxZU2xI
	 daHF+fvj1aFchcB6p5h+0lt/QVX3ZZ+RiJ1UnMXmvZ//HnAnfvF8Cvaql7Fb34uKJf
	 HwWRZIMI+2iqjlZ1UvGAbNvrWQM4vd/MPnKeAuIR4eMEqMVMdhLs1c47yzUI5dMOzi
	 dzC6+088zxCZQ==
Date: Wed, 30 Apr 2025 01:28:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH 1/3] platform/chrome: update pwm fan control host commands
Message-ID: <aBF8rsEfkFz4uArX@google.com>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-1-a8d9e3efbb1a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-cros_ec_fan-v1-1-a8d9e3efbb1a@chromium.org>

On Tue, Apr 29, 2025 at 04:14:21PM +0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
