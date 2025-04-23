Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51D280A2C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421128; cv=none; b=FeAvb5kCptT9wtmDzvB/tEhekxYxAYxjOGqRQ+SWoocMWmue+2gAfczzO+cd2wfSOU0EsoSbG8nHQ9RX47/BnCTrKWfR3p4wSZFKHeinb2S1O81Mu2ef++ys+ydLrXl0sN2LFQNMrW8SLOeIPtex476/TsWhe7RFgpI1MxfHzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421128; c=relaxed/simple;
	bh=Q61qQez5UnHF9zfHJ4kGv5x076vnjHwkr5s2qepPiAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQGkk/m2JUot7aVuv+fNz2RjSMSlaAi01692C7RtPBPnpU2bbNv2okFlurtlMpmlLUJ83ru7SC+1koLDU9rg0UA/XgbHaXCDBr6RrVGIIweezUmqZQFOniUg5VZ3hztLNiLIMR/W1ZfdiLR/X8pxl5lrk1VctFyFDv2A/Foya7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R34x74x8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R34x74x8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F8CC4CEE2;
	Wed, 23 Apr 2025 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421127;
	bh=Q61qQez5UnHF9zfHJ4kGv5x076vnjHwkr5s2qepPiAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R34x74x8E/GSFGWZ5m+9EbzgrAfdYbTSE5a1mEAPpvDlHh7KA0cPK10twzml4AXox
	 7CccmKY7KDDDm5SsgGpq7kW6Ubn2FQZO7xzsdqFJjxIcJnJ2UU04CNef7Wbp8bfbk8
	 TBB3AmDS0WgAopfq7uXn+Ln7NvzDtLvn7qeU7HeykjX5kahaDHvkeEF1jGTDBR6bRO
	 rhu4Do/epOw+gBOnFza6HEuiUDEQtFX9NB976SI/ZMy+SJSYiNYIFwDW/9QiyYVCIU
	 hykLIbl33cSoZut46KWf209FF+RhYPKnhwZeEc24xCft+6DTLvcyN5yBI00ASMxOwF
	 M3d++d7AV3B/g==
Date: Wed, 23 Apr 2025 05:12:06 -1000
From: Tejun Heo <tj@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, gaoxu <gaoxu2@honor.com>,
	Dennis Zhou <dennis@kernel.org>, Christoph Lameter <cl@linux.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	yipengxiang <yipengxiang@honor.com>
Subject: Re: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation
 failure
Message-ID: <aAkDRg0Ajl3ByXMq@slm.duckdns.org>
References: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com>
 <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
 <CAJuCfpF4SbPWMgECD89e=QDcrCTNqnchYZ=dpod-cdRxfsCtjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpF4SbPWMgECD89e=QDcrCTNqnchYZ=dpod-cdRxfsCtjA@mail.gmail.com>

On Tue, Apr 22, 2025 at 05:19:31PM -0700, Suren Baghdasaryan wrote:
...
> Allocating this reserved area dynamically would be ideal. OTOH this
> change increases the area size from 64kb to 128kb. Don't know how much
> effort we should put into it.

The easiest solution would be switching the modules to use alloc_percpu()
instead of declaring per-cpu variables statically. I couldn't think of a
better way to support static percpu variables in modules and still can't,
but there aren't noticeable downsides to using dynamically allocated percpu
variables, so if you have several bytes here and there, sure, declare them
statically, but for anything chunky, please use dynamic allocations.

Thanks.

-- 
tejun
