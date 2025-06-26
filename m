Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73D54204E;
	Thu, 26 Jun 2025 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936273; cv=none; b=u6l4Wc9Px6Wx9mX5IRxZkdlhkRkFaowHzyzDKqiu11yTCVW8uRutri0Sx9BifmllFafc0jy/euq+UPdSxauI/oMCSjOlpPEAbmsnrQKFGNHQAUx6wWReBmyF/OO82c/8E1oCTTUNMMUHM1X+1FBAbNr5RT0ZAyOWYgFW57cCy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936273; c=relaxed/simple;
	bh=lBAPaicE3y+2yA4To7dRq9JdvyHGI2xQfkEFxJiPK7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaeRpZKVjURLOZ8qPHxwOYABw/k5/SB/sxcT+vPjsDHoJBdVI/FqabflPLiibgRaKhKOS0RIKdhcf8nHi7aifYqjoWksu6lSMD3855OYpSBSrtceiUIYsEbtFnRKu6Uh7CtbTl0CIhUuf7J2R1ACTh4rYz4fw0NhlsV8n0sYl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8C51063;
	Thu, 26 Jun 2025 04:10:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1673F63F;
	Thu, 26 Jun 2025 04:11:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:10:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Message-ID: <aF0qwawoMKBCH-Ux@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-2-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-2-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:01PM +0000, Philip Radford wrote:
> Create scmi_dec_count function to decrease any of the Arm SCMI
> debug counters
> 

I agree on Dan's comment, other than that, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
