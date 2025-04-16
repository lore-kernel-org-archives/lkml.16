Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE15200B8A;
	Wed, 16 Apr 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813016; cv=none; b=WOtEt7h0Ln6vf3hRyZ2/pzYsYJZtSZQztu7m7PugGCRO9jkZ+lWdJfBzFBeVLewVnGFBmQ+rNa8+owUGSGR4kWaHCPS8woKBtR8roAy/RwwON6+oI9DhAqgngb9KPOS6/vxXEBRnuO5uHN/pd21bnTBpDhPUXdVbMT3fWDQugAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813016; c=relaxed/simple;
	bh=fyPIv3go0TpOegWOq0T8AHYCtU2r2MMKUPWMEWH+OQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYJxqKPUwJlpa4kFibBSBWxCdlhdvDKL1TERv1TZD9Lq4bmWJXcMjgofAb0HqSCP9Aij4b7vOMkuj9GUIVXwEyGpVoYH/R0PjUe3Phx2+kyrY0k5YYbbXSEW8TBroFxYe/oPn0AgGnWuneyKQSoWjgwZfj4Idf5eXsbTWiXwqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xqxQKYPy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xqxQKYPy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h0bcscZbc7pTPaVmlg3LUv5U6fAYQKfCQMo+JCEIFmk=; b=xqxQKYPyf4iKnKW8RkLdLa4Ywq
	Pd7OvEhk9/RqppUsvc0lsmACvvKLPpNf5S49+Pv79O919TVFUXhIPCtQPfFsr9QmOKFomHTJULC4f
	Vo/38mrHh85kyMqh0sAuhokE7cwPqKFutpbps/xm/lFUOQ97soEKXkVFTV/jlk1o/Mww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u53ZD-009ekx-Kv; Wed, 16 Apr 2025 16:16:43 +0200
Date: Wed, 16 Apr 2025 16:16:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, pkshih@realtek.com, larry.chiu@realtek.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net v2 1/3] rtase: Fix the compile error reported by the
 kernel test robot
Message-ID: <152c9566-a1bd-4082-9f66-6bbe8ab1eb47@lunn.ch>
References: <20250416124534.30167-1-justinlai0215@realtek.com>
 <20250416124534.30167-2-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416124534.30167-2-justinlai0215@realtek.com>

On Wed, Apr 16, 2025 at 08:45:32PM +0800, Justin Lai wrote:
> Fix the following compile error reported by the kernel test
> robot by modifying the condition used to detect overflow in
> rtase_calc_time_mitigation.

The Subject: line is not very useful. It is better to talk about what
you are fixing, not that a robot reported an issue.

    Andrew

---
pw-bot: cr
