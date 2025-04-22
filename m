Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6E13C3F6;
	Tue, 22 Apr 2025 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340844; cv=none; b=ZfrooLxNMw3mrjUVztJuDUEChymCfEzddM8f2f8S3w69wykKhKoSVgA+HCG3YdeC+bepKBzEogKp4/DQo5G/r6UUFoRVAg+PYf3HHJnS1gWyhsoCMDcmtnQipGegbJiSMYvhWaISy9u43l+ucHpY2vGv1+ERIhTzQ3Bbn37Y/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340844; c=relaxed/simple;
	bh=P2Cwn0mIOA//S9MJQ9EVspSybWtsYxxbfjWoCZdfSP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UicUjVhr7qYzATBiOG5rDmrtfvxHDAqPe8YiSYqru3jbAcioNIJCVlyjK5obyg/kVFSKMiMdafr7iPJ0gOxcL4x1hKkC0W7lJGz5ATkfZBJkrThKphzqGoBMYoq+AN9y7yKhadviW3VnUzP3vTbuIdz5q5WSMp+auqCWIdhoycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jv0b3A7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jv0b3A7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22726C4CEE9;
	Tue, 22 Apr 2025 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745340843;
	bh=P2Cwn0mIOA//S9MJQ9EVspSybWtsYxxbfjWoCZdfSP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jv0b3A7eixAfLOFmtbhzTtlj0A9zNqDP5eDF5XeL4ZVW0rO0sikXGgjhQYtJ0E2Rh
	 RomgmmCSuzTp0TGIxIW4yS8z0BtYoWqx/BQ+bFRTEQAblTnFTHXrT7CpG+Cbs5aKEG
	 VpAbxzujzisvidpetv70C/PcM3+zW/OQ/DOwnPGrAcnQT2czsllkoi31LvzpEBXWDn
	 SuRInvTp6uLX9D7ld1F2wep/aQpdTdhu6vJaZ0S0nDjdajiNyysMTuoSOejkdZFB4P
	 mpkiQmZRf92ROMKT3ld6LFV1J2ufylr3DYlxtN0h2kRJHOa0maR2spYiYLn0fVlamD
	 Q4ND93qV3U7Fg==
Date: Tue, 22 Apr 2025 17:53:58 +0100
From: Simon Horman <horms@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: dsa: rzn1_a5psw: Make the read-only array
 offsets static const
Message-ID: <20250422165358.GJ2843373@horms.kernel.org>
References: <20250417161106.490122-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161106.490122-1-colin.i.king@gmail.com>

On Thu, Apr 17, 2025 at 05:11:06PM +0100, Colin Ian King wrote:
> Don't populate the read-only array offsets and md5_init on the stack
> at run time, instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

