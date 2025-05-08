Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB57494;
	Thu,  8 May 2025 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746663116; cv=none; b=BRK7IXudMlUQJnjqS8H/E63rNFmnFQAG4CGsA11lz4rhvgfSBsBF1nLytkqroRhTosUo9znhy60W0DHEf5pvoUACvSYM8AGp0lxPaQ2QRAIoj6g8Fz8lPv02YooNkGScxHz0EZJvNmPQg8Kyxr75naNwoPIKpW0L6xC0eL2FWlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746663116; c=relaxed/simple;
	bh=QjVuFgGYlHpK17JFu9bANpiFf8cg5oFdw4JNnZaE0Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC1O1fzlEQEZmM+WW/rK7TfFT9kW/KXvlxs9AMcMFh/Fb3k78haIobVIbJSy4bEzZRoDmQdvbMN4CvHlk8KPmcoXjIJeDjh1m1AvYoKtfaJvGY1wWv0BsCu1K92PTLbbEXO0s14JA2LHr5KbNYJAVQJVKrROuGj1VtsI4ogzFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZWtWFCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZWtWFCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618E6C4CEE2;
	Thu,  8 May 2025 00:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746663115;
	bh=QjVuFgGYlHpK17JFu9bANpiFf8cg5oFdw4JNnZaE0Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZWtWFCe/zImhCxGNjD8b6bLGzDZp3jJal0fOCwNJdG4wKsVZ00PogXK/kQi9JGt3
	 4TpmnLT8uVHw2zyOwCCwLqJtNbnQoNa3tXFlSupjHOG+OVFlbo5iHGAQZM6Bph4ooQ
	 GuvFV0mGMRTo/AUcbvzh56hQtuL9q67AdM6nxI09dvvZcwNisxFC17ef0FNYdcehud
	 Kanp1/8Zyfu87a7axjDrsIGpAc+oWopuLdcba0qC2xFjv3IG6Gb2MOCd81+1rithou
	 GN6vZX2SPRf8RR8LvcwqIVwBbRCmKOdcmXbcMWqWOMbeV3c3sL1iVt+vUcXN5ho0PE
	 6SdLURlZUV70w==
Date: Wed, 7 May 2025 17:11:53 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: tip-bot2 for Rong Xu <tip-bot2@linutronix.de>
Cc: linux-tip-commits@vger.kernel.org, Rong Xu <xur@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] objtool: Speed up SHT_GROUP reindexing
Message-ID: <xb2rjui75xylasuihl7gdnovv2z6qxgsefmzhxvhntlcuw5ktb@zbstyytmzjag>
References: <20250425200541.113015-1-xur@google.com>
 <174601619410.22196.10353886760773998736.tip-bot2@tip-bot2>
 <jj4fu243l7ap4bza5imrgjk5f5dhsoloxezgphdjwo7sb5iqsq@wkt46abbt45r>
 <yrdh2fmzgqlrfe35wvxb3a2z7wdqod3liupdbriqzc5ihqjw5y@fsqeyi34cbgg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yrdh2fmzgqlrfe35wvxb3a2z7wdqod3liupdbriqzc5ihqjw5y@fsqeyi34cbgg>

On Wed, May 07, 2025 at 05:11:03PM -0700, Josh Poimboeuf wrote:
> From 2a33e583c87e3283706f346f9d59aac20653b7fd Mon Sep 17 00:00:00 2001
> Message-ID: <2a33e583c87e3283706f346f9d59aac20653b7fd.1746662991.git.jpoimboe@kernel.org>
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Date: Wed, 7 May 2025 16:56:55 -0700
> Subject: [PATCH] objtool: Speed up SHT_GROUP reindexing

Urgh, sorry about the patch formatting, the above can obviously be
dropped.

-- 
Josh
